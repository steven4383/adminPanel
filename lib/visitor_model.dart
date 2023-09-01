import 'package:cloud_firestore/cloud_firestore.dart';

class Visitor {
  String? id;
  String? name;
  String? nricFin;
  String? companyName;
  String? designation;
  String? phone;
  String? email;
  String? persontovisit;
  String? placeofvisit;
  String? purposeofvisit;
  String? inTime;
  String? emergencyContact;
  bool? isHaveCovidCertificate;
  bool? termsCondition;
  bool? approved;

  Visitor({
    this.id,
    this.name,
    this.nricFin,
    this.companyName,
    this.designation,
    this.phone,
    this.email,
    this.persontovisit,
    this.placeofvisit,
    this.purposeofvisit,
    this.inTime,
    this.emergencyContact,
    this.isHaveCovidCertificate,
    this.termsCondition,
    this.approved,
  });

  factory Visitor.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Visitor(
      id: snapshot.id,
      name: data['Name'] ?? '',
      nricFin: data['nricFin'] ?? '',
      companyName: data['CompanyName'] ?? '',
      designation: data['designation'] ?? '',
      phone: data['Phone'] ?? '',
      email: data['Email'] ?? '',
      persontovisit: data['persontovisit'] ?? '',
      placeofvisit: data['placetovisit'] ?? '',
      purposeofvisit: data['purpose'] ?? '',
      inTime: data['inTime'] ?? '',
      emergencyContact: data['emergencyContact'] ?? '',
      isHaveCovidCertificate: data['isHave-covidcertificate'] ?? false, // Corrected data type to bool
      termsCondition: data['termsCondition'] ?? false,
      approved: data['approved'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'nricFin': nricFin,
      'CompanyName': companyName,
      'designation': designation,
      'Phone': phone,
      'Email': email,
      'persontovisit': persontovisit,
      'placetovisit': placeofvisit,
      'purpose': purposeofvisit,
      'inTime': inTime,
      'emergencyContact': emergencyContact,
      'isHave-covidcertificate': isHaveCovidCertificate,
      'termsCondition': termsCondition,
      'approved': approved,
    };
  }
}
