import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../constants/constants.dart';

class productcard extends StatelessWidget {
  const productcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Container(
        width: getProperWidht(149),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: getProperHeight(101),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image:AssetImage('assets/images/onboard1.png') ,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                    child: Text(
                      'Arcon Samsung 1.5 pk with asu',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: getProperHeight(1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 13),
                    child: Text(
                      'Rp.${1000000.00000}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox( height: getProperHeight(5.0)),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 13),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add to cart functionality
                        },
                        child: Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
