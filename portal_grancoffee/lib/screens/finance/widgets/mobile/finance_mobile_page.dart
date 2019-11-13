

import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/finance/finance_bloc.dart';
import 'package:portal_grancoffee/screens/finance/widgets/mobile/widget/finance_mobile_item_list.dart';
import 'package:portal_grancoffee/models/finance/finance.dart';

class FinanceMobilePage extends StatefulWidget {
  @override
  _FinanceMobilePageState createState() => _FinanceMobilePageState();
}

class _FinanceMobilePageState extends State<FinanceMobilePage> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<List<Finance>>(
        stream: blocFinance.financeData,
        builder: (BuildContext context,
        AsyncSnapshot<List<Finance>> snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
        case ConnectionState.none:
          return Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor:
              AlwaysStoppedAnimation<Color>(Colors.grey),
              strokeWidth: 5,
            ),
          );
        default:
          if (snapshot.hasError)
            return Container();
          else
            return ListView.builder(
                padding: EdgeInsets.all(0.0),
                reverse: false,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return FinanceMobileItemList(snapshot.data[index]);
                });

      }});
  }
}
