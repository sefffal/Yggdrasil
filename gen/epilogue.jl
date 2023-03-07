
# Ignore these bad macro translations by setting this dummy function
# offsetof(args...) = nothing
# registration_id=nothing
# type_id=nothing
# free_for_reuse_deadline_ms=nothing
# key=nothing
# label=nothing
# PTHREAD_ONCE_INIT=nothing
# pthread_once_t=nothing
# pthread_mutex_init=nothing
# pthread_mutex_lock=nothing
# pthread_mutex_unlock=nothing
# pthread_mutex_destroy=nothing
# pthread_once=nothing
# pthread_attr_init=nothing
# pthread_create=nothing
# pthread_join=nothing
# pthread_key_create=nothing
# pthread_key_delete=nothing
# pthread_getspecific=nothing
# pthread_setspecific=nothing
# __FILE__=nothing
# strrchr(args...)=nothing
# dllimport=nothing
# __declspec(args...)=nothing
const AERON_NULL_VALUE = -1
const AERON_CLIENT_ERROR_DRIVER_TIMEOUT = -1000
const AERON_CLIENT_ERROR_CLIENT_TIMEOUT = -1001
const AERON_CLIENT_ERROR_CONDUCTOR_SERVICE_TIMEOUT = -1002
const AERON_CLIENT_ERROR_BUFFER_FULL = -1003
const AERON_CLIENT_MAX_LOCAL_ADDRESS_STR_LEN = 64
const AERON_DIR_ENV_VAR = "AERON_DIR"
const AERON_DRIVER_TIMEOUT_ENV_VAR = "AERON_DRIVER_TIMEOUT"
const AERON_CLIENT_RESOURCE_LINGER_DURATION_ENV_VAR = "AERON_CLIENT_RESOURCE_LINGER_DURATION"
const AERON_CLIENT_PRE_TOUCH_MAPPED_MEMORY_ENV_VAR = "AERON_CLIENT_PRE_TOUCH_MAPPED_MEMORY"
const AERON_AGENT_ON_START_FUNCTION_ENV_VAR = "AERON_AGENT_ON_START_FUNCTION"
const AERON_COUNTER_CACHE_LINE_LENGTH = Cuint(64)

# Skipping MacroDefinition: AERON_COUNTER_VALUE_LENGTH sizeof ( aeron_counter_value_descriptor_t )
# const AERON_COUNTER_REGISTRATION_ID_OFFSET = offsetof(aeron_counter_value_descriptor_t, registration_id)

# Skipping MacroDefinition: AERON_COUNTER_METADATA_LENGTH sizeof ( aeron_counter_metadata_descriptor_t )
# const AERON_COUNTER_TYPE_ID_OFFSET = offsetof(aeron_counter_metadata_descriptor_t, type_id)
# const AERON_COUNTER_FREE_FOR_REUSE_DEADLINE_OFFSET = offsetof(aeron_counter_metadata_descriptor_t, free_for_reuse_deadline_ms)
# const AERON_COUNTER_KEY_OFFSET = offsetof(aeron_counter_metadata_descriptor_t, key)
# const AERON_COUNTER_LABEL_LENGTH_OFFSET = offsetof(aeron_counter_metadata_descriptor_t, label)

# Skipping MacroDefinition: AERON_COUNTER_MAX_LABEL_LENGTH sizeof ( ( ( aeron_counter_metadata_descriptor_t * ) NULL ) -> label )

