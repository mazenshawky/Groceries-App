import 'package:flutter/material.dart';

import '../../../../../app/app_prefs.dart';
import '../../../../../app/di.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/values_manager.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: AppSize.s353,
          height: AppSize.s67,
          child: ElevatedButton(
              onPressed: () {
                _logout();
              },
              child: const Text(
                'Log out',
              ))),
    );
  }

  _logout(){
    _appPreferences.logout();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
