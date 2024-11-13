//El modelo define que datos debe tener  la aplicación. Investigar MVC
//Modelo = datos  Vista = Pantalla   Controlador = lógica
import 'package:yes_no_app_leonardo_4sa/domain/entities/message.dart';

class YesNoModel {
  //Atributos de clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  //factoryno necesariamente crea una nueva instancia
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      //Condicional ternario para darle valor a los mensajes
      text: answer == 'yes'
          ? 'Si'
          : answer == 'no'
              ? 'No'
              : 'Quizás',
      //Siempre va a ser ella
      fromWho: FromWho.hers,
      //Será el gif
      imageUrl: image);
}
