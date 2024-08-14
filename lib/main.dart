import 'package:device_preview/device_preview.dart';

import 'export.dart';
import 'data/data_providers/initialize_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize settings from storage API.
  final container = ProviderContainer();
  await initializeSettings(container);

  // Pass the container to ProviderScope and then run the app.
  runApp(
    ProviderScope(
      parent: container,
      child: DevicePreview(
        enabled: debugDisplay,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => const App(),
      ),
    ),
  );
}

