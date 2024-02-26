import 'package:package_info_plus/package_info_plus.dart';

/// Flavors of the application.
enum AppFlavor { dev, prod }

/// Represents the current flavor of the application.
class Flavor {
  static AppFlavor? appFlavor;

  static Future<void> initializeAppFlavor() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final package = packageInfo.packageName;

    if (package.endsWith('dev')) {
      appFlavor = AppFlavor.dev;
    } else {
      appFlavor = AppFlavor.prod;
    }
  }
}
