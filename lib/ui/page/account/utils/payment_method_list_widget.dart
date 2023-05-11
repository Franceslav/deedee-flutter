import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/payment_method_repository.dart';
import 'package:deedee/ui/page/account/bloc/payment_method_slider_add_method_bloc.dart';
import 'package:deedee/ui/page/filter/filter_page_bloc.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//ServiceRequestRepository, PaymentMethodResponse, PaymentMethodRequest
class PaymentMethodListWidget extends StatefulWidget {
  const PaymentMethodListWidget({super.key});

  @override
  _PaymentMethodListWidgetState createState() =>
      _PaymentMethodListWidgetState();
}

class _PaymentMethodListWidgetState extends State<PaymentMethodListWidget> {
  final TextEditingController _controller = TextEditingController();
  late List<String> paymentMethods;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bloc = PaymentMethodSliderBloc(
      locator.get<PaymentMethodRequestRepository>(),
    );
    return BlocProvider<PaymentMethodSliderBloc>(
      create: (_) => bloc,
      child: BlocConsumer<PaymentMethodSliderBloc, PaymentMethodSliderState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is PaymentMethodInitializedState) {
            paymentMethods = state.listPaymentMethod;
          }
        },
        builder: (context, state) {
          if (state is PaymentMethodInitializedState) {
            //paymentMethods = state.listPaymentMethod;

            return Container(
              margin: const EdgeInsets.all(16.0),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.25,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      child: Container(
                        height: 5.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2.5)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: paymentMethods.length * 55,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print('Tap on PM detected');
                          },
                          child: ListTile(
                            leading: const Icon(Icons.payment_outlined),
                            title: Text(paymentMethods[index]),
                          ),
                        );
                      },
                      itemCount: paymentMethods.length,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            context.router.navigate(const PaymentScreenRoute());
                          },
                          child: ListTile(
                            leading: const Icon(Icons.add_circle),
                            title: Text(locale.addPayment),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            print(
                '//TODO Correct the error, arising during the initial of payment methods');
            return Container();
          }
        },
      ),
    );
  }
}
