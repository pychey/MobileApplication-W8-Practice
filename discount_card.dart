import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: EdgeInsets.all(20), 
          child: ShopCart(price: 100, discountPercent: 25),
        ),
      ),
    );
  }
}

class ShopCart extends StatefulWidget {
  const ShopCart({
    super.key, 
    required this.price, 
    required this.discountPercent,
  });

  final int price;
  final int discountPercent;

  @override
  State<ShopCart> createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  bool hasDiscount = false;
  Color get backgroundColor => hasDiscount ? Colors.pinkAccent : Color(0xff333333);
  int get finalPrice => hasDiscount ? (widget.price * (100 - widget.discountPercent) / 100 ).toInt() : widget.price;
  String get finalPriceLabel => '\$ $finalPrice';
  String get discountLabel => hasDiscount ? 'Discount !' : 'No Discount';
  Color get buttonColor => hasDiscount ? Colors.pinkAccent : Color(0xff333333);
  String get buttonLabel => hasDiscount ? 'Cancel Discount' : 'Apply Discount';

  void applyDiscount() {
    setState(() {
      hasDiscount = !hasDiscount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(finalPriceLabel, style: TextStyle(color: Colors.white),),
          Text(discountLabel, style: TextStyle(color: Colors.white),),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.white),
              backgroundColor: buttonColor,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: applyDiscount, 
            child: Text(buttonLabel)
          )
        ],
      ),
    );
  }
}