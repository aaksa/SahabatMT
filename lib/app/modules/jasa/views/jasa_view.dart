import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jasa_controller.dart';

class JasaView extends GetView<JasaController> {
  const JasaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JasaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'JasaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
