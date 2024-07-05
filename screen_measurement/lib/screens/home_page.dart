import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:screen_measurement2/style/app_Style.dart';

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
    final double dpi = 100.0 * devicePixelRatio;
    rectWidth = cardWidth / 25.4 * dpi;
    rectHeight = cardHeight / 25.4 * dpi;
  }

  void _updateRectSize(double scale) {
    final double adjustedScale = 1.0 + ((scale - 1.0) * 0.2);
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final double dpi = 100.0 * devicePixelRatio;
    rectWidth = cardWidth / 25.4 * dpi * adjustedScale;
    rectHeight = cardHeight / 25.4 * dpi * adjustedScale;
  }

  double calculateTextSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidthInPixels = rectWidth;
    double myRatio = screenWidth / cardWidthInPixels;
    double newTextSize = 16.0 * myRatio;

    if (kIsWeb) {
      // Tarayıcı metin boyutunu hesaba katarak bir oran hesapla
      double textScaleFactor = MediaQuery.of(context).textScaleFactor;
      if (textScaleFactor == 1.0) {
        newTextSize = 50.0;
      }
      if (textScaleFactor == 1.25) {
        newTextSize = 50.0;
      }
      if (textScaleFactor == 1.5) {
        newTextSize = 50.0;
      }
      print("text web = $textScaleFactor");
      // double baseTextScaleFactor = 1.0; // Normal metin boyutu
      // double scalingFactor = baseTextScaleFactor / textScaleFactor;

      // newTextSize = newTextSize * scalingFactor;
      print("Text size web = $newTextSize");
    }

    // if (kIsWeb) {
    //   newTextSize *= 0.5; // Web platformu için
    // }

    return newTextSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metin Boyutu Ölçeklendirme'),
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1),
        ),
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _creditCardPlaceHolder(),
                    // _calibrationButton(context),
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
              _sliderWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sliderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppStyles.primaryColor,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _sliderValue = (_sliderValue - 0.5).clamp(1.0, 3.0);
                  _updateRectSize(_sliderValue);
                  _textSize = calculateTextSize(context);
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
                thumbColor: Colors.white,
                activeTickMarkColor: Colors.white,
                activeTrackColor: Colors.white,
                valueIndicatorColor: Colors.white),
            child: Slider(
              value: _sliderValue,
              min: 1.0,
              max: 3.0,
              divisions: 4,
              label: _sliderValue.toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                  _updateRectSize(_sliderValue);
                  _textSize = calculateTextSize(context);
                });
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppStyles.primaryColor,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _sliderValue = (_sliderValue + 0.5).clamp(1.0, 3.0);
                  _updateRectSize(_sliderValue);
                  _textSize = calculateTextSize(context);
                });
              },
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _calibrationButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        double newTextSize = calculateTextSize(context);
        setState(() {
          _textSize = newTextSize;
        });
      },
      child: const Text('Kalibrasyonu Tamamla'),
    );
  }

  Widget _creditCardPlaceHolder() {
    return Expanded(
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(24),
              width: rectWidth,
              height: rectHeight,
              decoration: BoxDecoration(
                border: Border.all(color: AppStyles.primaryColor, width: 2),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kredi Kartı',
                        style: TextStyle(fontSize: _textSize),
                      ),
                      // Text(
                      //   'IdaMobile',
                      //   style: TextStyle(fontSize: _textSize),
                      // ),
                      // Text(
                      //   'CCCCCCCCCCCCCCCCCCCCC',
                      //   style: TextStyle(fontSize: _textSize),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppStyles.primaryColor, width: 2),
                    right: BorderSide(color: AppStyles.primaryColor, width: 2),
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
                    top: BorderSide(color: AppStyles.primaryColor, width: 2),
                    left: BorderSide(color: AppStyles.primaryColor, width: 2),
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
                    bottom: BorderSide(color: AppStyles.primaryColor, width: 2),
                    left: BorderSide(color: AppStyles.primaryColor, width: 2),
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
                    top: BorderSide(color: AppStyles.primaryColor, width: 2),
                    right: BorderSide(color: AppStyles.primaryColor, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