# Skipping MacroDefinition: AERON_COUNTER_MAX_KEY_LENGTH sizeof ( ( ( aeron_counter_metadata_descriptor_t * ) NULL ) -> key )
const AERON_COUNTER_RECORD_UNUSED = 0
const AERON_COUNTER_RECORD_ALLOCATED = 1
const AERON_COUNTER_RECORD_RECLAIMED = -1
const AERON_COUNTER_REGISTRATION_ID_DEFAULT = INT64_C(0)
const AERON_COUNTER_NOT_FREE_TO_REUSE = INT64_MAX
const AERON_COUNTER_OWNER_ID_DEFAULT = INT64_C(0)
const AERON_NULL_COUNTER_ID = -1
const AERON_PUBLICATION_NOT_CONNECTED = -(Clong(1))
const AERON_PUBLICATION_BACK_PRESSURED = -(Clong(2))
const AERON_PUBLICATION_ADMIN_ACTION = -(Clong(3))
const AERON_PUBLICATION_CLOSED = -(Clong(4))
const AERON_PUBLICATION_MAX_POSITION_EXCEEDED = -(Clong(5))
const AERON_PUBLICATION_ERROR = -(Clong(6))
const AERON_COMPILER_GCC = 1
const AERON_COMPILER_LLVM = 1
const AERON_CPU_X64 = 1
const AERON_CACHE_LINE_LENGTH = Cuint(64)
# const AERON_INIT_ONCE = pthread_once_t
# const AERON_INIT_ONCE_VALUE = PTHREAD_ONCE_INIT
# const aeron_mutex_init = pthread_mutex_init
# const aeron_mutex_lock = pthread_mutex_lock
# const aeron_mutex_unlock = pthread_mutex_unlock
# const aeron_mutex_destroy = pthread_mutex_destroy
# const aeron_thread_once = pthread_once
# const aeron_thread_attr_init = pthread_attr_init
# const aeron_thread_create = pthread_create
# const aeron_thread_join = pthread_join
# const aeron_thread_key_create = pthread_key_create
# const aeron_thread_key_delete = pthread_key_delete
# const aeron_thread_get_specific = pthread_getspecific
# const aeron_thread_set_specific = pthread_setspecific

# Skipping MacroDefinition: AERON_ERROR_LOG_HEADER_LENGTH ( sizeof ( aeron_error_log_entry_t ) )

# Skipping MacroDefinition: AERON_ERROR_LOG_RECORD_ALIGNMENT ( sizeof ( int64_t ) )
const AERON_MAX_PATH = 384
const AERON_ERROR_MAX_TOTAL_LENGTH = 8192

const AERON_RES_HEADER_ADDRESS_LENGTH_IP4 = Cuint(4)
const AERON_RES_HEADER_ADDRESS_LENGTH_IP6 = Cuint(16)
const AERON_FRAME_HEADER_VERSION = 0
const AERON_HDR_TYPE_PAD = 0x00
const AERON_HDR_TYPE_DATA = 0x01
const AERON_HDR_TYPE_NAK = 0x02
const AERON_HDR_TYPE_SM = 0x03
const AERON_HDR_TYPE_ERR = 0x04
const AERON_HDR_TYPE_SETUP = 0x05
const AERON_HDR_TYPE_RTTM = 0x06
const AERON_HDR_TYPE_RES = 0x07
const AERON_HDR_TYPE_ATS_DATA = 0x08
const AERON_HDR_TYPE_ATS_SETUP = 0x09
const AERON_HDR_TYPE_ATS_SM = 0x0a
const AERON_HDR_TYPE_EXT = 0xffff

