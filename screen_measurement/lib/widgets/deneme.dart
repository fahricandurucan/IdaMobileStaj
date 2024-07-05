// import 'package:flutter/material.dart';
// import 'package:mobx/mobx.dart';

// part 'font_size_store.g.dart';

// class FontSizeStore = _FontSizeStore with _$FontSizeStore;

// abstract class _FontSizeStore with Store {
//   @observable
//   double textSize = 16.0;

//   @observable
//   double sliderValue = 1.0;

//   @observable
//   double textScaleFactor = 1.0;

//   @observable
//   double rectWidth = 0.0;

//   @observable
//   double rectHeight = 0.0;

//   @action
//   void setTextSize(double newSize) {
//     textSize = newSize;
//   }

//   @action
//   void setSliderValue(double value) {
//     sliderValue = value;
//   }

//   @action
//   void setTextScaleFactor(double factor) {
//     textScaleFactor = factor;
//   }

//   @action
//   void setRectSize(double width, double height) {
//     rectWidth = width;
//     rectHeight = height;
//   }
// }

// class HomePage extends StatelessWidget {
//   final FontSizeStore fontSizeStore = FontSizeStore();
//   final double cardWidth = 85.60; // Kredi kartı genişliği (mm)
//   final double cardHeight = 53.98;

//   HomePage({super.key}); // Kredi kartı yüksekliği (mm)

//   void _setDefaultSize(BuildContext context) {
//     final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//     final double dpi = 80.0 * devicePixelRatio; // 80.0 dpi varsayılan olarak alındı
//     double rectWidth = cardWidth / 25.4 * dpi; // cardWidth mm cinsinden
//     double rectHeight = cardHeight / 25.4 * dpi; // cardHeight mm cinsinden
//     fontSizeStore.setRectSize(rectWidth, rectHeight);
//   }

//   void _updateRectSize(BuildContext context) {
//     final double adjustedScale = 1.0 + ((fontSizeStore.sliderValue - 1.0) * 0.2);
//     final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//     final double dpi = 80.0 * devicePixelRatio;
//     double rectWidth = cardWidth / 25.4 * dpi * adjustedScale;
//     double rectHeight = cardHeight / 25.4 * dpi * adjustedScale;
//     fontSizeStore.setRectSize(rectWidth, rectHeight);
//   }

//   double calculateTextSize(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double cardWidthInPixels = fontSizeStore.rectWidth;
//     double myRatio = screenWidth / cardWidthInPixels;
//     double newTextSize = 16.0 * myRatio * fontSizeStore.textScaleFactor;
//     return newTextSize;
//   }

//   @override
//   Widget build(BuildContext context) {
//     _setDefaultSize(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Metin Boyutu Ölçeklendirme'),
//       ),
//       body: MediaQuery(
//         data: MediaQuery.of(context).copyWith(
//           textScaler: TextScaler.linear(fontSizeStore.textScaleFactor),
//         ),
//         child: Container(
//           constraints: const BoxConstraints.expand(),
//           color: const Color.fromRGBO(76, 175, 80, 1),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Observer(
//                 builder: (_) {
//                   _updateRectSize(context);
//                   return Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.all(12),
//                         width: fontSizeStore.rectWidth,
//                         height: fontSizeStore.rectHeight,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Kredi Kartı\n${(cardWidth / 10).toStringAsFixed(2)} cm x ${(cardHeight / 10).toStringAsFixed(2)} cm',
//                             style: TextStyle(fontSize: fontSizeStore.textSize),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           width: 20,
//                           height: 20,
//                           decoration: const BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 color: Colors.blue,
//                               ),
//                               right: BorderSide(color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 0,
//                         left: 0,
//                         child: Container(
//                           width: 20,
//                           height: 20,
//                           decoration: const BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                 color: Colors.blue,
//                               ),
//                               left: BorderSide(color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         child: Container(
//                           width: 20,
//                           height: 20,
//                           decoration: const BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 color: Colors.blue,
//                               ),
//                               left: BorderSide(color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 0,
//                         right: 0,
//                         child: Container(
//                           width: 20,
//                           height: 20,
//                           decoration: const BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                 color: Colors.blue,
//                               ),
//                               right: BorderSide(color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               _calibrationButton(context),
//               const SizedBox(height: 20),
//               _sliderWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _sliderWidget() {
//     return Observer(
//       builder: (_) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue,
//             ),
//             child: IconButton(
//               onPressed: () {
//                 fontSizeStore.setSliderValue((fontSizeStore.sliderValue - 0.5).clamp(1.0, 5.0));
//               },
//               icon: const Icon(Icons.remove),
//               color: Colors.white,
//             ),
//           ),
//           SliderTheme(
//             data: const SliderThemeData(
//               trackHeight: 12.0,
//               trackShape: RoundedRectSliderTrackShape(),
//               thumbShape: RoundSliderThumbShape(
//                 enabledThumbRadius: 12.0,
//               ),
//               overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
//               tickMarkShape: RoundSliderTickMarkShape(),
//             ),
//             child: Slider(
//               value: fontSizeStore.sliderValue,
//               min: 1.0,
//               max: 5.0,
//               divisions: 8,
//               label: fontSizeStore.sliderValue.toString(),
//               onChanged: (value) {
//                 fontSizeStore.setSliderValue(value);
//               },
//             ),
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue,
//             ),
//             child: IconButton(
//               onPressed: () {
//                 fontSizeStore.setSliderValue((fontSizeStore.sliderValue + 0.5).clamp(1.0, 5.0));
//               },
//               icon: const Icon(Icons.add),
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _calibrationButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         double newTextSize = calculateTextSize(context);
//         fontSizeStore.setTextSize(newTextSize);
//       },
//       child: const Text('Kalibre Et'),
//     );
//   }
// }
