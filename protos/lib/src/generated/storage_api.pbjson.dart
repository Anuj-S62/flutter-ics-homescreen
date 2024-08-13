//
//  Generated code. Do not modify.
//  source: protos/protos/storage_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use keyDescriptor instead')
const Key$json = {
  '1': 'Key',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'namespace', '3': 2, '4': 1, '5': 9, '10': 'namespace'},
  ],
};

/// Descriptor for `Key`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyDescriptor = $convert.base64Decode(
    'CgNLZXkSEAoDa2V5GAEgASgJUgNrZXkSHAoJbmFtZXNwYWNlGAIgASgJUgluYW1lc3BhY2U=');

@$core.Deprecated('Use valueDescriptor instead')
const Value$json = {
  '1': 'Value',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueDescriptor = $convert.base64Decode(
    'CgVWYWx1ZRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');

@$core.Deprecated('Use keyValueDescriptor instead')
const KeyValue$json = {
  '1': 'KeyValue',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    {'1': 'namespace', '3': 3, '4': 1, '5': 9, '10': 'namespace'},
  ],
};

/// Descriptor for `KeyValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyValueDescriptor = $convert.base64Decode(
    'CghLZXlWYWx1ZRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWUSHAoJbm'
    'FtZXNwYWNlGAMgASgJUgluYW1lc3BhY2U=');

@$core.Deprecated('Use subtreeInfoDescriptor instead')
const SubtreeInfo$json = {
  '1': 'SubtreeInfo',
  '2': [
    {'1': 'node', '3': 1, '4': 1, '5': 9, '10': 'node'},
    {'1': 'layers', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'layers', '17': true},
    {'1': 'namespace', '3': 3, '4': 1, '5': 9, '10': 'namespace'},
  ],
  '8': [
    {'1': '_layers'},
  ],
};

/// Descriptor for `SubtreeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtreeInfoDescriptor = $convert.base64Decode(
    'CgtTdWJ0cmVlSW5mbxISCgRub2RlGAEgASgJUgRub2RlEhsKBmxheWVycxgCIAEoBUgAUgZsYX'
    'llcnOIAQESHAoJbmFtZXNwYWNlGAMgASgJUgluYW1lc3BhY2VCCQoHX2xheWVycw==');

@$core.Deprecated('Use destroyArgumentsDescriptor instead')
const DestroyArguments$json = {
  '1': 'DestroyArguments',
};

/// Descriptor for `DestroyArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List destroyArgumentsDescriptor = $convert.base64Decode(
    'ChBEZXN0cm95QXJndW1lbnRz');

@$core.Deprecated('Use standardResponseDescriptor instead')
const StandardResponse$json = {
  '1': 'StandardResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `StandardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List standardResponseDescriptor = $convert.base64Decode(
    'ChBTdGFuZGFyZFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use readResponseDescriptor instead')
const ReadResponse$json = {
  '1': 'ReadResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'result', '3': 3, '4': 1, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `ReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readResponseDescriptor = $convert.base64Decode(
    'CgxSZWFkUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGAIgAS'
    'gJUgdtZXNzYWdlEhYKBnJlc3VsdBgDIAEoCVIGcmVzdWx0');

@$core.Deprecated('Use listResponseDescriptor instead')
const ListResponse$json = {
  '1': 'ListResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'result', '3': 3, '4': 3, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `ListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listResponseDescriptor = $convert.base64Decode(
    'CgxMaXN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGAIgAS'
    'gJUgdtZXNzYWdlEhYKBnJlc3VsdBgDIAMoCVIGcmVzdWx0');

