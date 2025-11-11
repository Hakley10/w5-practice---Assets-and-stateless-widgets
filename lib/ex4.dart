import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const [
              WeatherCard(weather: Weather.cloudy),
              SizedBox(height: 16),
              WeatherCard(weather: Weather.sunnyCloudy),
              SizedBox(height: 16),
              WeatherCard(weather: Weather.sunny),
              SizedBox(height: 16),
              WeatherCard(weather: Weather.verySunny),
            ],
          ),
        ),
      ),
    );
  }
}

enum Weather {
  cloudy(
    title: 'Phnom Penh',
    maxTemp: 30.0,
    minTemp: 10.0,
    currentTemp: 12.2,
    image: 'assets/cloudy.png',
    gradient: [Color.fromARGB(255, 139, 104, 176), Color.fromARGB(255, 109, 70, 149)],
  ),
  sunnyCloudy(
    title: 'Paris',
    maxTemp: 40.0,
    minTemp: 10.0,
    currentTemp: 22.2,
    image: 'assets/sunnyCloudy.png',
    gradient: [Color.fromARGB(255, 88, 192, 169), Color.fromARGB(255, 108, 195, 179)],
  ),
  sunny(
    title: 'Rome',
    maxTemp: 45.0,
    minTemp: 10.0,
    currentTemp: 45.2,
    image: 'assets/sunny.png',
    gradient: [Color.fromARGB(255, 193, 81, 133), Color(0xFFFF5E62)],
  ),
  verySunny(
    title: 'Toulouse',
    maxTemp: 45.0,
    minTemp: 10.0,
    currentTemp: 45.2,
    image: 'assets/veryCloudy.png',
    gradient: [Color.fromARGB(255, 212, 164, 106), Color.fromARGB(255, 183, 136, 85)],
  );

  final String title;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String image;
  final List<Color> gradient;

  const Weather({
    required this.title,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.image,
    required this.gradient,
  });
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: weather.gradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(weather.image),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Min: ${weather.minTemp}°C\nMax: ${weather.maxTemp}°C',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),


            Text(
              '${weather.currentTemp}°C',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
