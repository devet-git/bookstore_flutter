/// A validator extension for validate string from string.
///
/// Example using
/// ```dart
/// bool isValid = Validators("buithang@gmail.com").isValidEmail();
/// print(isValid) // output: true
/// ```
extension Validators on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r"^[0-9a-zA-Z]{8,}$").hasMatch(this);
  }

  bool isValidPhoneNumber() {
    return RegExp(r"").hasMatch(this);
  }

  bool isValidUsername() {
    return RegExp(r"^[a-zA-Z0-9]{4,}$").hasMatch(this);
  }
}
