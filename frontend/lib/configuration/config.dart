class Config {
  static const bool developmentMode =
      bool.fromEnvironment('DEVELOPMENT_MODE', defaultValue: false);

  static String get apiBaseUrl {
    if (developmentMode) {
      return 'http://127.0.0.1:5000';
    } else {
      return 'https://backend-233150177113.southamerica-east1.run.app';
    }
  }
}
