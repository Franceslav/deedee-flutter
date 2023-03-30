import 'package:deedee/model/order.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/place_order/bloc/place_order_bloc.dart';
import 'package:deedee/ui/place_order/order_text_form_fields.dart';
import 'package:deedee/ui/place_order/place_order_popover.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SocialNetworkScreen extends StatefulWidget {
  const SocialNetworkScreen({Key? key}) : super(key: key);

  @override
  State<SocialNetworkScreen> createState() => _SocialNetworkScreenState();
}

class _SocialNetworkScreenState extends State<SocialNetworkScreen> {
  final List<Widget> _contactFieldList = [];
  final PanelController _controller = PanelController();
  final order = Order();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final locale = AppLocalizations.of(context)!;

    return BlocProvider<PlaceOrderBloc>(
      create: (context) => PlaceOrderBloc(),
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: 'Контакты',
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: [
            BlocConsumer<PlaceOrderBloc, PlaceOrderState>(
              listener: (context, state) {
                if (state is PlaceOrderRequest) {
                  showSnackBar(
                      context, locale.orderSent);
                }

              },
              buildWhen: (old, current) =>
                  current is PlaceOrderFailureState && old != current,
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AnimatedContainer(
                            alignment: Alignment.center,
                            height: _contactFieldList.length * 100 + 70,
                            duration: const Duration(milliseconds: 100),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            locale
                                                .contactInformation,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge,
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                const PlaceOrderPopover(),
                                          ).then(
                                            (value) {
                                              setState(() {
                                                _contactFieldList.add(
                                                  OrderTextFormField(
                                                    index: value,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        order.phone = value;
                                                      });
                                                    },
                                                  ),
                                                );
                                              });
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  _contactFieldList.isEmpty
                                      ? const SizedBox.shrink()
                                      : Column(children: _contactFieldList),
                                ],
                              ),
                            ),
                          ),
                          DeeDeeButton(
                            onPressed: _contactFieldList.isEmpty ? null : () {},
                            gradientButton: true,
                            title: locale.safe,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
