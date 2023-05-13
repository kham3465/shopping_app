import 'package:app2/modules/auth/widget/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app2/route/app_router.dart';

import '../../../themes/spacing.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ItemCubit, ItemState>(
        listener: (context, state) {
          if (state.selecteItem == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No product selected')),
            );
          }
        },
        builder: (context, state) {
          if (state.selecteItem == null) {
            return Text('rong');
          } else {
            return ListView.builder(
              itemCount: state.selecteItem?.length,
              itemBuilder: (context, index) {
                final itemchose = state.selecteItem![index];
                return Container(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 196,
                    height: 337,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 14, 8, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 170 / 200,
                              child: Image.asset(itemchose.linkImage),
                            ),
                            Spacing.h8,
                            Text(
                              itemchose.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Spacing.h12,
                            Text(itemchose.price.toString())
                          ],
                        )));
              },
            );
          }
        },
      ),
    );
  }
}
