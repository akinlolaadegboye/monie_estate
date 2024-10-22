import 'package:flutter/material.dart';

abstract class HomeIntent {}
class LoadHomeData extends HomeIntent {}

class PageChanged implements HomeIntent {
  final int pageIndex;
  PageChanged(this.pageIndex);
}



@immutable
class HomeState {
  final int? pageIndex;
  String? error, message;
  final bool showLoading;
  final bool isPageIndexChanged;

  HomeState({this.pageIndex, this.error, this.message, this.showLoading = false, this.isPageIndexChanged = false});

  HomeState copy(
      {
        int? pageIndex,
        String? error,
        String? message,
        bool? showLoading,
        bool? isPageIndexChanged
      }
      ){
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
      error: error,
      message: message,
      showLoading: showLoading ?? this.showLoading,
      isPageIndexChanged: isPageIndexChanged ?? this.isPageIndexChanged
    );
  }
}