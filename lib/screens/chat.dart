import 'package:chat_bot/widget/chat_messages.dart';
import 'package:chat_bot/widget/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  setUpNotification() async {
    final fmn = FirebaseMessaging.instance;
    await fmn.requestPermission();
    // final tocken = await fmn.getToken();
    // print(' Tocken $tocken');   for individual app.
    fmn.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();
    setUpNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chat",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
        body: const Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessage()
          ],
        ));
  }
}
