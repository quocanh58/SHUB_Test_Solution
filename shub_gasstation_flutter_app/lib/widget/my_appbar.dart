import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    print("Heloo");
                  },
                  iconSize: 24,
                  icon: SvgPicture.asset("assets/icons/back-arrow.svg"),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Cập nhật",
                style: TextStyle(color: Colors.white), // Text color white
              ),
            ),
          ),
        )
      ],
    );
  }
}
