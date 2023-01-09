import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  void setContext(BuildContext context) => this.context;
  void init() {}

  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  void fetchLoadingService() {}

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