# Skipping MacroDefinition: AERON_DATA_HEADER_LENGTH ( sizeof ( aeron_data_header_t ) )
const AERON_DATA_HEADER_BEGIN_FLAG = UINT8_C(0x80)
const AERON_DATA_HEADER_END_FLAG = UINT8_C(0x40)
const AERON_DATA_HEADER_EOS_FLAG = UINT8_C(0x20)
const AERON_DATA_HEADER_UNFRAGMENTED = UINT8_C(AERON_DATA_HEADER_BEGIN_FLAG | AERON_DATA_HEADER_END_FLAG)
const AERON_DATA_HEADER_DEFAULT_RESERVED_VALUE = INT64_C(0)
const AERON_STATUS_MESSAGE_HEADER_SEND_SETUP_FLAG = UINT8_C(0x80)
const AERON_STATUS_MESSAGE_HEADER_EOS_FLAG = UINT8_C(0x40)
const AERON_RTTM_HEADER_REPLY_FLAG = UINT8_C(0x80)
const AERON_RES_HEADER_TYPE_NAME_TO_IP4_MD = 0x01
const AERON_RES_HEADER_TYPE_NAME_TO_IP6_MD = 0x02
const AERON_RES_HEADER_SELF_FLAG = UINT8_C(0x80)
const AERON_FRAME_MAX_MESSAGE_LENGTH = Cuint(16) * Cuint(1024) * Cuint(1024)
const AERON_OPTION_HEADER_IGNORE_FLAG = UINT16_C(0x8000)
const AERON_OPT_HDR_TYPE_ATS_SUITE = UINT16_C(0x0001)
const AERON_OPT_HDR_TYPE_ATS_RSA_KEY = UINT16_C(0x0002)
const AERON_OPT_HDR_TYPE_ATS_RSA_KEY_ID = UINT16_C(0x0003)
const AERON_OPT_HDR_TYPE_ATS_EC_KEY = UINT16_C(0x0004)
const AERON_OPT_HDR_TYPE_ATS_EC_SIG = UINT16_C(0x0005)
const AERON_OPT_HDR_TYPE_ATS_SECRET = UINT16_C(0x0006)
const AERON_OPT_HDR_TYPE_ATS_GROUP_TAG = UINT16_C(0x0007)
const AERON_OPT_HDR_ALIGNMENT = Cuint(4)
const AERON_LOGBUFFER_PARTITION_COUNT = 3
const AERON_LOGBUFFER_TERM_MIN_LENGTH = 64 * 1024
const AERON_LOGBUFFER_TERM_MAX_LENGTH = 1024 * 1024 * 1024
const AERON_PAGE_MIN_SIZE = 4 * 1024
const AERON_PAGE_MAX_SIZE = 1024 * 1024 * 1024
const AERON_LOGBUFFER_DEFAULT_FRAME_HEADER_MAX_LENGTH = AERON_CACHE_LINE_LENGTH * 2
const AERON_MAX_UDP_PAYLOAD_LENGTH = 65504

# Skipping MacroDefinition: AERON_LOGBUFFER_META_DATA_LENGTH ( AERON_ALIGN ( ( sizeof ( aeron_logbuffer_metadata_t ) + AERON_LOGBUFFER_DEFAULT_FRAME_HEADER_MAX_LENGTH ) , AERON_PAGE_MIN_SIZE ) )
const AERON_LOGBUFFER_FRAME_ALIGNMENT = 32
const AERON_MAP_DEFAULT_LOAD_FACTOR = Float32(0.65)
const AERON_PROPERTIES_MAX_LENGTH = 2048
const AERON_HTTP_PROPERTIES_TIMEOUT_NS = 10 * 1000 * 1000 * Clonglong(1000)
const AERON_LOSS_REPORT_FILE = "loss-report.dat"
const AERON_LOSS_REPORTER_ENTRY_ALIGNMENT = AERON_CACHE_LINE_LENGTH
# const aeron_dlsym = dlsym
# const aeron_dlerror = dlerror
const AERON_AGENT_STATE_UNUSED = 0
const AERON_AGENT_STATE_INITED = 1
const AERON_AGENT_STATE_STARTED = 2
const AERON_AGENT_STATE_MANUAL = 3
const AERON_AGENT_STATE_STOPPING = 4
const AERON_AGENT_STATE_STOPPED = 5
const AERON_IDLE_STRATEGY_BACKOFF_MAX_SPINS = 10
const AERON_IDLE_STRATEGY_BACKOFF_MAX_YIELDS = 20
const AERON_IDLE_STRATEGY_BACKOFF_MIN_PARK_PERIOD_NS = Clonglong(1000)
const AERON_IDLE_STRATEGY_BACKOFF_MAX_PARK_PERIOD_NS = 1 * 1000 * Clonglong(1000)
# const aeron_mkdir = mkdir
# const aeron_ftruncate = ftruncate
const AERON_PUBLICATIONS_DIR = "publications"
const AERON_IMAGES_DIR = "images"
const AERON_CNC_FILE = "cnc.dat"
const AERON_CLIENT_COMMAND_QUEUE_CAPACITY = 256

