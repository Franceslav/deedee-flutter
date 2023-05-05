import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceWidget extends StatefulWidget {
  String price;
  final void Function(String) onPressed;

  PriceWidget({Key? key, required this.price, required this.onPressed})
      : super(key: key);

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  TextEditingController controller = TextEditingController();
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return change ? _changePrice() : _savePrice();
  }

  Widget _changePrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 240,
          height: 50,
          child: TextField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            style: TextStyle(fontSize: 42),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: controller,
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
            onPressed: () {
              setState(() {
                change = false;
                widget.price = controller.text;
                widget.onPressed(widget.price);
                controller.text = '';
              });
            },
            icon: const Icon(Icons.check))
      ],
    );
  }

  Widget _savePrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.price.toString(), style: const TextStyle(fontSize: 42)),
        const SizedBox(width: 10),
        IconButton(
            onPressed: () {
              setState(() {
                change = true;
              });
            },
            icon: const Icon(Icons.edit))
      ],
    );
  }
}
