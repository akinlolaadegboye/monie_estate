import 'package:flutter/material.dart';

abstract class ChatIntent {}
class LoadChatData extends ChatIntent {}

@immutable
class ChatState {
  String? error, message;
  final bool showLoading;

  ChatState({this.error, this.message, this.showLoading = false});

  ChatState copy({
        String? error,
        String? message,
        bool? showLoading,
      }){
    return ChatState(
      error: error,
      message: message,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}