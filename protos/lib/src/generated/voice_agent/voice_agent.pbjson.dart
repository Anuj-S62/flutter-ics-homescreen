//
//  Generated code. Do not modify.
//  source: voice_agent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sTTFrameworkDescriptor instead')
const STTFramework$json = {
  '1': 'STTFramework',
  '2': [
    {'1': 'VOSK', '2': 0},
    {'1': 'WHISPER', '2': 1},
  ],
};

/// Descriptor for `STTFramework`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sTTFrameworkDescriptor = $convert.base64Decode(
    'CgxTVFRGcmFtZXdvcmsSCAoEVk9TSxAAEgsKB1dISVNQRVIQAQ==');

@$core.Deprecated('Use onlineModeDescriptor instead')
const OnlineMode$json = {
  '1': 'OnlineMode',
  '2': [
    {'1': 'ONLINE', '2': 0},
    {'1': 'OFFLINE', '2': 1},
  ],
};

/// Descriptor for `OnlineMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List onlineModeDescriptor = $convert.base64Decode(
    'CgpPbmxpbmVNb2RlEgoKBk9OTElORRAAEgsKB09GRkxJTkUQAQ==');

@$core.Deprecated('Use recordActionDescriptor instead')
const RecordAction$json = {
  '1': 'RecordAction',
  '2': [
    {'1': 'START', '2': 0},
    {'1': 'STOP', '2': 1},
  ],
};

/// Descriptor for `RecordAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recordActionDescriptor = $convert.base64Decode(
    'CgxSZWNvcmRBY3Rpb24SCQoFU1RBUlQQABIICgRTVE9QEAE=');

@$core.Deprecated('Use nLUModelDescriptor instead')
const NLUModel$json = {
  '1': 'NLUModel',
  '2': [
    {'1': 'SNIPS', '2': 0},
    {'1': 'RASA', '2': 1},
  ],
};

/// Descriptor for `NLUModel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List nLUModelDescriptor = $convert.base64Decode(
    'CghOTFVNb2RlbBIJCgVTTklQUxAAEggKBFJBU0EQAQ==');

@$core.Deprecated('Use recordModeDescriptor instead')
const RecordMode$json = {
  '1': 'RecordMode',
  '2': [
    {'1': 'MANUAL', '2': 0},
    {'1': 'AUTO', '2': 1},
  ],
};

/// Descriptor for `RecordMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recordModeDescriptor = $convert.base64Decode(
    'CgpSZWNvcmRNb2RlEgoKBk1BTlVBTBAAEggKBEFVVE8QAQ==');

@$core.Deprecated('Use recognizeStatusTypeDescriptor instead')
const RecognizeStatusType$json = {
  '1': 'RecognizeStatusType',
  '2': [
    {'1': 'REC_ERROR', '2': 0},
    {'1': 'REC_SUCCESS', '2': 1},
    {'1': 'REC_PROCESSING', '2': 2},
    {'1': 'VOICE_NOT_RECOGNIZED', '2': 3},
    {'1': 'INTENT_NOT_RECOGNIZED', '2': 4},
    {'1': 'TEXT_NOT_RECOGNIZED', '2': 5},
    {'1': 'NLU_MODEL_NOT_SUPPORTED', '2': 6},
  ],
};

/// Descriptor for `RecognizeStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recognizeStatusTypeDescriptor = $convert.base64Decode(
    'ChNSZWNvZ25pemVTdGF0dXNUeXBlEg0KCVJFQ19FUlJPUhAAEg8KC1JFQ19TVUNDRVNTEAESEg'
        'oOUkVDX1BST0NFU1NJTkcQAhIYChRWT0lDRV9OT1RfUkVDT0dOSVpFRBADEhkKFUlOVEVOVF9O'
        'T1RfUkVDT0dOSVpFRBAEEhcKE1RFWFRfTk9UX1JFQ09HTklaRUQQBRIbChdOTFVfTU9ERUxfTk'
        '9UX1NVUFBPUlRFRBAG');

@$core.Deprecated('Use executeStatusTypeDescriptor instead')
const ExecuteStatusType$json = {
  '1': 'ExecuteStatusType',
  '2': [
    {'1': 'EXEC_ERROR', '2': 0},
    {'1': 'EXEC_SUCCESS', '2': 1},
    {'1': 'KUKSA_CONN_ERROR', '2': 2},
    {'1': 'INTENT_NOT_SUPPORTED', '2': 3},
    {'1': 'INTENT_SLOTS_INCOMPLETE', '2': 4},
  ],
};

