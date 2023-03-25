import 'package:flutter/material.dart';
import 'package:test2/res/data_res.dart';
import 'package:test2/views/screens/secondpage.dart';

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
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        itemCount: allData.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 4,
            child: ListTile(
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => secondpage(
                          name: allData[i].Name,
                          price: allData[i].price,
                          image: allData[i].image),
                    ));
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(allData[i].image),
              ),
              title: Text("${allData[i].Name}"),
              subtitle: Text("Rs. ${allData[i].price}"),
              trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.purple,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.purple.shade100,
    );
  }
}
