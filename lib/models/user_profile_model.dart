class UserProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? email;
  final DateTime? birthday;
  final String? profileImageUrl;

  UserProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.phoneNumber,
    this.birthday,
    this.profileImageUrl,
  });
}
