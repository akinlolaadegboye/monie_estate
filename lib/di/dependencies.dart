import 'package:get_it/get_it.dart';
import 'package:monie_estate/presentation/screens/chat/chat_view_model.dart';
import 'package:monie_estate/presentation/screens/home/home_view_model.dart';
import 'package:monie_estate/presentation/screens/offers/offers_view_model.dart';
import 'package:monie_estate/presentation/screens/profile/profile_view_model.dart';
import 'package:monie_estate/presentation/screens/search/search_view_model.dart';
import 'package:monie_estate/presentation/screens/wish/wish_view_model.dart';

GetIt locator = GetIt.instance;

Future<void> setUpDependencies() async {
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => SearchViewModel());
  locator.registerLazySingleton(() => ChatViewModel());
  locator.registerLazySingleton(() => OffersViewModel());
  locator.registerLazySingleton(() => WishViewModel());
  locator.registerLazySingleton(() => ProfileViewModel());
}