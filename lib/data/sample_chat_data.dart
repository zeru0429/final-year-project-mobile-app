import 'package:dash_chat_2/dash_chat_2.dart';

List<ChatUser> users = [
  ChatUser(
    id: '1',
  ),
  ChatUser(
    id: '2',
  ),
  ChatUser(
    id: '3',
  ),
  ChatUser(
    id: '4',
  ),
  ChatUser(
    id: '5',
  ),
  ChatUser(
    id: '6',
  ),
  ChatUser(
    id: '7',
  ),
  ChatUser(
    id: '8',
  )
];

List<ChatMessage> messages = [
  ChatMessage(
    user: users[0],
    createdAt: DateTime.now(),
    text: "Hi, how can I help you?",
    isMarkdown: false,
    replyTo: ChatMessage(
      user: users[1],
      createdAt: DateTime.now(),
    ),
  ),
  ChatMessage(
    user: users[1],
    createdAt: DateTime.now(),
    text: "Hi, I'm fine. What about you?",
    isMarkdown: false,
    replyTo: ChatMessage(
      user: users[0],
      createdAt: DateTime.now(),
    ),
  ),
  ChatMessage(
    user: users[0],
    createdAt: DateTime.now(),
    text: "I'm good. How are you?",
    isMarkdown: false,
    replyTo: ChatMessage(
      user: users[1],
      createdAt: DateTime.now(),
    ),
  ),
  ChatMessage(
    user: users[1],
    createdAt: DateTime.now(),
    text: "I'm good. What about you?",
    isMarkdown: false,
    replyTo: ChatMessage(
      user: users[0],
      createdAt: DateTime.now(),
    ),
  ),
  ChatMessage(
    user: users[0],
    createdAt: DateTime.now(),
    text: "I'm good. What about you?",
    isMarkdown: false,
    replyTo: ChatMessage(
      user: users[1],
      createdAt: DateTime.now(),
    ),
  ),
  ChatMessage(
    user: users[1],
    createdAt: DateTime.now(),
    text: "I'm good. What about you?",
    isMarkdown: false,
    replyTo: ChatMessage(
      user: users[0],
      createdAt: DateTime.now(),
    ),
  ),
];
