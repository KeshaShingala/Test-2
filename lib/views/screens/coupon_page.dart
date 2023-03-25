import 'package:flutter/material.dart';

class coupon_page extends StatefulWidget {
  const coupon_page({Key? key}) : super(key: key);

  @override
  State<coupon_page> createState() => _coupon_pageState();
}

class _coupon_pageState extends State<coupon_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            "My Coupon",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple.shade500,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
        backgroundColor: Colors.purple.shade500,
      ),
    );
  }
}
