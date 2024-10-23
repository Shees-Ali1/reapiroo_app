import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:repairoo/const/text_styles.dart';
import 'package:repairoo/views/auth/otp_verification/otp_verification.dart';

import '../../../const/color.dart';
import '../../../const/images.dart';
import '../../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // FocusNode _phoneFocusNode = FocusNode();
  // @override
  // void dispose() {
  //   _phoneFocusNode
  //       .dispose(); // Dispose of the focus node when the widget is disposed
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                height: 85.h,
                width: 267.w,
                AppImages.logo,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              'Login or Signup',
              style: jost700(35.sp, AppColors.secondary),
            ),
            SizedBox(height: 76.h,),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: IntlPhoneField(
                flagsButtonPadding: EdgeInsets.only(left: 13.w),
                // focusNode: _phoneFocusNode,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                showDropdownIcon: false,
                decoration: InputDecoration(
                  hintText: 'Your phone number',
                  filled: true,
                  fillColor: Color(0xffFAFAFA),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  counterText: '',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'jost',
                      fontSize: 14.65.sp,
                      fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.31.r),
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Set the enabled border color to white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.31.r),
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Set the focused border color to white
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(13.31.r),
                  ),
                ),
                initialCountryCode: 'AE', // Set initial country to UAE
                onChanged: (phone) {
                  print(phone.completeNumber); // Get the complete phone number
                },
              ),
            ),
            SizedBox(height: 76.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomElevatedButton(
                text: 'Login',
                textColor: AppColors.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OtpAuthenticationView(); // Replace with your desired screen/widget
                      },
                    ),
                  );

                  // Button action
                },

                backgroundColor: AppColors.secondary, // Custom background color
              ),
            )
          ],
        ),
      ),
    );
  }
}
