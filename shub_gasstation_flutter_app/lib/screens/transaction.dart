import 'package:flutter/material.dart';
import 'package:shub_gasstation_flutter_app/components/dropdown/drop_down_item.dart';
import 'package:shub_gasstation_flutter_app/components/dropdown/drop_down_menu.dart';
import 'package:shub_gasstation_flutter_app/widget/label_date_time_field.dart';
import 'package:shub_gasstation_flutter_app/widget/label_text_field.dart';
import 'package:form_validation/form_validation.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final formKey = GlobalKey<FormState>();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final revenueController = TextEditingController();
  final dateTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to changes in the price and quantity to update revenue
    quantityController.addListener(_calculateRevenue);
    priceController.addListener(_calculateRevenue);
  }

  @override
  void dispose() {
    quantityController.dispose();
    priceController.dispose();
    revenueController.dispose();
    super.dispose();
  }

  void _calculateRevenue() {
    double quantity = double.tryParse(quantityController.text) ?? 0;
    double price = double.tryParse(priceController.text) ?? 0;
    double revenue = quantity * price;

    revenueController.text = revenue.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              LabelDateTimeField(
                labelText: "Thời gian",
                controller: dateTimeController,
                validator: (value) {
                  final validator = Validator(
                    validators: [const RequiredValidator()],
                  );

                  return validator.validate(
                    label: 'Thời gian',
                    value: value,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              LabelTextField(
                labelText: "Số lượng",
                controller: quantityController,
                isNumberField: true,
                isDouble: true,
                validator: (value) {
                  final validator = Validator(
                    validators: [const RequiredValidator()],
                  );

                  return validator.validate(
                    label: 'Số lượng',
                    value: value,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              MyDropdownMenu(
                label: "Trụ",
                items: [
                  DropdownItem('1', '01'),
                  DropdownItem('2', '02'),
                  DropdownItem('3', '03'),
                ],
                validator: (value) {
                  final validator = Validator(
                    validators: [const RequiredValidator()],
                  );

                  return validator.validate(
                    label: 'Trụ',
                    value: value,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              LabelTextField(
                labelText: "Doanh thu",
                controller: revenueController,
                isNumberField: false, // Assuming you want this read-only
                obscureText: false,
                validator: (value) {
                  final validator = Validator(
                    validators: [const RequiredValidator()],
                  );

                  return validator.validate(
                    label: 'Doanh thu',
                    value: value,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              LabelTextField(
                labelText: "Đơn giá",
                controller: priceController,
                isNumberField: true,
                validator: (value) {
                  final validator = Validator(
                    validators: [const RequiredValidator()],
                  );

                  return validator.validate(
                    label: 'Đơn giá',
                    value: value,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
