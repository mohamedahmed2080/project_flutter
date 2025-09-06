import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: ListView(
        children: [
          _buildCartItem("Red Apple", "assets/images/apple.png", 2, "\$4.99 /kg"),
          _buildCartItem("Original Banana", "assets/images/banana.png", 2, "\$5.99 /kg"),
          _buildCartItem("Avocado Bowl", "assets/images/avocado.png", 1, "\$24 /st"),
          _buildCartItem("Salmon", "assets/images/salmon.png", 2, "\$50 /kg"),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {},
          child: const Text("CheckOut"),
        ),
      ),
    );
  }

  Widget _buildCartItem(String title, String img, int qty, String price) {
    return ListTile(
      leading: Image.asset(img, width: 40),
      title: Text(title),
      subtitle: Text(price),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
          Text("$qty"),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}