import 'package:bloc_state_management_app/utils/error_types.dart';

class ApiStates {
  final bool? isLoading;
  final int? statusCode;
  final ErrorType? errorType;
  final String? msgError;
  final bool? isError;

  ApiStates(
      {this.isLoading,
      this.statusCode,
      this.errorType,
      this.isError,
      this.msgError});
}
