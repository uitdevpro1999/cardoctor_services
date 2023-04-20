
class CarDoctorGetOtpRequest {
  CarDoctorGetOtpRequest({
    required this.contractId,
    required this.name,
    required this.phone,
    required this.identifier,
    required this.isGetToken,
  });

  final String contractId;
  final String name;
  final String phone;
  final String identifier;
  final bool isGetToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contractId'] = contractId;
    map['name'] = name;
    map['phone'] = phone;
    map['identifiedCard'] = identifier;
    map['isGetToken'] = isGetToken;
    return map;
  }
}