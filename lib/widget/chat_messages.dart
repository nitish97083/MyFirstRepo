import 'package:chat_bot/widget/message_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Chat')
            .orderBy('createAt', descending: true)
            .snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            print(" Chat Waiting Page");
            return Center(
              child: Text(
                'Loading...',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            );
          }
          if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Message Found"),
            );
          }
          if (chatSnapshot.hasError) {
            return const Center(
              child: Text("SOmething Wrong..."),
            );
          }
          final loadMessage = chatSnapshot.data!.docs;
          print("load message ${loadMessage[1].reference.id}");
          return ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 14,
                left: 13,
                right: 13,
              ),
              reverse: true,
              itemCount: loadMessage.length,
              itemBuilder: (ctx, index) {
                final chatMessege = loadMessage[index]
                    .data(); // m = 2  i = 1  ch = 1 and next = i = 2 2<2
                final nextChatMessage = index + 1 < loadMessage.length
                    ? loadMessage[index + 1].data()
                    : null;
                final currentUserId = chatMessege['userId'];
                final nextUserId =
                    nextChatMessage != null ? nextChatMessage['userId'] : null;
                final nextUserIsSame = nextUserId == currentUserId;
                if (nextUserIsSame) {
                  print(" NextUser is same $nextUserIsSame");
                  return MessageBubble.next(
                      refrencId: loadMessage[index + 1].reference.id,
                      message: chatMessege['text'],
                      isMe: authUser.uid == currentUserId);
                } else {
                  return MessageBubble.first(
                      refrencId: loadMessage[index].reference.id,
                      userImage: chatMessege['imageUrl'],
                      username: chatMessege['username'],
                      message: chatMessege['text'],
                      isMe: authUser.uid == currentUserId);
                }
              });
        });
  }
}
