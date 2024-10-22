import 'package:flutter/material.dart';
import 'package:monie_estate/extensions/state_widget.dart';
import 'package:monie_estate/presentation/screens/components/commons.dart';
import 'package:monie_estate/presentation/screens/profile/profile_databinding.dart';
import 'package:monie_estate/presentation/screens/profile/profile_view_model.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    postFrameCallback(() {});
  }

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<ProfileViewModel>(context);
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
        child: ScreenTitle(title: 'Profile Screen'),
      )
    );
  }

  void _listenToState() async {}

  ProfileState get _viewState => _viewModel!.state;
}

class LoadData {}
