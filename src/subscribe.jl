
function print_available_image(clientd, subscription, image)
    # @show "available image"
    return 1
end
function print_unavailable_image(clientd, subscription, image)
    # @show "unavailable image"
    return 1
end



function subscribe(callback::Base.Callable, conf::AeronConfig)

    @info "Subscribing" conf.channel conf.stream

    aeron = Ptr{LibAeron.aeron_t}(C_NULL)
    context = Ptr{LibAeron.aeron_context_t}(C_NULL)
    subscription = Ptr{LibAeron.aeron_subscription_t}(C_NULL)
    fragment_assembler = Ptr{LibAeron.aeron_fragment_assembler_t}(C_NULL)
    async = Ptr{LibAeron.aeron_async_add_subscription_t}(C_NULL)

    should_continue = Ref(true)

    try

        if @c(LibAeron.aeron_context_init(&context)) < 0
            error("aeron_context_init: "*unsafe_string(LibAeron.aeron_errmsg()))
        end

        if @c(LibAeron.aeron_init(&aeron, context)) < 0
            error("aeron_init: "*unsafe_string(LibAeron.aeron_errmsg()))
        end
        @info "inited"

        if LibAeron.aeron_start(aeron) < 0
            error("aeron_start: "*unsafe_string(LibAeron.aeron_errmsg()))
        end
        @info "started"

        print_available_image_ptr = @cfunction(print_available_image, Int64, (Ptr{Nothing}, Ptr{Nothing}, Ptr{Nothing}))
        print_unavailable_image_ptr = @cfunction(print_unavailable_image, Int64, (Ptr{Nothing}, Ptr{Nothing}, Ptr{Nothing}))

        if @c(LibAeron.aeron_async_add_subscription(
            &async,
            aeron,
            conf.channel,
            conf.stream,
            print_available_image_ptr,
            C_NULL,
            print_unavailable_image_ptr,
            C_NULL)) < 0
            error("aeron_async_add_subscription: "*unsafe_string(LibAeron.aeron_errmsg()))
        end
    
        timeout = time() + 5
        while (C_NULL == subscription)
            if @c(LibAeron.aeron_async_add_subscription_poll(&subscription, async)) < 0
                error("aeron_async_add_subscription_poll: "*unsafe_string(LibAeron.aeron_errmsg()))
            end    
            yield()
            if time() > timeout
                error("timed out adding subscription after 5s")
            end
        end
    
        @info "Subscription channel status " LibAeron.aeron_subscription_channel_status(subscription)

        # Use a trampoline to close over the user's function
        function poll_handler_closure(clientd, buffer, length, header_ptr)
            # Allocation free
            # @time  begin
                bufarr = PtrArray(buffer, (length,))
        
                # Allocates
                header = unsafe_load(header_ptr)
            # end

            should_continue[] = GC.@preserve header bufarr callback(header, bufarr)
        
            return nothing
        end
        

        # poll_handler_ptr = @cfunction(poll_handler, Cvoid, (Ptr{Nothing}, Ptr{UInt8}, Csize_t, Ptr{LibAeron.aeron_header_t}))
        poll_handler_ptr = @cfunction($poll_handler_closure, Cvoid, (Ptr{Nothing}, Ptr{UInt8}, Csize_t, Ptr{LibAeron.aeron_header_t}))
    
        if @c(LibAeron.aeron_fragment_assembler_create(&fragment_assembler, poll_handler_ptr, subscription)) < 0
            error("aeron_fragment_assembler_create: "*unsafe_string(LibAeron.aeron_errmsg()))
        end

        aeron_fragment_assembler_handler_ptr = dlsym(dlopen(LibAeron.libaeron), :aeron_fragment_assembler_handler)
        while should_continue[]
            fragments_read = LibAeron.aeron_subscription_poll(
                subscription,
                aeron_fragment_assembler_handler_ptr,
                fragment_assembler,
                conf.fragment_count_limit
            )
            if fragments_read < 0
                error("aeron_subscription_poll: "*unsafe_string(LibAeron.aeron_errmsg()))
            end

        
        end

    finally
        LibAeron.aeron_subscription_close(subscription, C_NULL, C_NULL)
        LibAeron.aeron_close(aeron)
        LibAeron.aeron_context_close(context)
        LibAeron.aeron_fragment_assembler_delete(fragment_assembler)
        @info "cleanup complete"
    end
end


