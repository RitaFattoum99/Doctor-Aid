import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/models/create_patient.dart';
import 'package:draid/modules/patient/show_patient_information.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientInformationLayout extends StatefulWidget {
  final int patientId;
  final PatientData patientData;

  const PatientInformationLayout(
      {super.key, required this.patientId, required this.patientData});

  @override
  State<PatientInformationLayout> createState() =>
      _PatientInformationLayoutState();
}

class _PatientInformationLayoutState extends State<PatientInformationLayout> {
  @override
  void initState() {
    super.initState();
    DrAidCubit.get(context).getPatient(
        patientId: widget.patientId,
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZnVsbE5hbWUiOiLYo9it2YXYryDYtNmK2K4g2KfZhNi02KjYp9ioIiwicm9sZXMiOlsiYWRtaW4iXSwiaWF0IjoxNzE4NjA0NjE2fQ.hlL_f3ls3XTsO8S1TJB5a-7y1M8SWQe2IbQ5d0DM-is");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DrAidInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DrAidLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DrAidPatientSuccessState) {
          PatientData patientData = state.createPatientModel.patientData;
          return Scaffold(
            backgroundColor: coolWhite2,
            appBar: const CustomAppBar(),
            body: Row(
              children: [
                const SideBarScreen(),
                PatientInformation(patientData: patientData),
              ],
            ),
          );
        } else if (state is DrAidPatientErrorState) {
          return Center(
            child: Text('Error: ${state.errorMsg}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}


// class PatientInformationLayout extends StatefulWidget {
//     // final int patientId;

//   const PatientInformationLayout({super.key});

//   @override
//   State<PatientInformationLayout> createState() =>
//       _PatientInformationLayoutState();
// }

// class _PatientInformationLayoutState extends State<PatientInformationLayout> {

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<DrAidCubit, DrAidStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return const Scaffold(
//           backgroundColor: coolWhite2,
//           appBar:  CustomAppBar(),
//           body:  Row(
//             children: [ SideBarScreen(), 
//               PatientInformation(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
