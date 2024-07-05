import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:screen_measurement2/mobx/counter_model.dart';
import 'package:screen_measurement2/style/app_Style.dart';

class Deneme extends StatelessWidget {
  Deneme({super.key});

  final counterModel = CounterModel();
  @override
  Widget build(BuildContext context) {
    counterModel.setDefaultSize(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metin Boyutu Ölçeklendirme'),
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
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
              _sliderWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sliderWidget(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
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
                  counterModel.setSlider3(context);
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
                value: counterModel.sliderValue,
                min: 1.0,
                max: 3.0,
                divisions: 4,
                label: counterModel.sliderValue.toString(),
                onChanged: (value) {
                  counterModel.setSlider2(context, value);
                  // setState(() {
                  //   _sliderValue = value;
                  //   _updateRectSize(_sliderValue);
                  //   _textSize = calculateTextSize(context);
                  // });
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
                  counterModel.setSlider(context);
                  // setState(() {
                  //   _sliderValue = (_sliderValue + 0.5).clamp(1.0, 3.0);
                  //   _updateRectSize(_sliderValue);
                  //   _textSize = calculateTextSize(context);
                  // });
                },
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _creditCardPlaceHolder() {
    return Expanded(
      child: Observer(
        builder: (_) => Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(24),
                width: counterModel.rectWidth,
                height: counterModel.rectHeight,
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
                          style: TextStyle(fontSize: counterModel.textSize),
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
      ),
    );
  }
}
