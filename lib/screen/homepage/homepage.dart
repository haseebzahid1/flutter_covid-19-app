import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/mixture/constant.dart';
import 'package:flutter_covid_19_app/screen/info_screen/info_screen.dart';
import 'package:flutter_covid_19_app/screen/widget/counter.dart';
import 'package:flutter_covid_19_app/screen/widget/header.dart';
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
            HomeHeader(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>InfoScreen(),));
            },
                image: "assets/icons/Drcorona.svg", textTop: 'All your need',textBottom: 'is stay at home',
              child: Icon(Icons.dehaze,color: Colors.white,),
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
                  MainCounter(),
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
