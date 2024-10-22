import 'package:flutter/material.dart';
import 'package:monie_estate/extensions/state_widget.dart';
import 'package:monie_estate/presentation/screens/components/commons.dart';
import 'package:monie_estate/presentation/screens/wish/wish_data_binding.dart';
import 'package:monie_estate/presentation/screens/wish/wish_view_model.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:monie_estate/presentation/values/edge_insets.dart';
import 'package:provider/provider.dart';

class WishView extends StatefulWidget {

  const WishView({super.key});

  @override
  State<WishView> createState() => _WishViewState();
}

class _WishViewState extends State<WishView> {
  WishViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    postFrameCallback(() {});
  }

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<WishViewModel>(context);
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
            AppColors.homeBgStart,
            AppColors.homeBgMiddle,
            AppColors.homeBgEnd
          ],
        ),
      ),
      child: const Center(
        child: ScreenTitle(title: 'Wish Screen'),
      )
    );
  }

  void _listenToState() async {}

  WishState get _viewState => _viewModel!.state;
}

class LoadData {}
