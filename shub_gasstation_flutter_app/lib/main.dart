import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validation/form_validation.dart';
import 'package:shub_gasstation_flutter_app/components/dropdown/drop_down_item.dart';
import 'package:shub_gasstation_flutter_app/utils/message_util.dart';
import 'package:shub_gasstation_flutter_app/widget/label_date_time_field.dart';
import 'package:shub_gasstation_flutter_app/widget/label_text_field.dart';
import 'package:shub_gasstation_flutter_app/widget/my_appbar.dart';

import 'components/dropdown/drop_down_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the AppBar
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 3), // Offset in the y-direction
              ),
            ],
          ),
          child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0, // Remove default AppBar shadow
              toolbarHeight: MediaQuery.of(context).size.height * 0.15,
              leadingWidth: MediaQuery.of(context).size.width * 1,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              print("Trở về");
                            },
                            iconSize: 24,
                            icon:
                                SvgPicture.asset("assets/icons/back-arrow.svg"),
                          ),
                          const Text(
                            "Đóng",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Nhập giao dịch",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            MessageUtil.toast("Cập nhật thành công");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Cập nhật",
                          style: TextStyle(
                              color: Colors.white), // Text color white
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
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
      ),
    );
  }
}
