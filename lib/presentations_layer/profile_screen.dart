import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(80),
              color: Colors.grey[200]),
              width: 150,
              height: 150,
              child: Image.asset('assets/images/user.png')),
          const SizedBox(height: 10,),
          Text(
            username,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10,),
          const Divider(
            height: 10,
            thickness: 2.5,
            color: Colors.black,
          ),
          const SizedBox(height: 10,),

          MaterialButton(
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.edit,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Edit Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
