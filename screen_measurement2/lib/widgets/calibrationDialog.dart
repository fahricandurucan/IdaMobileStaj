// import 'package:flutter/material.dart';

// class CalibrationDialog extends StatefulWidget {
//   final Function(double) onCalibrationFinish;

//   const CalibrationDialog({super.key, required this.onCalibrationFinish});

//   @override
//   _CalibrationDialogState createState() => _CalibrationDialogState();
// }

// class _CalibrationDialogState extends State<CalibrationDialog> {
//   double rectWidth = 0.0;
//   double rectHeight = 0.0;
//   final double cardWidth = 85.60;
//   final double cardHeight = 53.98;
//   final double _minRectSize = 50.0;
//   double _sliderValue = 1.0; // Slider başlangıç değeri

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _setDefaultSize();
//   }

//   void _setDefaultSize() {
//     final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//     final double dpi = 80.0 * devicePixelRatio;
//     rectWidth = cardWidth / 25.4 * dpi;
//     rectHeight = cardHeight / 25.4 * dpi;
//   }

//   void _updateRectSize(double scale) {
//     final double adjustedScale = 1.0 + ((scale - 1.0) * 0.2);

//     final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//     final double dpi = 80.0 * devicePixelRatio;
//     rectWidth = cardWidth / 25.4 * dpi * adjustedScale;
//     rectHeight = cardHeight / 25.4 * dpi * adjustedScale;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Kredi Kartı ile Kalibrasyon Ayarı"),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text('Kredi kartınızı aşağıdaki kutuya hizalayın.'),
//             const SizedBox(height: 20),
//             GestureDetector(
//                 child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   width: rectWidth,
//                   height: rectHeight,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Kredi Kartı',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: -10,
//                   left: -10,
//                   child: Container(
//                     width: 20,
//                     height: 20,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Positioned(
//                   top: -5,
//                   right: -5,
//                   child: Container(
//                     width: 10,
//                     height: 10,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -5,
//                   left: -5,
//                   child: Container(
//                     width: 10,
//                     height: 10,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -5,
//                   right: -5,
//                   child: Container(
//                     width: 10,
//                     height: 10,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             )),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue,
//                   ),
//                   child: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         _sliderValue = (_sliderValue - 0.5).clamp(1.0, 5.0);
//                         _updateRectSize(_sliderValue);
//                       });
//                     },
//                     icon: const Icon(Icons.remove),
//                     color: Colors.white,
//                   ),
//                 ),
//                 SliderTheme(
//                   data: const SliderThemeData(
//                     trackHeight: 12.0,
//                     trackShape: RoundedRectSliderTrackShape(),
//                     thumbShape: RoundSliderThumbShape(
//                       enabledThumbRadius: 12.0,
//                     ),
//                     overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
//                     tickMarkShape: RoundSliderTickMarkShape(),
//                   ),
//                   child: Slider(
//                     value: _sliderValue,
//                     min: 1.0,
//                     max: 5.0,
//                     divisions: 8,
//                     label: _sliderValue.toString(),
//                     onChanged: (value) {
//                       setState(() {
//                         _sliderValue = value;
//                         _updateRectSize(_sliderValue);
//                       });
//                     },
//                   ),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue,
//                   ),
//                   child: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         _sliderValue = (_sliderValue + 0.5).clamp(1.0, 5.0);
//                         _updateRectSize(_sliderValue);
//                       });
//                     },
//                     icon: const Icon(Icons.add),
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 double newTextSize = calculateTextSize();
//                 widget.onCalibrationFinish(newTextSize);
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Kalibrasyonu Tamamla'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   double calculateTextSize() {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double cardWidthInPixels = rectWidth;
//     double myRatio = screenWidth / cardWidthInPixels;
//     double newTextSize = 16.0 * myRatio;
//     return newTextSize;
//   }
// }
