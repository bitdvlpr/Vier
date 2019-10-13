

class Cafeteria {

  String _foodimage;
  String _foodname;
  double _actualprice;



  Cafeteria(this._foodimage, this._foodname,this._actualprice);

  String get foodimage => _foodimage;

  set foodimage(String value) {
    _foodimage = value;
  }

  String get foodname => _foodname;

  set foodname(String value) {
    _foodname = value;
  }

  double get actualprice => _actualprice;

  set actualprice(double value) {
    _actualprice = value;
  }


}