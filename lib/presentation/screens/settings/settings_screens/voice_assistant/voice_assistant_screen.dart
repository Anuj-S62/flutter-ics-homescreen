
import 'package:flutter_ics_homescreen/export.dart';
import 'widgets/voice_assistant_content.dart';

class VoiceAssistantPage extends ConsumerWidget{
  const VoiceAssistantPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: VoiceAssistantPage());
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      body: Column(
        children: [
          CommonTitle(
            title: 'Voice Assistant',
            hasBackButton: true,
            onPressed: () {
              ref.read(appProvider.notifier).back();
            },
          ),
          Expanded(child: VoiceAssistantContent()),
        ],
      ),
    );
  }
}

