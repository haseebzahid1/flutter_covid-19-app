import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/mixture/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper:MyClipper(),
              child:   Container(
                padding: const EdgeInsets.only(left: 40,top: 50,right: 20),
                height: size.height * 45/100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff3383cd),
                      Color(0xff11249f),
                    ],
                  ),
                  image: DecorationImage(
                    image:AssetImage("assets/images/virus.png",),
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
                        alignment: Alignment.topRight,
                          child: SvgPicture.asset("assets/icons/menu.svg")
                      ),
                    ),

                    Expanded(child: Container(
                      width:size.width,
                      child: Stack(
                        children: [
                          SvgPicture.asset("assets/icons/Drcorona.svg",width: 230,fit: BoxFit.cover,alignment:Alignment.topCenter,),
                          Positioned(
                            top:30,
                            left: 160,
                            child: Text("All you need \nis stay at home",style: kHeadingTextStyle.copyWith(color: Colors.white)
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  ],
                ),

              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 28),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xffE5e5e5)
                )
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/maps-and-flags.svg",),
                  const SizedBox(height: 20,),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Indonesia",
                      items: ['Indonesia', 'Bangladesh', 'United States', 'Japan']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(text:const TextSpan(
                        children: [
                          TextSpan(text: "Case Update\n",style: kTitleTextstyle),
                          TextSpan(text: "Newest update March 28",style: TextStyle(color: kTextLightColor)),
                        ],
                      )),
                      const Spacer(),
                      const Text("See details",style: const TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(offset: const Offset(0,4),blurRadius: 30,color: kShadowColor),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Counter(color: kInfectedColor, number: 33, title: 'Infected',),
                        Counter(color: kDeathColor, number: 67, title: 'Death',),
                        Counter(color: kRecovercolor, number: 48, title: 'Recovered',),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: const [
                      Text("Spread of Virus",style:kTitleTextstyle),
                      Spacer(),
                      Text("See details",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,10),
                          blurRadius: 30,
                          color: kShadowColor,
                        )
                      ]
                    ),
                    child: Image.asset("assets/images/map.png",fit: BoxFit.cover,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}


class Counter extends StatelessWidget {
  final String title;
  final int number;
  final Color color;
  const Counter({Key? key, required this.title, required this.number, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.26),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(
                  color: color,
                  width: 2,
                )
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text("$number",style:   TextStyle(
          fontSize: 40,
          color: color,
        ),),
         Text(title,style: kSubTextStyle,),
      ],
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