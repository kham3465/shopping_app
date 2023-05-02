import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import '../screen/home.dart';

class ProductSelectionCubit extends Cubit<int> {
  ProductSelectionCubit() : super(0);

  void selectProduct(int index) => emit(index);
}

class MyCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'linkImage': 'assets/images/folo 1.png',
      'itemName': 'Item 1',
      'description': 'Description 1',
      'price': '\$10.00',
    },
    {
      'linkImage': 'assets/images/folo 1.png',
      'itemName': 'Item 2',
      'description': 'Description 2',
      'price': '\$20.00',
    },
    {
      'linkImage': 'assets/images/folo 1.png',
      'itemName': 'Item 3',
      'description': 'Description 3',
      'price': '\$30.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectionCubit, int>(
      builder: (context, state) {
        return CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, index, realIndex) {
            final item = items[index];
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
                      child: Image.asset(
                        item['linkImage'],
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacing.h8,
                    Text(
                      item['itemName'],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Spacing.h12,
                    Text(item['description']),
                    Spacing.h12,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['price'],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                            context
                                .read<ProductSelectionCubit>()
                                .selectProduct(index);
                          },
                          child: Icon(Icons.add_circle_sharp),
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
            autoPlayInterval: Duration(seconds: 3),
            aspectRatio: 196 / 200,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        );
      },
    );
  }
}
