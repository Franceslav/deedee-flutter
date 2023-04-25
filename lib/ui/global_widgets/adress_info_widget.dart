import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';
import '../../repository/service_request_repository.dart';
import '../map_sliding_panel/bloc/map_sliding_panel_bloc.dart';
import '../theme/app_text_theme.dart';
import '../user_bloc/user_bloc.dart';
import 'outlined_button_widget.dart';

class AddressInfoWidget extends StatelessWidget {
  final Int64 selectedTagId;
  const AddressInfoWidget({
    super.key,
    required this.selectedTagId,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    final mapPanelBloc =
        MapSlidingPanelBloc(locator.get<ServiceRequestRepository>(), user);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //TODO implement data
        children: [
          const Text(
            'Адрес',
            style: AppTextTheme.bodyMedium,
          ),
          const SizedBox(height: 2),
          const Text(
            'ул.Калиновского д.235/4',
            style: AppTextTheme.bodyLarge,
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 2),
          OutlinedButtonWidget(
            onPressed: () {
              mapPanelBloc.add(MapSlidingPanelRequestCreate(selectedTagId));
            },
            text: 'Fake Request',
          ),
        ],
      ),
    );
  }
}
