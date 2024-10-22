import 'package:flutter/material.dart';
import 'package:monie_estate/extensions/state_widget.dart';
import 'package:monie_estate/presentation/animation/fade_animation.dart';
import 'package:monie_estate/presentation/screens/chat/chat_view.dart';
import 'package:monie_estate/presentation/screens/home/home_data_binding.dart';
import 'package:monie_estate/presentation/screens/home/home_view_model.dart';
import 'package:monie_estate/presentation/screens/home/widgets.dart';
import 'package:monie_estate/presentation/screens/offers/offers_view.dart';
import 'package:monie_estate/presentation/screens/profile/profile_view.dart';
import 'package:monie_estate/presentation/screens/search/search_view.dart';
import 'package:monie_estate/presentation/screens/wish/wish_view.dart';
import 'package:monie_estate/presentation/utils/general_utils.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const id = 'Home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin  {
  HomeViewModel? _viewModel;
  final _scrollController = PageController();

  late AnimationController _controller;
  late Animation<Offset> _bottomNavLayoutAnimation;

  @override
  void initState() {
    super.initState();

    //Load Home screen data
    postFrameCallback(() {
      _viewModel!.onCall(LoadHomeData());
    });

    //Initialise and handles animation
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _bottomNavLayoutAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    ));

    // Delay for 6 secs before starting the animation.
    Future.delayed(const Duration(milliseconds: 6000), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<HomeViewModel>(context);
    postFrameCallback(_listenToState);
    return Scaffold(
      body: _content,
    );
  }

  Widget get _content {
    return Stack(children: [_pageView, _bottomNavLayout]);
  }

  get _pageView {
    return SizedBox(
      height: GeneralUtils().getScreenHeight(context),
      child: PageView.builder(
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, position) {
            return _pages[position];
          },
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int page) {
            _viewModel!.onCall(PageChanged(page));
          }),
    );
  }

  List<Widget> get _pages {
    return [
      const SearchView(),
      const ChatView(),
      const OffersView(),
      const WishView(),
      const ProfileView()
    ];
  }

  get _bottomNavLayout {
    return Positioned(
      bottom: 30,
      left: GeneralUtils().getScreenWidth(context) * .17,
      child: SlideTransition(
        position: _bottomNavLayoutAnimation,
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.85),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavItem(
                  icon: Icons.search,
                  isActive:  _viewModel!.state.pageIndex == 0,
                  bgColor: _viewModel!.state.pageIndex == 0
                      ? AppColors.pry
                      : Colors.black,
                  onTap: () {
                    setState(() {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpToPage(0);
                      }
                    });
                  }),
              BottomNavItem(
                  isActive: _viewModel!.state.pageIndex == 1,
                  icon: Icons.message,
                  bgColor: _viewModel!.state.pageIndex == 1
                      ? AppColors.pry
                      : Colors.black,
                  onTap: () {
                    setState(() {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpToPage(1);
                      }
                    });
                  }),

              BottomNavItem(
                  isActive: _viewModel!.state.pageIndex == 2,
                  icon: Icons.local_offer_sharp,
                  bgColor: _viewModel!.state.pageIndex == 2
                      ? AppColors.pry
                      : Colors.black,
                  onTap: () {
                    setState(() {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpToPage(2);
                      }
                    });
                  }),

              BottomNavItem(
                  isActive: _viewModel!.state.pageIndex == 3,
                  icon: Icons.heart_broken_sharp,
                  bgColor: _viewModel!.state.pageIndex == 3
                      ? AppColors.pry
                      : Colors.black,
                  onTap: () {
                    setState(() {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpToPage(3);
                      }
                    });
                  }),

              BottomNavItem(
                  isActive: _viewModel!.state.pageIndex == 4,
                  icon: Icons.person,
                  bgColor: _viewModel!.state.pageIndex == 4
                      ? AppColors.pry
                      : Colors.black,
                  onTap: () {
                    setState(() {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpToPage(4);
                      }
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _listenToState() async {
    if(_viewState.isPageIndexChanged){
      if (_scrollController.hasClients) {
        _scrollController.jumpToPage(_viewState.pageIndex ?? 0);
      }
    }
  }

  HomeState get _viewState => _viewModel!.state;
}

class LoadData {}
