class AppStrings {
  static AppStrings? _instance;
  static AppStrings get instance {
    if (_instance != null) return _instance!;
    _instance = AppStrings._init();
    return _instance!;
  }

  AppStrings._init();

  final String cartTitle = "Cart";
}