# Skipping MacroDefinition: AERON_BROADCAST_BUFFER_TRAILER_LENGTH ( sizeof ( aeron_broadcast_descriptor_t ) )
const AERON_BROADCAST_PADDING_MSG_TYPE_ID = -1

# Skipping MacroDefinition: AERON_BROADCAST_RECORD_HEADER_LENGTH ( sizeof ( aeron_broadcast_record_descriptor_t ) )
const AERON_BROADCAST_SCRATCH_BUFFER_LENGTH = Cuint(4096)

# Skipping MacroDefinition: AERON_RB_TRAILER_LENGTH ( sizeof ( aeron_rb_descriptor_t ) )

# Skipping MacroDefinition: AERON_RB_ALIGNMENT ( 2 * sizeof ( int32_t ) )

# Skipping MacroDefinition: AERON_RB_RECORD_HEADER_LENGTH ( sizeof ( aeron_rb_record_descriptor_t ) )
const AERON_RB_PADDING_MSG_TYPE_ID = -1
# const AERON_MPSC_RB_MIN_CAPACITY = AERON_RB_RECORD_HEADER_LENGTH
const AERON_COMMAND_ADD_PUBLICATION = 0x01
const AERON_COMMAND_REMOVE_PUBLICATION = 0x02
const AERON_COMMAND_ADD_EXCLUSIVE_PUBLICATION = 0x03
const AERON_COMMAND_ADD_SUBSCRIPTION = 0x04
const AERON_COMMAND_REMOVE_SUBSCRIPTION = 0x05
const AERON_COMMAND_CLIENT_KEEPALIVE = 0x06
const AERON_COMMAND_ADD_DESTINATION = 0x07
const AERON_COMMAND_REMOVE_DESTINATION = 0x08
const AERON_COMMAND_ADD_COUNTER = 0x09
const AERON_COMMAND_REMOVE_COUNTER = 0x0a
const AERON_COMMAND_CLIENT_CLOSE = 0x0b
const AERON_COMMAND_ADD_RCV_DESTINATION = 0x0c
const AERON_COMMAND_REMOVE_RCV_DESTINATION = 0x0d
const AERON_COMMAND_TERMINATE_DRIVER = 0x0e
const AERON_RESPONSE_ON_ERROR = 0x0f01
const AERON_RESPONSE_ON_AVAILABLE_IMAGE = 0x0f02
const AERON_RESPONSE_ON_PUBLICATION_READY = 0x0f03
const AERON_RESPONSE_ON_OPERATION_SUCCESS = 0x0f04
const AERON_RESPONSE_ON_UNAVAILABLE_IMAGE = 0x0f05
const AERON_RESPONSE_ON_EXCLUSIVE_PUBLICATION_READY = 0x0f06
const AERON_RESPONSE_ON_SUBSCRIPTION_READY = 0x0f07
const AERON_RESPONSE_ON_COUNTER_READY = 0x0f08
const AERON_RESPONSE_ON_UNAVAILABLE_COUNTER = 0x0f09
const AERON_RESPONSE_ON_CLIENT_TIMEOUT = 0x0f0a
const AERON_ERROR_CODE_UNKNOWN_CODE_VALUE = -1
const AERON_ERROR_CODE_UNUSED = 0
const AERON_ERROR_CODE_INVALID_CHANNEL = 1
const AERON_ERROR_CODE_UNKNOWN_SUBSCRIPTION = 2
const AERON_ERROR_CODE_UNKNOWN_PUBLICATION = 3
const AERON_ERROR_CODE_CHANNEL_ENDPOINT_ERROR = 4
const AERON_ERROR_CODE_UNKNOWN_COUNTER = 5
const AERON_ERROR_CODE_UNKNOWN_COMMAND_TYPE_ID = 6
const AERON_ERROR_CODE_MALFORMED_COMMAND = 7
const AERON_ERROR_CODE_NOT_SUPPORTED = 8
const AERON_ERROR_CODE_UNKNOWN_HOST = 9
const AERON_ERROR_CODE_RESOURCE_TEMPORARILY_UNAVAILABLE = 10
const AERON_ERROR_CODE_GENERIC_ERROR = 11

