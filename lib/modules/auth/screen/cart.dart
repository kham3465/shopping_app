import 'package:app2/modules/auth/widget/items.dart';
import 'package:app2/themes/app_colors.dart';
import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../route/router_name.dart';



class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

 void _plus(BuildContext context, Item item) {
    final cartCubit = context.read<CartCubit>();
    
    cartCubit.incrementQuantity(item);
  }
  void _down(BuildContext context, Item item) {
    final cartCubit = context.read<CartCubit>();
    cartCubit.decrementQuantity(item);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary100,
      title: Text("Cart Screen"),

       
        
      ),
      body: SafeArea(child: 
      BlocBuilder<CartCubit, List<Item>>(
        builder: (context, state) {
          print(state);
final items=state;
        

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Container(
                child: Row(
                  children: [Spacing.v12,
                    Icon(Icons.check_box_outline_blank),
                    Spacing.v24,
                    Image.asset(item.linkImage, width: 129,
                height: 148,),Spacing.v24,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                        Spacing.h32,
                      Text(
                          '\$${item.price}',
                          style: TextStyle(color: AppColors.primary500,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                       
                        DecoratedBox(

                          decoration:BoxDecoration(border: Border.all(color: AppColors.primary500)),
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // Spacing.v102,
                                InkWell(
                                  child: const Icon(Icons.remove),
                                  onTap: () =>{
                                    _plus(context, item),
                                    
                                  }
                                      // _handleAddProduct(context, product),
                                ),
                                const SizedBox(
                                  
                                  width: 16,
                                ),
                                Text('${item.quantity}'),
                                InkWell(
                                  child: Icon(Icons.add),
                                  onTap: () => {
                                    _down(context, item)
                                  },
                                  )
                              ],
                            ),
                        ),
                          ],
                        )
                      ],
                    )
              
                );
                // leading: Image.asset(item.linkImage),
                // title: Text(item.name),
                // subtitle: Text(item.description),
                // trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                
                // onTap: () {
               
                // },

                
              
            },
          );
        },
      ),
    ));
  }
}
