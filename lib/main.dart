import 'package:SwiftInvoice/pages/addData/provider/addDataProvider.dart';
import 'package:SwiftInvoice/pages/addData/view/addDataPage.dart';
import 'package:SwiftInvoice/pages/data/provider/dataProvider.dart';
import 'package:SwiftInvoice/pages/data/view/dataPage.dart';
import 'package:SwiftInvoice/pages/home/provider/homeProvider.dart';
import 'package:SwiftInvoice/pages/home/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String? path;
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddDataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/data': (context) => const DataPage(),
          '/add_data': (context) => const AddDataPage(),
        },
      ),
    ),
  );
}
