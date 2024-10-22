import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:monie_estate/presentation/animation/fade_animation.dart';
import 'package:monie_estate/presentation/screens/components/commons.dart';
import 'package:monie_estate/presentation/utils/general_utils.dart';
import 'package:monie_estate/presentation/utils/styles.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:monie_estate/presentation/values/edge_insets.dart';
import 'package:monie_estate/presentation/values/images.dart';
import 'package:monie_estate/presentation/values/strings.dart';



/// HEADER
class Header extends StatefulWidget {
  final String locationName;
  final String profileImagePath;
  const Header({required this.locationName, required this.profileImagePath, super.key});

  @override
  State<Header> createState() => _HeaderState();
}
class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  bool _isVisible = false;

  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _showText = false;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation
    _controller.forward();

    // Show the text once the animation is complete
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showText = true;
        });
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Padding(
        padding: AppEdgeInsets.appBarPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SlideTransition(
              position: _animation,
              child: Container(
                height: 50,
                width: 160,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: _showText ?
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.secBodyText,
                      size: 15,
                    ),
                    Text(
                      widget.locationName,
                      textAlign: TextAlign.center,
                      style: TextStyles.pryBody.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secBodyText,
                      ),
                    )
                  ],
                ) : Container(),
              ),
            ),
            AnimatedScale(
                scale: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                child: ClipOval(child: LocalImage(widget.profileImagePath, width: 45)))
          ],
        ),
      ),
    );
  }
}


/// GREETINGS
class Greetings extends StatefulWidget {
  final String username;
  const Greetings({super.key, required this.username});

  @override
  State<Greetings> createState() => _GreetingsState();
}
class _GreetingsState extends State<Greetings> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimation(
          delay: 1.5,
          child: Text(
            'Hi! ${widget.username}',
            style: TextStyles.pryBody.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: AppColors.secBodyText,
            ),
          ),
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRect(
              child: Stack(
                children: [
                  SlideTransition(
                    position: _animation,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'let\'s select your',
                          textAlign: TextAlign.start,
                          style: TextStyles.pryBody.copyWith(
                              fontSize: 27,
                              fontWeight: FontWeight.w400,
                              color: AppColors.pryBodyText),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: ClipRect( // Clipping the content to avoid overflow
            child: Stack(
              children: [
                SlideTransition(
                  position: _animation,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'perfect place',
                      style: TextStyles.pryBody.copyWith(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                          color: AppColors.pryBodyText),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}


 /// OFFER_BUTTONS
class OfferButtons extends StatefulWidget {

  final int buyCount;
  final int rentCount;
  const OfferButtons({required this.buyCount, required this.rentCount, super.key});

  @override
  State<OfferButtons> createState() => _OfferButtonsState();
}
class _OfferButtonsState extends State<OfferButtons> with SingleTickerProviderStateMixin {

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedScale(
          scale: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: AppColors.pry,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  Strings().buy,
                  textAlign: TextAlign.center,
                  style: TextStyles.pryBody.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 20),
                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: widget.buyCount),
                  // Ensure both are integers
                  duration: const Duration(seconds: 2),
                  // Duration for the count-up animation
                  builder: (context, value, child) {
                    return Text(
                      '$value',
                      textAlign: TextAlign.center,
                      style: TextStyles.pryBody.copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: AppColors.whiteColor,
                      ),
                    );
                  },
                ),
                Text(
                  Strings().offers,
                  textAlign: TextAlign.center,
                  style: TextStyles.pryBody.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        AnimatedScale(
          scale: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  Strings().rent,
                  textAlign: TextAlign.center,
                  style: TextStyles.pryBody.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secBodyText,
                  ),
                ),
                const SizedBox(height: 15),
                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: widget.rentCount),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    return   Text(
                      '$value',
                      textAlign: TextAlign.center,
                      style: TextStyles.pryBody.copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: AppColors.secBodyText,
                      ),
                    );
                  },),
                Text(
                  Strings().offers,
                  textAlign: TextAlign.center,
                  style: TextStyles.pryBody.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secBodyText,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        )
      ],
    );
  }
}



/// LISTINGS
class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}
class _ListingsState extends State<Listings> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _animation;

  static List<StaggeredGridTile> cardTile = [
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1,
      child: GridTile(
        count: 50,
        location: Strings().propertyNames[0],
        imagePath: ImagePaths.image1,
        isFullWidthTile: true,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: GridTile(
        count: 50,
        location: Strings().propertyNames[1],
        imagePath: ImagePaths.image2,
        isFullWidthTile: false,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: GridTile(
        count: 50,
        location: Strings().propertyNames[2],
        imagePath: ImagePaths.image3,
        isFullWidthTile: false,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: GridTile(
        count: 50,
        location: Strings().propertyNames[3],
        imagePath: ImagePaths.image4,
        isFullWidthTile: false,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1,
      child: GridTile(
        count: 30,
        location: Strings().propertyNames[4],
        imagePath: ImagePaths.image5,
        isFullWidthTile: true,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: GridTile(
        count: 10,
        location: Strings().propertyNames[5],
        imagePath: ImagePaths.image6,
        isFullWidthTile: false,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: GridTile(
        count: 23,
        location: Strings().propertyNames[6],
        imagePath: ImagePaths.image7,
        isFullWidthTile: false,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1,
      child: GridTile(
        count: 43,
        location: Strings().propertyNames[7],
        imagePath: ImagePaths.image8,
        isFullWidthTile: true,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    ));

    Future.delayed(const Duration(milliseconds: 2000), () {
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
    return Expanded(
      child: SlideTransition(
        position: _animation,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30)),
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                children: cardTile),
          ),
        ),
      ),
    );
  }
}


/// GRID_TILE
class GridTile extends StatefulWidget {
  final String location;
  final int count;
  final String imagePath;
  final bool isFullWidthTile;

  const GridTile(
      {super.key,
      required this.location,
      required this.count,
      required this.imagePath,
      required this.isFullWidthTile});

  @override
  State<GridTile> createState() => _GridTileState();
}

class _GridTileState extends State<GridTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconPositionAnimation;

  bool _isGridTileTitleVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _iconPositionAnimation =
        Tween<double>(begin: 0.0, end: 0.8).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        _controller.forward();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });

    Future.delayed(const Duration(milliseconds: 3700), () {
      setState(() {
        _isGridTileTitleVisible = true; // Set to true after the delay
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = GeneralUtils().getScreenWidth(context);
    double tileWidth = widget.isFullWidthTile
        ? screenWidth
        : screenWidth / 2 - 40;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          left: 20,
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            width: tileWidth * _iconPositionAnimation.value,
            curve: Curves.easeInOut,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: _isGridTileTitleVisible ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        '${widget.location}, ${widget.count}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      // Empty container for spacing
                      Container(),
                    ],
                  ) : const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ),

        // Animated Positioned for the CircleAvatar
        AnimatedPositioned(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          bottom: 23,
          left: tileWidth * _iconPositionAnimation.value - 28,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
