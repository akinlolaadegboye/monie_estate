import 'package:flutter/material.dart';
import 'package:monie_estate/extensions/state_widget.dart';
import 'package:monie_estate/presentation/screens/components/commons.dart';
import 'package:monie_estate/presentation/screens/home/home_data_binding.dart';
import 'package:monie_estate/presentation/screens/home/home_view_model.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:monie_estate/presentation/values/edge_insets.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {

  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  HomeViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    postFrameCallback(() {});
  }

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<HomeViewModel>(context);
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
        child: ScreenTitle(title: 'Chat Screen'),
      )
    );
  }

  void _listenToState() async {
  }

  HomeState get _viewState => _viewModel!.state;
}

class LoadData {}
