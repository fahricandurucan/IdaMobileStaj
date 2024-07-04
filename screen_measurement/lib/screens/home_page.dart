import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _textSize = 16.0;
  double rectWidth = 0.0;
  double rectHeight = 0.0;
  final double cardWidth = 85.60;
  final double cardHeight = 53.98;
  double _sliderValue = 1.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setDefaultSize();
  }

  void _setDefaultSize() {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final double dpi = 80.0 * devicePixelRatio;
    rectWidth = cardWidth / 25.4 * dpi;
    rectHeight = cardHeight / 25.4 * dpi;
  }

  void _updateRectSize(double scale) {
    final double adjustedScale = 1.0 + ((scale - 1.0) * 0.2);
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final double dpi = 80.0 * devicePixelRatio;
    rectWidth = cardWidth / 25.4 * dpi * adjustedScale;
    rectHeight = cardHeight / 25.4 * dpi * adjustedScale;
  }

  double calculateTextSize() {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidthInPixels = rectWidth;
    double myRatio = screenWidth / cardWidthInPixels;
    double newTextSize = 16.0 * myRatio;
    return newTextSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metin Boyutu Ölçeklendirme'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      width: rectWidth,
                      height: rectHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          'Kredi Kartı',
                          style: TextStyle(fontSize: _textSize),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue,
                        ),
                        right: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.blue,
                        ),
                        left: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue,
                        ),
                        left: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.blue,
                        ),
                        right: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _calibrationButton(),
            const SizedBox(height: 20),
            _sliderWidget(),
          ],
        ),
      ),
    );
  }

  Widget _sliderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                _sliderValue = (_sliderValue - 0.5).clamp(1.0, 5.0);
                _updateRectSize(_sliderValue);
              });
            },
            icon: const Icon(Icons.remove),
            color: Colors.white,
          ),
        ),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 12.0,
            trackShape: RoundedRectSliderTrackShape(),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 12.0,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            tickMarkShape: RoundSliderTickMarkShape(),
          ),
          child: Slider(
            value: _sliderValue,
            min: 1.0,
            max: 5.0,
            divisions: 8,
            label: _sliderValue.toString(),
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
                _updateRectSize(_sliderValue);
              });
            },
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                _sliderValue = (_sliderValue + 0.5).clamp(1.0, 5.0);
                _updateRectSize(_sliderValue);
              });
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _calibrationButton() {
    return ElevatedButton(
      onPressed: () {
        double newTextSize = calculateTextSize();
        setState(() {
          _textSize = newTextSize;
        });
      },
      child: const Text('Kalibrasyonu Tamamla'),
    );
  }
}
