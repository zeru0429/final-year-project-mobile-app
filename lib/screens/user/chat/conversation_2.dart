import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/sample_chat_data.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ChatUser _currentUser = users[1];
  final ChatUser _anotherUser = users[0];
  final List<ChatUser> _typingUsers = <ChatUser>[];
  final List<ChatMessage> _messages = messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context).themeData.colorScheme.background,
      appBar: AppBar(
        title: const Text("Chat Page"),
      ),
      body: SafeArea(
        child: Center(
          child: DashChat(
            currentUser: _currentUser,
            messages: _messages,
            messageOptions: MessageOptions(
              showCurrentUserAvatar: true,
              showOtherUsersAvatar: true,
              showOtherUsersName: true,
              avatarBuilder: (user, onPressAvatar, onLongPressAvatar) {
                if (user.id == _currentUser.id) {
                  // Use a custom image for the current user's avatar
                  return const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1620163280053-68782bd98475?q=80&w=1365&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  );
                } else if (user.id == _anotherUser.id) {
                  // Use a custom image for the another user's avatar
                  return const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1710608361177-a058894a1af3?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  );
                }

                return DefaultAvatar(
                  user: user,
                  size: 32,
                );
              },
              currentUserContainerColor: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .primary,
              containerColor: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
              showTime: true,
              timeFontSize: 12,
              currentUserTextColor: Colors.white,
              textColor: Colors.white,
              timeTextColor: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .onError,
            ),
            onSend: (ChatMessage message) {
              getChatResponse(message);
            },
            scrollToBottomOptions: ScrollToBottomOptions(
              scrollToBottomBuilder: (scrollController) => Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .secondary,
                  ),
                  onPressed: () {
                    scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ),
            ),
            typingUsers: _typingUsers,
            inputOptions: InputOptions(
              autocorrect: true,
              sendButtonBuilder: (onSend) {
                return IconButton(
                  onPressed: onSend,
                  icon: Icon(
                    Icons.send,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .secondary, // Change the send icon color here
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.clear();
      _typingUsers.add(_anotherUser);
    });
  }
}
