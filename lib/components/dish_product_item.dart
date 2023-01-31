import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishProductItem extends StatelessWidget {
  const DishProductItem(
      {this.isVeg = true,
      required this.wegith,
      required this.imageUrl,
      required this.title,
      required this.oldPrice,
      required this.newPrice,
      required this.description,
      this.buttonIcon = Icons.add,
      Key? key})
      : super(key: key);

  final bool isVeg;
  final String wegith;
  final String imageUrl;
  final String title;
  final String oldPrice;
  final String newPrice;
  final String description;
  final IconData buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 230,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 15,
            spreadRadius: 0.1,
            color: Color.fromARGB(255, 179, 179, 179),
          )
        ],
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _productTypeAndWeight(),
          _productImage(),
          _title(),
          const SizedBox(height: 5),
          _price(),
          const SizedBox(height: 5),
          _addButton(),
          const SizedBox(height: 5),
          _description(),
        ],
      ),
    );
  }

  Widget _productTypeAndWeight() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            isVeg
                ? 'assets/icons/veg-indicator.svg'
                : 'assets/icons/non-veg-indicator.svg',
            semanticsLabel: 'A red up arrow',
            width: 18,
            height: 18,
          ),
          Text(
            wegith,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productImage() {
    return Flexible(
      flex: 2,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(imageUrl),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            title,
            maxLines: 2,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          oldPrice,
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          newPrice,
          style: const TextStyle(),
        ),
      ],
    );
  }

  Widget _addButton() {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(buttonIcon, size: 15),
            const SizedBox(width: 3),
            const Text("Add"),
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Text(
          description,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.grey.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
