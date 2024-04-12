import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
 late int statusCode;
  late String message;
  Map<String, dynamic>? errors;


 ErrorMessageModel.fromJson(Map<String, dynamic> json) {
     statusCode= json["status"];
      message= json["message"]??'';
      errors= json["errors"];
  }


  @override
  List<Object?> get props => [
   statusCode,
    message,
    errors,
  ];
}
