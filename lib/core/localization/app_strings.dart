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
  final String haveAccount = "Don't have an account";
}
