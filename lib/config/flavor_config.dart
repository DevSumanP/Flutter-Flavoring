class AppConfig {
  static late String flavor;

  static Future<void> initialize() async {
    // Flavor can be passed via build configurations (like flutter build --flavor)
    flavor = const String.fromEnvironment('FLAVOR', defaultValue: 'free');
  }

  static bool isPaid() => flavor == 'paid';
}
