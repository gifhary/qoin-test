import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qoin_test/core/assets/app_asset.dart';

class TomorrowWeather extends StatelessWidget {
  final String iconUrl;
  final int dayTemp;
  final int minTemp;
  final String weather;
  final double windSpeed;
  final int humidity;
  final double rainChance;
  const TomorrowWeather(
      {Key? key,
      required this.dayTemp,
      required this.minTemp,
      required this.iconUrl,
      required this.weather,
      required this.windSpeed,
      required this.humidity,
      required this.rainChance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff053F8D).withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 80,
            offset: const Offset(0, 40),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: width / (height * 0.5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: (width * 0.9) / (height * 0.5),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff053F8D).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(53)),
              ),
            ),
            Column(
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xFF00CCFF),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 1.0]),
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(64)),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF78D1F5),
                              Color(0xFF126CF4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 1.0]),
                      ),
                      child: SafeArea(
                        child: Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: IconButton(
                                        splashRadius: 24,
                                        splashColor:
                                            Colors.white.withOpacity(0.5),
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                            AppAsset.fourDotsCircled),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.calendar_month_rounded),
                                          SizedBox(width: 5),
                                          Text(
                                            '7 Days',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: IconButton(
                                        splashRadius: 24,
                                        splashColor:
                                            Colors.white.withOpacity(0.5),
                                        onPressed: () {},
                                        icon: const Icon(Icons.more_vert),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          iconUrl,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const SizedBox(
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
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Tomorrow',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                                fontSize: 64,
                                                fontWeight: FontWeight.w900),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: dayTemp.toString()),
                                              TextSpan(
                                                  text: '/$minTemp°',
                                                  style: TextStyle(
                                                      fontSize: 36,
                                                      color: Colors.white
                                                          .withOpacity(0.6))),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.4,
                                          child: Text(
                                            weather,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                childAspectRatio: 2 / 1,
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset(AppAsset.wind),
                                      Text(
                                          '${(windSpeed * 3600 / 1000).toStringAsFixed(1)}kmph'),
                                      Text(
                                        'Wind',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SvgPicture.asset(AppAsset.droplet),
                                      Text('$humidity%'),
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SvgPicture.asset(AppAsset.rainClound),
                                      Text('${(rainChance * 100).round()}%'),
                                      Text(
                                        'Chance of rain',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 11),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
