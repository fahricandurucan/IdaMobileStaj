import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/text_size_settings_page.dart';

class CreditCardSlider extends StatefulWidget {
  const CreditCardSlider({super.key});

  @override
  _CreditCardSliderState createState() => _CreditCardSliderState();
}

class _CreditCardSliderState extends State<CreditCardSlider> {
  double _sliderValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _sliderValue,
          min: 50.0,
          max: 200.0,
          divisions: 150,
          label: _sliderValue.toString(),
          onChanged: (double value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
        Container(
          width: _sliderValue,
          height: 50,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'kredi kart genişliğiyle eşleştir',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            _saveScreenMeasurement(_sliderValue);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TextSizeSettings()),
            );
          },
          child: const Text('Ölçümü Kaydet ve Devam Et'),
        ),
      ],
    );
  }

  _saveScreenMeasurement(double value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setDouble('screenMeasurement', value);
  }
}
