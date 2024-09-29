enum SttModel {
  whisper,
  vosk
}

class VoiceAssistantState{
  final bool isWakeWordMode;
  final bool isVoiceAssistantEnable;
  final bool voiceAssistantOverlay;
  final bool isOnlineMode;
  final bool isOnlineModeAvailable;
  final String wakeWord;
  final SttModel sttModel;
  final String streamId;
  final bool isCommandProcessing;
  final String commandProcessingText;
  final int recordingTime;
  final bool buttonPressed;
  final bool isRecording;
  final String command;
  final String commandResponse;
  final bool isWakeWordDetected;
  final bool showOverLay;


  const VoiceAssistantState({
    required this.isWakeWordMode,
    required this.isVoiceAssistantEnable,
    required this.voiceAssistantOverlay,
    required this.isOnlineMode,
    required this.isOnlineModeAvailable,
    required this.wakeWord,
    required this.sttModel,
    required this.streamId,
    required this.isCommandProcessing,
    required this.commandProcessingText,
    required this.recordingTime,
    required this.buttonPressed,
    required this.isRecording,
    required this.command,
    required this.commandResponse,
    required this.isWakeWordDetected,
    required this.showOverLay,
  });

  const VoiceAssistantState.initial()
      : wakeWord = "hello auto",
        sttModel = SttModel.whisper,
        streamId = "",
        isWakeWordMode = false,
        isVoiceAssistantEnable = false,
        voiceAssistantOverlay = false,
        isOnlineMode = false,
        isOnlineModeAvailable = false,
        isCommandProcessing = false,
        commandProcessingText = "Processing...",
        recordingTime = 4,
        buttonPressed = false,
        isRecording = false,
        command = "",
        commandResponse = "",
        isWakeWordDetected = false,
        showOverLay = false;

  VoiceAssistantState copyWith({
    bool? isWakeWordMode,
    bool? isVoiceAssistantEnable,
    bool? voiceAssistantOverlay,
    bool? isOnlineMode,
    bool? isOnlineModeAvailable,
    String? wakeWord,
    SttModel? sttModel,
    String? streamId,
    bool? isCommandProcessing,
    String? commandProcessingText,
    int? recordingTime,
    bool? buttonPressed,
    bool? isRecording,
    String? command,
    String? commandResponse,
    bool? isWakeWordDetected,
    bool? showOverLay,
  }) {
    return VoiceAssistantState(
      isVoiceAssistantEnable : isVoiceAssistantEnable ?? this.isVoiceAssistantEnable,
      isWakeWordMode : isWakeWordMode ?? this.isWakeWordMode,
      voiceAssistantOverlay : voiceAssistantOverlay ?? this.voiceAssistantOverlay,
      isOnlineMode : isOnlineMode ?? this.isOnlineMode,
      isOnlineModeAvailable : isOnlineModeAvailable ?? this.isOnlineModeAvailable,
      wakeWord : wakeWord ?? this.wakeWord,
      sttModel : sttModel ?? this.sttModel,
      streamId : streamId ?? this.streamId,
      isCommandProcessing : isCommandProcessing ?? this.isCommandProcessing,
      commandProcessingText : commandProcessingText ?? this.commandProcessingText,
      recordingTime : recordingTime ?? this.recordingTime,
      buttonPressed : buttonPressed ?? this.buttonPressed,
      isRecording : isRecording ?? this.isRecording,
      command : command ?? this.command,
      commandResponse : commandResponse ?? this.commandResponse,
      isWakeWordDetected: isWakeWordDetected ?? this.isWakeWordDetected,
      showOverLay: showOverLay ?? this.showOverLay,
    );
  }
}