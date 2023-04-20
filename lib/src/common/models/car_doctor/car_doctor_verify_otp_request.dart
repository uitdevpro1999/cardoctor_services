
class CarDoctorVerifyOtpRequest {
  CarDoctorVerifyOtpRequest({
    required this.username,
    required this.password
  });

  final String username;
  final String password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}