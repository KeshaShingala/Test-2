import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:test2/helper/data_helper.dart';
import 'package:test2/modal/modal_page.dart';
import 'package:test2/res/data_res.dart';

import '../../provider/data_provider.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to this app",
          style: TextStyle(color: Colors.white),
        ),
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
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('coupon_page');
            },
            child: Icon(
              Icons.crop_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: Colors.purple.shade500,
      ),
      body:FutureBuilder(
        future: DataDBHelper.dataDBHelper.getAllRecode(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Error : ${snapShot.error}"),
              ),
            );
          } else if (snapShot.hasData) {
            List<DataDB> data = snapShot.data;
            return   ListView.builder(
            padding: EdgeInsets.all(10),
            physics: BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 4,
                child: ListTile(
                  isThreeLine: true,
                  onTap: () {
                    Navigator.pushNamed(context, "detail_page", arguments: data[1]);

                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(allData[i].image),
                  ),
                  title: Text(data[i].name),
                  subtitle: Text("Rs. ${data[i].price}"),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      Provider.of<ProductProvider>(context,listen: false).addProduct(food: Provider.of(context), quantity: i);
                    },
                  ),
                ),
              );
            },
          );


          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){},
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('secondpage');
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              Text(
                "${Provider.of<ProductProvider>(context).totalQuantity}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.purple.shade100,
    );
  }
}
