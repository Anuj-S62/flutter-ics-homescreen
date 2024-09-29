import 'package:flutter_ics_homescreen/export.dart';

import '../../../../../../../data/models/voice_assistant_state.dart';

class STTModelPage extends ConsumerWidget {
  const STTModelPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: STTModelPage());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SttModel sttModel = ref.watch(voiceAssistantStateProvider.select((value) => value.sttModel));

    return Scaffold(
      body: Column(
        children: [
          CommonTitle(
            title: 'Speech to Text Model',
            hasBackButton: true,
            onPressed: () {
              context.flow<AppState>().update((state) => AppState.voiceAssistant);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 144),
              child: ListView(
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: sttModel == SttModel.whisper
                              ? [0, 0.01, 0.8]
                              : [0.1, 1],
                          colors: sttModel == SttModel.whisper
                              ? <Color>[
                            Colors.white,
                            Colors.blue,
                            const Color.fromARGB(16, 41, 98, 255)
                          ]
                              : <Color>[Colors.black, Colors.black12]),
                    ),
                    child: ListTile(
                        minVerticalPadding: 0.0,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 40.0),
                        leading: Text(
                          'Whisper AI',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: sttModel == SttModel.whisper
                            ? const Icon(
                          Icons.done,
                          color: AGLDemoColors.periwinkleColor,
                          size: 48,
                        )
                            : null,
                        onTap: () {
                          ref
                              .read(voiceAssistantStateProvider.notifier)
                              .updateSttModel(SttModel.whisper);
                        }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: sttModel == SttModel.vosk
                              ? [0, 0.01, 0.8]
                              : [0.1, 1],
                          colors: sttModel == SttModel.vosk
                              ? <Color>[
                            Colors.white,
                            Colors.blue,
                            const Color.fromARGB(16, 41, 98, 255)
                          ]
                              : <Color>[Colors.black, Colors.black12]),
                    ),
                    child: ListTile(
                      minVerticalPadding: 0.0,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 40.0),
                      leading: Text(
                        'Vosk',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      //title: Text(widget.title),
                      //enabled: isSwitchOn,
                      trailing: sttModel == SttModel.vosk
                          ? const Icon(
                        Icons.done,
                        color: AGLDemoColors.periwinkleColor,
                        size: 48,
                      )
                          : null,

                      onTap: () {
                        ref
                            .read(voiceAssistantStateProvider.notifier)
                            .updateSttModel(SttModel.vosk);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
