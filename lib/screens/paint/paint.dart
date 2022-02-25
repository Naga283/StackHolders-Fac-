// import 'package:flutter/material.dart';
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow[100],
//       child: CustomPaint(
//         painter: MyCustomPainter(),
//       ),
//     );
//   }
// }
// // 1
// class MyCustomPainter extends CustomPainter {
//   // 2
//   @override
//   void paint(Canvas canvas, Size size) {
//   }

//   // 4
//   @override
//   bool shouldRepaint(MyCustomPainter delegate) {
//     return true;
//   }
// }
// @override

// @override
//   void paint(Canvas canvas, Size size) {
//     // 1
//     Paint paintMountains = Paint()
//       ..style = PaintingStyle.fill
//       ..color = Colors.brown;
//     // 2
//     Paint paintSun = Paint()
//       ..style = PaintingStyle.fill
//       ..color = Colors.deepOrangeAccent;

//     // 3
//     Path path = Path();
//     path.moveTo(0, 250);
//     path.lineTo(100, 200);
//     path.lineTo(150, 150);
//     path.lineTo(200, 50);
//     path.lineTo(250, 150);
//     path.lineTo(300, 200);
//     path.lineTo(size.width, 250);
//     path.lineTo(0, 250);
//     canvas.drawPath(path, paintMountains);

//     // 4
//     path = Path();
//     path.moveTo(100, 100);
//     path.addOval(Rect.fromCircle(center: Offset(100, 100), radius: 25));
//     canvas.drawPath(path, paintSun);
//   }
// GestureDetector buildCurrentPath(BuildContext context) {
//   return GestureDetector(
//     onPanStart: onPanStart,
//     onPanUpdate: onPanUpdate,
//     onPanEnd: onPanEnd,
//     child: RepaintBoundary(
//       child: Container(
//         color: Colors.transparent,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         // CustomPaint widget will go here
//       ),
//     ),
//   );
// }
// void onPanStart(DragStartDetails details) {
//   print('User started drawing');
//   final box = context.findRenderObject() as RenderBox;
//   final point = box.globalToLocal(details.globalPosition);
//   print(point);
// }

// void onPanUpdate(DragUpdateDetails details) {
//   final box = context.findRenderObject() as RenderBox;
//   final point = box.globalToLocal(details.globalPosition);
//   final path = List.from(line.path)..add(point);
//   setState((){
//     line = DrawnLine(path, selectedColor, selectedWidth);
//   });
//   print(point);
// }

// void onPanEnd(DragEndDetails details) {
//   print('User ended drawing');
// }
// void onPanStart(DragStartDetails details) {
//   ...  
//   setState((){
//     line = DrawnLine([point], selectedColor, selectedWidth);
//   });
// }

// void onPanUpdate(DragUpdateDetails details) {
//   ...
  
// }

// void onPanEnd(DragEndDetails details) {
//   setState((){
//     print('User ended drawing');
//   });
// }
