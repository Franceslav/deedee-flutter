import 'package:bloc/bloc.dart';
import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:meta/meta.dart';

part 'my_request_event.dart';

part 'my_request_state.dart';

class ServiceRequestBloc extends Bloc<MyRequestEvent, MyRequestState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final User _user;

  ServiceRequestBloc(this._serviceRequestRepository, this._user)
      : super(MyRequestInitial()) {
    on<MyRequestLoadEvent>(_onLoadRequest);
    on<MyRequestDeleteEvent>(_onDeleteRequest);
    initialize();
  }

  initialize() async {
    try {
      final requests = await _serviceRequestRepository.getAll(_user.userId);
      emit(MyRequestLoadState(requests));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onLoadRequest(
      MyRequestLoadEvent event, Emitter<MyRequestState> emit) async {}

  _onDeleteRequest(
      MyRequestDeleteEvent event, Emitter<MyRequestState> emit) async {
    try {
      var sr = ServiceRequest()..requestId = event.request.requestId;
      final response = await _serviceRequestRepository.delete(
        ServiceRequestRequest()..serviceRequest = sr,
      );
      if (response.status == ServiceRequest_Status.DELETED) {
        emit(DeletedSuccessfulState());
      } else {
        //without delay this error appears 'A dismissed Dismissible widget is still part of the tree.'
        await Future.delayed(const Duration(seconds: 1));
        emit(DeletedErrorState(
          request: event.request,
          index: event.index,
        ));
      }
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
