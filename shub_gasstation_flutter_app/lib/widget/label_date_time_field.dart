import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LabelDateTimeField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const LabelDateTimeField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
  });

  @override
  State<LabelDateTimeField> createState() => _LabelDateTimeFieldState();
}

class _LabelDateTimeFieldState extends State<LabelDateTimeField> {
  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        String formattedDateTime =
            DateFormat('dd/MM/yyyy HH:mm:ss').format(selectedDateTime);
        widget.controller.text =
            formattedDateTime; // Set the formatted date and time
      }
    }
  }

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14,
                  child: Text(
                    widget.labelText,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  controller: widget.controller,
                  validator: widget.validator,
                  readOnly: true,
                  style: const TextStyle(fontSize: 12),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  onTap: () => _selectDateTime(context),
                ),
              ],
            ),
            Positioned(
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                iconSize: 20,
                onPressed: () => _selectDateTime(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
