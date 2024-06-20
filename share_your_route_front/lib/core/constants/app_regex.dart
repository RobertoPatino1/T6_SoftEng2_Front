// ignore_for_file: avoid_classes_with_only_static_members

class AppRegex {
  static RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  static RegExp phoneRegex = RegExp(r'^\+\d{1,3}\s?(\d{3}[-\.\s]?){2}\d{4}$');
}
