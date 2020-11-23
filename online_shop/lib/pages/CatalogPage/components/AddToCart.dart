import 'package:flutter/material.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/models/Product.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key, this.productToBuy, 
  }) : super(key: key);

  final Product productToBuy;
  @override
  Widget build(BuildContext context) {
    final cartCounter = Provider.of<CounterForCart>(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.cyan),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.cyan),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false).addOrUpdateItem(productToBuy, cartCounter.value); 
              },
            ),
          ),
          Expanded(
              child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                color: Colors.cyan,
                onPressed: () {},
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}