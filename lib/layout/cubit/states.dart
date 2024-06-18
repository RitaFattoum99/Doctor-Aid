import 'package:draid/models/add_clinic_model.dart';
import 'package:draid/models/user_model.dart';

abstract class DrAidStates {}

class DrAidInitialState extends DrAidStates {}

class ChangeBottomScreenState extends DrAidStates {}

class ChangeMedicine extends DrAidStates {}

class ChangeTreatmentState extends DrAidStates {}

class ChangeCheckBoxState extends DrAidStates {}

class ChangeToothOrGumState extends DrAidStates {}

class DrAidLoadingState extends DrAidStates {}

class DrAidLoginSuccessState extends DrAidStates {
  final UserModel userModel;

  DrAidLoginSuccessState(this.userModel);
}

class DrAidLoginErrorState extends DrAidStates {
  final String error;

  DrAidLoginErrorState(this.error);
}

class DrAidClinicSuccessState extends DrAidStates {
  final AddClinicModel addClinicModel;

  DrAidClinicSuccessState(this.addClinicModel);
}

class DrAidClinicErrorState extends DrAidStates {
  final String errorMsg;

  DrAidClinicErrorState(this.errorMsg);
}
