import 'package:flutter/material.dart';

abstract class SearchIntent {}
class LoadSearchData extends SearchIntent {}
class DialogIndexChange extends SearchIntent {
  int index;
  DialogIndexChange(this.index);
}



@immutable
class SearchState {
  int? activeDialogItemIndex;
  String? error, message;
  final bool showLoading;
  final bool isDialogItemIndexChanged;

  SearchState({this.activeDialogItemIndex, this.error, this.message, this.showLoading = false,this.isDialogItemIndexChanged = false,});

  SearchState copy(
      {
        int? activeDialogItemIndex,
        String? error,
        String? message,
        bool? showLoading,
        bool? isDialogItemIndexChanged
      }){
    return SearchState(
      activeDialogItemIndex: activeDialogItemIndex ?? this.activeDialogItemIndex,
      error: error,
      message: message,
      showLoading: showLoading ?? this.showLoading,
        isDialogItemIndexChanged: isDialogItemIndexChanged ?? this.isDialogItemIndexChanged
    );
  }
}