import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text("Change Password"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("My Cards"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const Divider(),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            secondary: const Icon(Icons.notifications),
            title: const Text("Notifications"),
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
            trailing: Text("English"),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}