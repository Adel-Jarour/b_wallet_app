import 'dart:ui';

class HelpModel {
  final int id;
  final String title;
  final VoidCallback onTap;

  HelpModel({
    required this.id,
    required this.title,
    required this.onTap,
  });
}
