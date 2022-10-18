import 'package:get_it/get_it.dart';
import 'package:groceries_app/presentation/login/viewmodel/login_viewmodel.dart';

import '../presentation/register/viewmodel/register_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{

}

initLoginModule(){
  if(!GetIt.I.isRegistered<LoginViewModel>())
  instance.registerFactory<LoginViewModel>(() => LoginViewModel());
}

initRegisterModule(){
  if(!GetIt.I.isRegistered<RegisterViewModel>())
  instance.registerFactory<RegisterViewModel>(() => RegisterViewModel());
}