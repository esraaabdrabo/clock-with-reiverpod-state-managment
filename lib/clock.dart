import 'package:blockriverpod/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm:ss a');
    final dateFormat = DateFormat('EEEE, MMMM d, yyyy');

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _greetingMessage(DateTime.now()),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontFamily: 'RobotoMono',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Consumer(
            builder: (context, ref, child) {
              final DateTime currentTime = ref.watch(clockProvider);
              final String formattedTime = timeFormat.format(currentTime);
              final String formattedDate = dateFormat.format(currentTime);

              return Column(
                children: [
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  String _greetingMessage(DateTime currentTime) {
    final hour = currentTime.hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
