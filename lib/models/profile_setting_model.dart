import 'dart:ui';

class ProfileSettingModel {
  final String icon;
  final String title;
  final String? value;
  final VoidCallback onTap;

  ProfileSettingModel({
    required this.icon,
    required this.title,
    this.value,
    required this.onTap,
  });
}
