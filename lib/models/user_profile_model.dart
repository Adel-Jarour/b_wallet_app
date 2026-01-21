class UserProfileModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final DateTime birthday;
  final String? profileImageUrl;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.birthday,
    this.profileImageUrl,
  });
}
