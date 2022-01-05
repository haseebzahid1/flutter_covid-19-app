import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/mixture/constant.dart';
import 'package:flutter_covid_19_app/model/symptoms.dart';
import 'package:flutter_covid_19_app/screen/homepage/homepage_provider.dart';
import 'package:flutter_covid_19_app/screen/widget/header.dart';
import 'package:provider/provider.dart';
import 'compoent.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return ChangeNotifierProvider<Symptoms>(
      create: (context) => Symptoms(),
      child: InfoScreenWidget(),
    );
  }
}



class InfoScreenWidget extends StatelessWidget {
   InfoScreenWidget({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
    final _provider = Provider.of<Symptoms>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(
                onTap: (){Navigator.of(context).pop();},
                height: size.height * 40/100,image: "assets/icons/coronadr.svg", textTop: 'All your need',textBottom: 'is stay at home',
              child: Icon(Icons.arrow_back,color: Colors.white,),
              alignment: Alignment.topLeft,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Symptoms",style: kTitleTextstyle,),
                  SizedBox(height: 10,),
                  Container(
                    height: size.height * 0.17,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _provider.demoProducts.length,
                      itemBuilder: (context, index){
                        Product demoProductItem = _provider.demoProducts[index];
                        return    Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                               BoxShadow(
                                color: kActiveShadowColor,
                                blurRadius: 20,
                                offset: Offset(0,10),
                              )
                              ]
                          ),
                          child: Column(
                            children: [
                              Image.asset("${demoProductItem.images}",height: 90,),
                              Text("${demoProductItem.title}",style: TextStyle(fontWeight: FontWeight.w600),),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Prevention",style: kTitleTextstyle,),
                  // SizedBox(height: 10,),
                  Container(
                    height: size.height * .50,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index){
                      return PreventCard(size: size,image:"assets/images/wear_mask.png",title:"Wea face mash" ,
                    text: "Since the start of the coronavirus outbreak some places have fully embraced wearing facemarks",
                      );
                    },),
                  ),

                  SizedBox(height: 20,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
