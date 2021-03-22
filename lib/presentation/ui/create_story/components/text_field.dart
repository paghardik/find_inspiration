import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController editingController;
  final String label;
  final String errorMsg;
  const TextFieldWidget({
    Key key, this.editingController, this.label, this.errorMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          TextField(
            controller: editingController,
            style: TextStyle(
                fontSize: 20
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              errorText: errorMsg
            ),
          )
        ],
      ),
    );
  }
}