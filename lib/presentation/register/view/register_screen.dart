import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/presentation/components/stacked_carrot_widget.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _emailController
        .addListener(() => _viewModel.setEmail(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _viewModel.isUserRegisteredInSuccessfullyStreamController.stream
        .listen((isRegistered) {
      if (isRegistered) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPreferences.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white3,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StackedCarrotWidget(),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.register,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: AppSize.s15),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.registerSubtitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: AppSize.s40),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.userName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s25, right: AppSize.s28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outIsUserNameValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.text,
                    controller: _userNameController,
                    cursorColor: ColorManager.primary,
                    decoration: InputDecoration(
                      hintText: AppStrings.userName,
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.invalidUserName,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSize.s35),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.email,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s25, right: AppSize.s28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outIsEmailValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    cursorColor: ColorManager.primary,
                    decoration: InputDecoration(
                      hintText: AppStrings.emailExample,
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.invalidEmail,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSize.s35),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.password,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: AppSize.s300,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    height: AppSize.s300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageAssets.backgroundDown),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppSize.s25, right: AppSize.s28),
                        child: StreamBuilder<bool>(
                          stream: _viewModel.outIsPasswordValid,
                          builder: (context, snapshot) {
                            return StreamBuilder<bool>(
                              stream: _viewModel.outIsPasswordVisible,
                              builder: (context, visibleSnapshot) {
                                return TextFormField(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _passwordController,
                                  obscureText: (visibleSnapshot.data ?? true)
                                      ? true
                                      : false,
                                  cursorColor: ColorManager.primary,
                                  decoration: InputDecoration(
                                    hintText: AppStrings.password,
                                    errorText: (snapshot.data ?? true)
                                        ? null
                                        : AppStrings.invalidPassword,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _viewModel.changePasswordVisibility(
                                              (visibleSnapshot.data ?? true));
                                        },
                                        icon: (visibleSnapshot.data ?? true)
                                            ? Icon(
                                                Icons.visibility_off_outlined,
                                                color: ColorManager.grey,
                                              )
                                            : Icon(
                                                Icons.visibility_outlined,
                                                color: ColorManager.grey,
                                              )),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: AppSize.s20),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppSize.s25, right: AppSize.s25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.byContinuing,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                AppStrings.termOfService,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSize.s8),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppSize.s25, right: AppSize.s25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.and,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                AppStrings.privacyPolicy,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSize.s30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<bool>(
                              stream: _viewModel.outAreAllInputsValid,
                              builder: (context, snapshot) {
                                return SizedBox(
                                    width: AppSize.s353,
                                    height: AppSize.s67,
                                    child: ElevatedButton(
                                        onPressed: (snapshot.data ?? false)
                                            ? () {
                                                _viewModel.register();
                                              }
                                            : null,
                                        child: const Text(
                                          AppStrings.register,
                                        )));
                              }),
                        ],
                      ),
                      const SizedBox(height: AppSize.s25),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppSize.s25, right: AppSize.s25),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.alreadyHaveAnAccount,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                AppStrings.login,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
