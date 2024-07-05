import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'counter_model.g.dart';

class CounterModel = CounterModelBase with _$CounterModel;

abstract class CounterModelBase with Store {
  @observable
  double textSize = 16.0;
  @observable
  double rectWidth = 0.0;
  @observable
  double rectHeight = 0.0;
  final double cardWidth = 85.60;
  final double cardHeight = 53.98;
  @observable
  double sliderValue = 1.0;

  @action
  void setSlider(BuildContext context) {
    sliderValue = (sliderValue + 0.5).clamp(1.0, 3.0);
    updateRectSize(sliderValue, context);
    textSize = calculateTextSize(context);
  }

  @action
  void setSlider2(BuildContext context, value) {
    sliderValue = value;
    updateRectSize(sliderValue, context);
    textSize = calculateTextSize(context);
  }

  @action
  void setSlider3(BuildContext context) {
    sliderValue = (sliderValue - 0.5).clamp(1.0, 3.0);
    updateRectSize(sliderValue, context);
    textSize = calculateTextSize(context);
  }

  @action
  void setDefaultSize(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final double dpi = 100.0 * devicePixelRatio;
    rectWidth = cardWidth / 25.4 * dpi;
    rectHeight = cardHeight / 25.4 * dpi;
  }

  @action
  void updateRectSize(double scale, BuildContext context) {
    final double adjustedScale = 1.0 + ((scale - 1.0) * 0.2);
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final double dpi = 100.0 * devicePixelRatio;
    rectWidth = cardWidth / 25.4 * dpi * adjustedScale;
    rectHeight = cardHeight / 25.4 * dpi * adjustedScale;
  }

  @action
  double calculateTextSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidthInPixels = rectWidth;
    double myRatio = screenWidth / cardWidthInPixels;
    double newTextSize = 16.0 * myRatio;

    if (kIsWeb) {
      // Tarayıcı metin boyutunu hesaba katarak bir oran hesapla
      double textScaleFactor = MediaQuery.of(context).textScaleFactor;
      if (textScaleFactor == 1.0) {
        newTextSize = 42.0;
      }
      if (textScaleFactor == 1.25) {
        newTextSize = 42.0;
      }
      if (textScaleFactor == 1.5) {
        newTextSize = 48.0;
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

  @observable
  int counter = 0;

  @action
  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }
}
