
import 'package:flutter/cupertino.dart';
import 'package:monie_estate/presentation/screens/home/home_data_binding.dart';
import 'package:monie_estate/presentation/screens/search/search_data_binding.dart';

class SearchViewModel extends ChangeNotifier {

  SearchState _state = SearchState();
  SearchState get state => _state;

  set state(SearchState homeState) {
    _state = homeState;
    notifyListeners();
  }

  void onCall(SearchIntent intent){
    if(intent is LoadSearchData){
      _loadSearchData();
    } else if(intent is DialogIndexChange){
      state = state.copy(activeDialogItemIndex: intent.index);
    }
  }

  _loadSearchData(){
    state = state.copy(isDialogItemIndexChanged: true, activeDialogItemIndex: 2);
  }

}
