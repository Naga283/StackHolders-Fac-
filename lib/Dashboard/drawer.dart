// import 'package:drawer_swipe/drawer_swipe.dart';
// import 'package:flutter/material.dart';


// class DrawerM extends StatefulWidget {
//   @override
//   _DrawerMState createState() => _DrawerMState();
// }

// class _DrawerMState extends State<DrawerM> {
//   var drawerKey = GlobalKey<SwipeDrawerState>();


//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       // add this line so you can add your appBar in Body
//       extendBodyBehindAppBar: true,
//       body: SwipeDrawer(
//         radius: 20,
//         key: drawerKey,

//         hasClone: false,
//         bodyBackgroundPeekSize: 30,
//         backgroundColor: Colors.red,
//         // pass drawer widget
//         drawer: buildDrawer(),
//         // pass body widget
//         child: buildBody(),
//       ),
//     );
//   }

//   Widget buildDrawer() {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             title: Text('Title'),
//           ),
//           ListTile(
//             title: Text('Title'),
//           ),
//           ListTile(
//             title: Text('Title'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildBody() {
//     return Column(
//       children: [
//         // build your appBar
//         AppBar(
//           title: Text('AppBar title'),
//           leading: InkWell(
//               onTap: () {
//                 if (drawerKey.currentState!.isOpened()) {
//                   drawerKey.currentState!.closeDrawer();
//                 } else {
//                   drawerKey.currentState!.openDrawer();
//                 }
//               },
//               child: Icon(Icons.menu)),
//         ),
//        // build your screen body
//         Expanded(
//           child: Container(
//             color: Colors.white,
//             child: Center(
//               child: Text('Home Screen'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }