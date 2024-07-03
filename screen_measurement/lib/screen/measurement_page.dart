import 'package:flutter/material.dart';
import 'package:screen_measurement/widget/credit_card_slider.dart';

class MeasurementPage extends StatelessWidget {
  const MeasurementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ekran Ölçümü"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'kredi kartınızı eşleyiniz.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CreditCardSlider(),
          ],
        ),
      ),
    );
  }
}