/// Descriptor for `ExecuteStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List executeStatusTypeDescriptor = $convert.base64Decode(
    'ChFFeGVjdXRlU3RhdHVzVHlwZRIOCgpFWEVDX0VSUk9SEAASEAoMRVhFQ19TVUNDRVNTEAESFA'
        'oQS1VLU0FfQ09OTl9FUlJPUhACEhgKFElOVEVOVF9OT1RfU1VQUE9SVEVEEAMSGwoXSU5URU5U'
        'X1NMT1RTX0lOQ09NUExFVEUQBA==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use serviceStatusDescriptor instead')
const ServiceStatus$json = {
  '1': 'ServiceStatus',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    {'1': 'status', '3': 2, '4': 1, '5': 8, '10': 'status'},
    {'1': 'wake_word', '3': 3, '4': 1, '5': 9, '10': 'wakeWord'},
    {'1': 'online_mode', '3': 4, '4': 1, '5': 8, '10': 'onlineMode'},
  ],
};

/// Descriptor for `ServiceStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceStatusDescriptor = $convert.base64Decode(
    'Cg1TZXJ2aWNlU3RhdHVzEhgKB3ZlcnNpb24YASABKAlSB3ZlcnNpb24SFgoGc3RhdHVzGAIgAS'
        'gIUgZzdGF0dXMSGwoJd2FrZV93b3JkGAMgASgJUgh3YWtlV29yZBIfCgtvbmxpbmVfbW9kZRgE'
        'IAEoCFIKb25saW5lTW9kZQ==');

@$core.Deprecated('Use voiceAudioDescriptor instead')
const VoiceAudio$json = {
  '1': 'VoiceAudio',
  '2': [
    {'1': 'audio_chunk', '3': 1, '4': 1, '5': 12, '10': 'audioChunk'},
    {'1': 'audio_format', '3': 2, '4': 1, '5': 9, '10': 'audioFormat'},
    {'1': 'sample_rate', '3': 3, '4': 1, '5': 5, '10': 'sampleRate'},
    {'1': 'language', '3': 4, '4': 1, '5': 9, '10': 'language'},
  ],
};

/// Descriptor for `VoiceAudio`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceAudioDescriptor = $convert.base64Decode(
    'CgpWb2ljZUF1ZGlvEh8KC2F1ZGlvX2NodW5rGAEgASgMUgphdWRpb0NodW5rEiEKDGF1ZGlvX2'
        'Zvcm1hdBgCIAEoCVILYXVkaW9Gb3JtYXQSHwoLc2FtcGxlX3JhdGUYAyABKAVSCnNhbXBsZVJh'
        'dGUSGgoIbGFuZ3VhZ2UYBCABKAlSCGxhbmd1YWdl');

