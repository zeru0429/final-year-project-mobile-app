import 'package:flutter/material.dart';
import 'package:mobile/model/user/user_auth_model.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/util/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool islogin = false;
  String token = "";
  AuthUserInfo? _user = AuthUserInfo(
    id: 1,
    email: 'test@gmmail.com',
    phone: '994',
    role: 'Sample',
    activeStatus: false,
    userProfile: UserProfile(
      id: 1,
      firstName: 'Sample',
      middleName: 'User',
      lastName: 'for testing',
      imageUrl:
          'https://images.unsplash.com/photo-1607454230973-e19abb3fa2bc?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      gender: 'No',
    ),
    participantInChats: [],
    adminOfChats: [],
  );
  //prepare conversation
  List<ChatModel2> _chats = []; //list of chats
  // get
  bool get isLogin => islogin;

  AuthUserInfo get getUser => _user!;
  List<ChatModel2> get _chatLists => _chats;
  //set
  void setToken(String token) {
    this.token = token;
    notifyListeners();
  }

  void removeToken() {
    token = "";
    notifyListeners();
  }

  void login() {
    islogin = true;
    notifyListeners();
  }

  void setUser(AuthUserInfo user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    islogin = false;
    notifyListeners();
  }

  void prepareAuthData() async {
    print(" -------------------- start ----------------------");
    //first check it token exist
    final token = await getToken();
    if (token == null) {
    } else {
      //if token not exist send request for auth data
      AuthService authService = AuthService();
      final response = await authService.meService();
      if (response['success'] == false) {
      } else {
        login();
        setUser(AuthUserInfo.fromJson(response));
      }
    }
    print(" -------------------- Done ----------------------");
  }

  //set or fetch conversations
  void setChats(List<ChatModel2> chats) {
    _chats = chats;
    notifyListeners();
  }
  //update conversations info

  void allConversation() {
    print("all conversations");

    notifyListeners();
  }
}
