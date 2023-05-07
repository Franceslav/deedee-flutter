import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/services/http_service.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/page/my_requests/bloc/my_request_bloc.dart';
import 'package:deedee/ui/request_screen/bloc/service_request_bloc.dart';
import 'package:deedee/ui/request_screen/request_expansion_tile.dart';
import 'package:deedee/ui/request_screen/request_price_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global_widgets/dee_dee_menu_slider.dart';

class RequestScreen extends StatefulWidget {
  final Int64 serviceRequestId;

  const RequestScreen({super.key, required this.serviceRequestId});

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
    final bloc = ServicePushRequestBloc(
        locator.get<ServiceRequestRepository>(), user, widget.serviceRequestId);

    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: locale.request,
          controller: _controller,
          child: const Icon(Icons.menu),
        ),
        body: BlocConsumer<ServicePushRequestBloc, ServicePushRequestState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is ServiceRequestErrorState) {
                showSnackBar(context, state.errorMessage);
              }
              if (state is AcceptServiceRequestState) {
                context.router.replace(const MyRequestScreenRoute());
              }
            },
            builder: (context, state) {
              if (state is ServiceRequestChangeState) {
                final serviceRequest = ServiceRequest(
                  createdBy: user.userId,
                  serviceRequestId: state.serviceRequest.serviceRequestId,
                  createdFor: state.serviceRequest.createdFor,
                  createdAt: state.serviceRequest.createdAt,
                  price: state.serviceRequest.price,
                  description: state.serviceRequest.description,
                );
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
                                      id: state.serviceRequest.createdFor));
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
                                          bloc.add(
                                            AcceptServiceRequestEvent(
                                              serviceRequest: serviceRequest
                                                ..status = ServiceRequest_Status
                                                    .CHANGED,
                                            ),
                                          );
                                          context.router.pop();
                                        },
                                      ),
                                    ),
                                  if (!state.changed &&
                                      state.serviceRequest.status ==
                                          ServiceRequest_Status.PENDING)
                                    Expanded(
                                      child: OutlinedButtonWidget(
                                        text: locale.accept,
                                        onPressed: () {
                                          context.router.pop();
                                          bloc.add(
                                            AcceptServiceRequestEvent(
                                              serviceRequest: serviceRequest
                                                ..status = ServiceRequest_Status
                                                    .ACCEPTED,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  if (state.serviceRequest.status ==
                                      ServiceRequest_Status.PENDING)
                                    const SizedBox(width: 16),
                                  Expanded(
                                    child: OutlinedButtonWidget(
                                      text: locale.decline,
                                      onPressed: () {
                                        context.router.pop();
                                        bloc.add(
                                          DeclineServiceRequestEvent(
                                            serviceRequest: serviceRequest
                                              ..status = ServiceRequest_Status
                                                  .DECLINED,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: OutlinedButtonWidget(
                                  text: locale.share,
                                  onPressed: () {
                                    Share.share(locator
                                        .get<HttpService>()
                                        .prepareRequestString(state
                                            .serviceRequest.serviceRequestId
                                            .toString()));
                                  },
                                ),
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}