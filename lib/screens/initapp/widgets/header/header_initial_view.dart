import 'package:flutter/material.dart';

import 'caroussel_top.dart';

class HeaderInitialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 300,width:  MediaQuery.of(context).size.width,child: CarrousselTop(),);
  }
}
