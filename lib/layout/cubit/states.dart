import 'package:draid/models/add_clinic_model.dart';
import 'package:draid/models/all_patients.dart';
import 'package:draid/models/completed_treatment.dart';
import 'package:draid/models/create_attachment_model.dart';
import 'package:draid/models/create_complaint_model.dart';
import 'package:draid/models/create_disease_model.dart';
import 'package:draid/models/create_medication_model.dart';
import 'package:draid/models/create_patient.dart';
import 'package:draid/models/treatment.dart';
import 'package:draid/models/treatment_plan.dart';
import 'package:draid/models/user_model.dart';

abstract class DrAidStates {}

class DrAidAllPatientSuccessState extends DrAidStates {
  final AllPatientsModel allPatientsModel;

  DrAidAllPatientSuccessState(this.allPatientsModel);
}

class DrAidErrorState extends DrAidStates {
  final String message;

  DrAidErrorState(this.message);
}


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

class DrAidAllPatientErrorState extends DrAidStates {
  final String errorMsg;
  DrAidAllPatientErrorState(this.errorMsg);
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

class DrAidTreatmentSuccessState extends DrAidStates {
  final TreatmentModel treatmentModel;

  DrAidTreatmentSuccessState(this.treatmentModel);
}

class DrAidTreatmentErrorState extends DrAidStates {
  final String errorMsg;

  DrAidTreatmentErrorState(this.errorMsg);
}

class DrAidTreatmentPlanSuccessState extends DrAidStates {
  final TreatmentPlanModel treatmentPlanModel;

  DrAidTreatmentPlanSuccessState(this.treatmentPlanModel);
}

class DrAidTreatmentPlanErrorState extends DrAidStates {
  final String errorMsg;

  DrAidTreatmentPlanErrorState(this.errorMsg);
}

class DrAidCompletedTreatmentSuccessState extends DrAidStates {
  final CompletedTreatmentModel completedTreatmentModel;

  DrAidCompletedTreatmentSuccessState(this.completedTreatmentModel);
}

class DrAidCompletedTreatmentErrorState extends DrAidStates {
  final String errorMsg;

  DrAidCompletedTreatmentErrorState(this.errorMsg);
}
