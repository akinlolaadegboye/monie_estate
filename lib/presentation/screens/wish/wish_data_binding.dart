import 'package:flutter/material.dart';

abstract class WishIntent {}
class LoadWishData extends WishIntent {}



@immutable
class WishState {
  String? error, message;
  final bool showLoading;

  WishState({this.error, this.message, this.showLoading = false});

  WishState copy({
        String? error,
        String? message,
        bool? showLoading,
      }){
    return WishState(
      error: error,
      message: message,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}