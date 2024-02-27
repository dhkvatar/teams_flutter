class AppConfig {
  /// Separately from the flavors, represents whether the application
  /// is in test mode.
  static bool isTest =
      const String.fromEnvironment('test', defaultValue: 'true') == 'true';
}
