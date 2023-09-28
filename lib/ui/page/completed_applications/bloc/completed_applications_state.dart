part of 'completed_applications_bloc.dart';

@immutable
class CompletedApplicationsState {
  final bool isLoading;
  final List<ServiceRequest> requests;
  final List<ServiceRequest> requestsSearch;
  final String errorMessage;
  final String snackBarMessage;
  final String searchText;

  const CompletedApplicationsState({
    this.isLoading = false,
    this.requests = const [],
    this.requestsSearch = const [],
    this.errorMessage = '',
    this.snackBarMessage = '',
    this.searchText = '',
  });

  CompletedApplicationsState copyWith({
    bool? isLoading,
    List<ServiceRequest>? requests,
    List<ServiceRequest>? requestsSearch,
    String? errorMessage,
    String? snackBarMessage,
    String? searchText,
  }) {
    return CompletedApplicationsState(
      isLoading: isLoading ?? this.isLoading,
      requests: requests ?? this.requests,
      requestsSearch: requestsSearch ?? this.requestsSearch,
      errorMessage: errorMessage ?? this.errorMessage,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      searchText: searchText ?? this.searchText,
    );
  }
}
