import 'package:flutter/material.dart';

class splash_screens extends StatefulWidget {
  const splash_screens({Key? key}) : super(key: key);

  @override
  State<splash_screens> createState() => _splash_screensState();
}

class _splash_screensState extends State<splash_screens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.purple.shade200,
          Colors.purple.shade500
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Image.asset(
              "assets/images/shopping-cart.png",
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "    The Store of your \n dreams.you will find\n   here what you need",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed('/');
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "START SHOPPING",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
