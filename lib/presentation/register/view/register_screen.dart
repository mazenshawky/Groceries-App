import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
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
                padding: const EdgeInsets.only(
                    left: AppSize.s25, right: AppSize.s28),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  keyboardType: TextInputType.text,
                  controller: _userNameController,
                  cursorColor: ColorManager.primary,
                  decoration: const InputDecoration(
                    hintText: AppStrings.userName,
                    errorText: null,
                  ),
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
              const SizedBox(height: AppSize.s20),
              Padding(
                padding: const EdgeInsets.only(left: AppSize.s25, right: AppSize.s25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.byContinuing,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Text(
                        AppStrings.termOfService,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s8),
              Padding(
                padding: const EdgeInsets.only(left: AppSize.s25, right: AppSize.s25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.and,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Text(
                        AppStrings.privacyPolicy,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s30),
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
                            AppStrings.register,
                          ))),
                ],
              ),
              const SizedBox(height: AppSize.s25),
              Padding(
                padding: const EdgeInsets.only(left: AppSize.s25, right: AppSize.s25),
                child: InkWell(
                  onTap: (){
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
        ),
      ),
    );
  }
}
