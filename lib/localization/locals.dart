// ignore: depend_on_referenced_packages
import 'package:flutter_localization/flutter_localization.dart';

// ignore: constant_identifier_names
const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
  MapLocale("am", LocaleData.AM),
  MapLocale("or", LocaleData.OR),
];

mixin LocaleData {
  // Common keys
  static const String title = 'title';
  static const String notification = 'notification';
  static const String body = 'body';
  static const String home = 'home';
  static const String chat = 'chat';
  static const String newChat = 'newChat';
  static const String profile = 'profile';
  static const String settings = 'settings';
  static const String card = 'card';
  static const String logout = 'logout';
  static const String cardPageMessage = 'cardPageMessage';
  static const String startSession = 'startSession';
  static const String endSession = 'endSession';
  static const String myAccount = 'My Account';
  static const String myCertification = 'My Certification';
  static const String myChildren = 'My Children';
  static const String privacySecurity = 'Privacy & Security';
  static const String DIRECTMESSAGES = 'DIRECT MESSAGES';
  static const String back = 'Back';

  // English translations
  static const Map<String, dynamic> EN = {
    title: 'Localization',
    notification: 'Notification',
    body: 'Welcome to this localized Flutter application %a',
    home: 'Home',
    chat: 'Chat',
    newChat: 'New Chat',
    card: 'Card',
    profile: 'Profile',
    settings: 'settings',
    logout: 'Logout',
    cardPageMessage: 'Put your card near the NFC reader',
    startSession: 'Start Session',
    endSession: 'End Session',
    myAccount: 'My Account',
    myCertification: 'My Certification',
    myChildren: 'My Children',
    privacySecurity: 'Privacy & Security',
    DIRECTMESSAGES: 'DIRECT MESSAGES',
    back: 'Back',
  };

  // Amharic translations
  static const Map<String, dynamic> AM = {
    title: 'ርዕስ',
    notification: 'አስተዳዳሪ',
    body: 'ወደዚህ የተተረጎመ የFlutter መተግበሪያ እንኳን በደህና መጡ',
    home: 'የገጠራዊ ገጽ',
    chat: 'አቤቱ',
    newChat: 'አቀማጥ አቤቱ',
    profile: 'ፋይል',
    settings: 'ቅንብሮች',
    logout: 'ውጣ',
    cardPageMessage: 'የካርድዎን እናዳለጋት ከዚህ NFCreader ቀጥቶዎታል',
    startSession: 'ክፍለ ጊዜ መጀመር',
    endSession: 'የማቆሚያ ክፍለ ጊዜ',
    myAccount: 'አካውንት',
    myCertification: 'ካርድዎን አባል',
    myChildren: 'አካውንትዎች',
    privacySecurity: 'ስራዎች እና መተግበሪያ',
    DIRECTMESSAGES: 'DIRECT MESSAGES',
    back: 'ወደዚህ'
  };

  // Oromo translations
  static const Map<String, dynamic> OR = {
    title: 'mata-duree',
    notification: 'beeksisa',
    body: 'Baga gara application Flutter localized kanaatti dhuftan',
    home: 'Home',
    chat: 'Chat',
    newChat: 'New Chat',
    profile: 'Profile',
    settings: 'settings',
    logout: 'Logout',
    cardPageMessage: 'Fedhii kaardii Keessan gara NFCreader kaa qaba',
    startSession: 'walgahii jalqabaa',
    endSession: 'walgahii dhaabuu',
    myAccount: 'Akka Dhimmaa',
    myCertification: 'Akka Hirmaannaa',
    myChildren: 'Kutaa Sirna Dheebuu',
    privacySecurity: 'Jireenyaafi Amaaraa',
    DIRECTMESSAGES: 'DIRECT MESSAGES',
    back: 'Back',
  };
}
