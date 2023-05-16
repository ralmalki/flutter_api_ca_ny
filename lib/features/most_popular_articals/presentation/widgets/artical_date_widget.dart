import 'package:flutter/material.dart';

class ArtiicalDateWidget extends StatelessWidget {
  const ArtiicalDateWidget({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month_outlined, size: 20),
        Text(date),
      ],
    );
  }
}