
import 'package:flutter/cupertino.dart';
import 'package:monie_estate/presentation/screens/chat/chat_data_binding.dart';
import 'package:monie_estate/presentation/screens/offers/offers_data_binding.dart';

class ChatViewModel extends ChangeNotifier {

  ChatState _state = ChatState();
  ChatState get state => _state;

  set state(ChatState offersState) {
    _state = offersState;
    notifyListeners();
  }

  void onCall(ChatIntent intent){
    if(intent is LoadChatData){}
  }
}
