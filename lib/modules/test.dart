// // // import 'dart:typed_data';
// // // import 'dart:html' as html;
// // // import 'package:draid/layout/cubit/cubit.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:file_picker/file_picker.dart';

// // // class FilePickerScreen extends StatefulWidget {
// // //   @override
// // //   _FilePickerScreenState createState() => _FilePickerScreenState();
// // // }

// // // class _FilePickerScreenState extends State<FilePickerScreen> {
// // //   html.File? _pickedFile;
// // //   String? _title = "تحاليل CBC";
// // //   String? _token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZnVsbE5hbWUiOiLYo9it2YXYryDYtNmK2K4g2KfZhNi02KjYp9ioIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzE4NjIxMTUwfQ.MKGlRqm9skM4hoHsHO2oBbnnintKNJj_5wR4Hjotof8"; // Replace with your token

// // //   void _pickFileAndUpload() async {
// // //     final result = await FilePicker.platform.pickFiles(
// // //       type: FileType.any,
// // //     );

// // //     if (result != null && result.files.isNotEmpty) {
// // //       final file = result.files.single;

// // //       // Convert the selected file to a dart:html file
// // //       final htmlFile = html.File(file.bytes!, file.name, {'type': file.extension});

// // //       setState(() {
// // //         _pickedFile = htmlFile;
// // //       });

// // //       DrAidCubit.get(context).createAttachment(
// // //         patientId: 3,
// // //         title: _title!,
// // //         file: _pickedFile!,
// // //         token: _token!,
// // //       );
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('File Picker & Upload'),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             if (_pickedFile != null)
// // //               Text('Picked file: ${_pickedFile!.name}'),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: _pickFileAndUpload,
// // //               child: Text('Pick File and Upload'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:draid/layout/cubit/cubit.dart';
// // import 'package:draid/layout/cubit/states.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class PatientInfoScreen extends StatelessWidget {
// //   final int patientId;
// //   final String token;

// //   const PatientInfoScreen({
// //     Key? key,
// //     required this.patientId,
// //     required this.token,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (context) => DrAidCubit(),
// //       child: BlocBuilder<DrAidCubit, DrAidStates>(
// //         builder: (context, state) {
// //           final cubit = context.watch<DrAidCubit>();

// //           if (state is DrAidInitialState) {
// //             cubit.getPatientInfo(patientId: patientId, token: token);
// //             return Center(child: CircularProgressIndicator());
// //           } else if (state is DrAidPatientSuccessState) {
// //             final patientData = state.createPatientModel.patientData;

// //             return Scaffold(
// //               appBar: AppBar(title: Text('Patient Information')),
// //               body: SingleChildScrollView(
// //                 padding: EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text('Full Name: ${patientData.fullName}'),
// //                     Text('Address: ${patientData.address}'),
// //                     Text('Email: ${patientData.email}'),
// //                     Text('Phone Number: ${patientData.phoneNumber}'),
// //                     Text('Age: ${patientData.age}'),
// //                     Text('Gender: ${patientData.gender}'),
// //                     Text('Habits: ${patientData.habits}'),
// //                     Text('Birth Date: ${patientData.birthDate}'),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           } else if (state is DrAidPatientErrorState) {
// //             return Scaffold(
// //               appBar: AppBar(title: Text('Patient Information')),
// //               body: Center(child: Text(state.errorMsg)),
// //             );
// //           } else {
// //             return Scaffold(
// //               appBar: AppBar(title: Text('Patient Information')),
// //               body: Center(child: CircularProgressIndicator()),
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:draid/layout/cubit/cubit.dart';
// import 'package:draid/layout/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PatientDetailsScreen extends StatelessWidget {
//   final int patientId;

//   const PatientDetailsScreen({super.key, required this.patientId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Patient Details'),
//       ),
//       body: BlocProvider(
//         create: (context) => DrAidCubit(), // Provide your DrAidCubit here
//         child: BlocConsumer<DrAidCubit, DrAidStates>(
//           listener: (context, state) {
//             // Handle state changes if needed
//             if (state is DrAidPatientErrorState) {
//               // Handle error state
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.errorMsg)),
//               );
//             }
//           },
//           builder: (context, state) {
//             // Access DrAidCubit instance
//             // final cubit = BlocProvider.of<DrAidCubit>(context);

//             // Call getPatientDetails when the screen is built
//             DrAidCubit.get(context).getPatientDetails(patientId: patientId);

//             return Center(
//               child: state is DrAidLoadingState
//                   ? const CircularProgressIndicator()
//                   : state is DrAidPatientSuccessState
//                       ? Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                                 'Patient Name: ${state.createPatientModel.patientData.fullName}'),
//                             Text(
//                                 'Age: ${state.createPatientModel.patientData.age}'),
//                             // Display other patient details as needed
//                           ],
//                         )
//                       : const Text('Failed to load patient details'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_print

import 'package:draid/models/create_patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';

class PatientScreen extends StatefulWidget {
  final int clinicId;
  final String token;

  const PatientScreen({
    super.key,
    required this.clinicId,
    required this.token,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  void initState() {
    super.initState();
    // _fetchPatientData();
    _fetchAllPatientData();
  }

  // void _fetchPatientData() {
  //   DrAidCubit cubit = DrAidCubit.get(context);
  //   cubit.getPatient(patientId: widget.patientId, token: widget.token);
  // }

    void _fetchAllPatientData() {
    DrAidCubit cubit = DrAidCubit.get(context);
    cubit.getAllPatients(clinicId: widget.clinicId, token: widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: BlocConsumer<DrAidCubit, DrAidStates>(
        listener: (context, state) {
          if (state is DrAidPatientErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMsg)),
            );
          }
        },
        builder: (context, state) {
          if (state is DrAidLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DrAidPatientSuccessState) {
            // Replace with your patient data display logic
            return _buildPatientData(state.createPatientModel);
          } else if (state is DrAidPatientErrorState) {
            print("error: ${state.errorMsg}");
            return const Center(child: Text('Failed to load patient data'));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _buildPatientData(CreatePatientModel patientModel) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text('Full Name: ${patientModel.patientData.fullName}'),
        Text('Birth Date: ${patientModel.patientData.birthDate}'),
        Text('Phone Number: ${patientModel.patientData.phoneNumber}'),
        Text('Address: ${patientModel.patientData.address}'),
        // Add more fields as needed
      ],
    );
  }
}
