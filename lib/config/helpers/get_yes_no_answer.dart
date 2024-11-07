import 'package:dio/dio.dart';
import 'package:yes_no_app_leonardo_4sa/domain/entities/message.dart';
import 'package:yes_no_app_leonardo_4sa/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //Se crea objeto de la clase Dio
  //para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacenar la peticion GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    //Generar el error
    throw UnimplementedError();
  }
}
