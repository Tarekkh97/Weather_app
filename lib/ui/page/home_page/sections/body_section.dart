import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/app/const.dart';
import 'package:weather_app/app/data/global/api_call.dart';
import 'package:weather_app/app/domain/global_controller.dart';
import 'package:weather_app/app/ui/widgets/big_text.dart';
import 'package:weather_app/app/ui/widgets/small_text.dart';

class BodySection extends StatefulWidget {
  const BodySection({super.key});

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  GlobalController ctrl = Get.put(GlobalController(), permanent: true);
  Map<String, dynamic> weatherData = {};
  Map<String, dynamic> weatherFiveData = {};
  @override
  void initState() {
    getDataForWeatherToday(lat: ctrl.getLat().value, lon: ctrl.getLon().value);
    getDataForWeatherFifeDay(
        lat: ctrl.getLat().value, lon: ctrl.getLon().value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return weatherData.isNotEmpty && weatherFiveData.isNotEmpty
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/weather/${weatherData['weather'][0]['icon']}.png',
                    height: 80,
                    width: 80,
                  ),
                  Container(height: 56, width: 1.5, color: Colors.grey),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BigText(
                        text:
                            '${(weatherData['main']['temp'] - 273.16).round().toInt()}°',
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: SmallText(
                            size: 14,
                            text:
                                '${weatherData['weather'][0]['description']}'),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFE3E9F8),
                        ),
                        child: Image.asset('assets/images/icons/windspeed.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SmallText(
                        text: '${weatherData['wind']['speed']} km',
                        color: Colors.black,
                        size: 14,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFE3E9F8),
                        ),
                        child: Image.asset('assets/images/icons/clouds.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SmallText(
                        text: '${weatherData['clouds']['all']} %',
                        size: 14,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFE3E9F8),
                        ),
                        child: Image.asset('assets/images/icons/humidity.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SmallText(
                        text: '${weatherData['main']['humidity']} %',
                        size: 14,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              BigText(
                text: 'Today',
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        width: 80,
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        padding: EdgeInsets.only(top: 10, bottom: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFE3E9F8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SmallText(
                              text:
                                  '${DateFormat.jm().format(DateTime.parse(weatherFiveData['list'][index]['dt_txt']))}',
                              size: 14,
                              color: Colors.black,
                            ),
                            Image.asset(
                              'assets/images/weather/${weatherFiveData['list'][index]['weather'][0]['icon']}.png',
                              height: 40,
                              width: 40,
                            ),
                            SmallText(
                              text:
                                  '${(weatherFiveData['list'][index]['main']['temp'] - 273.16).round()}°',
                              size: 16,
                              color: Colors.black,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 360,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFFE3E9F8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Next days',
                      size: 18,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: weatherFiveData['list'].length,
                        itemBuilder: (context, index) {
                          return DateFormat.H().format(DateTime.parse(
                                    weatherFiveData['list'][index]['dt_txt'],
                                  )) ==
                                  DateFormat.H().format(DateTime.parse(
                                    weatherFiveData['list'][0]['dt_txt'],
                                  ))
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SmallText(
                                            text:
                                                '${DateFormat.E().format(DateTime.parse(weatherFiveData['list'][index]['dt_txt']))}',
                                            size: 16,
                                            color: Colors.black,
                                            weight: FontWeight.bold,
                                          ),
                                          Image.asset(
                                            'assets/images/weather/${weatherFiveData['list'][index]['weather'][0]['icon']}.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          SmallText(
                                            text:
                                                '${(weatherFiveData['list'][index]['main']['temp_max'] - 273.16).round()}° / ${(weatherFiveData['list'][index]['main']['temp_min'] - 273.16).round()}',
                                            size: 18,
                                            color: Colors.black,
                                            weight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                )
                              : Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1.5,
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  BigText(
                    text: 'Custom level',
                    size: 18,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 180,
                    child: Column(
                      children: [
                        Center(
                          child: SleekCircularSlider(
                            min: 0,
                            max: 100,
                            initialValue:
                                weatherData['main']['humidity'].toDouble(),
                            appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(
                                handlerSize: 0,
                                trackWidth: 12,
                                progressBarWidth: 12,
                              ),
                              infoProperties: InfoProperties(
                                bottomLabelText: 'Humidity',
                                bottomLabelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  letterSpacing: 0.1,
                                  height: 1.5,
                                ),
                              ),
                              animationEnabled: true,
                              size: 140,
                              customColors: CustomSliderColors(
                                  trackColor: Colors.blue.withOpacity(0.2),
                                  progressBarColors: [
                                    Colors.blue,
                                    Colors.blue[400]!,
                                  ]),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SmallText(
                              text: 'Feel likes: 255.12',
                              size: 14,
                              height: 0.8,
                              color: Colors.grey,
                              weight: FontWeight.w400,
                            ),
                            SmallText(
                              text: 'UV index: 255.14',
                              size: 14,
                              height: 0.8,
                              color: Colors.grey,
                              weight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/clouds.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
  }

  getDataForWeatherFifeDay({required double lat, required double lon}) async {
    await ApiCall.getData(
      url: url2,
      query: {
        'lat': lat,
        'lon': lon,
        'appid': apiKey,
      },
    ).then((value) {
      setState(() {
        weatherFiveData = value.data;
      });
      print(value.data);
    });
  }

  getDataForWeatherToday({required double lat, required double lon}) async {
    await ApiCall.getData(
      url: url1,
      query: {
        'lat': lat,
        'lon': lon,
        'appid': apiKey,
      },
    ).then((value) {
      setState(() {
        weatherData = value.data;
      });
      print(value.data);
    });
  }
}
