import 'dart:async';
import 'package:flutter_ics_homescreen/data/models/voice_assistant_state.dart';
import 'package:protos/val_api.dart';

import '../../export.dart';

class VoiceAgentClient {
  final VoiceAgentConfig config;
  late ClientChannel _channel;
  late VoiceAgentServiceClient _client;
  final Ref ref;
  StreamSubscription<WakeWordStatus>? _wakeWordStatusSubscription;

  VoiceAgentClient({required this.config,required this.ref}) {
    // Initialize the client channel without connecting immediately
    debugPrint("Connecting to Voice Assistant at ${config.hostname}:${config.port}");
    String host = config.hostname;
    int port = config.port;
    _channel = ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _client = VoiceAgentServiceClient(_channel);

  }

  Future<ServiceStatus> checkServiceStatus() async {
    final empty = Empty();
    try {
      final response = await _client.checkServiceStatus(empty);
      return response;
    } catch (e) {
      // Handle the error gracefully, such as returning an error status
      return ServiceStatus()..status = false;
    }
  }

  Stream<WakeWordStatus> detectWakeWord() {
    final empty = Empty();
    try {
      return _client.detectWakeWord(empty);
    } catch (e) {
      // Handle the error gracefully, such as returning a default status
      return const Stream.empty(); // An empty stream as a placeholder
    }
  }

  Future<RecognizeResult> recognizeVoiceCommand(
      Stream<RecognizeVoiceControl> controlStream) async {
    try {
      final response = await _client.recognizeVoiceCommand(controlStream);
      return response;
    } catch (e) {
      // Handle the error gracefully, such as returning a default RecognizeResult
      return RecognizeResult()..status = RecognizeStatusType.REC_ERROR;
    }
  }

  Future<RecognizeResult> recognizeTextCommandGrpc(
      RecognizeTextControl controlInput) async {
    try {
      final response = await _client.recognizeTextCommand(controlInput);
      return response;
    } catch (e) {
      // Handle the error gracefully, such as returning a default RecognizeResult
      return RecognizeResult()..status = RecognizeStatusType.REC_ERROR;
    }
  }

  Future<ExecuteResult> executeCommandGrpc(ExecuteInput input) async {
    try {
      final response = await _client.executeCommand(input);
      return response;
    } catch (e) {
      // Handle the error gracefully, such as returning an error status
      return ExecuteResult()..status = ExecuteStatusType.EXEC_ERROR;
    }
  }

  Future<void> shutdown() async {
    // await _channel.shutdown();
  }

  // Grpc helper methods
  Future<void> startWakeWordDetection() async {
    // Capture the state before any async operations
    _wakeWordStatusSubscription?.cancel();
    final isWakeWordModeActive = ref.read(voiceAssistantStateProvider.select((value) => value.isWakeWordMode));

    if (isWakeWordModeActive) {
      debugPrint("Wake Word Detection Started");
    } else {
      debugPrint("Wake Word Detection Stopped");
      return;
    }
    _wakeWordStatusSubscription = detectWakeWord().listen(
          (response) async {
        if (response.status) {
          await startVoiceAssistant();
          // Wait for 2-3 seconds and then restart wake word detection
          await Future.delayed(const Duration(seconds: 2));
          startWakeWordDetection();
        }
        if(!ref.read(voiceAssistantStateProvider.select((value) => value.isWakeWordMode))){
          _wakeWordStatusSubscription?.cancel();
          return;
        }
      },
      onError: (error) {
      },
      cancelOnError: true,
    );
  }

  Future<String> startRecording() async {
    String streamId = "";
    try {
      // Create a RecognizeControl message to start recording
      final controlMessage = RecognizeVoiceControl()
        ..action = RecordAction.START
        ..recordMode = RecordMode
            .MANUAL; // You can change this to your desired record mode

      // Create a Stream with the control message
      final controlStream = Stream.fromIterable([controlMessage]);

      // Call the gRPC method to start recording
      final response =
      await recognizeVoiceCommand(controlStream);

      streamId = response.streamId;
    } catch (e) {
    }
    return streamId;
  }

  Future<RecognizeResult> stopRecording(
      String streamId, String nluModel, String stt,bool isOnlineMode) async {

    try {
      NLUModel model = NLUModel.RASA;
      if (nluModel == "snips") {
        model = NLUModel.SNIPS;
      }
      STTFramework sttFramework = STTFramework.VOSK;
      if (stt == "whisper") {
        sttFramework = STTFramework.WHISPER;
      }
      OnlineMode onlineMode = OnlineMode.OFFLINE;
      if (isOnlineMode) {
        onlineMode = OnlineMode.ONLINE;
      }
      // Create a RecognizeControl message to stop recording
      final controlMessage = RecognizeVoiceControl()
        ..action = RecordAction.STOP
        ..nluModel = model
        ..streamId =
            streamId // Use the same stream ID as when starting recording
        ..recordMode = RecordMode.MANUAL
        ..sttFramework = sttFramework
        ..onlineMode = onlineMode;


      // Create a Stream with the control message
      final controlStream = Stream.fromIterable([controlMessage]);

      // Call the gRPC method to stop recording
      final response =
      await recognizeVoiceCommand(controlStream);

      // Process and store the result
      if (response.status == RecognizeStatusType.REC_SUCCESS) {
      } else if (response.status == RecognizeStatusType.INTENT_NOT_RECOGNIZED) {
        final command = response.command;
        debugPrint("Command is : $command");
      }
      else {
        debugPrint('Failed to process your voice command. Please try again.');
      }
      await shutdown();
      return response;
    } catch (e) {
      // addChatMessage(/**/'Failed to process your voice command. Please try again.');
      await shutdown();
      return RecognizeResult()..status = RecognizeStatusType.REC_ERROR;
    }
    // await voiceAgentClient.shutdown();
  }

