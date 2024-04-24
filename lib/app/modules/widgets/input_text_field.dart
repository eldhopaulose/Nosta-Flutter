import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textController;
  final String isValid;
  final Function validateText;
  final String textName;
  final bool isMaxLines;
  final bool isType;

  const InputTextField({
    super.key,
    required this.textController,
    required this.isValid,
    required this.validateText,
    required this.textName,
    required this.isMaxLines,
    required this.isType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: isMaxLines ? 20 : 1,
      controller: textController,
      keyboardType: isType ? TextInputType.number : null,
      onChanged: (value) {
        // controller.isValid.value = controller.validateText(value);
        validateText(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: textName,
        errorText: isValid == 'true' ? null : 'Invalid text',
      ),
    );
  }
}
