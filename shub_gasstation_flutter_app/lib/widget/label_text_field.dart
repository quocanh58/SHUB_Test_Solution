import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool isNumberField;
  final bool isDouble; // New parameter for decimal input

  const LabelTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.isNumberField = false,
    this.isDouble = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black.withOpacity(0.3)),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 14,
              child: Text(
                labelText,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextFormField(
              controller: controller,
              validator: validator,
              obscureText: obscureText,
              keyboardType: isDouble || isNumberField
                  ? TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
              inputFormatters: isDouble
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')), // Allow decimal numbers
                    ]
                  : isNumberField
                      ? <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly, // Allow only integers
                        ]
                      : null, // No input formatter for text fields
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
