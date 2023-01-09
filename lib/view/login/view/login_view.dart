import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:random_full_app/core/base/base_widget.dart';
import 'package:random_full_app/core/extension/context_extension.dart';
import 'package:random_full_app/core/images/image_constants.dart';
import 'package:random_full_app/view/login/viewModel/login_view_model.dart';

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
                  AnimatedContainer(
                    duration: context.lowDuration,
                    height: context.mediaQuery.viewInsets.bottom > 0
                        ? 0
                        : context.height * 0.3,
                    color: context.colors.background,
                    child: Center(
                      child: Image.asset(ImageConstants.instance.cat),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: context.colors.background,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 5),
                      child: TabBar(
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: context.textTheme.headline5,
                        unselectedLabelStyle: context.textTheme.headline5,
                        indicatorWeight: 5,
                        indicatorColor: context.colors.onPrimary,
                        tabs: [
                          Tab(text: "Login"),
                          Tab(text: "Signup"),
                        ],
                      ),
                    ),
                  ),
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

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildFormEmail(context),
          buildFormPassword(context, value),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildLoginButton(context),
          buildWrapForgot(),
          Spacer()
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
          suffixIcon: ElevatedButton(
            onPressed: () {
              viewModel.isLockStateChange();
            },
            child: Observer(builder: (_) {
              return Icon(viewModel.isLockOpen
                  ? Icons.visibility
                  : Icons.visibility_off);
            }),
          ),
          labelText: "Password",
          icon: buildContainerIcon(context, Icons.password_outlined),
        ),
      );
    });
  }

  TextFormField buildFormEmail(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        icon: buildContainerIcon(context, Icons.mail_outline_outlined),
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
          "Forgot Password?",
          textAlign: TextAlign.end,
        ),
      );

  ElevatedButton buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: context.paddingNormal,
          shape: StadiumBorder(),
          backgroundColor: context.colors.onPrimary),
      onPressed: () {},
      child: Center(
        child: Text(
          "Enter to App",
          style: context.textTheme.headline5,
        ),
      ),
    );
  }

  Wrap buildWrapForgot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text("Don't have an account ?"),
        TextButton(
          onPressed: () {},
          child: Text("Signup"),
        ),
      ],
    );
  }
}
