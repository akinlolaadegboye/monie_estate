import 'package:flutter/material.dart';

abstract class OffersIntent {}
class LoadOfferData extends OffersIntent {}



@immutable
class OffersState {
  String? error, message;
  final bool showLoading;

  OffersState({this.error, this.message, this.showLoading = false});

  OffersState copy({
        String? error,
        String? message,
        bool? showLoading,
      }){
    return OffersState(
      error: error,
      message: message,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}