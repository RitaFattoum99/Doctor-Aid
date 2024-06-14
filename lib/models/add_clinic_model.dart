//
// class AddClinicModel
// {
//   late   String status;
//   late String message;
//   late ClinicData clinicData;
//   AddClinicModel.fromJson(Map<String,dynamic> json)
//   {
//     status=json['status'];
//     status=json['message'];
//     if (json['data'] !=null) {
//       clinicData = ClinicData.fromJson(json['data']);
//     } else {
//       clinicData = ClinicData();
//     }
//
//   }
//
// }
// class ClinicData
// {
//   int   id=0;
//   String name='';
//   String address='';
//   String telePhoneNumber='';
//   String phoneNumber='';
//   String whatsappNumber='';
//   String ownerName='';
//   String ownerAddress='';
//   String ownerPhone='';
//
//
//
//
//   ClinicData({
//     this.id=0,
//     this.name='',
//     this.ownerPhone='',
//     this.ownerName='',
//     this.address='',
//     this.ownerAddress='',
//     this.phoneNumber='',
//     this.telePhoneNumber='',
//     this.whatsappNumber='',
//
//
//   }
//
//
//
//       );
//   ClinicData.fromJson(Map<String,dynamic> json)
//   {
//     id=json['id'];
//     name=json['name'];
//     ownerName=json['ownerName'];
//
//
//   }
// }



class AddClinicModel {
  late String status;
  late String message;
  late ClinicData clinicData;

  // Constructor that takes all necessary parameters
  AddClinicModel({
    required this.status,
    required this.message,
    required this.clinicData,
  });

  // Factory constructor for creating an instance from JSON
  factory AddClinicModel.fromJson(Map<String, dynamic> json) {
    return AddClinicModel(
      status: json['status'],
      message: json['message'],
      clinicData: ClinicData.fromJson(json['data']),
    );
  }
}

class ClinicData {
  int id = 0;
  String name = '';
  String address = '';
  String telePhoneNumber = '';
  String phoneNumber = '';
  String whatsappNumber = '';
  String ownerName = '';
  String ownerAddress = '';
  String ownerPhone = '';

  // Default constructor
  ClinicData({
    this.id = 0,
    this.name = '',
    this.ownerPhone = '',
    this.ownerName = '',
    this.address = '',
    this.ownerAddress = '',
    this.phoneNumber = '',
    this.telePhoneNumber = '',
    this.whatsappNumber = '',
  });

  // Constructor for creating an instance from JSON
  ClinicData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        ownerName = json['ownerName'];
}