import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari barang/jasa',
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
