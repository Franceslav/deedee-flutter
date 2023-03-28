import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/set_location_bloc.dart';

class SearchAddressScreen extends StatefulWidget {
  const SearchAddressScreen({super.key});

  @override
  State<SearchAddressScreen> createState() => _SearchAddressScreenState();
}

class _SearchAddressScreenState extends State<SearchAddressScreen> {
  bool _isLodaing = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetLocationBloc, SetLocationState>(
      bloc: BlocProvider.of<SetLocationBloc>(context),
      listener: (context, state) {
        if (state.isLoading) {
          _isLodaing = true;
        }
        if (!state.isLoading) {
          _isLodaing = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enterAddress,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                ),
                onChanged: (value) {
                  BlocProvider.of<SetLocationBloc>(context)
                      .add(SearchLocationByAddress(value));
                },
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black,
              height: 0,
            ),
            if (_isLodaing && state.addresses.isEmpty)
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              ),
            Expanded(
              child: ListView.separated(
                itemBuilder: ((context, index) {
                  final dataItem = state.addresses[index];
                  return ListTile(
                    title: Text(dataItem.address ?? 'Error'),
                    onTap: () {
                      Navigator.of(context).pop(
                        dataItem.location,
                      );
                    },
                  );
                }),
                itemCount: state.addresses.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
