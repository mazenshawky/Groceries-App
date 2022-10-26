import 'dart:async';

import 'package:groceries_app/presentation/common/freezed_data_classes.dart';

class RegisterViewModel extends RegisterViewModelInputs with RegisterViewModelOutputs{
  final StreamController _userNameStreamController = StreamController<String>.broadcast();

  final StreamController _emailStreamController = StreamController<String>.broadcast();

  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController = StreamController<void>.broadcast();

  final StreamController _passwordVisibilityStreamController = StreamController<bool>.broadcast();

  final StreamController isUserRegisteredInSuccessfullyStreamController = StreamController<bool>.broadcast();

  var registerObject = RegisterObject("", "", "");

  // inputs
  void dispose(){
    _userNameStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    _passwordVisibilityStreamController.close();
    isUserRegisteredInSuccessfullyStreamController.close();
  }

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputChangePasswordVisibility => _passwordVisibilityStreamController.sink;

  @override
  register() {
    isUserRegisteredInSuccessfullyStreamController.add(true);
  }

  @override
  setUserName(String userName) {
    _userNameStreamController.add(userName);
    registerObject = registerObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  setEmail(String email) {
    _emailStreamController.add(email);
    registerObject = registerObject.copyWith(email: email);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    _passwordStreamController.add(password);
    registerObject = registerObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  changePasswordVisibility(bool state) {
    state ? _passwordVisibilityStreamController.add(false) : _passwordVisibilityStreamController.add(true);
  }

  // outputs
  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outIsEmailValid => _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outIsPasswordVisible => _passwordVisibilityStreamController.stream.map((state) => state);

  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }

  bool _isEmailValid(String email){
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _isPasswordValid(String password){
    return password.length >= 6;
  }

  bool _areAllInputsValid(){
    return _isUserNameValid(registerObject.userName) && _isEmailValid(registerObject.email) && _isPasswordValid(registerObject.password);
  }
}

abstract class RegisterViewModelInputs{
  setUserName(String userName);

  setEmail(String email);

  setPassword(String password);

  changePasswordVisibility(bool state);

  register();

  Sink get inputUserName;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;

  Sink get inputChangePasswordVisibility;
}

abstract class RegisterViewModelOutputs{
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsEmailValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outAreAllInputsValid;

  Stream<bool> get outIsPasswordVisible;
}