# Skipping MacroDefinition: AERON_COUNTERS_MANAGER_VALUE_LENGTH ( sizeof ( aeron_counter_value_descriptor_t ) )

# Skipping MacroDefinition: AERON_COUNTERS_MANAGER_METADATA_LENGTH ( sizeof ( aeron_counter_metadata_descriptor_t ) )
const AERON_COUNTER_CHANNEL_ENDPOINT_STATUS_INITIALIZING = 0
const AERON_COUNTER_CHANNEL_ENDPOINT_STATUS_ERRORED = -1
const AERON_COUNTER_CHANNEL_ENDPOINT_STATUS_NO_ID_ALLOCATED = -1
const AERON_COUNTER_CHANNEL_ENDPOINT_STATUS_ACTIVE = INT64_C(1)
const AERON_COUNTER_CHANNEL_ENDPOINT_STATUS_CLOSING = INT64_C(2)
const AERON_CLIENT_COMMAND_QUEUE_FAIL_THRESHOLD = 10
const AERON_CLIENT_COMMAND_RB_FAIL_THRESHOLD = 10
const AERON_CLIENT_CONDUCTOR_IDLE_SLEEP_NS = 16 * 1000 * Clong(1000)
# const aeron_erand48 = erand48
# const aeron_srand48 = srand48
# const aeron_drand48 = drand48
# const aeron_strndup = strndup
const AERON_FORMAT_NUMBER_TO_LOCALE_STR_LEN = 32
# const AERON_EXPORT = __declspec(dllimport)
const AERON_COUNTER_SYSTEM_COUNTER_TYPE_ID = 0
const AERON_COUNTER_PUBLISHER_LIMIT_NAME = "pub-lmt"
const AERON_COUNTER_PUBLISHER_LIMIT_TYPE_ID = 1
const AERON_COUNTER_SENDER_POSITION_NAME = "snd-pos"
const AERON_COUNTER_SENDER_POSITION_TYPE_ID = 2
const AERON_COUNTER_RECEIVER_HWM_NAME = "rcv-hwm"
const AERON_COUNTER_RECEIVER_HWM_TYPE_ID = 3
const AERON_COUNTER_SUBSCRIPTION_POSITION_NAME = "sub-pos"
const AERON_COUNTER_SUBSCRIPTION_POSITION_TYPE_ID = 4
const AERON_COUNTER_RECEIVER_POSITION_NAME = "rcv-pos"
const AERON_COUNTER_RECEIVER_POSITION_TYPE_ID = 5
const AERON_COUNTER_SEND_CHANNEL_STATUS_NAME = "snd-channel"
const AERON_COUNTER_SEND_CHANNEL_STATUS_TYPE_ID = 6
const AERON_COUNTER_RECEIVE_CHANNEL_STATUS_NAME = "rcv-channel"
const AERON_COUNTER_RECEIVE_CHANNEL_STATUS_TYPE_ID = 7
const AERON_COUNTER_SENDER_LIMIT_NAME = "snd-lmt"
const AERON_COUNTER_SENDER_LIMIT_TYPE_ID = 9
const AERON_COUNTER_PER_IMAGE_TYPE_ID = 10
const AERON_COUNTER_CLIENT_HEARTBEAT_TIMESTAMP_NAME = "client-heartbeat"
const AERON_COUNTER_CLIENT_HEARTBEAT_TIMESTAMP_TYPE_ID = 11
const AERON_COUNTER_PUBLISHER_POSITION_NAME = "pub-pos (sampled)"
const AERON_COUNTER_PUBLISHER_POSITION_TYPE_ID = 12
const AERON_COUNTER_SENDER_BPE_NAME = "snd-bpe"
const AERON_COUNTER_SENDER_BPE_TYPE_ID = 13
const AERON_COUNTER_RCV_LOCAL_SOCKADDR_NAME = "rcv-local-sockaddr"
const AERON_COUNTER_SND_LOCAL_SOCKADDR_NAME = "snd-local-sockaddr"
const AERON_COUNTER_LOCAL_SOCKADDR_TYPE_ID = 14
const AERON_COUNTER_FC_NUM_RECEIVERS_TYPE_ID = 17
const AERON_COUNTER_CHANNEL_MDC_NUM_DESTINATIONS_NAME = "mdc-num-dest"
const AERON_COUNTER_CHANNEL_NUM_DESTINATIONS_TYPE_ID = 18
# const AERON_COUNTER_ARCHIVE_RECORDING_POSITION_TYPE_ID = $(Expr(:toplevel, 100))
# const AERON_COUNTER_ARCHIVE_ERROR_COUNT_TYPE_ID = $(Expr(:toplevel, 101))
# const AERON_COUNTER_ARCHIVE_CONTROL_SESSIONS_TYPE_ID = $(Expr(:toplevel, 102))
const AERON_COUNTER_CLUSTER_CONSENSUS_MODULE_STATE_TYPE_ID = 200
const AERON_COUNTER_CLUSTER_NODE_ROLE_TYPE_ID = 201
const AERON_COUNTER_CLUSTER_CONTROL_TOGGLE_TYPE_ID = 202
const AERON_COUNTER_CLUSTER_COMMIT_POSITION_TYPE_ID = 203
const AERON_COUNTER_CLUSTER_RECOVERY_STATE_TYPE_ID = 204
const AERON_COUNTER_CLUSTER_SNAPSHOT_COUNTER_TYPE_ID = 205
const AERON_COUNTER_CLUSTER_ELECTION_STATE_TYPE_ID = 207
const AERON_COUNTER_CLUSTER_BACKUP_STATE_TYPE_ID = 208
const AERON_COUNTER_CLUSTER_BACKUP_LIVE_LOG_POSITION_TYPE_ID = 209
const AERON_COUNTER_CLUSTER_BACKUP_QUERY_DEADLINE_TYPE_ID = 210
const AERON_COUNTER_CLUSTER_BACKUP_ERROR_COUNT_TYPE_ID = 211
const AERON_COUNTER_CLUSTER_CONSENSUS_MODULE_ERROR_COUNT_TYPE_ID = 212
const AERON_COUNTER_CLUSTER_CLIENT_TIMEOUT_COUNT_TYPE_ID = 213
const AERON_COUNTER_CLUSTER_INVALID_REQUEST_COUNT_TYPE_ID = 214
const AERON_COUNTER_CLUSTER_CLUSTERED_SERVICE_ERROR_COUNT_TYPE_ID = 215
const AERON_MAX_HOST_LENGTH = 384
const AERON_MAX_PORT_LENGTH = 8
const AERON_MAX_PREFIX_LENGTH = 8
const AERON_MAX_HTTP_USERINFO_LENGTH = 384
const AERON_MAX_HTTP_PATH_AND_QUERY_LENGTH = 512
const AERON_MAX_HTTP_URL_LENGTH = AERON_MAX_HTTP_USERINFO_LENGTH + AERON_MAX_HOST_LENGTH + AERON_MAX_PORT_LENGTH + AERON_MAX_HTTP_PATH_AND_QUERY_LENGTH + 9
const AERON_HTTP_RESPONSE_RECV_LENGTH = 4 * 1024
const AERON_HTTP_MAX_HEADER_LENGTH = 1024
# const AERON_SPSC_RB_MIN_CAPACITY = 2AERON_RB_RECORD_HEADER_LENGTH
const AERON_INT64_TO_TAGGED_PTR_VALUE_PRESENT = UINT32_C(1)
const AERON_INT64_TO_TAGGED_PTR_VALUE_ABSENT = UINT32_C(0)
const AERON_SYMBOL_TABLE_NAME_MAX_LENGTH = 1023
# const AERON_ALIGNED_HEADER_LENGTH = AERON_ALIGN(AERON_DATA_HEADER_LENGTH, AERON_LOGBUFFER_FRAME_ALIGNMENT)

