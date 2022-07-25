import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'my_todo_app.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String? _timeString;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
    DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(_createRoute());
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/do it 2.png',
                  )
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 60,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.blueGrey,
                              ),
                            ),
                            const Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 60,
                                color: Colors.yellow
                                // color: Color(0xff72db7b),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(_timeString.toString(),style: const TextStyle(fontSize: 25),),
                      ],
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.all(20),
                    //   child: Stack(
                    //     alignment: Alignment.center,
                    //     children: <Widget>[
                    //       Text(
                    //         'It\'s time to do something',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           fontSize: 30,
                    //           foreground: Paint()
                    //             ..style = PaintingStyle.stroke
                    //             ..strokeWidth = 2
                    //             ..color = Colors.blueGrey,
                    //         ),
                    //       ),
                    //       const Text(
                    //         'It\'s time to do something',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           fontSize: 30,
                    //           color: Colors.yellow
                    //           // color: Color(0xff72db7b),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MyTodoApp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// return Scaffold(
// body: SafeArea(
// child: Container(
// width: double.infinity,
// color: Colors.white,
// child: Container(
// height: MediaQuery.of(context).size.height,
// decoration: const BoxDecoration(
// image: DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage(
// 'images/sakura.jpg',
// )
// )
// ),
// child: Padding(
// padding: const EdgeInsets.only(top: 100, bottom: 30),
// child:
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(
// children: [
// Stack(
// children: <Widget>[
// // Stroked text as border.
// Text(
// 'Welcome!',
// style: TextStyle(
// fontSize: 60,
// foreground: Paint()
// ..style = PaintingStyle.stroke
// ..strokeWidth = 4
// ..color = Colors.red[700]!,
// ),
// ),
// // Solid text as fill.
// const Text(
// 'Welcome!',
// style: TextStyle(
// fontSize: 60,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ],
// ),
// Container(
// width: double.infinity,
// padding: const EdgeInsets.all(20),
// child: TextButton(
// onPressed: () {},
// child: Stack(
// children: <Widget>[
// // Stroked text as border.
// Text(
// 'Tap to go to your todo\'s',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 30,
// foreground: Paint()
// ..style = PaintingStyle.stroke
// ..strokeWidth = 1
// ..color = Colors.grey[700]!,
// ),
// ),
// // Solid text as fill.
// const Text(
// 'Tap to go to your todo\'s',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 30,
// color: Colors.blueGrey,
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// ),
// );
