import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monie_estate/presentation/utils/styles.dart';
import 'package:monie_estate/presentation/values/colors.dart';


/// LOAD LOCAL IMAGES

class LocalImage extends StatelessWidget {
  final String srcPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const LocalImage(this.srcPath,
      {super.key, this.height, this.width, this.fit, this.color});

  @override
  Widget build(BuildContext context) {
    return _isSvgImage
        ? SvgPicture.asset(
            srcPath,
            width: width,
            height: height,
            color: color,
          )
        : Image.asset(
            srcPath,
            width: width,
            height: height,
            fit: fit,
            color: color,
          );
  }

  bool get _isSvgImage {
    return srcPath.endsWith('.svg');
  }
}
class NetworkSvgImage extends StatelessWidget {
  final String srcPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const NetworkSvgImage(this.srcPath,
      {super.key, this.height, this.width, this.fit, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      srcPath,
      width: width,
      height: height,
      color: color,
    );
  }
}


/// PAGE TITLES
///
class ScreenTitle extends StatefulWidget {
  final String title;
  const ScreenTitle({super.key, required this.title});

  @override
  State<ScreenTitle> createState() => _ScreenTitleState();
}
class _ScreenTitleState extends State<ScreenTitle> with SingleTickerProviderStateMixin {
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

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: ClipRect(
        child: Stack(
          children: [
            SlideTransition(
              position: _animation,
              child: Text(
                widget.title,
                style: TextStyles.pryBody.copyWith(
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    color: AppColors.pryBodyText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


