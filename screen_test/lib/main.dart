import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenMeasurement(),
    );
  }
}

class ScreenMeasurement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ekran Ölçümü')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lütfen kredi kartınızı ekranın üzerine yerleştirin ve aşağıdaki çubuğu kartınızın genişliğiyle eşleşecek şekilde ayarlayın.',
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

class CreditCardSlider extends StatefulWidget {
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
          child: Center(
            child: Text(
              'Bu kutuyu kredi kartınızın genişliğiyle eşleştirin',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _saveScreenMeasurement(_sliderValue);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextSizeSettings()),
            );
          },
          child: Text('Ölçümü Kaydet ve Devam Et'),
        ),
      ],
    );
  }

  _saveScreenMeasurement(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setDouble('screenMeasurement', value);
  }
}

class TextSizeSettings extends StatefulWidget {
  @override
  _TextSizeSettingsState createState() => _TextSizeSettingsState();
}

class _TextSizeSettingsState extends State<TextSizeSettings> {
  double _textSize = 16.0;

  @override
  void initState() {
    super.initState();
    _loadTextSize();
  }

  _loadTextSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double screenMeasurement = prefs.getDouble('screenMeasurement') ?? 100.0;
    double scale = (screenMeasurement / 85.6).clamp(10.0 / 16.0, 30.0 / 16.0);
    setState(() {
      _textSize = (16.0 * scale)
          .clamp(10.0, 30.0); // Burada daha uygun bir ölçek faktörü hesaplayın
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Metin Boyutu Ayarları')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _textSize,
            min: 10.0,
            max: 30.0,
            divisions: 20,
            label: _textSize.toString(),
            onChanged: (double value) {
              setState(() {
                _textSize = value;
              });
              _saveTextSize(value);
            },
          ),
          Text(
            'Örnek Metin',
            style: TextStyle(fontSize: _textSize),
          ),
        ],
      ),
    );
  }

  _saveTextSize(double size) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('textSize', size);
  }
}
