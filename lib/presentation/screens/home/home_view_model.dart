import 'package:flutter/cupertino.dart';
import 'package:monie_estate/presentation/screens/home/home_data_binding.dart';

class HomeViewModel extends ChangeNotifier {

  HomeState _state = HomeState();
  HomeState get state => _state;

  set state(HomeState homeState) {
    _state = homeState;
    notifyListeners();
  }

  void onCall(HomeIntent intent){
    if(intent is LoadHomeData){
      _loadHomeData();
    } else if (intent is PageChanged) {
      state = state.copy(pageIndex: intent.pageIndex, isPageIndexChanged: true);
    }
  }

  _loadHomeData(){
    state = state.copy(pageIndex: 2, isPageIndexChanged: true);
  }

}
