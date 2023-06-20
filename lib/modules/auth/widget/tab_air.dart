import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:app2/modules/auth/widget/data_btlvixuly.dart';
import '../../../themes/spacing.dart';

class wigetAir extends StatelessWidget {
  const wigetAir({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 400,
  child: Column(
    children: [
    Container(
      decoration: BoxDecoration(color: Color.fromRGBO(24, 153, 71,1),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))),
      alignment: Alignment.center,
      width: 400,
      height: 80,
    child: Text('\t\t\t\t\t\t\t\t\tBách Khoa\n Hai Bà Trưng,Hà Nội',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w700),)
    ),
    Container(
    
      color: Color.fromRGBO(28, 190, 87, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('US AQI',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w700)),
              Text('160')
            ],
          ),ClipOval(
  child: Image.asset(
    'assets/images/like.jpg',
    width: 100,
    height: 100,
    fit: BoxFit.cover,
  ),
),
Text('warning!',style: TextStyle(color: Color.fromARGB(255, 226, 175, 8),fontSize: 20,fontWeight:FontWeight.w700))
          
        ],
      ),
    ),

    Container(
      height: 100,
      decoration: BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1) ,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))),
      
    child: Column(children: [
      Spacing.h16,
      Text('Cập nhật ngày 13/6/2023 14h30'),
      Spacing.h12,
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('CO2(ug/m^3)',style: TextStyle(color:Colors.blue)),
              Text('300')
            ],
          ),
          Column(
            children: [
              Text('PM2.5(ug/m^3)',style: TextStyle(color:Colors.blue)),
              Text('20')
            ],
          ),
          Column(
            children: [
              Text('CO(ug/m^3)',style: TextStyle(color:Colors.blue),),
              Text('30')
            ],
          )
        ],
      )
    ]),
    )
  ]
  ),
),
Spacing.h16,
SfRadialGauge(
axes: <RadialAxis>[
RadialAxis(
  minimum: 0,
  maximum: 500,
  interval: 50,
  ranges: <GaugeRange>[
    GaugeRange(
      startValue:0,
       endValue:50,
       color: Color.fromRGBO(0, 230, 0,1),
      ),
      GaugeRange(
      startValue:50,
       endValue:100,
       color: Color.fromRGBO(255, 251, 0,1),
      ),
      GaugeRange(
      startValue:100,
       endValue:150,
       color: Color.fromRGBO(255,126,1,1),
      ),
        GaugeRange(
      startValue:150,
       endValue:200,
       color: Color.fromRGBO(254,37,1,1),
      ),
         GaugeRange(
      startValue:200,
       endValue:300,
       color: Color.fromRGBO(156,22,77,1),
      ),
          GaugeRange(
      startValue:300,
       endValue:500,
       color: Color.fromRGBO(128,14,30,1),
      ),
  ],
  pointers: <GaugePointer>[
    NeedlePointer(
      value:160,
      enableAnimation: true,
    )
  ],
  annotations: <GaugeAnnotation>[
GaugeAnnotation(
  widget: Text("160.0",style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),),
  positionFactor: 0.5,
  angle: 90,
  )
  ],
)
],
),
Text('Công tơ đo chỉ số AQI',style: TextStyle(color: Color.fromARGB(255, 128, 97, 4),fontSize: 18,fontWeight: FontWeight.w700),
)
      ],
    ) ;
  }
}