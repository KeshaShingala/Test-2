import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/provider/data_provider.dart';

import '../../helper/coupon_helper.dart';
import '../../modal/modal_page.dart';

class coupon_page extends StatefulWidget {
  const coupon_page({Key? key}) : super(key: key);

  @override
  State<coupon_page> createState() => _coupon_pageState();
}

class _coupon_pageState extends State<coupon_page> {
  Future? getData;

  @override
  void initState() {
    getData = CouponDBHelper.couponDBHelper.fetchAllRecords();
    super.initState();
  }

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
        body: FutureBuilder(
          future: getData,
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            if (snapShot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Error : ${snapShot.error}"),
                ),
              );
            } else if (snapShot.hasData) {
              List<CouponDB> data = snapShot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) => Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    isThreeLine: true,
                    title: Row(
                      children: [
                        Text(
                          data[i].name,
                          style: TextStyle(color: Colors.purple.shade900,fontWeight: FontWeight.w600,fontSize: 25),
                        ),
                    Spacer(),
                        Text(
                          "${data[i].quantity}",
                          style: TextStyle(color: Colors.purple.shade900,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "Valid Until 01 Octomber 2023 ₹ ${data[i].price} ",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.purple.shade200),
                    ),
                    trailing: InkWell(
                      onTap: () async {
                        if (data[i].quantity > 0) {
                          CouponDBHelper.couponDBHelper
                              .updateRecord(id: i, quantity: data[i].quantity);
                          Provider.of<ProductProvider>(context).addDiscount(data: data[i].price, text: data[i].name);
                          await getData;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Coupon Apply Successfully"),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          await getData;
                        } else {
                          Provider.of<ProductProvider>(context).removeDiscount(data: 0, text: "");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Coupon is Not available"),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                        child: Text("Apply",style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.w800),))),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        backgroundColor: Colors.purple.shade100,
      ),
    );
  }
}

