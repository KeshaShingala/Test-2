class Data {
  int id;
  String name;
  int price;
  int quantity;
  int dummyPrice;
  String image;

  Data(
      {required this.id,
      required this.name,
      required this.price,
        required this.quantity,
      required this.dummyPrice,
      required this.image});

  factory Data.fromData({required Data data,}){
    return Data(
    id: data.id,
      name: data.name,
      price: data.price,
      quantity: data.quantity,
      dummyPrice: data.dummyPrice,
      image: data.image,
    );
}
}

class DataDB {
  final String name;
  final String details;
  final int price;
  final int id;

  DataDB(
      {required this.name,
        required this.details,
        required this.price,
        required this.id});

  factory DataDB.fromData({required Map data}) {
    return DataDB(
      name: data["Name"],
      details: data["Details"],
      price: data["Price"],
      id: data["Id"],
    );
  }
}



class CouponData
{
  final String name;
  final int quantity;
  final int price;

  CouponData({required this.name, required this.quantity, required this.price});

  factory CouponData.data({required CouponData data}){
    return CouponData(name: data.name, quantity: data.quantity, price: data.price);
  }
}

class CouponDB
{
  final String name;
  final int quantity;
  final int price;

  CouponDB({required this.name, required this.quantity, required this.price});

  factory CouponDB.data({required Map data}){
    return CouponDB(name: data["coupon"], quantity: data["Quantity"], price: data["Price"]);
  }
}