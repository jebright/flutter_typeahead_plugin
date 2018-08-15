import 'service_result.dart';

class ServiceState {
  final ServiceResult result;
  final bool isInitial;
  final bool isProcessing;
  final bool hasError;

  ServiceState(
      {this.result,
      this.isInitial = false,
      this.isProcessing = false,
      this.hasError = false});

  ServiceState.initial(
      {this.isInitial = true,
      this.isProcessing = false,
      this.hasError = false,
      this.result});

  ServiceState.processing(
      {this.isInitial = false,
      this.isProcessing = true,
      this.hasError = false,
      this.result});

  ServiceState.error(
      {this.isInitial = false,
      this.isProcessing = false,
      this.hasError = true,
      this.result});
}
