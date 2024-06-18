import 'package:draid/models/add_clinic_model.dart';
import 'package:draid/models/create_attachment_model.dart';
import 'package:draid/models/create_complaint_model.dart';
import 'package:draid/models/create_disease_model.dart';
import 'package:draid/models/create_medication_model.dart';
import 'package:draid/models/create_patient.dart';
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

class DrAidPatientSuccessState extends DrAidStates {
  final CreatePatientModel createPatientModel;

  DrAidPatientSuccessState(this.createPatientModel);
}

class DrAidPatientErrorState extends DrAidStates {
  final String errorMsg;

  DrAidPatientErrorState(this.errorMsg);
}


class DrAidMedicationSuccessState extends DrAidStates {
  final CreateMedicationModel createMedicationModel;

  DrAidMedicationSuccessState(this.createMedicationModel);
}

class DrAidMedicationErrorState extends DrAidStates {
  final String errorMsg;

  DrAidMedicationErrorState(this.errorMsg);
}

class DrAidDiseaseSuccessState extends DrAidStates {
  final CreateDiseaseModel createDiseaseModel;

  DrAidDiseaseSuccessState(this.createDiseaseModel);
}

class DrAidDiseaseErrorState extends DrAidStates {
  final String errorMsg;

  DrAidDiseaseErrorState(this.errorMsg);
}


class DrAidComplaintSuccessState extends DrAidStates {
  final CreateComplaintModel createComplaintModel;

  DrAidComplaintSuccessState(this.createComplaintModel);
}

class DrAidComplaintErrorState extends DrAidStates {
  final String errorMsg;

  DrAidComplaintErrorState(this.errorMsg);
}


class DrAidAttachmentSuccessState extends DrAidStates {
  final CreateAttachmentModel createAttachmentModel;

  DrAidAttachmentSuccessState(this.createAttachmentModel);
}

class DrAidAttachmentErrorState extends DrAidStates {
  final String errorMsg;

  DrAidAttachmentErrorState(this.errorMsg);
}
