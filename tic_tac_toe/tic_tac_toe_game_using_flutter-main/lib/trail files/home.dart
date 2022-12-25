import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
// import 'package:tic_tac_toe/grid.dart';
import 'package:tic_tac_toe/trail%20files/grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridWidget(),
    );
  }
}
