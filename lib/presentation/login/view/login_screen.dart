import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:groceries_app/presentation/resources/assets_manager.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';

import '../../../app/di.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();

  _bind(){
    _emailController.addListener(() => _viewModel.setEmail(_emailController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((isLoggedIn) {
      if(isLoggedIn){
        SchedulerBinding.instance.addPostFrameCallback((_) {
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

  Widget _getContentWidget(){
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s300,
              child: Stack(
                children: [
                  Container(
                    height: AppSize.s300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageAssets.backgroundUp),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(child: SvgPicture.asset(ImageAssets.logoOrange)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.login,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: AppSize.s15),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.loginSubtitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: AppSize.s40),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25),
              child: Text(
                AppStrings.email,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSize.s25, right: AppSize.s28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outIsEmailValid,
                builder: (context, snapshot){
                  return TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    cursorColor: ColorManager.primary,
                    decoration: InputDecoration(
                      hintText: AppStrings.emailExample,
                      errorText: (snapshot.data ?? true) ? null : AppStrings.invalidEmail,
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
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSize.s25, right: AppSize.s28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outIsPasswordValid,
                builder: (context, snapshot){
                  return StreamBuilder<bool>(
                    stream: _viewModel.outIsPasswordVisible,
                    builder: (context, visibleSnapshot){
                      return TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        obscureText: (visibleSnapshot.data ?? true) ? true : false,
                        cursorColor: ColorManager.primary,
                        decoration:  InputDecoration(
                          hintText: AppStrings.password,
                          errorText: (snapshot.data ?? true) ? null : AppStrings.invalidPassword,
                          suffixIcon: IconButton(
                              onPressed: (){
                                _viewModel.changePasswordVisibility((visibleSnapshot.data ?? true));
                              },
                              icon: (visibleSnapshot.data ?? true) ?
                              Icon(Icons.visibility_off_outlined, color: ColorManager.grey,) :
                              Icon(Icons.visibility_outlined, color: ColorManager.grey,)
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s25, right: AppSize.s25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed:(){},
                    child: Text(
                      AppStrings.forgotPassword,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.s20),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: AppSize.s353,
                              height: AppSize.s67,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _viewModel.login();
                                  },
                                  child: const Text(
                                    AppStrings.loginButton,
                                  ))),
                        ],
                      ),
                      const SizedBox(height: AppSize.s25),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSize.s25, right: AppSize.s25),
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.noAccount,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                AppStrings.signUp,
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
