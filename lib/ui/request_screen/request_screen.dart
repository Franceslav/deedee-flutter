import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/page/my_requests/bloc/my_request_bloc.dart';
import 'package:deedee/ui/request_screen/bloc/request_bloc.dart';
import 'package:deedee/ui/request_screen/request_expansion_tile.dart';
import 'package:deedee/ui/request_screen/request_price_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global_widgets/dee_dee_menu_slider.dart';

class RequestScreen extends StatefulWidget {
  RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final PanelController _controller = PanelController();

  List<String> dateList = [
    '28.03.2023',
    '8.03.2023',
    '15.06.2024',
    '15.06.2025',
    '15.06.2026',
    '15.06.2027',
    '15.06.2028',
    '15.06.2029'
  ];

  List<String> timeList = [
    '8:00 - 20:00',
    '9:00 - 14:00',
    '12:00 - 22:00',
    '8:00 - 20:01',
    '9:00 - 14:02',
    '12:00 - 22:03'
  ];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final pushBloc =
        ServicePushRequestBloc(locator.get<ServiceRequestRepository>(), user);
    final serviceBloc =
        ServiceRequestBloc(locator.get<ServiceRequestRepository>(), user);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ServicePushRequestBloc>(
          create: (context) => pushBloc,
        ),
        BlocProvider<ServiceRequestBloc>(
          create: (context) => serviceBloc,
        ),
      ],
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: locale.request,
          controller: _controller,
          child: const Icon(Icons.menu),
        ),
        body: BlocConsumer<ServicePushRequestBloc, ServicePushRequestState>(
            bloc: pushBloc,
            listener: (context, state) {
              if (state is ServiceRequestErrorState) {
                showSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is ServiceRequestChangeState) {
                return SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 32),
                              PriceWidget(
                                price: state.serviceRequest.price.toString(),
                                onPressed: (value) {
                                  context.read<ServicePushRequestBloc>().add(
                                      ServiceRequestPriceChangeEvent(
                                          price: value));
                                },
                              ),
                              const SizedBox(height: 32),
                              DeeDeeRowInfoWidget(
                                icon: Image.asset(
                                    'assets/images/header_icon.png'),
                                mainText: const Text(
                                  'Заголовок',
                                  style: AppTextTheme.bodyLarge,
                                ),
                                secondaryText: const Text(
                                  'Дополнительный текст',
                                  style: AppTextTheme.bodyMedium,
                                ),
                                onTap: () {
                                  context.router.push(CustomerProfileRoute(
                                      id: state.serviceRequest.clientId));
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: DeeDeeDeviderWidget(),
                              ),
                              const Text('Описание',
                                  style: AppTextTheme.titleMedium),
                              const Text('Lorem ipsum',
                                  style: AppTextTheme.labelMedium),
                              const SizedBox(height: 48),
                              Text(locale.date,
                                  style: AppTextTheme.titleMedium),
                              const SizedBox(height: 6),
                              RequestExpansionTile(
                                data: dateList,
                                onTap: (value) {
                                  context.read<ServicePushRequestBloc>().add(
                                      ServiceRequestDateChangeEvent(
                                          date: value));
                                },
                              ),
                              const SizedBox(height: 16),
                              Text(locale.time,
                                  style: AppTextTheme.titleMedium),
                              const SizedBox(height: 6),
                              RequestExpansionTile(
                                data: timeList,
                                onTap: (value) {
                                  context.read<ServicePushRequestBloc>().add(
                                      ServiceRequestTimeChangeEvent(
                                          time: value));
                                },
                              ),
                              const SizedBox(height: 16),
                              const Text('Описание',
                                  style: AppTextTheme.titleMedium),
                              const SizedBox(height: 12),
                              const Text('Описание',
                                  style: AppTextTheme.titleMedium),
                              const SizedBox(height: 12),
                              const Text('Описание',
                                  style: AppTextTheme.titleMedium),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  if (state.changed)
                                    Expanded(
                                      child: OutlinedButtonWidget(
                                        text: locale.send,
                                        onPressed: () {
                                          BlocProvider.of<ServiceRequestBloc>(
                                                  context)
                                              .add(AcceptRequestEvent(
                                            userId: user.userId,
                                            request: ServiceRequest(
                                                requestId: state
                                                    .serviceRequest.requestId,
                                                clientId: state
                                                    .serviceRequest.clientId,
                                                status: ServiceRequest_Status
                                                    .CHANGED,
                                                dateOfRequest: state
                                                    .serviceRequest
                                                    .dateOfRequest,
                                                price:
                                                    state.serviceRequest.price,
                                                description: state
                                                    .serviceRequest
                                                    .description),
                                          ));
                                          context.router.pop();
                                        },
                                      ),
                                    ),
                                  if (!state.changed)
                                    Expanded(
                                      child: OutlinedButtonWidget(
                                        text: locale.accept,
                                        onPressed: () {
                                          BlocProvider.of<ServiceRequestBloc>(
                                                  context)
                                              .add(AcceptRequestEvent(
                                            userId: user.userId,
                                            request: ServiceRequest(
                                                requestId: state
                                                    .serviceRequest.requestId,
                                                clientId: state
                                                    .serviceRequest.clientId,
                                                status: ServiceRequest_Status
                                                    .ACCEPTED,
                                                dateOfRequest: state
                                                    .serviceRequest
                                                    .dateOfRequest,
                                                price:
                                                    state.serviceRequest.price,
                                                description: state
                                                    .serviceRequest
                                                    .description),
                                          ));
                                          context.router.pop();
                                        },
                                      ),
                                    ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: OutlinedButtonWidget(
                                      text: locale.share,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      DeeDeeMenuSlider(
                        context,
                        controller: _controller,
                        user: user,
                      ),
                    ],
                  ),
                );
              } else {
                return const Placeholder();
              }
            }),
      ),
    );
  }
}
