import 'package:protos/val_api.dart';

import '../../export.dart';
import '../models/voice_assistant_state.dart';


class VoiceAssistantStateNotifier extends Notifier<VoiceAssistantState>{
  @override
  VoiceAssistantState build() {
    return const VoiceAssistantState.initial();
  }

  void updateVoiceAssistantState(VoiceAssistantState newState){
    state = newState;
  }

  void updateVoiceAssistantStateWith({
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
  }){
    state = state.copyWith(
      isWakeWordMode: isWakeWordMode,
      isVoiceAssistantEnable: isVoiceAssistantEnable,
      voiceAssistantOverlay: voiceAssistantOverlay,
      isOnlineMode: isOnlineMode,
      isOnlineModeAvailable: isOnlineModeAvailable,
      wakeWord: wakeWord,
      sttModel: sttModel,
      streamId: streamId,
      isCommandProcessing: isCommandProcessing,
      commandProcessingText: commandProcessingText,
      recordingTime: recordingTime,
      buttonPressed: buttonPressed,
      isRecording: isRecording,
      command: command,
      commandResponse: commandResponse,
      isWakeWordDetected: isWakeWordDetected,
      showOverLay: showOverLay,
    );
  }

  void resetToDefaults(){
    state = const VoiceAssistantState.initial();
  }

  void updateWakeWordDetected(bool isWakeWordDetected){
    state = state.copyWith(isWakeWordDetected: isWakeWordDetected);
  }

  void toggleShowOverlay(bool value){
    state = state.copyWith(showOverLay: value);
  }

  bool toggleWakeWordMode(){
    state = state.copyWith(isWakeWordMode: !state.isWakeWordMode);
    return state.isWakeWordMode;
  }

  Future<void> toggleVoiceAssistant(ServiceStatus status) async {
    bool prevState = state.isVoiceAssistantEnable;
    if(!prevState){
      if(status.status){
        state = state.copyWith(isVoiceAssistantEnable: !state.isVoiceAssistantEnable);
        state = state.copyWith(wakeWord: status.wakeWord);
        state = state.copyWith(isOnlineModeAvailable: status.onlineMode);
      }
      else{
        debugPrint("Failed to start the Voice Assistant");
      }
    }
    else{
      state = state.copyWith(isVoiceAssistantEnable: !state.isVoiceAssistantEnable);
      if(state.isWakeWordMode){
        state = state.copyWith(isWakeWordMode: false);
      }
    }
  }

  void toggleVoiceAssistantOverlay(){
    state = state.copyWith(voiceAssistantOverlay: !state.voiceAssistantOverlay);
  }

  void toggleOnlineMode(){
    state = state.copyWith(isOnlineMode: !state.isOnlineMode);
  }

  void updateWakeWord(String wakeWord){
    state = state.copyWith(wakeWord: wakeWord);
  }

  void updateSttModel(SttModel sttModel){
    state = state.copyWith(sttModel: sttModel);
  }

  void updateStreamId(String streamId){
    state = state.copyWith(streamId: streamId);
  }

  void updateIsCommandProcessing(bool isCommandProcessing){
    state = state.copyWith(isCommandProcessing: isCommandProcessing);
  }

  void updateCommandProcessingText(String commandProcessingText){
    state = state.copyWith(commandProcessingText: commandProcessingText);
  }

  void updateRecordingTime(int recordingTime){
    state = state.copyWith(recordingTime: recordingTime);
  }

  void updateIsRecording(){
    state = state.copyWith(isRecording: !state.isRecording);
  }

  void updateCommand(String? command){
    state = state.copyWith(command: command);
  }

  void updateCommandResponse(String? commandResponse){
    state = state.copyWith(commandResponse: commandResponse);
  }


  bool toggleButtonPressed(){
    bool prevState = state.buttonPressed;
    state = state.copyWith(buttonPressed: !state.buttonPressed);
    return !prevState;
  }

  void updateButtonPressed(bool buttonPressed){
    state = state.copyWith(buttonPressed: buttonPressed);
  }
}