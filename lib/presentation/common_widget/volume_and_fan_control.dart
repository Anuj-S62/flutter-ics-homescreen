import '../common_widget/volume_bar.dart';
import '../common_widget/fan_bar.dart';

import '../../export.dart';

class VolumeFanControl extends ConsumerWidget {
  const VolumeFanControl({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    final size = MediaQuery.of(context).size;
    final gapSize = size.height * 0.06;

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VolumeBar(),
          SizedBox(
            height: gapSize,
          ),
          Visibility.maintain(
            visible: state == AppState.hvac ? false : true,
            child: const FanBar(),
          ),
        ],
      ),
    );
  }
}
