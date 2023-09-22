import 'package:blockriverpod/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = StateNotifierProvider<ClockeViewModel, DateTime>(
        (ref) => ClockeViewModel());
    return Scaffold(
      body: Center(
          child: Consumer(
              builder: (context, ref, child) =>
                  Text(ref.watch(provider).toString()))),
    );
  }
}