@$core.Deprecated('Use wakeWordStatusDescriptor instead')
const WakeWordStatus$json = {
  '1': 'WakeWordStatus',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `WakeWordStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wakeWordStatusDescriptor = $convert.base64Decode(
    'Cg5XYWtlV29yZFN0YXR1cxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cw==');

@$core.Deprecated('Use s_RecognizeVoiceControlDescriptor instead')
const S_RecognizeVoiceControl$json = {
  '1': 'S_RecognizeVoiceControl',
  '2': [
    {'1': 'audio_stream', '3': 1, '4': 1, '5': 11, '6': '.VoiceAudio', '10': 'audioStream'},
    {'1': 'nlu_model', '3': 2, '4': 1, '5': 14, '6': '.NLUModel', '10': 'nluModel'},
    {'1': 'stream_id', '3': 3, '4': 1, '5': 9, '10': 'streamId'},
    {'1': 'stt_framework', '3': 4, '4': 1, '5': 14, '6': '.STTFramework', '10': 'sttFramework'},
  ],
};

/// Descriptor for `S_RecognizeVoiceControl`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RecognizeVoiceControlDescriptor = $convert.base64Decode(
    'ChdTX1JlY29nbml6ZVZvaWNlQ29udHJvbBIuCgxhdWRpb19zdHJlYW0YASABKAsyCy5Wb2ljZU'
        'F1ZGlvUgthdWRpb1N0cmVhbRImCglubHVfbW9kZWwYAiABKA4yCS5OTFVNb2RlbFIIbmx1TW9k'
        'ZWwSGwoJc3RyZWFtX2lkGAMgASgJUghzdHJlYW1JZBIyCg1zdHRfZnJhbWV3b3JrGAQgASgOMg'
        '0uU1RURnJhbWV3b3JrUgxzdHRGcmFtZXdvcms=');

@$core.Deprecated('Use recognizeVoiceControlDescriptor instead')
const RecognizeVoiceControl$json = {
  '1': 'RecognizeVoiceControl',
  '2': [
    {'1': 'action', '3': 1, '4': 1, '5': 14, '6': '.RecordAction', '10': 'action'},
    {'1': 'nlu_model', '3': 2, '4': 1, '5': 14, '6': '.NLUModel', '10': 'nluModel'},
    {'1': 'record_mode', '3': 3, '4': 1, '5': 14, '6': '.RecordMode', '10': 'recordMode'},
    {'1': 'stream_id', '3': 4, '4': 1, '5': 9, '10': 'streamId'},
    {'1': 'stt_framework', '3': 5, '4': 1, '5': 14, '6': '.STTFramework', '10': 'sttFramework'},
    {'1': 'online_mode', '3': 6, '4': 1, '5': 14, '6': '.OnlineMode', '10': 'onlineMode'},
  ],
};

/// Descriptor for `RecognizeVoiceControl`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recognizeVoiceControlDescriptor = $convert.base64Decode(
    'ChVSZWNvZ25pemVWb2ljZUNvbnRyb2wSJQoGYWN0aW9uGAEgASgOMg0uUmVjb3JkQWN0aW9uUg'
        'ZhY3Rpb24SJgoJbmx1X21vZGVsGAIgASgOMgkuTkxVTW9kZWxSCG5sdU1vZGVsEiwKC3JlY29y'
        'ZF9tb2RlGAMgASgOMgsuUmVjb3JkTW9kZVIKcmVjb3JkTW9kZRIbCglzdHJlYW1faWQYBCABKA'
        'lSCHN0cmVhbUlkEjIKDXN0dF9mcmFtZXdvcmsYBSABKA4yDS5TVFRGcmFtZXdvcmtSDHN0dEZy'
        'YW1ld29yaxIsCgtvbmxpbmVfbW9kZRgGIAEoDjILLk9ubGluZU1vZGVSCm9ubGluZU1vZGU=');

@$core.Deprecated('Use recognizeTextControlDescriptor instead')
const RecognizeTextControl$json = {
  '1': 'RecognizeTextControl',
  '2': [
    {'1': 'text_command', '3': 1, '4': 1, '5': 9, '10': 'textCommand'},
    {'1': 'nlu_model', '3': 2, '4': 1, '5': 14, '6': '.NLUModel', '10': 'nluModel'},
  ],
};

/// Descriptor for `RecognizeTextControl`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recognizeTextControlDescriptor = $convert.base64Decode(
    'ChRSZWNvZ25pemVUZXh0Q29udHJvbBIhCgx0ZXh0X2NvbW1hbmQYASABKAlSC3RleHRDb21tYW'
        '5kEiYKCW5sdV9tb2RlbBgCIAEoDjIJLk5MVU1vZGVsUghubHVNb2RlbA==');

@$core.Deprecated('Use intentSlotDescriptor instead')
const IntentSlot$json = {
  '1': 'IntentSlot',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `IntentSlot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List intentSlotDescriptor = $convert.base64Decode(
    'CgpJbnRlbnRTbG90EhIKBG5hbWUYASABKAlSBG5hbWUSFAoFdmFsdWUYAiABKAlSBXZhbHVl');

@$core.Deprecated('Use recognizeResultDescriptor instead')
const RecognizeResult$json = {
  '1': 'RecognizeResult',
  '2': [
    {'1': 'command', '3': 1, '4': 1, '5': 9, '10': 'command'},
    {'1': 'intent', '3': 2, '4': 1, '5': 9, '10': 'intent'},
    {'1': 'intent_slots', '3': 3, '4': 3, '5': 11, '6': '.IntentSlot', '10': 'intentSlots'},
    {'1': 'stream_id', '3': 4, '4': 1, '5': 9, '10': 'streamId'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.RecognizeStatusType', '10': 'status'},
  ],
};

/// Descriptor for `RecognizeResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recognizeResultDescriptor = $convert.base64Decode(
    'Cg9SZWNvZ25pemVSZXN1bHQSGAoHY29tbWFuZBgBIAEoCVIHY29tbWFuZBIWCgZpbnRlbnQYAi'
        'ABKAlSBmludGVudBIuCgxpbnRlbnRfc2xvdHMYAyADKAsyCy5JbnRlbnRTbG90UgtpbnRlbnRT'
        'bG90cxIbCglzdHJlYW1faWQYBCABKAlSCHN0cmVhbUlkEiwKBnN0YXR1cxgFIAEoDjIULlJlY2'
        '9nbml6ZVN0YXR1c1R5cGVSBnN0YXR1cw==');

@$core.Deprecated('Use executeInputDescriptor instead')
const ExecuteInput$json = {
  '1': 'ExecuteInput',
  '2': [
    {'1': 'intent', '3': 1, '4': 1, '5': 9, '10': 'intent'},
    {'1': 'intent_slots', '3': 2, '4': 3, '5': 11, '6': '.IntentSlot', '10': 'intentSlots'},
  ],
};

/// Descriptor for `ExecuteInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeInputDescriptor = $convert.base64Decode(
    'CgxFeGVjdXRlSW5wdXQSFgoGaW50ZW50GAEgASgJUgZpbnRlbnQSLgoMaW50ZW50X3Nsb3RzGA'
        'IgAygLMgsuSW50ZW50U2xvdFILaW50ZW50U2xvdHM=');

