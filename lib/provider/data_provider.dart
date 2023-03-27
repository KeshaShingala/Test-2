import 'package:flutter/material.dart';

import '../modal/modal_page.dart';


class  ProductProvider extends ChangeNotifier{
  List<Data> addedProducts =[];
  List<Data> productQuantity =[];
  int  discount = 0;
  String promo = "";

  addDiscount({required int data,required String text})
  {
     discount = data;
     promo = text ;
  }

  removeDiscount({required int data,required String text})
  {
    discount = data;
    promo = text;
  }

  void addQuantity({required Data dataDB, required int index}) {
    int flag = 0;
    for (Data addProduct in productQuantity){
      if(productQuantity[index].quantity > 1){
        productQuantity[index].quantity++;
        flag = 1;
        notifyListeners();
      }
      notifyListeners();
    }
    if (flag == 0) {
      addedProducts.add(dataDB);
      notifyListeners();
    }
    notifyListeners();
  }

  void removeQuantity({required Data data, required int index}) {
    int flag = 0;
       for (Data addProduct in productQuantity){
         if(productQuantity[index].quantity > 1){
           productQuantity[index].quantity--;
           flag = 1;
           notifyListeners();
         }
         notifyListeners();
       }
    if (flag == 0) {
          addedProducts.remove(data);
          notifyListeners();
        }
    notifyListeners();
  }

   get totalQuantity {
   int  totalQuantity = 0;
    for (var element in productQuantity) {
      totalQuantity += element as int;
    }
    return totalQuantity;
  }

   get totalPrice {
    double finalTotal = 0;
    for (var element in addedProducts) {
      int indext = addedProducts.indexOf(element);
      finalTotal += element.price * productQuantity[indext].quantity;
    }
    return finalTotal -= - discount;
  }


  void addProduct({required DataDB food, required int quantity}) {
    addProduct(food: food, quantity: quantity);
    notifyListeners();
  }



    void removeProduct({required DataDB food, required int quantity}) {
    addedProducts.remove(food);
    productQuantity.remove(quantity);
    notifyListeners();
  }

}

