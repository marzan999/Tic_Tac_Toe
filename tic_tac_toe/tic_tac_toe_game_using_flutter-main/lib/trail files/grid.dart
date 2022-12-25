import 'package:flutter/material.dart';

import 'components.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  bool isXturn = false;
  List<List<String>> arr = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  clickEvent(int i, int j) {
    print(i);
    if (isXturn) {
      setState(() {
        arr[i][j] = 'X';
        isXturn = false;
      });
    } else {
      setState(() {
        arr[i][j] = 'O';
        isXturn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBox(
              name: arr[0][0],
              onTap: () {
                clickEvent(0, 0);
              },
              // onTap: () {
              //   setState(() {
              //     clickEvent(0, 0);
              //   });
              // },
            ),
            CustomBox(
              name: arr[0][1],
              onTap: () => clickEvent(0, 0),
              // onTap: () {
              //   setState(() {
              //     clickEvent(0, 1);
              //   });
              // },
            ),
            CustomBox(
              name: arr[0][2],
              onTap: () {},
              // onTap: () {
              //   setState(() {
              //     clickEvent(0, 2);
              //   });
              // },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBox(
              name: arr[1][0],
              onTap: () {},
              // onTap: () {
              //   setState(() {
              //     clickEvent(1, 0);
              //   });
              // },
            ),
            CustomBox(
              name: arr[1][1],
              onTap: () {},
              // onTap: () {
              //   setState(() {
              //     clickEvent(1, 1);
              //   });
              // },
            ),
            CustomBox(
              name: arr[1][2],
              onTap: () {},
              // onTap: () {
              //   setState(() {
              //     clickEvent(1, 2);
              //   });
              // },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBox(
              name: arr[2][0],
              onTap: () {},
              // onTap: () {
              //   setState(() {
              //     clickEvent(2, 0);
              //   });
              // },
            ),
            CustomBox(
              name: arr[2][1],
              onTap: () {},
              // onTap: () {
              //   setState(() {
              //     clickEvent(2, 1);
              //   });
              // },
            ),
            CustomBox(
              onTap: () {},
              name: arr[2][2],
              // onTap: () {
              //   setState(() {
              //     clickEvent(2, 2);
              //   });
              // },
            ),
          ],
        ),
      ],
    );
  }
}