@$core.Deprecated('Use executeResultDescriptor instead')
const ExecuteResult$json = {
  '1': 'ExecuteResult',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 9, '10': 'response'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.ExecuteStatusType', '10': 'status'},
  ],
};

/// Descriptor for `ExecuteResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeResultDescriptor = $convert.base64Decode(
    'Cg1FeGVjdXRlUmVzdWx0EhoKCHJlc3BvbnNlGAEgASgJUghyZXNwb25zZRIqCgZzdGF0dXMYAi'
        'ABKA4yEi5FeGVjdXRlU3RhdHVzVHlwZVIGc3RhdHVz');

const $core.Map<$core.String, $core.dynamic> VoiceAgentServiceBase$json = {
  '1': 'VoiceAgentService',
  '2': [
    {'1': 'CheckServiceStatus', '2': '.Empty', '3': '.ServiceStatus'},
    {'1': 'S_DetectWakeWord', '2': '.VoiceAudio', '3': '.WakeWordStatus', '5': true, '6': true},
    {'1': 'DetectWakeWord', '2': '.Empty', '3': '.WakeWordStatus', '6': true},
    {'1': 'S_RecognizeVoiceCommand', '2': '.S_RecognizeVoiceControl', '3': '.RecognizeResult', '5': true},
    {'1': 'RecognizeVoiceCommand', '2': '.RecognizeVoiceControl', '3': '.RecognizeResult', '5': true},
    {'1': 'RecognizeTextCommand', '2': '.RecognizeTextControl', '3': '.RecognizeResult'},
    {'1': 'ExecuteCommand', '2': '.ExecuteInput', '3': '.ExecuteResult'},
  ],
};

@$core.Deprecated('Use voiceAgentServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> VoiceAgentServiceBase$messageJson = {
  '.Empty': Empty$json,
  '.ServiceStatus': ServiceStatus$json,
  '.VoiceAudio': VoiceAudio$json,
  '.WakeWordStatus': WakeWordStatus$json,
  '.S_RecognizeVoiceControl': S_RecognizeVoiceControl$json,
  '.RecognizeResult': RecognizeResult$json,
  '.IntentSlot': IntentSlot$json,
  '.RecognizeVoiceControl': RecognizeVoiceControl$json,
  '.RecognizeTextControl': RecognizeTextControl$json,
  '.ExecuteInput': ExecuteInput$json,
  '.ExecuteResult': ExecuteResult$json,
};

/// Descriptor for `VoiceAgentService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List voiceAgentServiceDescriptor = $convert.base64Decode(
    'ChFWb2ljZUFnZW50U2VydmljZRIsChJDaGVja1NlcnZpY2VTdGF0dXMSBi5FbXB0eRoOLlNlcn'
        'ZpY2VTdGF0dXMSNAoQU19EZXRlY3RXYWtlV29yZBILLlZvaWNlQXVkaW8aDy5XYWtlV29yZFN0'
        'YXR1cygBMAESKwoORGV0ZWN0V2FrZVdvcmQSBi5FbXB0eRoPLldha2VXb3JkU3RhdHVzMAESRw'
        'oXU19SZWNvZ25pemVWb2ljZUNvbW1hbmQSGC5TX1JlY29nbml6ZVZvaWNlQ29udHJvbBoQLlJl'
        'Y29nbml6ZVJlc3VsdCgBEkMKFVJlY29nbml6ZVZvaWNlQ29tbWFuZBIWLlJlY29nbml6ZVZvaW'
        'NlQ29udHJvbBoQLlJlY29nbml6ZVJlc3VsdCgBEj8KFFJlY29nbml6ZVRleHRDb21tYW5kEhUu'
        'UmVjb2duaXplVGV4dENvbnRyb2waEC5SZWNvZ25pemVSZXN1bHQSLwoORXhlY3V0ZUNvbW1hbm'
        'QSDS5FeGVjdXRlSW5wdXQaDi5FeGVjdXRlUmVzdWx0');