  Future<RecognizeResult> recognizeTextCommand(String command, String nluModel) async {
    debugPrint("Recognizing Text Command: $command");
    try {
      NLUModel model = NLUModel.RASA;
      if (nluModel == "snips") {
        model = NLUModel.SNIPS;
      }
      // Create a RecognizeControl message to stop recording
      final controlMessage = RecognizeTextControl()
        ..textCommand = command
        ..nluModel = model;

      // Call the gRPC method to stop recording
      final response =
      await recognizeTextCommandGrpc(controlMessage);
      debugPrint("Response is : $response");

      // Process and store the result
      if (response.status == RecognizeStatusType.REC_SUCCESS) {
        // Do nothing
      } else if (response.status == RecognizeStatusType.INTENT_NOT_RECOGNIZED) {
        final command = response.command;
        debugPrint("Command is : $command");
      } else {
        debugPrint('Failed to process your voice command. Please try again.');
      }
      return response;
    } catch (e) {
      return RecognizeResult()..status = RecognizeStatusType.REC_ERROR;
    }
  }

  Future<void> executeCommand(RecognizeResult response) async {
    try {
      // Create an ExecuteInput message using the response from stopRecording
      final executeInput = ExecuteInput()
        ..intent = response.intent
        ..intentSlots.addAll(response.intentSlots);

      // Call the gRPC method to execute the voice command
      final execResponse = await executeCommandGrpc(executeInput);

      // Handle the response as needed
      if (execResponse.status == ExecuteStatusType.EXEC_SUCCESS) {
        final commandResponse = execResponse.response;
        ref.read(voiceAssistantStateProvider.notifier).updateCommandResponse(commandResponse);
        debugPrint("Command Response is : $commandResponse");
      } else if (execResponse.status == ExecuteStatusType.KUKSA_CONN_ERROR) {
        final commandResponse = execResponse.response;
        ref.read(voiceAssistantStateProvider.notifier).updateCommandResponse(commandResponse);
      } else {
        ref.read(voiceAssistantStateProvider.notifier).updateCommandResponse("Sorry, I couldn't execute your command. Please try again.");
      }
    } catch (e) {
    }
    await shutdown();
  }


  Future<void> disableOverlay() async{
    await Future.delayed(Duration(seconds: 3));
    ref.read(voiceAssistantStateProvider.notifier).toggleShowOverlay(false);
  }

  Future<void> startVoiceAssistant()async {
    ref.read(voiceAssistantStateProvider.notifier).updateCommand(null);
    ref.read(voiceAssistantStateProvider.notifier).updateCommandResponse(null);

    SttModel stt = ref.read(voiceAssistantStateProvider.select((value)=>value.sttModel));
    bool isOnlineMode = ref.read(voiceAssistantStateProvider.select((value)=>value.isOnlineMode));
    String nluModel = "snips";
    String sttModel = "whisper";
    if(stt == SttModel.vosk){
      sttModel = "vosk";
    }
    bool isOverlayEnabled = ref.read(voiceAssistantStateProvider.select((value)=>value.voiceAssistantOverlay));
    bool overlayState = ref.read(voiceAssistantStateProvider.select((value)=>value.showOverLay));

    String streamId = await startRecording();
    if (streamId.isNotEmpty) {
      debugPrint('Recording started. Please speak your command.');
      if(isOverlayEnabled){
        if(!overlayState){
          ref.read(voiceAssistantStateProvider.notifier).toggleShowOverlay(true);
        }
      }

      ref.read(voiceAssistantStateProvider.notifier).updateButtonPressed(true);
      ref.read(voiceAssistantStateProvider.notifier).updateIsRecording();
      ref.read(voiceAssistantStateProvider.notifier).updateIsCommandProcessing(false);

      // wait for the recording time
      await Future.delayed(Duration(seconds: ref.watch(voiceAssistantStateProvider.select((value)=>value.recordingTime))));

      ref.read(voiceAssistantStateProvider.notifier).updateIsRecording();
      ref.read(voiceAssistantStateProvider.notifier).updateIsCommandProcessing(true);

      // stop the recording and process the command
      RecognizeResult recognizeResult = await stopRecording(streamId, nluModel, sttModel,isOnlineMode);

      ref.read(voiceAssistantStateProvider.notifier).updateCommand(recognizeResult.command);
      debugPrint('Recording stopped. Processing the command...');

      // Execute the command
      await executeCommand(recognizeResult);

      ref.read(voiceAssistantStateProvider.notifier).updateIsCommandProcessing(false);
      ref.read(voiceAssistantStateProvider.notifier).updateButtonPressed(false);
      ref.read(voiceAssistantStateProvider.notifier).updateCommand(null);
      ref.read(voiceAssistantStateProvider.notifier).updateCommandResponse(null);
      disableOverlay();

    } else {
      debugPrint('Failed to start recording. Please try again.');
    }

  }


}
