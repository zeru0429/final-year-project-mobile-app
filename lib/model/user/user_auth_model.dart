class AuthUserInfo {
  final int id;
  final String email;
  final String phone;
  final String role;
  final bool activeStatus;
  final UserProfile userProfile;
  final MotherProfile? motherProfile;
  final ProProfile? proProfile;
  final HealthStation? healthStation;

  AuthUserInfo({
    required this.id,
    required this.email,
    required this.phone,
    required this.role,
    required this.activeStatus,
    required this.userProfile,
    this.motherProfile,
    this.proProfile,
    this.healthStation,
  });
  factory AuthUserInfo.fromJson(Map<String, dynamic> json) {
    if (json['role'] == "MOTHER") {
      return AuthUserInfo(
        id: json['id'],
        email: json['email'],
        phone: json['phone'],
        role: json['role'],
        activeStatus: json['activeStatus'],
        userProfile: UserProfile.fromJson(json['profile']),
        motherProfile: MotherProfile.fromJson(json['motherProfile']),
        healthStation: HealthStation.fromJson(json['healthStation']),
      );
    } else {
      return AuthUserInfo(
        id: json['id'],
        email: json['email'],
        phone: json['phone'],
        role: json['role'],
        activeStatus: json['activeStatus'],
        userProfile: UserProfile.fromJson(json['profile']),
        proProfile: ProProfile.fromJson(json['proProfile']),
        healthStation: HealthStation.fromJson(json['healthStation']),
      );
    }
  }
}

class UserProfile {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String imageUrl;
  final String gender;

  UserProfile({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.imageUrl,
    required this.gender,
  });
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      imageUrl: json['imageUrl'],
      gender: json['sex'],
    );
  }
}

class MotherProfile {
  final int id;
  final String birthdate;
  final String bloodType;
  final String RH;

  MotherProfile(
      {required this.id,
      required this.birthdate,
      required this.bloodType,
      required this.RH});

  factory MotherProfile.fromJson(Map<String, dynamic> json) {
    return MotherProfile(
      id: json['id'],
      birthdate: json['birthdate'],
      bloodType: json['bloodType'],
      RH: json['RH'],
    );
  }
}

class HealthStation {
  final int id;
  final String name;
  final String type;
  final String city;
  final String subcity;
  final String kebele;
  final String houseNumber;

  HealthStation({
    required this.id,
    required this.name,
    required this.type,
    required this.city,
    required this.subcity,
    required this.kebele,
    required this.houseNumber,
  });

  factory HealthStation.fromJson(Map<String, dynamic> json) {
    return HealthStation(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      city: json['city'],
      subcity: json['subcity'],
      kebele: json['kebele'],
      houseNumber: json['houseNumber'],
    );
  }
}

class ProProfile {
  final int id;
  final String title;
  final String position;
  ProProfile({
    required this.id,
    required this.title,
    required this.position,
  });

  factory ProProfile.fromJson(Map<String, dynamic> json) {
    return ProProfile(
      id: json['id'],
      title: json['title'],
      position: json['position'],
    );
  }
}
