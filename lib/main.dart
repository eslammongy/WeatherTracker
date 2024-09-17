import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For weather icons

void main() {
  runApp(const MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text("Egypt"),
            Text("Cairo", style: TextStyle(fontSize: 16)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? FontAwesomeIcons.solidMoon
                : FontAwesomeIcons.solidSun),
            onPressed: toggleTheme,
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Weather Icon, Temp, and Date
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent.withOpacity(0.2),
              ),
              child: const Column(
                children: [
                  Icon(FontAwesomeIcons.cloudSun, size: 64), // Weather Icon
                  SizedBox(height: 10),
                  Text('24°C',
                      style: TextStyle(
                          fontSize: 48, fontWeight: FontWeight.bold)), // Temp
                  SizedBox(height: 5),
                  Text('Sept 17, 2024', style: TextStyle(fontSize: 20)), // Date
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Grid for other weather data
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  // Sunrise Info
                  InfoCard(
                    icon: FontAwesomeIcons.solidSun,
                    title: 'Sunrise',
                    value: '06:00 AM',
                  ),
                  // Wind Speed Info
                  InfoCard(
                    icon: FontAwesomeIcons.wind,
                    title: 'Wind Speed',
                    value: '15 km/h',
                  ),
                  // Sunset Info
                  InfoCard(
                    icon: FontAwesomeIcons.solidMoon,
                    title: 'Sunset',
                    value: '06:45 PM',
                  ),
                  // Humidity Info
                  InfoCard(
                    icon: FontAwesomeIcons.droplet,
                    title: 'Humidity',
                    value: '65%',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
