import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/base_widget.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/images/image_constants.dart';
import '../../../core/localization/app_strings.dart';
import '../../home/feed/view/build_feed_view.dart';
import '../viewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            key: value.scaffoldState,
            backgroundColor: context.colors.onBackground,
            body: SafeArea(
              child: Column(
                children: [
                  buildAnimatedContainerImage(context),
                  buildContainerTabBar(context),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: buildForm(value, context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer buildAnimatedContainerImage(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: context.colors.background,
      child: Center(
        child: Image.asset(ImageConstants.instance.cat),
      ),
    );
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 5),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelColor: context.colors.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: context.textTheme.headline5,
      unselectedLabelStyle: context.textTheme.headline5,
      indicatorWeight: 5,
      indicatorColor: context.colors.onPrimary,
      tabs: [
        Tab(text: AppStrings.instance.login),
        Tab(text: AppStrings.instance.signUp),
      ],
    );
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      child: Column(
        children: [
          const Spacer(flex: 6),
          buildFormEmail(context),
          buildFormPassword(context, value),
          const Spacer(),
          buildTextForgot(),
          const Spacer(flex: 6),
          buildLoginButton(context),
          buildWrapForgot(context),
          const Spacer()
        ],
      ),
    );
  }

  Widget buildFormPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        obscureText: viewModel.isLockOpen,
        validator: (value) {
          value!.isNotEmpty ? null : "This field is required";
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              viewModel.isLockStateChange();
            },
            icon: Observer(builder: (_) {
              return Icon(viewModel.isLockOpen ? Icons.visibility_off : Icons.visibility);
            }),
          ),
          labelText: AppStrings.instance.password,
          icon: buildContainerIcon(context, Icons.password),
        ),
      );
    });
  }

  TextFormField buildFormEmail(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: AppStrings.instance.email,
        icon: buildContainerIcon(context, Icons.mail),
      ),
    );
  }

  Container buildContainerIcon(BuildContext context, IconData icon) {
    return Container(
      padding: context.paddingLow,
      color: context.colors.onPrimary,
      child: Icon(
        icon,
        color: context.colors.background,
      ),
    );
  }

  Widget buildTextForgot() => Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.instance.forgot,
          textAlign: TextAlign.end,
        ),
      );

  ElevatedButton buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: context.paddingNormal, shape: const StadiumBorder(), backgroundColor: context.colors.onPrimary),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuildFeedView(),
            ));
      },
      child: Center(
        child: Text(
          AppStrings.instance.enterToApp,
          style: context.textTheme.headline5,
        ),
      ),
    );
  }

  Wrap buildWrapForgot(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(AppStrings.instance.haveAccount),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.instance.signUp,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
