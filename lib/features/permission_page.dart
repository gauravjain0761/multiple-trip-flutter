import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:multitrip_user/app_enverionment.dart';
import 'package:multitrip_user/features/dashboard/home.dart';
import 'package:multitrip_user/routes.dart';
import 'package:multitrip_user/shared/data/constants/constants.dart';
import 'package:multitrip_user/shared/utils/utils.dart';
import 'package:multitrip_user/themes/app_text.dart';

class NoPermission extends StatefulWidget {
  const NoPermission({Key? key}) : super(key: key);

  @override
  State<NoPermission> createState() => _NoPermissionState();
}

class _NoPermissionState extends State<NoPermission>
    with WidgetsBindingObserver {
  ValueNotifier<LocationPermission?> permision = ValueNotifier(null);
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _getPermission();
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _getPermission();
  }

  void _getPermission() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      permision.value = await Geolocator.checkPermission();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _getPermission();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();

        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.appColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Permession Denied',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'Please give permission to app ,to work properly. Please go to app setting and grant the permissions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              Spacer(),
              ValueListenableBuilder<LocationPermission?>(
                  valueListenable: permision,
                  builder: (context, snapshot, _) {
                    return GestureDetector(
                      onTap: () async {
                        if (snapshot == LocationPermission.denied ||
                            snapshot == LocationPermission.deniedForever ||
                            snapshot == LocationPermission.unableToDetermine) {
                          Geolocator.openAppSettings();
                        } else {
                          AppEnvironment.navigator.pushNamedAndRemoveUntil(
                            GeneralRoutes.pages,
                            (route) => false,
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            snapshot == LocationPermission.denied ||
                                    snapshot ==
                                        LocationPermission.deniedForever ||
                                    snapshot ==
                                        LocationPermission.unableToDetermine
                                ? "Go to Setting"
                                : "Go to Home Page",
                            style: AppText.text15w400.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.h),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
