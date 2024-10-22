import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:monie_estate/di/dependencies.dart';
import 'package:monie_estate/presentation/screens/chat/chat_view_model.dart';
import 'package:monie_estate/presentation/screens/home/home_view.dart';
import 'package:monie_estate/presentation/screens/home/home_view_model.dart';
import 'package:monie_estate/presentation/screens/offers/offers_view_model.dart';
import 'package:monie_estate/presentation/screens/profile/profile_view_model.dart';
import 'package:monie_estate/presentation/screens/search/search_view_model.dart';
import 'package:monie_estate/presentation/screens/wish/wish_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class App {
  static String startingRoute = HomeView.id;

  static Map<String, WidgetBuilder> routes = {
    HomeView.id: (_) => const HomeView()
  };

  static List<SingleChildWidget> notifierProviders = [
    ChangeNotifierProvider(create: (_) => locator<HomeViewModel>()),
    ChangeNotifierProvider(create: (_) => locator<SearchViewModel>()),
    ChangeNotifierProvider(create: (_) => locator<ChatViewModel>()),
    ChangeNotifierProvider(create: (_) => locator<OffersViewModel>()),
    ChangeNotifierProvider(create: (_) => locator<WishViewModel>()),
    ChangeNotifierProvider(create: (_) => locator<ProfileViewModel>())
  ];
}
