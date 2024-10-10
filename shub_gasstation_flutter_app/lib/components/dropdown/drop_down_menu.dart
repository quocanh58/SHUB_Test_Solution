import 'package:flutter/material.dart';
import 'drop_down_item.dart';

class MyDropdownMenu extends StatefulWidget {
  final String label;
  final List<DropdownItem> items;
  final String? Function(String?)? validator; // Thêm tham số validator

  const MyDropdownMenu({
    super.key,
    required this.items,
    this.label = 'Chọn một giá trị:',
    this.validator,
  });

  @override
  _MyDropdownMenuState createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black.withOpacity(0.3)),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 14,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DropdownButton<String>(
              value: selectedValue,
              hint: const Text(""), // Hiển thị gợi ý khi chưa có giá trị
              isExpanded: true,
              isDense: true,
              underline: const SizedBox(),
              items: widget.items.map((DropdownItem item) {
                return DropdownMenuItem<String>(
                  value: item.key,
                  child: Text(
                    item.value,
                    style:
                        const TextStyle(fontSize: 12), // Giảm kích thước font
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue; // Cập nhật giá trị được chọn
                });
                // Gọi validator khi thay đổi
                if (widget.validator != null) {
                  String? validationMessage = widget.validator!(newValue);
                  if (validationMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(validationMessage)),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
