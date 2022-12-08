import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class LastUpdateTag extends StatelessWidget {
  final DateTime date;
  const LastUpdateTag({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.circle,
            color: Colors.yellow,
            size: 10,
          ),
          const SizedBox(width: 4),
          Text('Updated ${timeago.format(date)}')
        ],
      ),
    );
  }
}
