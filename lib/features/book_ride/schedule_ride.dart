import 'package:flutter/material.dart';
import 'package:multitrip_user/shared/shared.dart';
import 'package:multitrip_user/shared/ui/common/spacing.dart';
import 'package:multitrip_user/themes/app_text.dart';

class ScheduleRide extends StatefulWidget {
  const ScheduleRide({super.key});

  @override
  State<ScheduleRide> createState() => _ScheduleRideState();
}

class _ScheduleRideState extends State<ScheduleRide> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final ThemeData theme = Theme.of(context);

    final TimeOfDay? picked = await showTimePicker(
      builder: (BuildContext context, child) {
        return Theme(
          data: theme.copyWith(
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            )),
            colorScheme: theme.colorScheme.copyWith(
              primary: Colors.green,
              onPrimary: Colors.white,
            ),
            textTheme: theme.textTheme.copyWith(),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);

    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, child) {
          return Theme(
            data: theme.copyWith(
              dialogBackgroundColor: Colors.white,
              textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              )),
              colorScheme: theme.colorScheme.copyWith(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              textTheme: theme.textTheme.copyWith(),
            ),
            child: child!,
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            AppEnvironment.navigator.pop();
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Schedule a ride",
              style: AppText.text22w500.copyWith(color: Colors.black),
            ),
            sizedBoxWithHeight(80),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Text(
                "Thu, 2 Feb",
                style: AppText.text14w400.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            sizedBoxWithHeight(20),
            Divider(
              color: Colors.black,
              thickness: 0.4,
            ),
            sizedBoxWithHeight(20),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Text(
                "11:10 am - 11:20 am",
                style: AppText.text14w400.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            sizedBoxWithHeight(80),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 15.h,
              ),
              child: Center(
                child: Text(
                  "Set pickup time",
                  style: AppText.text15w500.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
