import 'package:flutter/material.dart';

abstract class ProfileIntent {}
class LoadProfileData extends ProfileIntent {}

@immutable
class ProfileState {
  String? error, message;
  final bool showLoading;

  ProfileState({this.error, this.message, this.showLoading = false});

  ProfileState copy({
    String? error,
    String? message,
    bool? showLoading,
  }){
    return ProfileState(
      error: error,
      message: message,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}