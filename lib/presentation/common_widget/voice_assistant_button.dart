import 'package:flutter_ics_homescreen/export.dart';

class VoiceAssistantButton extends ConsumerStatefulWidget {
  const VoiceAssistantButton({super.key});

  @override
  ConsumerState<VoiceAssistantButton> createState() => _VoiceAssistantButtonState();
}

class _VoiceAssistantButtonState extends ConsumerState<VoiceAssistantButton> with SingleTickerProviderStateMixin {
  bool _showOverlay = false;
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;
  int overlayLock = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..stop(); // Stop the animation initially

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    ref.read(voiceAssistantStateProvider.notifier).updateCommandResponse("");
    ref.read(voiceAssistantStateProvider.notifier).updateCommand("");
    bool state = ref.read(voiceAssistantStateProvider.notifier).toggleButtonPressed();
    if(state){
      var voiceAgentClient = ref.read(voiceAgentClientProvider);
      voiceAgentClient.startVoiceAssistant();
    }
  }

  void _showAssistantPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final String? command = ref.watch(voiceAssistantStateProvider.select((value) => value.command));
            final String? commandResponse = ref.watch(voiceAssistantStateProvider.select((value) => value.commandResponse));
            final bool isRecording = ref.watch(voiceAssistantStateProvider.select((value)=>value.isRecording));
            final bool isProcessing = ref.watch(voiceAssistantStateProvider.select((value)=>value.isCommandProcessing));

            if (isRecording) {
              _animationController.repeat(reverse: true);
            } else {
              _animationController.stop();
            }

            return Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/VoiceAssistantBottomSheetBg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 40, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(!isRecording && !isProcessing)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              command ?? "No Command Detected",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 43,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              commandResponse ?? "No Response",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color.fromRGBO(41, 95, 248, 1),
                                fontSize: 43,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),

                    if(isRecording)
                      Column(
                        children: [
                          const Text("Listening...",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 43,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.02,
                          ),
                          ScaleTransition(
                            scale: _pulseAnimation,  // Apply the pulse animation here
                            child: SvgPicture.asset(
                              'assets/VoiceControlButton.svg',
                              fit: BoxFit.cover,
                              semanticsLabel: 'Voice Assistant',
                            ),
                          ),
                        ],
                      ),

                    if(!isRecording && isProcessing)
                      Column(
                        children: [
                          const Text("Processing...",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 43,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.05,
                          ),
                          Lottie.asset(
                            'animations/LoadingAnimation.json',
                            fit: BoxFit.cover,
                            repeat: true,
                          ),
                        ],
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      ref.read(voiceAssistantStateProvider.notifier).updateCommandResponse(null);
      ref.read(voiceAssistantStateProvider.notifier).updateCommand(null);
      ref.read(voiceAssistantStateProvider.notifier).toggleShowOverlay(false);
      overlayLock = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    _showOverlay = ref.watch(voiceAssistantStateProvider.select((value) => value.showOverLay));

    if(_showOverlay){
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if(overlayLock == 0){
          overlayLock = 1;
          _showAssistantPopup(context);
        }
      });
    }
    else if(overlayLock == 1){
      overlayLock = 0;
      Navigator.of(context).pop();
    }

    String svgPath = ref.watch(voiceAssistantStateProvider.select((value) => value.buttonPressed))
        ? 'assets/VoiceAssistantActive.svg'
        : 'assets/VoiceAssistantEnabled.svg';

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          padding: EdgeInsets.zero,
          child: SvgPicture.asset(
            svgPath,
            fit: BoxFit.cover,
            semanticsLabel: 'Voice Assistant',
          ),
        ),
      ),
    );
  }
}
