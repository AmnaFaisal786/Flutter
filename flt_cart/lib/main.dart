import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var cart = FlutterCart();

  // Function to show a dialog for editing quantity
  Future<void> _showEditDialog(int index) async {
    TextEditingController _quantityController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Quantity'),
          content: TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Quantity'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Update quantity and dismiss the dialog
                int newQuantity = int.tryParse(_quantityController.text) ?? 0;

                // Check if the new quantity is greater than 0
                if (newQuantity > 0) {
                  // Manually update the quantity for the specific item in the cart
                  cart.cartItem[index].quantity = newQuantity;
                  Navigator.of(context).pop();
                  setState(() {});
                } else {
                  // Handle invalid quantity (less than or equal to 0)
                  // You can show an error message or take appropriate action
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cart.addToCart(
                      productId: cart.cartItem.length + 1,
                      unitPrice: 15.0,
                      quantity: 1,
                      productDetailsObject: {
                        'name': 'New Product',
                        'description': 'This is a new product',
                      },
                    );
                    setState(() {});
                  },
                  child: Text('Add to Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cart.cartItem.isNotEmpty) {
                      cart.decrementItemFromCart(0);
                      setState(() {});
                    }
                  },
                  child: Text('Remove One'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cart.cartItem.isNotEmpty) {
                      cart.incrementItemToCart(0);
                      setState(() {});
                    }
                  },
                  child: Text('Add One'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItem.length,
              itemBuilder: (context, index) {
                var item = cart.cartItem[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(item.productDetails['name']),
                    subtitle: Text(
                      'Price: \$${item.unitPrice} | Quantity: ${item.quantity}',
                    ),
                    // Add a trailing icon button for removing items
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Show edit dialog
                            _showEditDialog(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Remove the item from the cartItem list
                            cart.cartItem.removeAt(index);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
