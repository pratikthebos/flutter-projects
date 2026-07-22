class Validators {
  static String? url(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter API URL";
    }

    final uri = Uri.tryParse(value);

    if (uri == null || !uri.hasScheme) {
      return "Enter valid URL";
    }

    return null;
  }

  static String? json(String? value) {
    return null;
  }
}