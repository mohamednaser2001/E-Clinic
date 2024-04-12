

import 'package:equatable/equatable.dart';
import '../network/error_message_model.dart';

abstract class Failure extends Equatable{
  final ErrorMessageModel errorMessageModel;

  const Failure({required this.errorMessageModel});

  @override
  List<Object> get props => [errorMessageModel];
}

class ServerFailure extends Failure{
  const ServerFailure({required super.errorMessageModel});
}


class DatabaseFailure extends Failure{
  const DatabaseFailure({required super.errorMessageModel});
} 