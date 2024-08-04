import 'package:flutter/material.dart';
import 'package:joistic_test/l10n/extensions.dart';
import 'package:joistic_test/src/gen/colors.gen.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.errorText,
    this.validator = TextFieldValidator.text,
    this.keyboardType = TextInputType.text,
    this.minLines,
    this.maxLines,
    this.maxLength,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final TextFieldValidator validator;
  final TextInputType keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        counterText: '',
        prefixIconConstraints: const BoxConstraints(maxHeight: 25),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 20,
        ),
        filled: true,
        fillColor: ColorName.textColor.withOpacity(0.1),
        hintText: hintText ?? 'Type anything',
        hintStyle: Theme.of(context).textTheme.titleSmall,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(14.0), // Adjust the radius as needed
          borderSide: const BorderSide(
            // Set the border color here
            width: 2.0, // Set the border width here
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: ColorName.textColor.withOpacity(0),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorName.textColor.withOpacity(0),
            width: 2.0,
          ),
        ),
      ),

      /* onChanged: (value) {
        controller.formKey.currentState?.validate();
      },*/
      validator: (value) {
        if (validator == TextFieldValidator.text) {
          if (value == null || value.isEmpty) {
            return errorText ?? 'Please enter some text';
          }
        } else if (validator == TextFieldValidator.email) {
          if (value == null || !value.isValidEmail()) {
            return errorText ?? 'Please enter valid email address';
          }
        } else if (validator == TextFieldValidator.password) {
          if (value == null || !value.isValidPassword()) {
            return errorText ?? 'Please enter valid password';
          }
        }
        return null;
      },
    );
  }
}

enum TextFieldValidator {
  text,
  email,
  password,
}