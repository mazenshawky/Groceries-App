import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/presentation/resources/assets_manager.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';

import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget(){
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s100),
      child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: SvgPicture.asset(ImageAssets.logoOrange)),
                const SizedBox(height: AppSize.s90),
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
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    cursorColor: ColorManager.primary,
                    decoration: const InputDecoration(
                      hintText: AppStrings.emailExample,
                      errorText: null,
                    ),
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
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: ColorManager.primary,
                    decoration:  InputDecoration(
                      hintText: AppStrings.password,
                      errorText: null,
                      suffixIcon: Icon(Icons.visibility_off_outlined, color: ColorManager.grey,),
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: AppSize.s353,
                        height: AppSize.s67,
                        child: ElevatedButton(
                            onPressed: () {

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
          ),
      ),
    );
  }
}
