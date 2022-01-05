import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/mixture/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double? height;
  void Function()? onTap;
  final Widget? child;
  final AlignmentGeometry? alignment;
   HomeHeader({Key? key,this.alignment,this.child,this.onTap,this.height ,required this.image, required this.textTop, required this.textBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  ClipPath(
      clipper:MyClipper(),
      child:   Container(
        padding: const EdgeInsets.only(left: 40,top: 50,right: 20),
        height:height??size.height * 45/100,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff3383cd),
              Color(0xff11249f),
            ],
          ),
          image: DecorationImage(
            image:AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>anyName()))
              },
              child: Align(
                  alignment:alignment??Alignment.topRight,
                  child: GestureDetector(
                    onTap: onTap,
                      child: child,
                  ),
              ),
            ),

            Expanded(child: Container(
              width:size.width,
              child: Stack(
                children: [
                  SvgPicture.asset(image,width: 230,fit: BoxFit.cover,alignment:Alignment.topCenter,),
                  Positioned(
                    top:30,
                    left: 160,
                    child: Text("$textTop \n$textBottom",style: kHeadingTextStyle.copyWith(color: Colors.white)
                    ),
                  ),
                ],
              ),
            ),
            ),
          ],
        ),

      ),
    );
  }
}



class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}