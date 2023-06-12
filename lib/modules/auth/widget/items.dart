// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app2/route/router_name.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/app_cubit.dart';
import '../../../bloc/app_state.dart';
import '../../../themes/spacing.dart';

class Item {
  final String id;
 final String linkImage;
 final  String name;
 final  String description;
 final  double price;
  double quantity=0;
  Item( {
    required this.id,
    required this.linkImage,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity, 
  });


  Item copyWith({
    String? id,
    String? linkImage,
    String? name,
    String? description,
    double? price,
    double? quantity
  }) {
    return Item(
     id: id ?? this.id,
     linkImage: linkImage ?? this.linkImage,
     name: name ?? this.name,
    description:  description ?? this.description,
     price: price ?? this.price,
     quantity: quantity ?? this.quantity,
    );
  }
}
class CartCubit extends Cubit<List<Item>> {
  CartCubit() : super([]);

  void addProduct(Item item) {
  final updatedState = List<Item>.from(state);

  if (updatedState.any((e) => e.id == item.id)) {
   
    final index = updatedState.indexWhere((e) => e.id == item.id);
    final existingItem = updatedState[index];
    updatedState[index] = existingItem.copyWith(quantity: existingItem.quantity + 1);
  } else {
  
    updatedState.add(item.copyWith(quantity: 1));
  }

  emit(updatedState);
}

    


  void incrementQuantity(Item item) {
    final List<Item> newState = [];
    for (final e in state) {
      if (e.id == item.id) {
        e.quantity += 1;
        newState.add(e);
        continue;
      }
      newState.add(e);

    }
    emit(newState);
  }
   void decrementQuantity(Item item) {
    final List<Item> newState = [];
    for (final e in state) {
      if (e.id == item.id) {
        e.quantity -= 1;
        newState.add(e);
        continue;
      }
      newState.add(e);
    }
    emit(newState);
  }
}
   


class ItemCarousel extends StatelessWidget {
   ItemCarousel({Key? key}) : super(key: key);



final Items=[
      Item(id:"1",linkImage:'assets/images/folo 1.png', name:'Đầu tư', description: 'description', price:50.000,quantity:0),
      Item(id:"2",linkImage:'assets/images/folo 2.png', name:'Tủ lạnh', description: 'description', price:100.000,quantity:0),
      Item(id:"3",linkImage:'assets/images/folo 3.png', name:'Tủ đứng', description: 'description', price:150.000,quantity:0),
      Item(id:"4",linkImage:'assets/images/folo 4.png', name:'Dược phẩm', description: 'description', price:200.000,quantity:0),
      Item(id:"5",linkImage:'assets/images/folo 1.png', name:'Tiết Kiệm', description: 'description', price:250.000,quantity:0)
];

  void addItemToCard(Item item, BuildContext context) {
 
    final cartCubit = context.read<CartCubit>();
    cartCubit.addProduct(item);
    Navigator.pushNamed(context, RouteName.cart);
}

// ignore: non_constant_identifier_names
void _Itemselect(Item item,BuildContext context){
final cartCubitSelect=context.read<CartCubit>();
print('${item.name}');
cartCubitSelect.addProduct(item);
Navigator.pushNamed(context, RouteName.product);
}




  
  @override
  Widget build(BuildContext context) {
    return 
       BlocBuilder<AppCubit,AppState>(
        builder: (context, state) {return 
          CarouselSlider.builder(
          key: UniqueKey(),
          itemCount: Items.length,
          itemBuilder: (context, index, realIndex) {
            final item =Items[index];

            return Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              width: 196,
              height: 337,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 14, 8, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                      _Itemselect(item, context);
                     
                      print(state);
                      },
                      child: AspectRatio(
                        aspectRatio: 170 / 200,
                        child: Image.asset(item.linkImage),
                      ),
                    ),
                    Spacing.h8,
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Spacing.h12,
                    Text(item.description),
                    Spacing.h12,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                      addItemToCard(item, context);
                      print(state);
                          },
                          child: const Icon(Icons.add_circle_sharp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay:true,
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: 196 / 200,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        )
        ;
        
      },
    )
    ;
  }
}