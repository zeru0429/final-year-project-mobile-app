import 'package:flutter/material.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppData {
  static final List<Map<String, dynamic>> progressIndicatorList = [
    {
      "cardTitle": "Progress Task Progress",
      "rating": "3/5",
      "progress": "68.99",
      "progressBar": "2"
    },
    {
      "cardTitle": "Registration",
      "rating": "3/4",
      "progress": "75.00",
      "progressBar": "3"
    },
    {
      "cardTitle": "Invite 5 Members",
      "rating": "2/5",
      "progress": "50",
      "progressBar": "1"
    },
    {
      "cardTitle": "Setup Profile",
      "rating": "3/4",
      "progress": "75",
      "progressBar": "3"
    },
    {
      "cardTitle": "Complete Workspace",
      "rating": "3/5",
      "progress": "68.99",
      "progressBar": "2"
    },
  ];

  static final List<Map<String, dynamic>> notificationMentions = [
    {
      "mentionedBy": "Benjamin Poole",
      "mentionedIn": "Unity Gaming",
      "read": false,
      "date": "Nov 2nd",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "hashTagPresent": true,
      "userOnline": false,
      "color": "BBF1C3",
      "hashElement": "@tranmautritam",
      "message":
          " when you have time please take a look at the new designs I just made in Figma. 👋"
    },
    {
      "mentionedBy": "Katharine Walls",
      "mentionedIn": "Unity Gaming",
      "read": true,
      "date": "Nov 2nd",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "hashTagPresent": false,
      "color": "DBCFFE",
      "userOnline": true,
      "hashElement": "",
      "message":
          "Please make the presentation as soon as possible Tam. We're still waiting for it. 🏀"
    },
    {
      "mentionedBy": "Bertha Ramos",
      "mentionedIn": "UI8 Products",
      "read": true,
      "date": "Nov 2nd",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "hashTagPresent": false,
      "userOnline": true,
      "color": "FFC5D5",
      "hashElement": "",
      "message":
          "Are you actually working? I don't see any new stuffs from you. Please Be creative!!!"
    },
    {
      "mentionedBy": "Marie Bowen",
      "mentionedIn": "Productivity",
      "date": "Nov 2nd",
      "read": true,
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "hashTagPresent": false,
      "color": "FAA3FF",
      "userOnline": false,
      "hashElement": "",
      "message": "Are you actually working? We're still waiting for it. 🏀"
    },
    {
      "mentionedBy": "Katharine Walls",
      "mentionedIn": "Unity Gaming",
      "read": true,
      "date": "Nov 2nd",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "hashTagPresent": false,
      "color": "DBCFFE",
      "userOnline": true,
      "hashElement": "",
      "message":
          "Please make the presentation as soon as possible Tam. We're still waiting for it. 🏀"
    },
    {
      "mentionedBy": "Bertha Ramos",
      "mentionedIn": "UI8 Products",
      "read": true,
      "date": "Nov 2nd",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "hashTagPresent": false,
      "userOnline": true,
      "color": "FFC5D5",
      "hashElement": "",
      "message":
          "Are you actually working? I don't see any new stuffs from you. Please Be creative!!!"
    },
    {
      "mentionedBy": "Marie Bowen",
      "mentionedIn": "Productivity",
      "date": "Nov 2nd",
      "read": true,
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "hashTagPresent": false,
      "color": "FAA3FF",
      "userOnline": false,
      "hashElement": "",
      "message": "Are you actually working? We're still waiting for it. 🏀"
    },
  ];

  static final List<String> profileImages = [
    "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
    "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
    "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
    "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI="
  ];

  static final List<Color> groupBackgroundColors = [
    Colors.green.shade500,
    Colors.green.shade200,
    Colors.green.shade100,
    Colors.green.shade800
  ];

  static final List<Map<String, dynamic>> onlineUsers = [
    {
      "name": "Gareth Reid 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "BAF0C5",
    },
    {
      "name": "Vincent Lyons 🇺🇸",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "DACFFE",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "FFC7D5",
    },
    {
      "name": "Samuel Doyle 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "C0E7FD",
    },
    {
      "name": "Ruth Benson 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "D7D2D4",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "FFC7D5",
    },
    {
      "name": "Samuel Doyle 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "C0E7FD",
    },
    {
      "name": "Ruth Benson 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "D7D2D4",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "FFC7D5",
    },
    {
      "name": "Samuel Doyle 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "C0E7FD",
    },
    {
      "name": "Ruth Benson 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "D7D2D4",
    },
    {
      "name": "Gareth Reid 🔥",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "BAF0C5",
    },
    {
      "name": "Vincent Lyons 🇺🇸",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "DACFFE",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": "FFC7D5",
    },
  ];

  static final List<Map<String, dynamic>> employeeData = [
    {
      "employeeName": "Aaliyah Langosh",
      "employeeImage": "assets/girl_smile.png",
      "color": Colors.green.shade500,
      "activated": true,
      "employeePosition": "Senior Interactions Agent"
    },
    {
      "employeeName": "Greta Streich",
      "employeeImage": "assets/man-head.png",
      "color": Colors.green.shade500,
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Judd Koch",
      "employeeImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": Colors.green.shade500,
      "activated": true,
      "employeePosition": "Senior Interactions Agent"
    },
    {
      "employeeName": "Katherine Wells",
      "employeeImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": Colors.green.shade500,
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Betha Ramos",
      "employeeImage":
          "https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=",
      "color": Colors.green.shade500,
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Greta Streich",
      "employeeImage": "assets/girl_smile.png",
      "color": Colors.green.shade500,
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Aaliyah Langosh",
      "employeeImage": "assets/girl_smile.png",
      "color": Colors.green.shade500,
      "activated": true,
      "employeePosition": "Senior Interactions Agent"
    },
  ];

  static final List<Map<String, dynamic>> productData = [
    {
      "projectName": "Unity Dashboard",
      "category": "Design",
      "color": "A06AFA",
      "ratingsUpperNumber": 15,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "Instagram   Shots🇺🇸",
      "category": "Marketing",
      "color": "8D96FF",
      "ratingsUpperNumber": 8,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "Cubbies",
      "category": "Design",
      "color": "FF968E",
      "ratingsUpperNumber": 15,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "OpenMind 🚀",
      "category": "Development",
      "color": "FFDE72",
      "ratingsUpperNumber": 19,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "UI8 Platform",
      "category": "Design",
      "color": "A06AFA",
      "ratingsUpperNumber": 10,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "3D Characters Inc.",
      "category": "Development",
      "color": "A6F69C",
      "ratingsUpperNumber": 18,
      "ratingsLowerNumber": 20
    },
  ];
}
