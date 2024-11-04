import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_app_leonardo_4sa/domain/entities/message.dart";
import "package:yes_no_app_leonardo_4sa/presentation/chat_provider.dart";
import "package:yes_no_app_leonardo_4sa/presentation/widgets/chat/her_message_bubble.dart";
import "package:yes_no_app_leonardo_4sa/presentation/widgets/chat/my_message_bubble.dart";
import "package:yes_no_app_leonardo_4sa/presentation/widgets/shared/message_field_box.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://s3p.sofifa.net/f195d613b06dd86bc8f9aa8ebd1574edd3ddb0cf.png'),
          ),
        ),
        title: const Text('El comandante 👑'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),

            //Caja de Texto
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
