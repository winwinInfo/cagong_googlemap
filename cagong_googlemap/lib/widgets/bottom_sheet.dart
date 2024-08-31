import 'package:flutter/material.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';

class BottomSheetContent extends StatelessWidget {
  final String name;
  final String message;
  final String address;
  final String price;
  final String hoursWeekday;
  final String hoursWeekend;
  final String videoUrl;
  final List<Map<String, dynamic>> seatingInfo;
  final double? height;

  const BottomSheetContent({
    super.key,
    required this.name,
    required this.message,
    required this.address,
    required this.price,
    required this.hoursWeekday,
    required this.hoursWeekend,
    required this.videoUrl,
    required this.seatingInfo,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, // 배경색을 흰색으로 설정
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20)), // 상단 모서리를 둥글게 처리
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text("주소: $address", style: const TextStyle(fontSize: 14)),
                  Text("가격: $price", style: const TextStyle(fontSize: 14)),
                  Text("평일 이용 시간: $hoursWeekday",
                      style: const TextStyle(fontSize: 14)),
                  Text("주말 이용 시간: $hoursWeekend",
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  const Text("좌석 정보:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ...seatingInfo.map((seating) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Text(
                        "${seating['type']}석 - ${seating['count']}석 (콘센트: ${seating['power']})",
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("영상 링크 열기: $videoUrl");
                    },
                    child: const Text("영상 보기"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
