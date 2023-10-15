import 'package:deedee/generated/deedee/api/service/payment_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/card_repository.dart';
import 'package:deedee/repository/payment_method_repository.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/add_card/card.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'bloc/card_bloc.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final PanelController _controller = PanelController();
  OutlineInputBorder? border;
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bloc = CardBloc(
      locator.get<CardRepository>(),
    );
    return BlocProvider<CardBloc>(
      create: (_) => bloc,
      child: BlocConsumer<CardBloc, CardState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UpdateCardState) {
            final cardModel = state.cardModel;
            String cardNumber = cardModel.cardNumber;
            String expiryDate = cardModel.expiryDate;
            String cardHolderName = cardModel.cardHolderName;
            String cvvCode = cardModel.cvvCode;
            return Scaffold(
              appBar: DeeDeeAppBar(
                title: locale.addCard,
                controller: _controller,
                child: ProfilePhotoWithBadge(canChangePhoto: false, radius: 20, fontSize: 20,),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    children: [
                      CardWidget(
                        isCvvFocused: isCvvFocused,
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        color: Colors.deepPurple,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CreditCardForm(
                                formKey: formKey,
                                obscureCvv: true,
                                obscureNumber: false,
                                cardNumber: cardNumber,
                                cvvCode: cvvCode,
                                isHolderNameVisible: true,
                                isCardNumberVisible: true,
                                isExpiryDateVisible: true,
                                cardHolderName: cardHolderName,
                                expiryDate: expiryDate,
                                themeColor: Colors.purple,
                                textColor: Colors.black,
                                cardNumberDecoration: InputDecoration(
                                  labelText: locale.cardNumber,
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                ),
                                expiryDateDecoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  labelText: locale.expiredDate,
                                  hintText: 'XX/XX',
                                ),
                                cvvCodeDecoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  labelText: 'CVV',
                                  hintText: 'XXX',
                                ),
                                cardHolderDecoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  labelText: locale.cardHolder,
                                ),
                                onCreditCardModelChange:
                                    (CreditCardModel? creditCardModel) {
                                  context.read<CardBloc>().add(
                                      CardModelChangedEvent(
                                          cardModel: creditCardModel));
                                }),
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            DeeDeeButton(
                                title: locale.addCard,
                                onPressed: validateForm()
                                    ? () {
                                        bloc.add(
                                          SaveCardDataEvent(
                                              cardModel: cardModel),
                                        );
                                        PaymentMethodRequestRepository()
                                            .addPaymentMethod(
                                          PaymentMethodRequest(),
                                          cardModel,
                                        );
                                        Navigator.pop(context);
                                      }
                                    : null,
                                gradientButton: true),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  bool validateForm() {
    if (formKey.currentState == null) {
      return false;
    }
    return formKey.currentState!.validate();
  }
}
