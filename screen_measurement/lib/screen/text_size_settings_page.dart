import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextSizeSettings extends StatefulWidget {
  const TextSizeSettings({super.key});

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
    // Örneğin: kredi kartının genişliği 85.6 mm ve ölçülen genişlik 100 birim ise
    // metin boyutunu hesaplayabilirsiniz
    double scale = 85.6 / screenMeasurement;
    setState(() {
      _textSize = 16.0 * scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metin Boyutu Ayarları')),
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
