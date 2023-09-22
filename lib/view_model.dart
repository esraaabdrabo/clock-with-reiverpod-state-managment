import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockeViewModel extends StateNotifier<DateTime> {
  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  ClockeViewModel() : super(DateTime.now()) {
    //first thing will happen
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      state = DateTime.now();
    });
  }
}
