import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../configs/configs.dart';
import '../../../constants/constants.dart';

class CardCaraousel extends StatelessWidget {
  const CardCaraousel({
    Key? key,
    required this.img,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle, img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: getProperWidht(5),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kcaraousel
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: getProperWidht(12),
                  ),
                  Text(
                    subtitle,
                    style: primaryTextStyle.copyWith(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child:SvgPicture.asset(img),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
