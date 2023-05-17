import 'package:auto_route/auto_route.dart';
import 'package:deedee/model/order.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/place_order/place_order_popover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../services/helper.dart';
import '../global_widgets/dee_dee_menu_slider.dart';
import '../global_widgets/deedee_appbar.dart';
import '../global_widgets/profile_photo_with_badge.dart';
import '../routes/app_router.gr.dart';
import '../user_bloc/user_bloc.dart';
import 'bloc/place_order_bloc.dart';
import 'convenient_time_picker.dart';
import 'order_text_form_fields.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final PanelController _controller = PanelController();
  final _formKey = GlobalKey<FormState>();
  final order = Order();
  final List<Widget> _contactFieldList = [];
  final List<Widget> _times = [];

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return BlocProvider<PlaceOrderBloc>(
      create: (context) => PlaceOrderBloc(),
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.placeOrderPageTitle,
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: [
            BlocConsumer<PlaceOrderBloc, PlaceOrderState>(
              listener: (context, state) {
                if (state is PlaceOrderRequest) {
                  showSnackBar(
                      context, AppLocalizations.of(context)!.orderSent);
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
                                            AppLocalizations.of(context)!
                                                .contactInformation,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .orderProvideInformation,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
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
                          const Divider(thickness: 1),
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.time,
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _times.add(
                                        ConvenientTimePicker(
                                          order: order,
                                        ),
                                      );
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            height: _times.length * 205,
                            duration: const Duration(milliseconds: 300),
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(
                                  _times.length,
                                  (index) => Column(
                                    children: [
                                      _times[index],
                                      _times[index] == _times.last
                                          ? const SizedBox.shrink()
                                          : const Divider(height: 32)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(thickness: 1),
                          const SizedBox(height: 24),
                          Text(
                            AppLocalizations.of(context)!.additionalInformation,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.text,
                              filled: true,
                              fillColor: const Color.fromRGBO(242, 242, 242, 1),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            maxLength: 500,
                            onChanged: (value) {
                              setState(() {
                                order.information = value;
                              });
                            },
                          ),
                          DeeDeeButton(
                            onPressed: _contactFieldList.isEmpty
                                ? null
                                : () {
                                    context
                                        .read<PlaceOrderBloc>()
                                        .add(PlaceOrderRequestEvent(
                                          userId: user.userId,
                                          order: order,
                                        ));
                                    context.router
                                        .replace(const HomeScreenRoute());
                                  },
                            gradientButton: true,
                            title: AppLocalizations.of(context)!.save,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            DeeDeeMenuSlider(
              context,
              controller: _controller,
              user: user,
            ),
          ],
        ),
      ),
    );
  }
}
