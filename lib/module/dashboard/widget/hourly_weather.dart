import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyWeather extends StatelessWidget {
  final double temperature;
  final String iconUrl;
  final DateTime time;
  final bool current;
  const HourlyWeather(
      {Key? key,
      this.temperature = 0,
      required this.iconUrl,
      required this.time,
      this.current = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 66 / 95,
      child: Container(
        padding: const EdgeInsets.only(top: 9, bottom: 13),
        decoration: BoxDecoration(
          gradient: current
              ? const LinearGradient(
                  colors: [
                    Color(0xFF82DAF4),
                    Color(0xFF207AF5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0])
              : null,
          border: Border.all(
            color: current ? const Color(0xFF82DAF4) : const Color(0xFF272727),
          ),
          borderRadius: BorderRadius.circular(27),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                iconUrl,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                    ),
                  ),
                ),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${temperature.round()}°',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  DateFormat('HH:mm').format(time),
                  style: TextStyle(
                    color: current ? Colors.white : const Color(0xFF687B92),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