# Skipping MacroDefinition: AERON_CNC_VERSION_AND_META_DATA_LENGTH ( AERON_ALIGN ( sizeof ( aeron_cnc_metadata_t ) , AERON_CACHE_LINE_LENGTH * 2u ) )
# const AERON_CNC_VERSION = aeron_semantic_version_compose(0, 2, 0)
const AERON_UDP_CHANNEL_RELIABLE_KEY = "reliable"
const AERON_UDP_CHANNEL_TTL_KEY = "ttl"
const AERON_UDP_CHANNEL_ENDPOINT_KEY = "endpoint"
const AERON_UDP_CHANNEL_INTERFACE_KEY = "interface"
const AERON_UDP_CHANNEL_CONTROL_KEY = "control"
const AERON_UDP_CHANNEL_CONTROL_MODE_KEY = "control-mode"
const AERON_UDP_CHANNEL_CONTROL_MODE_MANUAL_VALUE = "manual"
const AERON_UDP_CHANNEL_CONTROL_MODE_DYNAMIC_VALUE = "dynamic"
const AERON_URI_INITIAL_TERM_ID_KEY = "init-term-id"
const AERON_URI_TERM_ID_KEY = "term-id"
const AERON_URI_TERM_OFFSET_KEY = "term-offset"
const AERON_URI_TERM_LENGTH_KEY = "term-length"
const AERON_URI_LINGER_TIMEOUT_KEY = "linger"
const AERON_URI_MTU_LENGTH_KEY = "mtu"
const AERON_URI_SPARSE_TERM_KEY = "sparse"
const AERON_URI_EOS_KEY = "eos"
const AERON_URI_TETHER_KEY = "tether"
const AERON_URI_TAGS_KEY = "tags"
const AERON_URI_SESSION_ID_KEY = "session-id"
const AERON_URI_GROUP_KEY = "group"
const AERON_URI_REJOIN_KEY = "rejoin"
const AERON_URI_FC_KEY = "fc"
const AERON_URI_GTAG_KEY = "gtag"
const AERON_URI_CC_KEY = "cc"
const AERON_URI_SPIES_SIMULATE_CONNECTION_KEY = "ssc"
const AERON_URI_ATS_KEY = "ats"
const AERON_URI_SOCKET_SNDBUF_KEY = "so-sndbuf"
const AERON_URI_SOCKET_RCVBUF_KEY = "so-rcvbuf"
const AERON_URI_RECEIVER_WINDOW_KEY = "rcv-wnd"
const AERON_URI_MEDIA_RCV_TIMESTAMP_OFFSET_KEY = "media-rcv-ts-offset"
const AERON_URI_CHANNEL_RCV_TIMESTAMP_OFFSET_KEY = "channel-rcv-ts-offset"
const AERON_URI_CHANNEL_SND_TIMESTAMP_OFFSET_KEY = "channel-snd-ts-offset"
const AERON_URI_TIMESTAMP_OFFSET_RESERVED = "reserved"
const AERON_URI_INVALID_TAG = -1
# const AERON_NETUTIL_FORMATTED_MAX_LENGTH = INET6_ADDRSTRLEN + 8











############# Custom
const AERON_DATA_HEADER_LENGTH = ( sizeof( aeron_data_header_t ) )
const AERON_ALIGNED_HEADER_LENGTH = AERON_ALIGN(AERON_DATA_HEADER_LENGTH, AERON_LOGBUFFER_FRAME_ALIGNMENT)