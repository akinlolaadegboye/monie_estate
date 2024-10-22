
import 'package:flutter/cupertino.dart';
import 'package:monie_estate/presentation/screens/offers/offers_data_binding.dart';
import 'package:monie_estate/presentation/screens/wish/wish_data_binding.dart';

class WishViewModel extends ChangeNotifier {

  WishState _state = WishState();
  WishState get state => _state;

  set state(WishState wishState) {
    _state = wishState;
    notifyListeners();
  }

  void onCall(WishIntent intent){
    if(intent is LoadWishData){}
  }


}
