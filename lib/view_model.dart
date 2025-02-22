import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockNotifier extends StateNotifier<DateTime> {
  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  ClockNotifier() : super(DateTime.now()) {
    //first thing will happen
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
  }
}

final clockProvider =
    StateNotifierProvider<ClockNotifier, DateTime>((ref) => ClockNotifier());
