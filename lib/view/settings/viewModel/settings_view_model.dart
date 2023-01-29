import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:random_full_app/core/base/base_view_model.dart';
import 'package:random_full_app/product/model/user.dart';
import 'package:random_full_app/view/settings/view/subView/settings_dynamic_view.dart';
part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();
  @override
  void setContext(BuildContext context) => this.context;
  @override
  void init() {}

  void navigateToContribution(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsDynamicView(),
        ));
  }
}
