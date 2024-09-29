import 'package:flutter_ics_homescreen/export.dart';

import '../../common_widget/voice_assistant_button.dart';
// import 'package:media_kit_video/media_kit_video.dart';

final bkgImageProvider = Provider((ref) {
  return Container(
      width: 1080,
      height: 1920,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/BG_Sequence_00000.png"),
        ),
      ));
});

final bkgAnimationProvider = Provider((ref) {
  return Lottie.asset(
    'animations/BG-dotwaveform.json',
    fit: BoxFit.cover,
    repeat: true,
  );
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(appLauncherProvider).run();
    super.initState();
  }

  @override
  void dispose() {
    // player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final appState = ref.watch(appProvider);
      final bool disableBkgAnimation =
          ref.watch(appConfigProvider).disableBkgAnimation;
      final bool plainBackground = ref.watch(appConfigProvider).plainBackground;
      return Scaffold(
        key: homeScaffoldKey,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: const CustomTopBar(),
        body: Stack(
          children: [
            if (!disableBkgAnimation)
              ref.watch(bkgAnimationProvider)
            else if (!plainBackground)
              ref.watch(bkgImageProvider),
            FlowBuilder<AppState>(
              state: appState,
              onGeneratePages: onGenerateAppViewPages,
              observers: [
                HeroController(),
              ],
            ),
            if (appState != AppState.splash)
              Positioned(
                top: 0,
                bottom: 0,
                child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    height: 500,
                    child: const VolumeFanControl()),
              ),
            //   Voice Assistant Button
            if (appState != AppState.splash && ref.watch(voiceAssistantStateProvider.select((value)=>value.isVoiceAssistantEnable)))
              Positioned(
                top: MediaQuery.of(context).size.height * 0.82,
                child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: const VoiceAssistantButton()
                ),
              ),
          ],
        ),
        bottomNavigationBar:
            appState == AppState.splash ? null : const CustomBottomBar(),
      );
    });
  }
}
