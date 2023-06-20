import 'package:app2/modules/auth/widget/tab_wet.dart';
import 'package:app2/themes/spacing.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:app2/modules/auth/widget/tab_air.dart';
 import 'package:flutter/gestures.dart';

  import 'package:flutter/rendering.dart';

import '../widget/tab_temperature.dart';
class Air extends StatelessWidget {
  const Air({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabAir(),
    );
  }
}
//  void _getData(){
//   final db = FirebaseFirestore.instance;
//   final rel=db.collection('data').get().then((value) =>print(value) );

//  }

class TabAir extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabAir();
  }

}



class _TabAir extends State<TabAir> with TickerProviderStateMixin {
   late TabController _tabController;
    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 3, vsync: this);
      _tabController.animateTo(2);
    }
  
    static const List<Tab> _tabs = [
      const Tab(icon: Icon(Icons.air), child: const Text('Không khí')),
      const Tab(icon: Icon(Icons.water_drop_outlined), text: 'Độ ẩm'),
      const Tab(icon: Icon(Icons.thermostat), text: 'Nhiệt độ'),

    ];
  
    static  List<Widget> _views = [
      const Center(child:const wigetAir()),
      const Center(child: const wigetWet()),
      const Center(child: const TabTemperature()),
    ];
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                labelColor: Color.fromARGB(255, 13, 99, 197),
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
                overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blue;
                  } if (states.contains(MaterialState.focused)) {
                    return Colors.orange;
                  } else if (states.contains(MaterialState.hovered)) {
                    return Colors.pinkAccent;
                  }
  
                  return Colors.transparent;
                }),
                indicatorWeight: 10,
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(5),
                indicator: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
                isScrollable: true,
                physics: BouncingScrollPhysics(),
                onTap: (int index) {
                  print('Tab $index is tapped');
                },
                enableFeedback: true,
                // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
                // controller: _tabController,
                tabs: _tabs,
              ),
              title: const Text('\t\t\t\t\t\t\t\t\t\tChúc bạn một ngày tốt lành',style: TextStyle(color: Colors.blue),),
              backgroundColor: Color.fromARGB(255, 241, 241, 241),
            ),
            body:  TabBarView(
              physics: BouncingScrollPhysics(),
              // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
              // controller: _tabController,
              children: _views,
            ),
          ),
        ),
      );
    }
  }
