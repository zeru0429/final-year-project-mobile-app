import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  late String selectedOption;
  late Function onChange;

  MyRadioButton(
      {Key? key, required this.onChange, required String selectedOption})
      : super(key: key);

  @override
  _MyRadioButtonState createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Read'),
              leading: Radio(
                value: 'read',
                groupValue: widget.selectedOption,
                onChanged: (value) {
                  setState(() {
                    widget.onChange(value.toString());
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text('Write'),
              leading: Radio(
                value: 'write',
                groupValue: widget.selectedOption,
                onChanged: (value) {
                  setState(() {
                    widget.onChange(value.toString());
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
