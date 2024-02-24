/// Flavors of the application.
enum AppFlavor { dev, prod }

/// Represents the current flavor of the application.
class Flavor {
  static AppFlavor? appFlavor =
      const String.fromEnvironment('flavor', defaultValue: 'dev') ==
              AppFlavor.prod.name
          ? AppFlavor.prod
          : AppFlavor.dev;
}
