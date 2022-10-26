import 'dart:async';

import 'package:groceries_app/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends LoginViewModelInputs with LoginViewModelOutputs{
  final StreamController _emailStreamController = StreamController<String>.broadcast();

  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController = StreamController<void>.broadcast();

  final StreamController _passwordVisibilityStreamController = StreamController<bool>.broadcast();

  final StreamController isUserLoggedInSuccessfullyStreamController = StreamController<bool>.broadcast();

  var loginObject = LoginObject("", "");

  // inputs
  void dispose(){
    _emailStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    _passwordVisibilityStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputChangePasswordVisibility => _passwordVisibilityStreamController.sink;

  @override
  login() {
    isUserLoggedInSuccessfullyStreamController.add(true);
  }

  @override
  setEmail(String email) {
    _emailStreamController.add(email);
    loginObject = loginObject.copyWith(email: email);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    _passwordStreamController.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  changePasswordVisibility(bool state) {
    state ? _passwordVisibilityStreamController.add(false) : _passwordVisibilityStreamController.add(true);
  }

  // outputs
  @override
  Stream<bool> get outIsEmailValid => _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outIsPasswordVisible => _passwordVisibilityStreamController.stream.map((state) => state);

  bool _isEmailValid(String email){
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _isPasswordValid(String password){
    return password.length >= 6;
  }

  bool _areAllInputsValid(){
    return _isEmailValid(loginObject.email) && _isPasswordValid(loginObject.password);
  }
}

abstract class LoginViewModelInputs{
  setEmail(String email);

  setPassword(String password);

  changePasswordVisibility(bool state);

  login();

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;

  Sink get inputChangePasswordVisibility;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outIsEmailValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outAreAllInputsValid;

  Stream<bool> get outIsPasswordVisible;
}