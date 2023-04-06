import 'package:flutter/material.dart';
import 'package:sahabatmt/app/constants/constants.dart';

class IconButton1 extends StatelessWidget {
  final Icon icon;
  final String title;

  const IconButton1({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        children: [
          SizedBox.fromSize(
            size: Size(56, 56), // button width and height
            child: ClipOval(
              child: Material(
                color: kBackgroundColor1, // button color
                child: InkWell(
                  splashColor: kPrimaryColor, // splash color
                  onTap: () {}, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      icon, // icon
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
            child: Text(
              title,
              style: TextStyle(color: Colors.black45),
            ),
          ), // text
        ],
      ),
    );
  }
}