function subscribe2(callback::Base.Callable, conf::AeronConfig)

    @info "Subscribing" conf.channel conf.stream

    aeron = Ptr{LibAeron.aeron_t}(C_NULL)
    context = Ptr{LibAeron.aeron_context_t}(C_NULL)
    subscription = Ptr{LibAeron.aeron_subscription_t}(C_NULL)
    # fragment_assembler = Ptr{LibAeron.aeron_fragment_assembler_t}(C_NULL)
    async = Ptr{LibAeron.aeron_async_add_subscription_t}(C_NULL)

    # should_continue = Ref(true)

    # We will copy data into this buffer. 
    # We will resize it to be the right size for each message.
    # If the message size is larger than the buffer, our call to resize
    # will reallocate it (julia should handle this transparently)
    buffer = UInt8[]
    sizehint!(buffer, 512*512)

    try

        if @c(LibAeron.aeron_context_init(&context)) < 0
            error("aeron_context_init: "*unsafe_string(LibAeron.aeron_errmsg()))
        end

        if @c(LibAeron.aeron_init(&aeron, context)) < 0
            error("aeron_init: "*unsafe_string(LibAeron.aeron_errmsg()))
        end
        @info "inited"

        if LibAeron.aeron_start(aeron) < 0
            error("aeron_start: "*unsafe_string(LibAeron.aeron_errmsg()))
        end
        @info "started"

        print_available_image_ptr = @cfunction(print_available_image, Int64, (Ptr{Nothing}, Ptr{Nothing}, Ptr{Nothing}))
        print_unavailable_image_ptr = @cfunction(print_unavailable_image, Int64, (Ptr{Nothing}, Ptr{Nothing}, Ptr{Nothing}))

        if @c(LibAeron.aeron_async_add_subscription(
            &async,
            aeron,
            conf.channel,
            conf.stream,
            print_available_image_ptr,
            C_NULL,
            print_unavailable_image_ptr,
            C_NULL)) < 0
            error("aeron_async_add_subscription: "*unsafe_string(LibAeron.aeron_errmsg()))
        end
    
        timeout = time() + 5
        while (C_NULL == subscription)
            if @c(LibAeron.aeron_async_add_subscription_poll(&subscription, async)) < 0
                error("aeron_async_add_subscription_poll: "*unsafe_string(LibAeron.aeron_errmsg()))
            end    
            yield()
            if time() > timeout
                error("timed out adding subscription after 5s")
            end
        end
    
        @info "Subscription channel status " LibAeron.aeron_subscription_channel_status(subscription)

        header_values_ref = Ref(Aeron.LibAeron.aeron_header_values_t(ntuple(i->0x00, 44)))
        next_term_offset_ref = Ref(Int32(0))
        buffer_limit_ref = Ref(Int32(0))

        # Callback must return true each time to continue subscribing.
        user_continue = Ref(true)

        function fragment_assembler(context, fragment_buffer, length, header_ptr)

            # Length is the length of this fragment, not the overall message

            LibAeron.aeron_header_values(header_ptr, header_values_ref)
            header_values = header_values_ref[]
            frame = header_values.frame


            local aligned_length::Int32
            frame_length::Int32 = frame.frame_length

            # Unfragmented case
            if frame.flags & LibAeron.AERON_DATA_HEADER_UNFRAGMENTED == LibAeron.AERON_DATA_HEADER_UNFRAGMENTED
                resize!(buffer, length)
                user_continue[] = callback(header_values, buffer)::Bool
            # Fragemented case: first fragment
            elseif frame.flags & LibAeron.AERON_DATA_HEADER_BEGIN_FLAG == LibAeron.AERON_DATA_HEADER_BEGIN_FLAG 
                resize!(buffer, frame_length)
                if !isassigned(buffer, length)
                    @error "Attempted to copy data past length of buffer. How did this happen?" size(buffer) buffer_limit_ref[]
                    return
                end
                unsafe_copyto!(pointer(buffer), fragment_buffer, length)
                aligned_length = LibAeron.AERON_ALIGN(LibAeron.AERON_DATA_HEADER_LENGTH + length, LibAeron.AERON_LOGBUFFER_FRAME_ALIGNMENT)
                next_term_offset_ref[] = frame.term_offset + aligned_length
                buffer_limit_ref[] = length
            # Appending case
            elseif next_term_offset_ref[] == frame.term_offset
                # Resize to give sufficient room
                if !isassigned(buffer, buffer_limit_ref[])
                    resize!(buffer, buffer_limit_ref[] + length)
                end
                unsafe_copyto!(pointer(buffer, buffer_limit_ref[]+1), fragment_buffer, length)
                buffer_limit_ref[] = buffer_limit_ref[]  + length
                # Case: we're done, trigger callback
                if frame.flags & LibAeron.AERON_DATA_HEADER_END_FLAG == LibAeron.AERON_DATA_HEADER_END_FLAG
                    user_continue[] = callback(header_values, buffer)::Bool
                # Case: we're not done, record next offset we expect
                else
                    aligned_length = LibAeron.AERON_ALIGN(LibAeron.AERON_DATA_HEADER_LENGTH + length, LibAeron.AERON_LOGBUFFER_FRAME_ALIGNMENT)
                    next_term_offset_ref[] = frame.term_offset + aligned_length
                end
            else
            end

            return nothing
        end
        fragment_assembler_ptr = @cfunction($fragment_assembler, Cvoid, (Ptr{Nothing}, Ptr{UInt8}, Csize_t, Ptr{LibAeron.aeron_header_t}))

        while user_continue[]
            fragments_read = LibAeron.aeron_subscription_poll(
                subscription,
                fragment_assembler_ptr,
                # Context pointer for callback if we want it
                C_NULL,
                conf.fragment_count_limit
            )
            if fragments_read < 0
                error("aeron_subscription_poll: "*unsafe_string(LibAeron.aeron_errmsg()))
            end
        end
        

    finally
        LibAeron.aeron_subscription_close(subscription, C_NULL, C_NULL)
        LibAeron.aeron_close(aeron)
        LibAeron.aeron_context_close(context)
        @info "cleanup complete"
    end
end