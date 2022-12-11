import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:qoin_test/core/assets/app_asset.dart';
import 'package:qoin_test/module/dashboard/widget/last_update_tag.dart';

class DashboardCurrentWeather extends StatelessWidget {
  final String location;
  final double temperature;
  final String? weather;
  final String iconUrl;
  final DateTime? lastUpdate;
  final double rainChance;
  final int humdity;
  final double windSpeed;
  final bool loading;
  const DashboardCurrentWeather(
      {Key? key,
      required this.location,
      this.temperature = 0,
      this.weather,
      this.lastUpdate,
      this.rainChance = 0,
      this.humdity = 0,
      this.windSpeed = 0,
      required this.iconUrl,
      this.loading = false})
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
        aspectRatio: width / (height * 0.75),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: (width * 0.9) / (height * 0.75),
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
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: loading
                                  ? SizedBox(
                                      height: height * 0.35,
                                      width: height * 0.35,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : Image.network(
                                      iconUrl,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              SizedBox(
                                        height: height * 0.35,
                                        width: height * 0.35,
                                        child: const Center(
                                          child: Icon(
                                            Icons.broken_image,
                                          ),
                                        ),
                                      ),
                                      height: height * 0.35,
                                      width: height * 0.35,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: IconButton(
                                                splashRadius: 24,
                                                splashColor: Colors.white
                                                    .withOpacity(0.5),
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
                                                  SvgPicture.asset(
                                                      AppAsset.location),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    child: Text(
                                                      location,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: IconButton(
                                                splashRadius: 24,
                                                splashColor: Colors.white
                                                    .withOpacity(0.5),
                                                onPressed: () {},
                                                icon:
                                                    const Icon(Icons.more_vert),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                        visible: lastUpdate != null,
                                        child: LastUpdateTag(
                                            date:
                                                lastUpdate ?? DateTime.now())),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            temperature.round().toString(),
                                            style: const TextStyle(
                                                fontSize: 90,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Text(
                                          '°',
                                          style: TextStyle(
                                              fontSize: 50,
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                    Text(loading ? 'Loading...' : weather ?? '',
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800)),
                                    Text(
                                      'Today, ${DateFormat('dd MMMM').format(DateTime.now())}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white.withOpacity(0.5)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: height * 0.02),
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset(
                                                  AppAsset.droplet),
                                              Text('$humdity%'),
                                              Text(
                                                'Humidity',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset(
                                                  AppAsset.rainClound),
                                              Text(
                                                  '${(rainChance * 100).round()}%'),
                                              Text(
                                                'Chance of rain',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
