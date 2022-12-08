import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qoin_test/core/assets/app_asset.dart';
import 'package:qoin_test/module/dashboard/widget/last_update_tag.dart';

class DashboardCurrentWeather extends StatelessWidget {
  final String location;
  final int temperature;
  final String weather;
  final DateTime lastUpdate;
  final int rainChance;
  final int humdity;
  final int windSpeed;
  const DashboardCurrentWeather(
      {Key? key,
      required this.location,
      this.temperature = 0,
      required this.weather,
      required this.lastUpdate,
      this.rainChance = 0,
      this.humdity = 0,
      this.windSpeed = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        aspectRatio: 355 / 630,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 331 / 630,
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
                                        children: [
                                          SvgPicture.asset(AppAsset.location),
                                          const SizedBox(width: 5),
                                          Flexible(
                                            child: Text(
                                              location,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700),
                                            ),
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
                            LastUpdateTag(
                                date: DateTime.now()
                                    .subtract(const Duration(minutes: 100)))
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
