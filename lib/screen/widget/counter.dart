import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/mixture/constant.dart';


class MainCounter extends StatelessWidget {
  const MainCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          CounterWidget(color: kInfectedColor, number: 33, title: 'Infected',),
          CounterWidget(color: kDeathColor, number: 67, title: 'Death',),
          CounterWidget(color: kRecovercolor, number: 48, title: 'Recovered',),
        ],
      ),
    );
  }
}




class CounterWidget extends StatelessWidget {
  final String title;
  final int number;
  final Color color;
  const CounterWidget({Key? key, required this.title, required this.number, required this.color}) : super(key: key);

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


