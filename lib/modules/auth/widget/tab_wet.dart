import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../themes/spacing.dart';

class wigetWet extends StatelessWidget {
  const wigetWet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 400,
  child: Column(
    children: [
    
Spacing.h16,
SfRadialGauge(
axes: <RadialAxis>[
RadialAxis(
  minimum: 0,
  maximum: 100,
  interval: 10,
  ranges: <GaugeRange>[
    GaugeRange(
      startValue:0,
       endValue:20,
       color: Color.fromRGBO(204, 154, 164,1),
      ),
      GaugeRange(
      startValue:20,
       endValue:40,
       label: 'Dry',
       color: Color.fromRGBO(204, 154, 164,1),
      ),
      GaugeRange(
      startValue:40,
       endValue:60,
       label: 'Comfort',
       color: Color.fromRGBO(143,192,192,1),
      ),
        GaugeRange(
      startValue:60,
       endValue:100,
       label: 'Wet',
       color: Color.fromRGBO(191,201,220,1),
      ),
        
  ],
  pointers: <GaugePointer>[
    NeedlePointer(
      value:50,
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
Text('Công tơ đo độ âm',style: TextStyle(color: Color.fromARGB(255, 128, 97, 4),fontSize: 18,fontWeight: FontWeight.w700),
)
      ],
    ) )]);
  }
}