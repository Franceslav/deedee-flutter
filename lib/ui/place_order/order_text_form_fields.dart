import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/contact.dart';
import '../../model/user.dart';
import '../user_bloc/user_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderTextFormField extends StatefulWidget {
  final int index;
  final void Function(String?)? onChanged;

  const OrderTextFormField({
    super.key,
    required this.index,
    this.onChanged,
  });

  @override
  State<OrderTextFormField> createState() => _OrderTextFormFieldState();
}

class _OrderTextFormFieldState extends State<OrderTextFormField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    var type = user.contacts![widget.index].type;
    _controller.text = user.contacts![widget.index].value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        if (type == ContactType.email)
          Text(
                       AppLocalizations.of(context)!.email,

            style: Theme.of(context).textTheme.displayLarge,
          ),
        if (type == ContactType.phone)
          Text(
            AppLocalizations.of(context)!.phone,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        if (type == ContactType.instagram)
          Text(
            AppLocalizations.of(context)!.instagram,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        if (type == ContactType.telegram)
          Text(
            AppLocalizations.of(context)!.telegram,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: _controller,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(242, 242, 242, 1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
