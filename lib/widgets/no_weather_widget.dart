import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';


class NoWeatherWidget extends StatelessWidget {
   NoWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.blue[300]!,
              Colors.blue[50]!,
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_off,
                  color: Colors.white,
                ),
                const Text(
                  " not found location",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  color: Colors.white,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              "no weather",
              style: TextStyle(fontSize: 26),
            ),
            const Text(
              "search on your location",
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
