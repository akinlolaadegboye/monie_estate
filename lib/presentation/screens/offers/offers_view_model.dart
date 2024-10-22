
import 'package:flutter/cupertino.dart';
import 'package:monie_estate/presentation/screens/offers/offers_data_binding.dart';

class OffersViewModel extends ChangeNotifier {

  OffersState _state = OffersState();
  OffersState get state => _state;

  set state(OffersState offersState) {
    _state = offersState;
    notifyListeners();
  }

  void onCall(OffersIntent intent){
    if(intent is LoadOfferData){}
  }

}
