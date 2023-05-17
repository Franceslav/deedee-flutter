import 'package:deedee/ui/page/account/business_bloc/business_bloc.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountBusinessPage extends StatelessWidget {
  const AccountBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: const AccountInfoBusinessPage(),
    );
  }
}

class AccountInfoBusinessPage extends StatelessWidget {
  const AccountInfoBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccountInfoTitle(),
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.lightgrey,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                ),
                child: Text(
                  AppLocalizations.of(context)!.regToBecomeClient,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const BusinessRowInfoWidget()
          ],
        ),
      ),
    );
  }
}

class AccountInfoTitle extends StatelessWidget {
  const AccountInfoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale.deeDeeForBusiness,
            style: AppTextTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            locale.placeText,
            style: AppTextTheme.labelLarge,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class BusinessRowInfoWidget extends StatefulWidget {
  const BusinessRowInfoWidget({super.key});

  @override
  State<BusinessRowInfoWidget> createState() => _BusinessRowInfoWidgetState();
}

class _BusinessRowInfoWidgetState extends State<BusinessRowInfoWidget> {
  bool isChecked = false;
  bool isConnect = false;
  final _formKey = GlobalKey<FormState>();
  bool validateForm() {
    if (_formKey.currentState == null) {
      return false;
    }
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BusinessPageBloc();
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.blue;
      }
      return AppColors.fiolet;
    }

    return BlocProvider<BusinessPageBloc>(
      create: (_) => bloc,
      child: BlocConsumer<BusinessPageBloc, BusinessState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BusinessPageState) {
              isChecked = state.policyAccepted;
              isConnect = state.buttonConnectBusiness;
            }
            return Padding(
                padding: const EdgeInsets.all(13.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value)  {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name company';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.nameCompany,
                          labelText: AppLocalizations.of(context)!.nameCompany,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.homeChooseCity,
                          labelText:
                              AppLocalizations.of(context)!.homeChooseCity,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter contact information';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.contactInformation,
                          labelText:
                              AppLocalizations.of(context)!.contactInformation,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.phoneNumber,
                          labelText: AppLocalizations.of(context)!.phoneNumber,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.emailAddressTitle,
                          labelText:
                              AppLocalizations.of(context)!.emailAddressTitle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              AppLocalizations.of(context)!.agreePP,
                              style: AppTextTheme.bodyLarge,
                              softWrap: true,
                              maxLines: 2,
                            ),
                          ),
                          Checkbox(
                            checkColor: AppColors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: validateForm(),
                            onChanged: (bool? value) {
                              bloc.add(PolicyCheckedEvent(
                                  isChecked = value ?? false));
                            },
                          )
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                                disabledBackgroundColor: AppColors.grey)
                            .copyWith(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed:
                        validateForm() && state is BusinessPageState &&
                                state.policyAccepted
                            ? () {
                                if (isChecked) {
                                  state is BusinessConnectTapState &&
                                      state.buttonConnectBusiness;
                                }
                              }
                            : null,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.connect,
                            style: AppTextTheme.titleLarge.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }

}


