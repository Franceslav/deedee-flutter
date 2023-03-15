import 'package:auto_route/auto_route.dart';
import 'package:deedee/model/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../global_widgets/profile_photo_with_badge.dart';
import '../global_widgets/deedee_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../routes/app_router.gr.dart';
import '../user_bloc/user_bloc.dart';
import 'bloc/place_order_bloc.dart';
import 'convenient_time_picker.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final PanelController _controller = PanelController();
  final _formKey = GlobalKey<FormState>();
  final order = Order();
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
        body: BlocConsumer<PlaceOrderBloc, PlaceOrderState>(
          listener: (context, state) {
            if (state is PlaceOrderRequest) {
              showSnackBar(context, AppLocalizations.of(context)!.orderSent);
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
                      Text(
                        AppLocalizations.of(context)!.contactInformation,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        AppLocalizations.of(context)!.orderProvideInformation,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.phone,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      orderTextFormField(
                        hint: '+375(29)888-88-88',
                        onChanged: (value) {
                          setState(() {
                            order.phone = value;
                          });
                        },
                      ),
                      Text(
                        AppLocalizations.of(context)!.instagram,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      orderTextFormField(
                        hint: '@Profile',
                        onChanged: (value) {
                          setState(() {
                            order.instagram = value;
                          });
                        },
                      ),
                      Text(
                        AppLocalizations.of(context)!.telegram,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      orderTextFormField(
                        hint: '@Deedee',
                        onChanged: (value) {
                          setState(() {
                            order.telegram = value;
                          });
                        },
                      ),
                      const Divider(thickness: 1),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.time,
                            style: Theme.of(context).textTheme.headlineLarge,
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
                      _times.isEmpty
                          ? const SizedBox.shrink()
                          : Column(
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
                      const SizedBox(height: 32),
                      const Divider(thickness: 1),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.additionalInformation,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 16),
                      orderTextFormField(
                        hint: AppLocalizations.of(context)!.text,
                        maxLength: 500,
                        onChanged: (value) {
                          setState(() {
                            order.information = value;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: order.phone != null && order.phone != '' ||
                                order.instagram != null &&
                                    order.instagram != '' ||
                                order.telegram != null && order.telegram != ''
                            ? () {
                                context
                                    .read<PlaceOrderBloc>()
                                    .add(PlaceOrderRequestEvent(
                                      userId: user.userId,
                                      order: order,
                                    ));
                                context.router.replace(const HomeScreenRoute());
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          disabledForegroundColor:
                              Colors.grey.withOpacity(0.38),
                          disabledBackgroundColor:
                              Colors.grey.withOpacity(0.12),
                        ),
                        child: Text(AppLocalizations.of(context)!.safe),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget orderTextFormField({
    int? maxLength,
    required String hint,
    required void Function(String?)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color.fromRGBO(242, 242, 242, 1),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
