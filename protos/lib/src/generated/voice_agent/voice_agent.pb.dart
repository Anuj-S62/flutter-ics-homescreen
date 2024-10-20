//
//  Generated code. Do not modify.
//  source: voice_agent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'voice_agent.pbenum.dart';

export 'voice_agent.pbenum.dart';

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class ServiceStatus extends $pb.GeneratedMessage {
  factory ServiceStatus({
    $core.String? version,
    $core.bool? status,
    $core.String? wakeWord,
    $core.bool? onlineMode,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (status != null) {
      $result.status = status;
    }
    if (wakeWord != null) {
      $result.wakeWord = wakeWord;
    }
    if (onlineMode != null) {
      $result.onlineMode = onlineMode;
    }
    return $result;
  }
  ServiceStatus._() : super();
  factory ServiceStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceStatus', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'version')
    ..aOB(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'wakeWord')
    ..aOB(4, _omitFieldNames ? '' : 'onlineMode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  ServiceStatus clone() => ServiceStatus()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  ServiceStatus copyWith(void Function(ServiceStatus) updates) => super.copyWith((message) => updates(message as ServiceStatus)) as ServiceStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceStatus create() => ServiceStatus._();
  ServiceStatus createEmptyInstance() => create();
  static $pb.PbList<ServiceStatus> createRepeated() => $pb.PbList<ServiceStatus>();
  @$core.pragma('dart2js:noInline')
  static ServiceStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceStatus>(create);
  static ServiceStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get status => $_getBF(1);
  @$pb.TagNumber(2)
  set status($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get wakeWord => $_getSZ(2);
  @$pb.TagNumber(3)
  set wakeWord($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWakeWord() => $_has(2);
  @$pb.TagNumber(3)
  void clearWakeWord() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get onlineMode => $_getBF(3);
  @$pb.TagNumber(4)
  set onlineMode($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOnlineMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnlineMode() => clearField(4);
}

class VoiceAudio extends $pb.GeneratedMessage {
  factory VoiceAudio({
    $core.List<$core.int>? audioChunk,
    $core.String? audioFormat,
    $core.int? sampleRate,
    $core.String? language,
  }) {
    final $result = create();
    if (audioChunk != null) {
      $result.audioChunk = audioChunk;
    }
    if (audioFormat != null) {
      $result.audioFormat = audioFormat;
    }
    if (sampleRate != null) {
      $result.sampleRate = sampleRate;
    }
    if (language != null) {
      $result.language = language;
    }
    return $result;
  }
  VoiceAudio._() : super();
  factory VoiceAudio.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceAudio.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceAudio', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'audioChunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'audioFormat')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'sampleRate', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'language')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  VoiceAudio clone() => VoiceAudio()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  VoiceAudio copyWith(void Function(VoiceAudio) updates) => super.copyWith((message) => updates(message as VoiceAudio)) as VoiceAudio;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceAudio create() => VoiceAudio._();
  VoiceAudio createEmptyInstance() => create();
  static $pb.PbList<VoiceAudio> createRepeated() => $pb.PbList<VoiceAudio>();
  @$core.pragma('dart2js:noInline')
  static VoiceAudio getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceAudio>(create);
  static VoiceAudio? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get audioChunk => $_getN(0);
  @$pb.TagNumber(1)
  set audioChunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAudioChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioChunk() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get audioFormat => $_getSZ(1);
  @$pb.TagNumber(2)
  set audioFormat($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAudioFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearAudioFormat() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sampleRate => $_getIZ(2);
  @$pb.TagNumber(3)
  set sampleRate($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSampleRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearSampleRate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get language => $_getSZ(3);
  @$pb.TagNumber(4)
  set language($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLanguage() => $_has(3);
  @$pb.TagNumber(4)
  void clearLanguage() => clearField(4);
}

class WakeWordStatus extends $pb.GeneratedMessage {
  factory WakeWordStatus({
    $core.bool? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  WakeWordStatus._() : super();
  factory WakeWordStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WakeWordStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WakeWordStatus', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  WakeWordStatus clone() => WakeWordStatus()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  WakeWordStatus copyWith(void Function(WakeWordStatus) updates) => super.copyWith((message) => updates(message as WakeWordStatus)) as WakeWordStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WakeWordStatus create() => WakeWordStatus._();
  WakeWordStatus createEmptyInstance() => create();
  static $pb.PbList<WakeWordStatus> createRepeated() => $pb.PbList<WakeWordStatus>();
  @$core.pragma('dart2js:noInline')
  static WakeWordStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WakeWordStatus>(create);
  static WakeWordStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class S_RecognizeVoiceControl extends $pb.GeneratedMessage {
  factory S_RecognizeVoiceControl({
    VoiceAudio? audioStream,
    NLUModel? nluModel,
    $core.String? streamId,
    STTFramework? sttFramework,
  }) {
    final $result = create();
    if (audioStream != null) {
      $result.audioStream = audioStream;
    }
    if (nluModel != null) {
      $result.nluModel = nluModel;
    }
    if (streamId != null) {
      $result.streamId = streamId;
    }
    if (sttFramework != null) {
      $result.sttFramework = sttFramework;
    }
    return $result;
  }
  S_RecognizeVoiceControl._() : super();
  factory S_RecognizeVoiceControl.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RecognizeVoiceControl.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_RecognizeVoiceControl', createEmptyInstance: create)
    ..aOM<VoiceAudio>(1, _omitFieldNames ? '' : 'audioStream', subBuilder: VoiceAudio.create)
    ..e<NLUModel>(2, _omitFieldNames ? '' : 'nluModel', $pb.PbFieldType.OE, defaultOrMaker: NLUModel.SNIPS, valueOf: NLUModel.valueOf, enumValues: NLUModel.values)
    ..aOS(3, _omitFieldNames ? '' : 'streamId')
    ..e<STTFramework>(4, _omitFieldNames ? '' : 'sttFramework', $pb.PbFieldType.OE, defaultOrMaker: STTFramework.VOSK, valueOf: STTFramework.valueOf, enumValues: STTFramework.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  S_RecognizeVoiceControl clone() => S_RecognizeVoiceControl()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  S_RecognizeVoiceControl copyWith(void Function(S_RecognizeVoiceControl) updates) => super.copyWith((message) => updates(message as S_RecognizeVoiceControl)) as S_RecognizeVoiceControl;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_RecognizeVoiceControl create() => S_RecognizeVoiceControl._();
  S_RecognizeVoiceControl createEmptyInstance() => create();
  static $pb.PbList<S_RecognizeVoiceControl> createRepeated() => $pb.PbList<S_RecognizeVoiceControl>();
  @$core.pragma('dart2js:noInline')
  static S_RecognizeVoiceControl getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_RecognizeVoiceControl>(create);
  static S_RecognizeVoiceControl? _defaultInstance;

  @$pb.TagNumber(1)
  VoiceAudio get audioStream => $_getN(0);
  @$pb.TagNumber(1)
  set audioStream(VoiceAudio v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAudioStream() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioStream() => clearField(1);
  @$pb.TagNumber(1)
  VoiceAudio ensureAudioStream() => $_ensure(0);

  @$pb.TagNumber(2)
  NLUModel get nluModel => $_getN(1);
  @$pb.TagNumber(2)
  set nluModel(NLUModel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNluModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearNluModel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get streamId => $_getSZ(2);
  @$pb.TagNumber(3)
  set streamId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStreamId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamId() => clearField(3);

  @$pb.TagNumber(4)
  STTFramework get sttFramework => $_getN(3);
  @$pb.TagNumber(4)
  set sttFramework(STTFramework v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSttFramework() => $_has(3);
  @$pb.TagNumber(4)
  void clearSttFramework() => clearField(4);
}

class RecognizeVoiceControl extends $pb.GeneratedMessage {
  factory RecognizeVoiceControl({
    RecordAction? action,
    NLUModel? nluModel,
    RecordMode? recordMode,
    $core.String? streamId,
    STTFramework? sttFramework,
    OnlineMode? onlineMode,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    if (nluModel != null) {
      $result.nluModel = nluModel;
    }
    if (recordMode != null) {
      $result.recordMode = recordMode;
    }
    if (streamId != null) {
      $result.streamId = streamId;
    }
    if (sttFramework != null) {
      $result.sttFramework = sttFramework;
    }
    if (onlineMode != null) {
      $result.onlineMode = onlineMode;
    }
    return $result;
  }
  RecognizeVoiceControl._() : super();
  factory RecognizeVoiceControl.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecognizeVoiceControl.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecognizeVoiceControl', createEmptyInstance: create)
    ..e<RecordAction>(1, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: RecordAction.START, valueOf: RecordAction.valueOf, enumValues: RecordAction.values)
    ..e<NLUModel>(2, _omitFieldNames ? '' : 'nluModel', $pb.PbFieldType.OE, defaultOrMaker: NLUModel.SNIPS, valueOf: NLUModel.valueOf, enumValues: NLUModel.values)
    ..e<RecordMode>(3, _omitFieldNames ? '' : 'recordMode', $pb.PbFieldType.OE, defaultOrMaker: RecordMode.MANUAL, valueOf: RecordMode.valueOf, enumValues: RecordMode.values)
    ..aOS(4, _omitFieldNames ? '' : 'streamId')
    ..e<STTFramework>(5, _omitFieldNames ? '' : 'sttFramework', $pb.PbFieldType.OE, defaultOrMaker: STTFramework.VOSK, valueOf: STTFramework.valueOf, enumValues: STTFramework.values)
    ..e<OnlineMode>(6, _omitFieldNames ? '' : 'onlineMode', $pb.PbFieldType.OE, defaultOrMaker: OnlineMode.ONLINE, valueOf: OnlineMode.valueOf, enumValues: OnlineMode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  RecognizeVoiceControl clone() => RecognizeVoiceControl()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  RecognizeVoiceControl copyWith(void Function(RecognizeVoiceControl) updates) => super.copyWith((message) => updates(message as RecognizeVoiceControl)) as RecognizeVoiceControl;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecognizeVoiceControl create() => RecognizeVoiceControl._();
  RecognizeVoiceControl createEmptyInstance() => create();
  static $pb.PbList<RecognizeVoiceControl> createRepeated() => $pb.PbList<RecognizeVoiceControl>();
  @$core.pragma('dart2js:noInline')
  static RecognizeVoiceControl getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecognizeVoiceControl>(create);
  static RecognizeVoiceControl? _defaultInstance;

  @$pb.TagNumber(1)
  RecordAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(RecordAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  NLUModel get nluModel => $_getN(1);
  @$pb.TagNumber(2)
  set nluModel(NLUModel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNluModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearNluModel() => clearField(2);

  @$pb.TagNumber(3)
  RecordMode get recordMode => $_getN(2);
  @$pb.TagNumber(3)
  set recordMode(RecordMode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecordMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecordMode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get streamId => $_getSZ(3);
  @$pb.TagNumber(4)
  set streamId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStreamId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamId() => clearField(4);

  @$pb.TagNumber(5)
  STTFramework get sttFramework => $_getN(4);
  @$pb.TagNumber(5)
  set sttFramework(STTFramework v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSttFramework() => $_has(4);
  @$pb.TagNumber(5)
  void clearSttFramework() => clearField(5);

  @$pb.TagNumber(6)
  OnlineMode get onlineMode => $_getN(5);
  @$pb.TagNumber(6)
  set onlineMode(OnlineMode v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasOnlineMode() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnlineMode() => clearField(6);
}

class RecognizeTextControl extends $pb.GeneratedMessage {
  factory RecognizeTextControl({
    $core.String? textCommand,
    NLUModel? nluModel,
  }) {
    final $result = create();
    if (textCommand != null) {
      $result.textCommand = textCommand;
    }
    if (nluModel != null) {
      $result.nluModel = nluModel;
    }
    return $result;
  }
  RecognizeTextControl._() : super();
  factory RecognizeTextControl.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecognizeTextControl.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecognizeTextControl', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'textCommand')
    ..e<NLUModel>(2, _omitFieldNames ? '' : 'nluModel', $pb.PbFieldType.OE, defaultOrMaker: NLUModel.SNIPS, valueOf: NLUModel.valueOf, enumValues: NLUModel.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  RecognizeTextControl clone() => RecognizeTextControl()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  RecognizeTextControl copyWith(void Function(RecognizeTextControl) updates) => super.copyWith((message) => updates(message as RecognizeTextControl)) as RecognizeTextControl;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecognizeTextControl create() => RecognizeTextControl._();
  RecognizeTextControl createEmptyInstance() => create();
  static $pb.PbList<RecognizeTextControl> createRepeated() => $pb.PbList<RecognizeTextControl>();
  @$core.pragma('dart2js:noInline')
  static RecognizeTextControl getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecognizeTextControl>(create);
  static RecognizeTextControl? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get textCommand => $_getSZ(0);
  @$pb.TagNumber(1)
  set textCommand($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTextCommand() => $_has(0);
  @$pb.TagNumber(1)
  void clearTextCommand() => clearField(1);

  @$pb.TagNumber(2)
  NLUModel get nluModel => $_getN(1);
  @$pb.TagNumber(2)
  set nluModel(NLUModel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNluModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearNluModel() => clearField(2);
}

class IntentSlot extends $pb.GeneratedMessage {
  factory IntentSlot({
    $core.String? name,
    $core.String? value,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  IntentSlot._() : super();
  factory IntentSlot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IntentSlot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IntentSlot', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  IntentSlot clone() => IntentSlot()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  IntentSlot copyWith(void Function(IntentSlot) updates) => super.copyWith((message) => updates(message as IntentSlot)) as IntentSlot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntentSlot create() => IntentSlot._();
  IntentSlot createEmptyInstance() => create();
  static $pb.PbList<IntentSlot> createRepeated() => $pb.PbList<IntentSlot>();
  @$core.pragma('dart2js:noInline')
  static IntentSlot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IntentSlot>(create);
  static IntentSlot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class RecognizeResult extends $pb.GeneratedMessage {
  factory RecognizeResult({
    $core.String? command,
    $core.String? intent,
    $core.Iterable<IntentSlot>? intentSlots,
    $core.String? streamId,
    RecognizeStatusType? status,
  }) {
    final $result = create();
    if (command != null) {
      $result.command = command;
    }
    if (intent != null) {
      $result.intent = intent;
    }
    if (intentSlots != null) {
      $result.intentSlots.addAll(intentSlots);
    }
    if (streamId != null) {
      $result.streamId = streamId;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  RecognizeResult._() : super();
  factory RecognizeResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecognizeResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecognizeResult', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'command')
    ..aOS(2, _omitFieldNames ? '' : 'intent')
    ..pc<IntentSlot>(3, _omitFieldNames ? '' : 'intentSlots', $pb.PbFieldType.PM, subBuilder: IntentSlot.create)
    ..aOS(4, _omitFieldNames ? '' : 'streamId')
    ..e<RecognizeStatusType>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: RecognizeStatusType.REC_ERROR, valueOf: RecognizeStatusType.valueOf, enumValues: RecognizeStatusType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  RecognizeResult clone() => RecognizeResult()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  RecognizeResult copyWith(void Function(RecognizeResult) updates) => super.copyWith((message) => updates(message as RecognizeResult)) as RecognizeResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecognizeResult create() => RecognizeResult._();
  RecognizeResult createEmptyInstance() => create();
  static $pb.PbList<RecognizeResult> createRepeated() => $pb.PbList<RecognizeResult>();
  @$core.pragma('dart2js:noInline')
  static RecognizeResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecognizeResult>(create);
  static RecognizeResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get command => $_getSZ(0);
  @$pb.TagNumber(1)
  set command($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommand() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get intent => $_getSZ(1);
  @$pb.TagNumber(2)
  set intent($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIntent() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntent() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<IntentSlot> get intentSlots => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get streamId => $_getSZ(3);
  @$pb.TagNumber(4)
  set streamId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStreamId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamId() => clearField(4);

  @$pb.TagNumber(5)
  RecognizeStatusType get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(RecognizeStatusType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}

class ExecuteInput extends $pb.GeneratedMessage {
  factory ExecuteInput({
    $core.String? intent,
    $core.Iterable<IntentSlot>? intentSlots,
  }) {
    final $result = create();
    if (intent != null) {
      $result.intent = intent;
    }
    if (intentSlots != null) {
      $result.intentSlots.addAll(intentSlots);
    }
    return $result;
  }
  ExecuteInput._() : super();
  factory ExecuteInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExecuteInput', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'intent')
    ..pc<IntentSlot>(2, _omitFieldNames ? '' : 'intentSlots', $pb.PbFieldType.PM, subBuilder: IntentSlot.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  ExecuteInput clone() => ExecuteInput()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  ExecuteInput copyWith(void Function(ExecuteInput) updates) => super.copyWith((message) => updates(message as ExecuteInput)) as ExecuteInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteInput create() => ExecuteInput._();
  ExecuteInput createEmptyInstance() => create();
  static $pb.PbList<ExecuteInput> createRepeated() => $pb.PbList<ExecuteInput>();
  @$core.pragma('dart2js:noInline')
  static ExecuteInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteInput>(create);
  static ExecuteInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get intent => $_getSZ(0);
  @$pb.TagNumber(1)
  set intent($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIntent() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntent() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<IntentSlot> get intentSlots => $_getList(1);
}

class ExecuteResult extends $pb.GeneratedMessage {
  factory ExecuteResult({
    $core.String? response,
    ExecuteStatusType? status,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  ExecuteResult._() : super();
  factory ExecuteResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExecuteResult', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'response')
    ..e<ExecuteStatusType>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ExecuteStatusType.EXEC_ERROR, valueOf: ExecuteStatusType.valueOf, enumValues: ExecuteStatusType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
          'Will be removed in next major version')
  ExecuteResult clone() => ExecuteResult()..mergeFromMessage(this);
  @$core.Deprecated(
      'Using this can add significant overhead to your binary. '
          'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
          'Will be removed in next major version')
  ExecuteResult copyWith(void Function(ExecuteResult) updates) => super.copyWith((message) => updates(message as ExecuteResult)) as ExecuteResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteResult create() => ExecuteResult._();
  ExecuteResult createEmptyInstance() => create();
  static $pb.PbList<ExecuteResult> createRepeated() => $pb.PbList<ExecuteResult>();
  @$core.pragma('dart2js:noInline')
  static ExecuteResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteResult>(create);
  static ExecuteResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get response => $_getSZ(0);
  @$pb.TagNumber(1)
  set response($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => clearField(1);

  @$pb.TagNumber(2)
  ExecuteStatusType get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(ExecuteStatusType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class VoiceAgentServiceApi {
  $pb.RpcClient _client;
  VoiceAgentServiceApi(this._client);

  $async.Future<ServiceStatus> checkServiceStatus($pb.ClientContext? ctx, Empty request) =>
      _client.invoke<ServiceStatus>(ctx, 'VoiceAgentService', 'CheckServiceStatus', request, ServiceStatus())
  ;
  $async.Future<WakeWordStatus> s_DetectWakeWord($pb.ClientContext? ctx, VoiceAudio request) =>
      _client.invoke<WakeWordStatus>(ctx, 'VoiceAgentService', 'S_DetectWakeWord', request, WakeWordStatus())
  ;
  $async.Future<WakeWordStatus> detectWakeWord($pb.ClientContext? ctx, Empty request) =>
      _client.invoke<WakeWordStatus>(ctx, 'VoiceAgentService', 'DetectWakeWord', request, WakeWordStatus())
  ;
  $async.Future<RecognizeResult> s_RecognizeVoiceCommand($pb.ClientContext? ctx, S_RecognizeVoiceControl request) =>
      _client.invoke<RecognizeResult>(ctx, 'VoiceAgentService', 'S_RecognizeVoiceCommand', request, RecognizeResult())
  ;
  $async.Future<RecognizeResult> recognizeVoiceCommand($pb.ClientContext? ctx, RecognizeVoiceControl request) =>
      _client.invoke<RecognizeResult>(ctx, 'VoiceAgentService', 'RecognizeVoiceCommand', request, RecognizeResult())
  ;
  $async.Future<RecognizeResult> recognizeTextCommand($pb.ClientContext? ctx, RecognizeTextControl request) =>
      _client.invoke<RecognizeResult>(ctx, 'VoiceAgentService', 'RecognizeTextCommand', request, RecognizeResult())
  ;
  $async.Future<ExecuteResult> executeCommand($pb.ClientContext? ctx, ExecuteInput request) =>
      _client.invoke<ExecuteResult>(ctx, 'VoiceAgentService', 'ExecuteCommand', request, ExecuteResult())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
