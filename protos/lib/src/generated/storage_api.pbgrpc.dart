//
//  Generated code. Do not modify.
//  source: protos/protos/storage_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'storage_api.pb.dart' as $0;

export 'storage_api.pb.dart';

@$pb.GrpcServiceName('storage_api.Database')
class DatabaseClient extends $grpc.Client {
  static final _$destroyDB = $grpc.ClientMethod<$0.DestroyArguments, $0.StandardResponse>(
      '/storage_api.Database/DestroyDB',
      ($0.DestroyArguments value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StandardResponse.fromBuffer(value));
  static final _$write = $grpc.ClientMethod<$0.KeyValue, $0.StandardResponse>(
      '/storage_api.Database/Write',
      ($0.KeyValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StandardResponse.fromBuffer(value));
  static final _$read = $grpc.ClientMethod<$0.Key, $0.ReadResponse>(
      '/storage_api.Database/Read',
      ($0.Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReadResponse.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$0.Key, $0.StandardResponse>(
      '/storage_api.Database/Delete',
      ($0.Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StandardResponse.fromBuffer(value));
  static final _$search = $grpc.ClientMethod<$0.Key, $0.ListResponse>(
      '/storage_api.Database/Search',
      ($0.Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));
  static final _$deleteNodes = $grpc.ClientMethod<$0.Key, $0.StandardResponse>(
      '/storage_api.Database/DeleteNodes',
      ($0.Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StandardResponse.fromBuffer(value));
  static final _$listNodes = $grpc.ClientMethod<$0.SubtreeInfo, $0.ListResponse>(
      '/storage_api.Database/ListNodes',
      ($0.SubtreeInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));

  DatabaseClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.StandardResponse> destroyDB($0.DestroyArguments request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$destroyDB, request, options: options);
  }

  $grpc.ResponseFuture<$0.StandardResponse> write($0.KeyValue request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$write, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReadResponse> read($0.Key request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$read, request, options: options);
  }

  $grpc.ResponseFuture<$0.StandardResponse> delete($0.Key request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListResponse> search($0.Key request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$search, request, options: options);
  }

  $grpc.ResponseFuture<$0.StandardResponse> deleteNodes($0.Key request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteNodes, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListResponse> listNodes($0.SubtreeInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listNodes, request, options: options);
  }
}

@$pb.GrpcServiceName('storage_api.Database')
abstract class DatabaseServiceBase extends $grpc.Service {
  $core.String get $name => 'storage_api.Database';

  DatabaseServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DestroyArguments, $0.StandardResponse>(
        'DestroyDB',
        destroyDB_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DestroyArguments.fromBuffer(value),
        ($0.StandardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.KeyValue, $0.StandardResponse>(
        'Write',
        write_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.KeyValue.fromBuffer(value),
        ($0.StandardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Key, $0.ReadResponse>(
        'Read',
        read_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Key.fromBuffer(value),
        ($0.ReadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Key, $0.StandardResponse>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Key.fromBuffer(value),
        ($0.StandardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Key, $0.ListResponse>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Key.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Key, $0.StandardResponse>(
        'DeleteNodes',
        deleteNodes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Key.fromBuffer(value),
        ($0.StandardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubtreeInfo, $0.ListResponse>(
        'ListNodes',
        listNodes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SubtreeInfo.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.StandardResponse> destroyDB_Pre($grpc.ServiceCall call, $async.Future<$0.DestroyArguments> request) async {
    return destroyDB(call, await request);
  }

  $async.Future<$0.StandardResponse> write_Pre($grpc.ServiceCall call, $async.Future<$0.KeyValue> request) async {
    return write(call, await request);
  }

  $async.Future<$0.ReadResponse> read_Pre($grpc.ServiceCall call, $async.Future<$0.Key> request) async {
    return read(call, await request);
  }

  $async.Future<$0.StandardResponse> delete_Pre($grpc.ServiceCall call, $async.Future<$0.Key> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.ListResponse> search_Pre($grpc.ServiceCall call, $async.Future<$0.Key> request) async {
    return search(call, await request);
  }

  $async.Future<$0.StandardResponse> deleteNodes_Pre($grpc.ServiceCall call, $async.Future<$0.Key> request) async {
    return deleteNodes(call, await request);
  }

  $async.Future<$0.ListResponse> listNodes_Pre($grpc.ServiceCall call, $async.Future<$0.SubtreeInfo> request) async {
    return listNodes(call, await request);
  }

  $async.Future<$0.StandardResponse> destroyDB($grpc.ServiceCall call, $0.DestroyArguments request);
  $async.Future<$0.StandardResponse> write($grpc.ServiceCall call, $0.KeyValue request);
  $async.Future<$0.ReadResponse> read($grpc.ServiceCall call, $0.Key request);
  $async.Future<$0.StandardResponse> delete($grpc.ServiceCall call, $0.Key request);
  $async.Future<$0.ListResponse> search($grpc.ServiceCall call, $0.Key request);
  $async.Future<$0.StandardResponse> deleteNodes($grpc.ServiceCall call, $0.Key request);
  $async.Future<$0.ListResponse> listNodes($grpc.ServiceCall call, $0.SubtreeInfo request);
}
