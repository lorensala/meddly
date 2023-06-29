import 'package:flutter/material.dart';

class CalendarIndicator extends StatelessWidget {
  const CalendarIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Icon(Icons.arrow_drop_down),
    );
  }
}
