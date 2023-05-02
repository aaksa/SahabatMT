import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../configs/configs.dart';
import '../modules/widgets/appbarviews.dart';
// import 'package:google_fonts/google_fonts.dart';

//url endpoint
//for api
const String baseUrl = 'http://192.168.1.22:8000/api';

//for storage
const String baseUrl2 = 'http://192.168.1.22:8000';

const String baseUrl3 = 'http://192.168.1.22:8000/api/pay';

// For App Color
const Color kPrimaryColor = Color(0xFFE8505B);
const Color kPrimaryLightColor = Color(0xFFE46A73);
const Color kSecondaryColor = Color(0xFFB5B5B5);
const Color kBackgroundColor1 = Color(0xFFFFFFFF);
const Color kBackgroundColor2 = Color(0xFFE0E0E0);
const Color kAlert = Color(0xFFED6363);
const Color kSuccess = Color(0xFF28C76F);
const Color kcaraousel = Color(0xFFFFFEE1);

enum Kondisi { baru, bekas }

//For Text Color
const Color kPrimaryTextColor = Color(0xFF363636);
const Color kSubtitleTextColor = Color(0xFFBDBDBD);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle primaryTextStyle = GoogleFonts.sourceSansPro(
  color: kPrimaryTextColor,
);

// padding
double defaultPadding = getProperWidht(24);

String defaultimg = 'https://via.placeholder.com/300';

// better shadow
List<BoxShadow> softShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(-2, 2), // changes position of shadow
  )
];

ButtonStyle butt1 =
    ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryLightColor));
