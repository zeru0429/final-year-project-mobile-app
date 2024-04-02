class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String middleName;
  final String gender;
  User(
      {required this.userId,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json[''],
      middleName: '',
      lastName: '',
      gender: '',
      userId: '',
    );
  }
}
