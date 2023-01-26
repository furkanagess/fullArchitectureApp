import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/base_view_model.dart';
import '../../../../core/localization/app_strings.dart';

part 'game_view_model.g.dart';

class GameViewModel = _GameViewModelBase with _$GameViewModel;

abstract class _GameViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context;
  @override
  void init() {}

  final List<String> gameTabItems = [
    AppStrings.instance.cartoon,
    AppStrings.instance.simulator,
    AppStrings.instance.toys,
    AppStrings.instance.racing,
    AppStrings.instance.casual,
  ];
}
