import 'package:flutter/material.dart';



class CategoriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"name": "Fruits", "icon": Icons.grain, "color": Colors.purple[200]},
    {"name": "Vegetables", "icon": Icons.local_florist, "color": Colors.orange[200]},
    {"name": "Meat", "icon": Icons.set_meal, "color": Colors.red[200]},
    {"name": "Fish", "icon": Icons.water, "color": Colors.pink[200]},
    {"name": "Sea food", "icon": Icons.set_meal_outlined, "color": Colors.amber[200]},
    {"name": "Juice", "icon": Icons.local_drink, "color": Colors.green[200]},
    {"name": "Egg & Milk", "icon": Icons.egg, "color": Colors.blue[200]},
    {"name": "Ice cream", "icon": Icons.icecream, "color": Colors.pink[100]},
    {"name": "Cake", "icon": Icons.cake, "color": Colors.orange[300]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Box
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.brown),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Grid
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: category["color"],
                        child: Icon(category["icon"],
                            size: 35, color: Colors.brown),
                      ),
                      SizedBox(height: 8),
                      Text(
                        category["name"],
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.brown,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}