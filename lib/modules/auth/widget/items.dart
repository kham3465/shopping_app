// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes/spacing.dart';

class Item {
 final String linkImage;
 final  String name;
 final  String description;
 final  double price;
  Item({
    required this.linkImage,
    required this.name,
    required this.description,
    required this.price,
  });
}
class ItemState {
  final  List<Item> Items;
 List<Item>? selecteItem;
 final Item? selecteProducts;

  ItemState({
    this.Items=const [],
    this.selecteItem=const [],
   this.selecteProducts,
  });


ItemState copyWith({  List<Item>? Items,List<Item>? selecteItem,Item? selecteProducts }){
  return ItemState(
Items: Items?? this.Items,
selecteItem: selecteItem?? this.selecteItem,
 selecteProducts: selecteProducts?? this.selecteProducts,
  );
}
}

class ItemCubit extends Cubit<ItemState>{
  ItemCubit():super(ItemState(
    Items: [
      Item(linkImage:'assets/images/folo 1.png', name:'Item 1', description: 'description', price:50.000),
      Item(linkImage:'assets/images/folo 2.png', name:'Item 2', description: 'description', price:100.000),
      Item(linkImage:'assets/images/folo 3.png', name:'Item 3', description: 'description', price:150.000),
      Item(linkImage:'assets/images/folo 4.png', name:'Item 4', description: 'description', price:200.000),
      Item(linkImage:'assets/images/folo 1.png', name:'Item 5', description: 'description', price:250.000)
    ], 
  ));
  void selectItem(Item item){
 List<Item>? selectedItems=state.selecteItem;
    // if(selectedItems.contains(item)){
    //   selectedItems.remove(item);
    // }
    // else{
     selectedItems = List.from(selectedItems ?? [])..add(item);

  // }
    emit(state.copyWith(selecteItem:selectedItems));
  }
  void selecteProduct(Item item){
emit(state.copyWith(selecteProducts:item ));
  }
  
}

class ItemCarousel extends StatelessWidget {
  const ItemCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        return CarouselSlider.builder(
          key: UniqueKey(),
          itemCount: state.Items.length,
          itemBuilder: (context, index, realIndex) {
            final item = state.Items[index];

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
                        context.read<ItemCubit>().selecteProduct(item);
                        Navigator.pushNamed(context, '/product');
                        print(state.selecteItem);
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
                        GestureDetector(
                          onTap: () {
                            context.read<ItemCubit>().selectItem(item);
                            Navigator.pushNamed(context, '/cart');
                            print(state.selecteItem.toString());
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
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 1),
            aspectRatio: 196 / 200,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        );
      },
    );
  }
}
