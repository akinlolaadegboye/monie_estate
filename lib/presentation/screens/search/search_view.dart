import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monie_estate/extensions/state_widget.dart';
import 'package:monie_estate/presentation/screens/search/search_data_binding.dart';
import 'package:monie_estate/presentation/screens/search/search_view_model.dart';
import 'package:monie_estate/presentation/screens/search/widgets.dart';
import 'package:monie_estate/presentation/utils/general_utils.dart';
import 'package:monie_estate/presentation/utils/map_utils.dart';
import 'package:monie_estate/presentation/utils/styles.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:monie_estate/presentation/values/strings.dart';
import 'package:provider/provider.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with SingleTickerProviderStateMixin {
  SearchViewModel? _viewModel;

  late GoogleMapController _mapController;

  Map<MarkerId, Marker> markers = {};

  bool _isHeaderWidgetsVisible = false;
  bool _isShowIconAlone = true;

  // Animation controller for zoom-out effect
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  // Boolean to toggle dialog visibility
  bool _isDialogVisible = false;

  @override
  void initState() {
    super.initState();

    // Handle animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    Future.delayed(const Duration(milliseconds: 3500), () {
      setState(() {
        _isHeaderWidgetsVisible = true;
      });
    });

    //Call LoadSearchData intent
    postFrameCallback(() {
      _viewModel!.onCall(LoadSearchData());
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<SearchViewModel>(context);
    postFrameCallback(_listenToState);
    return Scaffold(body: _content);
  }

  get _content {
    return Stack(
      children: [
        _mapView,
        _header,
        _mapActionButtons,
        _propertySwitchDialog
      ],
    );
  }

  get _mapView {
    return MapView(onMapCreated: _onMapCreated, markers: markers);
  }

  get _header {
    return MapHeader(isHeaderWidgetsVisible: _isHeaderWidgetsVisible);
  }

  get _mapActionButtons {
    return MapActionButtons(isHeaderWidgetsVisible: _isHeaderWidgetsVisible, onTap: (){
      _toggleDialog();
    });
  }

  get _propertySwitchDialog {
    return _isDialogVisible
        ? Positioned(
            bottom: 155,
            left: 65,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Transform(
                alignment: Alignment.bottomLeft,
                transform: Matrix4.identity(),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 170,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MapDialogItem(
                            title: Strings().searchDialogItems[0],
                            iconData: Icons.home,
                            isActive: _viewState.activeDialogItemIndex == 0,
                            onTap: () {
                              _onDialogItemClick('');
                              _viewModel!.onCall(DialogIndexChange(0));
                            }),
                        MapDialogItem(
                            title: Strings().searchDialogItems[1],
                            iconData: Icons.wallet,
                            isActive: _viewState.activeDialogItemIndex == 1,
                            onTap: () {
                              _onDialogItemClick(Strings().searchDialogItems[1]);
                              _viewModel!.onCall(DialogIndexChange(1));
                            }),
                        MapDialogItem(
                            title: Strings().searchDialogItems[2],
                            iconData: Icons.account_balance_rounded,
                            isActive: _viewState.activeDialogItemIndex == 2,
                            onTap: () {
                              _onDialogItemClick(Strings().searchDialogItems[2]);
                              _viewModel!.onCall(DialogIndexChange(2));
                            }),
                        MapDialogItem(
                            title: Strings().searchDialogItems[3],
                            iconData: Icons.ac_unit_sharp,
                            isActive: _viewState.activeDialogItemIndex == 3,
                            onTap: () {
                              _onDialogItemClick('');
                              _viewModel!.onCall(DialogIndexChange(3));
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  void _listenToState() async {}


  SearchState get _viewState => _viewModel!.state;


  // Function that handles dialog visibility
  void _toggleDialog() {
    setState(() {
      if (_isDialogVisible) {
        _animationController.reverse(); // Zoom out animation
      } else {
        _animationController.forward(); // Zoom in animation
      }
      _isDialogVisible = !_isDialogVisible; // Toggle visibility state
    });
  }

  // Function that handles item selection from the dialog
  void _onDialogItemClick(String action) {
    switch (action) {
      case '':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No Action Added yet!!!',
                textAlign: TextAlign.start,
                style: TextStyles.pryBody.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.pry,
                )),
          ),
        );
        break;
      case 'Price':
        _isShowIconAlone = false;
        setState(() {});
        _loadMarkers();
        break;
      case 'Infrastructure':
        _isShowIconAlone = true;
        setState(() {});
        _loadMarkers();
        break;
    }
    _toggleDialog();
  }

  // Function is call on map created.
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController.setMapStyle(darkMapStyle);
    Future.delayed(const Duration(seconds: 4), () {
      _loadMarkers();
    });
  }

  // Function loads markers
  void _loadMarkers() async {
    for( var property in MapUtils().propertiesData) {
      BitmapDescriptor customIcon = await MapUtils().createCustomMarker(
          text: property['price'], isShowIconOnly: _isShowIconAlone);
      final markerId = MarkerId(property['id']);
      final marker = Marker(
          markerId: markerId,
          position: LatLng(property['lat'], property['lng']),
          infoWindow: InfoWindow(title: property['price']),
          icon: customIcon);
      markers[markerId] = marker;
      setState(() {});
    }
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }
}


