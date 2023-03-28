import 'package:bloc/bloc.dart';
import 'package:deedee/model/order.dart';

import '../../../injection.dart';
import '../../../services/grpc.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  PlaceOrderBloc() : super(PlaceBidInitial()) {
    on<PlaceOrderSetValueEvent>((event, emit) async {
      emit(PlaceOrderSetValue(Order()));
    });
    on<PlaceOrderRequestEvent>((event, emit) async {
      try {
        emit(PlaceOrderRequest());
        await locator
            .get<GRCPRepository>()
            .placeBidRequest(event.userId, event.order);
      } catch (error) {
        print(error.toString());
      }
    });
  }
}
