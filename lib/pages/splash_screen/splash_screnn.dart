import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vogon_chat/app_router.dart';
import 'package:vogon_chat/rotas.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        nivelOpacidade = 1.0;
      });
      Timer(Duration(seconds: 2), (() {
        AppRouter.gotoPush(nomeRota: rotaHome);
      }));
    });
    super.initState();
  }

  var nivelOpacidade = 0.0;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 0.0),
          colors: [Color.fromARGB(255, 63, 140, 202), Colors.blue],
        )),
        child: Column(
          children: [
            Container(
              height: _size.height / 2 + 24,
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                opacity: nivelOpacidade,
                duration: Duration(seconds: 3),
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/7841/7841073.png',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            Container(
              height: _size.height / 2 - 24,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8),
              child: Text(
                'Vogon Chat',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
