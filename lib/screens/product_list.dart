import 'package:bh_flutter/components/dish_product_item.dart';
import 'package:flutter/material.dart';

class DishProductScreen extends StatefulWidget {
  const DishProductScreen({Key? key}) : super(key: key);

  @override
  State<DishProductScreen> createState() => _DishProductScreenState();
}

class _DishProductScreenState extends State<DishProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deals of the week"),
      ),
      body: GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const DishProductItem(
            isVeg: true,
            wegith: "25gm",
            imageUrl: "assets/images/005_dish.png",
            title: "Chicken Masala",
            oldPrice: "Rs. 460",
            newPrice: "250",
            buttonIcon: Icons.add,
            description:
                "An aspect ratio is a proportional relationship between an image's width and height. Essentially",
          );
        },
      ),
    );
  }
}
