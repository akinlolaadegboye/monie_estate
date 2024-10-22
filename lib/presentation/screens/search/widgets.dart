import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monie_estate/presentation/utils/general_utils.dart';
import 'package:monie_estate/presentation/utils/styles.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:monie_estate/presentation/values/strings.dart';


/// MAP HEADER

class MapHeader extends StatefulWidget {
  final bool isHeaderWidgetsVisible;
  const MapHeader({required this.isHeaderWidgetsVisible, super.key});

  @override
  State<MapHeader> createState() => _MapHeaderState();
}
class _MapHeaderState extends State<MapHeader> {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 40.0,
      left: 15.0,
      right: 15.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedScale(
              scale: widget.isHeaderWidgetsVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              child: Container(
                height: 50.0,
                width: GeneralUtils().getScreenWidth(context) - 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: TextField(
                  readOnly: true,
                  onTap: () {},
                  decoration: InputDecoration(
                    hintText: 'Saint Petersburg',
                    prefixIcon:
                    const Icon(Icons.search, color: Colors.black),
                    border: InputBorder.none,
                    hintStyle: TextStyles.pryBody.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.pryBodyText),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              )),
          AnimatedScale(
              scale: widget.isHeaderWidgetsVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add_chart_rounded),
                ),
              ))
        ],
      ),
    );
  }
}


/// MAP VIEW
class MapView extends StatelessWidget {
  final MapCreatedCallback onMapCreated;
  final Map<MarkerId, Marker> markers;

  const MapView({required this.onMapCreated, required this.markers, super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      mapType: MapType.normal,
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.7749, -122.4194),
        zoom: 14.5,
      ),
      markers: Set<Marker>.of(markers.values),
    );
  }
}



/// MAP ACTION BUTTON

class MapActionButtons extends StatefulWidget {
  final bool isHeaderWidgetsVisible;
  final Function onTap;
  const MapActionButtons({required this.isHeaderWidgetsVisible,required this.onTap, super.key});

  @override
  State<MapActionButtons> createState() => _MapActionButtonsState();
}
class _MapActionButtonsState extends State<MapActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 120,
      child: Column(
        children: [
          Container(
            width: GeneralUtils().getScreenWidth(context) - 40,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  child: AnimatedScale(
                    scale: widget.isHeaderWidgetsVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      child: const Icon(
                        Icons.account_balance_wallet,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: GeneralUtils().getScreenWidth(context) - 40,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    widget.onTap();
                  },
                  borderRadius: BorderRadius.circular(25),
                  splashColor: Colors.grey,
                  child: AnimatedScale(
                    scale: widget.isHeaderWidgetsVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      child: const Icon(
                        Icons.account_tree_sharp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                AnimatedScale(
                  scale: widget.isHeaderWidgetsVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.add_chart_sharp,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          Strings().mapBottomRightIconName,
                          textAlign: TextAlign.start,
                          style: TextStyles.pryBody.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/// MAP DIALOG ITEM

class MapDialogItem extends StatefulWidget {
  final String title;
  final IconData iconData;
  final bool isActive;
  final Function onTap;
  const MapDialogItem({required this.title, required this.iconData,required this.isActive, required this.onTap, super.key});

  @override
  State<MapDialogItem> createState() => _MapDialogItemState();
}
class _MapDialogItemState extends State<MapDialogItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
            Icon(widget.iconData, size: 15,color: widget.isActive ? AppColors.pry : AppColors.pryBodyText),
            const SizedBox(width: 15),
            Text(
              widget.title,
              textAlign: TextAlign.start,
              style: TextStyles.pryBody.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: widget.isActive ? AppColors.pry : AppColors.pryBodyText),
            )
          ],
        ),
      ),
    );
  }
}





