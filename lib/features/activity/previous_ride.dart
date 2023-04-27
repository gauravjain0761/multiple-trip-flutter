import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:multitrip_user/models/ridehistory.dart';
import 'package:multitrip_user/routes/routes.dart';
import 'package:multitrip_user/shared/shared.dart';
import 'package:multitrip_user/shared/ui/common/app_image.dart';
import 'package:multitrip_user/shared/ui/common/spacing.dart';
import 'package:multitrip_user/themes/app_text.dart';

class PreviousRides extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;

  const PreviousRides({super.key, this.parentScaffoldKey});

  @override
  State<PreviousRides> createState() => _PreviousRidesState();
}

class _PreviousRidesState extends State<PreviousRides> {
  List<RideHistory> ridehistory = [
    RideHistory(name: "Sam", price: "40", rating: 4),
    RideHistory(name: "Ram", price: "30", rating: 1.4),
    RideHistory(name: "Aam", price: "540", rating: 4.4),
    RideHistory(name: "Rahul", price: "140", rating: 2),
    RideHistory(name: "Test User", price: "80", rating: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppEnvironment.navigator
            .pushReplacementNamed(GeneralRoutes.bottombar, arguments: 0);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.appColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leadingWidth: 40.w,
          leading: InkWell(
            onTap: () {
              AppEnvironment.navigator
                  .pushReplacementNamed(GeneralRoutes.bottombar, arguments: 0);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Previous rides",
                style: AppText.text18w400.copyWith(
                  color: Colors.black,
                ),
              ),
              sizedBoxWithHeight(30),
              Text(
                "Past",
                style: AppText.text14w400.copyWith(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                padding: EdgeInsets.all(8),
                height: 230.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 155.h,
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                    ),
                    Text(
                      "1 Feb, 9:30 AM",
                      style: AppText.text14w400.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "'\$10",
                      style: AppText.text14w400.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppColors.greylight,
                    )),
              ),
              sizedBoxWithHeight(30),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        AppImage(
                          "assets/driver.svg",
                          height: 50.h,
                          width: 50.w,
                        ),
                        sizedBoxWithWidth(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ridehistory.elementAt(index).name,
                              style: AppText.text14w400.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            RatingBar.builder(
                              initialRating:
                                  ridehistory.elementAt(index).rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              ignoreGestures: true,
                              allowHalfRating: true,
                              unratedColor: Colors.grey,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding: EdgeInsets.symmetric(horizontal: .0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 10,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "\$ ${ridehistory.elementAt(index).price}",
                          style: AppText.text14w400.copyWith(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        sizedBoxWithWidth(10),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.black,
                          size: 15,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 0.9,
                      color: AppColors.greylight,
                    );
                  },
                  itemCount: ridehistory.length)
            ],
          ),
        ),
      ),
    );
  }
}