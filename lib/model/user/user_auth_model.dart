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
  final List<ChatModel2>? participantInChats;
  final List<ChatModel2>? adminOfChats;

  AuthUserInfo(
      {required this.id,
      required this.email,
      required this.phone,
      required this.role,
      required this.activeStatus,
      required this.userProfile,
      this.motherProfile,
      this.proProfile,
      this.healthStation,
      this.participantInChats,
      this.adminOfChats});
  factory AuthUserInfo.fromJson(Map<String, dynamic> json) {
    print(json);
    if (json['role'] == "MOTHER") {
      return AuthUserInfo(
        id: json['id'],
        email: json['email'],
        phone: json['phone'],
        role: json['role'],
        activeStatus: json['activeStatus'],
        userProfile: UserProfile.fromJson(json['profile']),
        motherProfile: MotherProfile.fromJson(json['motherProfile']),
        // adminOfChats: (json['adminOfChats'] as List<dynamic>?)
        //     ?.map((e) => ChatModel2.fromJson(e))
        //     .toList(),
        participantInChats: (json['participantInChats'] as List<dynamic>?)
            ?.map((e) => ChatModel2.fromJson(e))
            .toList(),
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
        // adminOfChats: (json['adminOfChats'] as List<dynamic>?)
        //     ?.map((e) => ChatModel2.fromJson(e))
        //     .toList(),
        participantInChats: (json['participantInChats'] as List<dynamic>?)
            ?.map((e) => ChatModel2.fromJson(e))
            .toList(),
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

class ParticipantInChat {
  final List<ChatModel2> chatParticipant;
  ParticipantInChat({required this.chatParticipant});
  factory ParticipantInChat.fromJson(Map<String, dynamic> json) {
    return ParticipantInChat(
      chatParticipant: List<ChatModel2>.from(
          json['participantInChats'].map((x) => ChatModel2.fromJson(x))),
    );
  }
}

class ChatModel2 {
  final int id;
  final String name;
  final bool isGroup;
  final DateTime createdAt;
  final int? adminId;
  final MessageModel? lastMessage;
  final List<AuthUserInfo>? members;
  final List<MessageModel>? allMessages;

  ChatModel2(
      {required this.id,
      required this.name,
      required this.isGroup,
      required this.createdAt,
      this.adminId,
      this.lastMessage,
      this.members,
      this.allMessages});

  factory ChatModel2.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? messageData = json['lastMessage'] as List<dynamic>?;
    final List<dynamic>? memberData = json['participants'] as List<dynamic>?;
    final MessageModel? lastMessage =
        messageData != null && messageData.isNotEmpty
            ? MessageModel.fromJson(messageData.first)
            : null;
    // print("+++++++++++++++++++++++++++object");
    // final List<AuthUserInfo>? members =
    //     memberData != null && memberData.isNotEmpty
    //         ? memberData
    //             .map((e) => AuthUserInfo.fromJson(e as Map<String, dynamic>))
    //             .toList()
    //         : null;
    // print(memberData);

    return ChatModel2(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      isGroup: json['isGroup'] == true,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      adminId: json['adminId'] ?? null,
      lastMessage: lastMessage,
      // members: members,
    );
  }
}

class MessageModel {
  final int id;
  final String content;
  final DateTime sentTime;
  final int senderId;

  MessageModel({
    required this.id,
    required this.content,
    required this.sentTime,
    required this.senderId,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      content: json['content'],
      sentTime: DateTime.parse(json['sentTime']),
      senderId: json['senderId'],
    );
  }
}
