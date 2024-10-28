import "package:flutter/material.dart";
import "package:yes_no_app_leonardo_4sa/domain/entities/message.dart";

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Lloras porque reprobaste topicos?', fromWho: FromWho.me)
  ];
  //Controlador para manejar la posicion del scroll
  final ScrollController chatScrollController = ScrollController();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser "me" porque yo lo envio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a lista "messageList"
    messageList.add(newMessage);
    //Notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
  }

  //Mover el scroll al ultimo mensaje
  Future<void> moveScrollToBottom() async {
    //Un peque;o atraso en la animacion para garantizar que siempre se vera aun cuando se envien
    //mensajes cortos y rapidos
    await Future.delayed(const Duration(seconds: 1));
    //offset: posicion de la animacion
    //maxScrollExtent determina a lo maximo que el scroll puede dar
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        //Duracion de la animacion
        duration: const Duration(milliseconds: 300),
        //"Rebote" al final de la animacion
        curve: Curves.easeOut);
  }
}
