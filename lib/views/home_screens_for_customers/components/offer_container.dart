import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/const/images.dart';
import 'package:repairoo/const/svg_icons.dart';
import 'package:repairoo/const/text_styles.dart';
import 'package:repairoo/views/home_screen_for_tech/components/bid_bottom_sheet.dart';
import 'package:repairoo/views/home_screens_for_customers/search_offer_view.dart';
import 'package:repairoo/widgets/custom_button.dart';
import 'package:repairoo/widgets/my_svg.dart';

class OfferContainer extends StatefulWidget {
  const OfferContainer({super.key, required this.image, required this.name, required this.experience, required this.price, required this.rating, required this.reviews});

  final String image;
  final String name;
  final String experience;
  final String price;
  final String rating;
  final String reviews;

  @override
  State<OfferContainer> createState() => _OfferContainerState();
}

class _OfferContainerState extends State<OfferContainer> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.w),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: 90.w,
            height: 76.h,
            margin: EdgeInsets.only(right: 9.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.fill)
            ),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.name, style: jost600(16.sp, AppColors.secondary),),
                  SizedBox(
                    child: Row(
                      children: [
                        Image.asset(AppImages.star, height: 18.h, width: 18.w),
                        SizedBox(width: 4.w,),
                        Text(widget.rating, style: jost600(14.sp, Colors.white),),
                        SizedBox(width: 3.w,),
                        Text("(${widget.reviews})", style: jost(13.sp, AppColors.lightGrey, FontWeight.w300),),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 3.h,),
              Text(widget.experience, style: jost500(10.sp, AppColors.secondary),),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text: widget.price, style: jost600(24.sp, AppColors.secondary)),
                      TextSpan(text: "AED",style: jost(13.sp, AppColors.lightGrey, FontWeight.w300))
                    ]
                  )),
                  SizedBox(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(SearchOfferView(
                                name: widget.name,
                                image: widget.image,
                                experience: widget.experience,
                                price: widget.price,
                                rating: widget.rating,
                                reviews: widget.reviews
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8.w),
                            width: 60.w,
                            height: 27.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              color: AppColors.secondary,
                            ),
                            alignment: Alignment.center,
                            child: Text("Accept", style: jost500(13.sp, AppColors.primary),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.bottomSheet(
                              isScrollControlled: true,
                              isDismissible: true,
                              enableDrag: true,
                              BidBottomSheet(),
                            );
                          },
                          child: Container(
                            width: 60.w,
                            height: 27.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(
                                color: AppColors.secondary
                              ),
                              color: AppColors.buttonGrey,
                            ),
                            alignment: Alignment.center,
                            child: Text("Bid", style: jost500(13.sp, AppColors.secondary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ))
        ],
      ),
    );
  }
}
