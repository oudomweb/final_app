// import 'package:flutter/material.dart';
// import 'login_screen.dart';

// class UserManagementScreen extends StatelessWidget {
//   const UserManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Colors.teal.shade900, Colors.grey[900]!],
//         ),
//       ),
//       child: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           const Text(
//             'User Management',
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const SizedBox(height: 16),
//           Card(
//             color: Colors.grey[800],
//             child: ListTile(
//               leading: const Icon(Icons.logout, color: Colors.teal),
//               title: const Text(
//                 'Log Out',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onTap: () {
//                 // Navigate back to LoginScreen and clear the navigation stack
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => const LoginScreen()),
//                   (Route<dynamic> route) => false, // Remove all previous routes
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_screen.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = const FlutterSecureStorage();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.teal.shade900, Colors.grey[900]!],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'User Management',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.grey[800],
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.teal),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                // Clear the login state
                await storage.delete(key: 'isLoggedIn');
                // Navigate back to LoginScreen and clear the navigation stack
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}