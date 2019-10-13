
class Transaction{
  int id;  //autoincrement
  String customerrequest;  //rice 50 , beans 100,meat 50  == using map . might not until clicked on
  String foodvendor;  // Either greencorner/yelllowcorner/iyadebo
  int amount;   //Amount spent to buy a meal
  String response; //Either success/failed/network

  Transaction({this.id, this.customerrequest, this.foodvendor, this.amount,
      this.response});

  factory Transaction.fromMap(Map<String, dynamic> map) => new Transaction(
      id: map["id"],
      customerrequest: map["customerrequest"],
      foodvendor: map["foodvendor"],
      amount: map["amount"],
      response: map['response']
  );

  Map<String, dynamic> toMap() => {
    "customerrequest": customerrequest,
    "foodvendor": foodvendor,
    "amount": amount,
    "response":response,
  };


}