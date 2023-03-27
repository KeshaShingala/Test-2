import 'package:flutter/material.dart';

import '../../modal/modal_page.dart';


class detail_page extends StatefulWidget {
  const detail_page({Key? key}) : super(key: key);

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  @override
  Widget build(BuildContext context) {
    Data product = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
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
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pushNamed('coupon_page');
                  }
                    , icon: Icon(
                      Icons.crop_outlined,
                      color: Colors.white,
                    ),),
                  Text(
                    "coupon",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ],
            title: Text("Cart Page",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.purple.shade500,
          ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 400,
          width: double.infinity,
          child: Image.asset(
            product.image,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            product.name,
            style: TextStyle(
                color: Colors.purple.shade500,
                fontSize: 40,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.star,
              color: Colors.purple.shade800,
              size: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.star,
              color: Colors.purple.shade800,
              size: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.star,
              color: Colors.purple.shade800,
              size: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.star,
              color: Colors.purple.shade200,
              size: 25,
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('coupon_page');
              },
              child: Container(
                height: 30,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.crop_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "coupon",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "Lorem ipsum dolor sit amet,consetetur\nsading eilter,sed diam nanumy eirmod\ntempor.",
            style: TextStyle(color: Colors.purple.shade50, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Buy Now",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    ),

    backgroundColor: Colors.purple.shade100,
    );
  }
}
