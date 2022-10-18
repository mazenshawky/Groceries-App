import 'package:get_it/get_it.dart';
import 'package:groceries_app/presentation/login/viewmodel/login_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{

}

initLoginModule(){
  instance.registerFactory<LoginViewModel>(() => LoginViewModel());
}