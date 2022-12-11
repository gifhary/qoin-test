import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  final String day;
  final String iconUrl;
  final String weather;
  final int dayTemp;
  final int minTemp;
  const DailyForecast(
      {Key? key,
      required this.day,
      required this.iconUrl,
      required this.weather,
      required this.dayTemp,
      required this.minTemp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        Row(
          children: [
            Image.network(
              iconUrl,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 46,
                width: 46,
                child: Center(
                  child: Icon(
                    Icons.broken_image,
                  ),
                ),
              ),
              height: 46,
              width: 46,
              fit: BoxFit.cover,
            ),
            Text(
              weather,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(text: '+$dayTemp°'),
              TextSpan(
                  text: ' +$minTemp°',
                  style: TextStyle(color: Colors.white.withOpacity(0.6))),
            ],
          ),
        ),
      ],
    );
  }
}
