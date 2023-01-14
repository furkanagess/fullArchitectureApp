import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/base_view_model.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context;
  @override
  void init() {}
}
