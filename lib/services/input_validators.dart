String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Enter your email address.';
  }
  if (!value.contains('@')) return 'Enter a valid email address.';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your password.';
  }
  if (value.length < 6) return 'Use at least six characters.';
  return null;
}
