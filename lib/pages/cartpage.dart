import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/providers/cartprovider.dart';
//import 'package:shop_app/globalvariables.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

// Provider // Provide one value
// ChangeNotifierProvider -> change the value and notify the widgets listening to it
// FutureProvider -> listen to future , subscribe to them and show  changes
// StreamProvider -> Provide a Stream

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<CartProvider>(context).cart;
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem["imageUrl"] as String),
              radius: 30,
            ),
            title: Text(
              cartItem["title"] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text("Size:${cartItem["size"].toString()}"),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text("Delete Product"),
                      content: const Text("Remove Product From The Cart?"),
                      actions: [
                        CupertinoDialogAction(
                          child: TextButton(
                            onPressed: () {
                              // Provider.of<CartProvider>(context, listen: false)
                              //    .removeProduct(cartItem);
                              context.read<CartProvider>().removeProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        CupertinoDialogAction(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "No",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}
