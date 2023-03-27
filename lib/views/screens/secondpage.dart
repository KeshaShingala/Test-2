import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/provider/data_provider.dart';

class secondpage extends StatefulWidget {
  const  secondpage({Key? key}) : super(key: key);
  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
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
        children: [
          SizedBox(height: 20,),
          Container(
            height: 449,
            width: double.infinity,
            child: ListView.builder(
                itemCount: Provider.of<ProductProvider>(context).addedProducts.length,
                itemBuilder: (context,i){
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Image.asset(Provider.of<ProductProvider>(context).addedProducts[i].image,height: 75,width: 75,),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              SizedBox(height: 20,),
                              Text("${Provider.of<ProductProvider>(context).addedProducts[i].name}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
                              Spacer(),
                              Container(
                                height: 45,
                                width: 163,
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 7,),
                                    IconButton(onPressed: (){
                                      Provider.of<ProductProvider>(context,
                                              listen: false).removeQuantity(data: Provider.of<ProductProvider>(context).addedProducts[i], index: i);
                                    }, icon:  Icon(Icons.remove,size: 30,color: Colors.white,),),
                                    SizedBox(width: 6,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text("${Provider.of<ProductProvider>(context).addedProducts[i].quantity}",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
                                    ),
                                    SizedBox(width: 6,),
                                    IconButton(onPressed: (){
                                      Provider.of<ProductProvider>(context).addQuantity(dataDB: Provider.of<ProductProvider>(context).addedProducts[i], index: i);
                                    }, icon:  Icon(Icons.add,size: 30,color: Colors.white,),),
                                    SizedBox(width: 7,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                          Spacer(),
                          Text("Rs.${Provider.of<ProductProvider>(context).addedProducts[i].price}",style: TextStyle(color: Colors.brown.shade800,fontWeight: FontWeight.w700,fontSize: 20),),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("Item Quantity:",style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.w600),),
                      Spacer(),
                      Text("${Provider.of<ProductProvider>(context).totalQuantity}",style: TextStyle(color: Colors.purple.shade900,fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(width: 20,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("Delivery Services:",style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.w600),),
                      Spacer(),
                      Text("Free",style: TextStyle(color: Colors.purple.shade900,fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(width: 20,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.purple.shade200,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("Total:",style: TextStyle(color: Colors.purple,fontSize: 25,fontWeight: FontWeight.w600),),
                      Spacer(),
                      Text("Rs. ${Provider.of<ProductProvider>(context).totalPrice}",style: TextStyle(color: Colors.purple.shade900,fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(width: 20,),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.purple
              ),
              child: Text("Order Now",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),

      backgroundColor: Colors.purple.shade100,
    );
  }
}
