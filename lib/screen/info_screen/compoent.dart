import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/mixture/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreventCard extends StatelessWidget {
  final Size size;
  final String title;
  final String text;
  final String image;
  const PreventCard({Key? key, required this.size, required this.title,required this.image,required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: size.height * 0.20,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: size.height * 0.17,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 24,
                    color: kShadowColor,
                  )
                ]
            ),
          ),
          Image.asset(image,),
          Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                width: size.width -160,
                height: size.height * 0.19,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: kTitleTextstyle.copyWith(fontSize: 16),),
                    Text(text,
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/forward.svg")),
                  ],
                ),
              )
          ),

        ],
      ),
    );
  }
}
