import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:monie_estate/presentation/values/enum.dart';
import 'package:monie_estate/extensions/string.dart';

extension StateWidgetExtension on State {

  void postFrameCallback(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callback.call();
    });
  }

  Future<bool?> switchMessage(String? message, MessageType messageType, {VoidCallback? onCompleted, }) async{
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Message',
        message: '$message',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType:
        MessageType.success == messageType ? ContentType.success :
        MessageType.error == messageType ? ContentType.failure :
        ContentType.warning,
      ),
    );

    if(message.hasValue) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      onCompleted?.call();
    }

    return true;
  }

  Map get arg {
    final arg = ModalRoute.of(context)?.settings.arguments;
    return arg != null ? arg as Map : {};
  }

  /// This is needed for operations that need to check the [context] is still
  /// mounted before it's triggered (to enhance safety).
  ///
  /// E.g: If [context] is needed for an operation after async-await,
  /// it's important to check that it's still mounted before using it.
  void ifMounted(VoidCallback callback){
    if (mounted) callback.call();
  }

  bool get _isPdShowing{
    if(_pdShowingStatus['$runtimeType'] == null) {
      _setPdShowingStatus(false);
    }

    return _pdShowingStatus['$runtimeType']!;
  }

  void _setPdShowingStatus(bool status){
    _pdShowingStatus['$runtimeType'] = status;
  }

}

extension ScrollControllerExtension on ScrollController{

  void scrollDown() {
    _scrollTo(position.maxScrollExtent);
  }

  void scrollUp() {
    _scrollTo(0);
  }

  void _scrollTo(double position){
    try {
      animateTo(position, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } catch (e) {
      e.toString();
    }
  }

}

Map<String, bool> _pdShowingStatus = {};
