class AppStrings {
  static AppStrings? _instance;
  static AppStrings get instance {
    if (_instance != null) return _instance!;
    _instance = AppStrings._init();
    return _instance!;
  }

  AppStrings._init();

  // Login View Strings
  final String login = "Login";
  final String signUp = "Signup";
  final String password = "Password";
  final String email = "Email";
  final String forgot = "Forgot Password?";
  final String enterToApp = "Enter to App";
  final String haveAccount = "Don't have an account?";

  // Home Feed Strings
  final String latest = "Latest";
  final String dogs = "Dogs";
  final String cats = "Cats";
  final String others = "Others";
  final String name = "Eda Gündoğdu";
  final String pet = "1 Tekir ve 1 Scottish";
  final String desc = "Kedi kumunu 2 günde bir temizlemeniz gerekmektedir.";
  final String recommended = "Recommended";

  // Social Feed String
  final String findFriends = "Find Friends";
  final String follow = "Follow";
  final String next = "Next";
}
