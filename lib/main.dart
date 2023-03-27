import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/provider/data_provider.dart';
import 'package:test2/views/screens/coupon_page.dart';
import 'package:test2/views/screens/detail_page.dart';
import 'package:test2/views/screens/home_page.dart';
import 'package:test2/views/screens/secondpage.dart';
import 'package:test2/views/screens/splash_screens.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductProvider>(create: (context) => ProductProvider()),
          ],
           builder: (context, _){
             return  MaterialApp(
               debugShowCheckedModeBanner: false,
                 theme: ThemeData(
                     useMaterial3: true,
                   ),
               initialRoute: 'splash_screens',
               routes: {
                 '/': (context) => const home_page(),
                     'splash_screens': (context) => const splash_screens(),
                     'coupon_page': (context) => const coupon_page(),
                 'secondpage': (context) => const secondpage(),
                 'detail_page': (context)=> const detail_page(),
               },
             );
           },
         ),
  );
}
