import 'package:flutter/material.dart';

void main() {
  runApp(MyOrdersApp());
}

class MyOrdersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrdersScreen(),
    );
  }
}

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.orange),
        centerTitle: true,
        title: Text(
          "Orders",
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          indicatorWeight: 3,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.brown,
          tabs: [
            Tab(text: "Ongoing"),
            Tab(text: "History"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("No ongoing orders")),
          ListView(
            children: [
              buildOrderItem(
                orderId: "#345",
                status: "Delivered",
                statusColor: Colors.green,
                date: "October 26, 2014",
                price: "\$700",
              ),
              buildOrderItem(
                orderId: "#346",
                status: "Cancelled",
                statusColor: Colors.red,
                date: "October 14, 2016",
                price: "\$452",
              ),
              buildOrderItem(
                orderId: "#347",
                status: "Delivered",
                statusColor: Colors.green,
                date: "July 26, 2017",
                price: "\$281",
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.brown,
        currentIndex: 4, // Account tab selected
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

  Widget buildOrderItem({
    required String orderId,
    required String status,
    required Color statusColor,
    required String date,
    required String price,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Icon(Icons.shopping_bag, color: Colors.white),
      ),
      title: Text(
        "Order $orderId",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.w500),
          ),
          Text(date, style: TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: Text(
        price,
        style: TextStyle(
            color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}