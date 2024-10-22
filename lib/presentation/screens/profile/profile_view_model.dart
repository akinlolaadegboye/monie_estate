
import 'package:flutter/cupertino.dart';
import 'package:monie_estate/presentation/screens/offers/offers_data_binding.dart';
import 'package:monie_estate/presentation/screens/profile/profile_databinding.dart';

class ProfileViewModel extends ChangeNotifier {

  ProfileState _state = ProfileState();
  ProfileState get state => _state;

  set state(ProfileState profileState) {
    _state = profileState;
    notifyListeners();
  }

  void onCall(ProfileIntent intent){
    if(intent is LoadProfileData){}
  }


}
