import 'package:flutter/material.dart';
import 'package:monie_estate/extensions/state_widget.dart';
import 'package:monie_estate/presentation/screens/home/home_data_binding.dart';
import 'package:monie_estate/presentation/screens/home/home_view_model.dart';
import 'package:monie_estate/presentation/screens/offers/offers_data_binding.dart';
import 'package:monie_estate/presentation/screens/offers/offers_view_model.dart';
import 'package:monie_estate/presentation/screens/offers/widgets.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:monie_estate/presentation/values/edge_insets.dart';
import 'package:monie_estate/presentation/values/images.dart';
import 'package:provider/provider.dart';

class OffersView extends StatefulWidget {

  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  OffersViewModel? _viewModel;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<OffersViewModel>(context);
    postFrameCallback(_listenToState);
    return Scaffold(
        body: _content
    );
  }

  get _content {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.homeBgStart,  // Light grey
            AppColors.homeBgMiddle,  // Light orange
            AppColors.homeBgEnd
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: AppEdgeInsets.screen,
            child: const Column(
              children: [
                Header(locationName: 'Saint Petersburg', profileImagePath: ImagePaths.profileImage),
                SizedBox(height: 20),
                Greetings(username: 'Marina'),
                SizedBox(height: 20),
                OfferButtons(buyCount: 1034, rentCount: 2212),
                SizedBox(height: 5)
              ],
            ),
          ),
          const Listings()
        ],
      ),
    );
  }

  void _listenToState() async {}

  OffersState get _viewState => _viewModel!.state;
}

