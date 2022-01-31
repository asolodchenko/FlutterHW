import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherTwo());
}

class WeatherTwo extends StatelessWidget {
  const WeatherTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                top: false,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        'https://www.wallpapertip.com/wmimgs/25-252077_weather-wallpaper-iphone.jpg'),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Lviv",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 50),
                            ),
                            const Text(
                              "Mostly Cloudy",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 25),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: const Text(
                                "0°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 110,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            const Text(
                              "H: 1°  L: -2°",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 25),
                            )
                          ]),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(
                        thickness: 2.0,
                        color: Colors.white54,
                      ),
                      TimeList(),
                      const Divider(
                        thickness: 2.0,
                        color: Colors.white54,
                      ),
                      DayWeather(),
                    ],
                  ),
                ))));
  }
}

class TimeList extends StatelessWidget {
  TimeList({Key? key}) : super(key: key);

  final item = List<String>.generate(25, (i) => '$i');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Container(
              width: 50.0,
              height: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item[index],
                    style: const TextStyle(inherit: false, fontSize: 20),
                  ),
                  const Icon(
                    Icons.cloud,
                    color: Colors.white,
                  ),
                  const Text(
                    "12°",
                    style: TextStyle(inherit: false, fontSize: 20),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class DayWeather extends StatelessWidget {
  final List<String> weekIndex = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  final List<IconData> weekIcon = [
    Icons.ac_unit,
    Icons.cloud,
    Icons.ac_unit,
    Icons.ac_unit,
    Icons.ac_unit,
    Icons.ac_unit,
    Icons.ac_unit,
  ];
  final List<String> weekPersent = ["90", "10", "20", "80", "45", "65", "15"];
  final List<String> weekDayTemp = ["-9", "-1", "-2", "-8", "-4", "-6", "-1"];
  final List<String> weekNightTemp = [
    "-19",
    "-11",
    "-12",
    "-18",
    "-14",
    "-16",
    "-11"
  ];
  DayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weekIndex.length,
          itemBuilder: (contex, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                          // alignment: Alignment.centerLeft,
                          child: Text(weekIndex[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal))),
                    )),
                Expanded(
                    child: Icon(
                  weekIcon[index],
                  color: Colors.white70,
                )),
                Expanded(
                    child: Text("${weekPersent[index]}%",
                        style: const TextStyle(color: Colors.blue))),
                Expanded(
                    child: Text("${weekDayTemp[index]}%",
                        style: const TextStyle(color: Colors.white))),
                Expanded(
                    child: Text("${weekNightTemp[index]}%",
                        style: const TextStyle(color: Colors.white))),
              ],
            );
          }),
    );
  }
}
