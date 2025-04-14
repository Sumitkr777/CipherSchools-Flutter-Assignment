// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../services/auth_service.dart';
// import '../../routes/app_routes.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // Mock data for user profile
//   String _userName = 'Sumit Kumar2';
//   String? _userPhotoUrl;
//   final AuthService _authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: Color(0xFFF5F5F5),
//           statusBarIconBrightness: Brightness.dark,
//         ),
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         children: [
//           // Profile header with photo, name and edit button
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
//             child: Row(
//               children: [
//                 // Profile image with purple border
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: const Color(0xFF9662F1),
//                       width: 2,
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(40),
//                     child:
//                         _userPhotoUrl != null
//                             ? Image.network(_userPhotoUrl!, fit: BoxFit.cover)
//                             : Image.asset(
//                               'assets/images/profile_placeholder.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 // Username and full name
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Username',
//                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         _userName,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Edit button
//                 IconButton(
//                   icon: const Icon(Icons.edit_outlined, color: Colors.grey),
//                   onPressed: () {
//                     // Handle edit profile
//                   },
//                 ),
//               ],
//             ),
//           ),

//           // White card with menu options
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               children: [
//                 // Account option
//                 _buildProfileOption(
//                   icon: Icons.person_outline,
//                   label: 'Account',
//                   color: const Color(0xFF9662F1),
//                   onTap: () {
//                     // Handle account tap
//                   },
//                 ),

//                 // Settings option
//                 _buildProfileOption(
//                   icon: Icons.settings,
//                   label: 'Settings',
//                   color: const Color(0xFF9662F1),
//                   onTap: () {
//                     // Handle settings tap
//                   },
//                 ),

//                 // Export Data option
//                 _buildProfileOption(
//                   icon: Icons.upload_outlined,
//                   label: 'Export Data',
//                   color: const Color(0xFF9662F1),
//                   onTap: () {
//                     // Handle export data tap
//                   },
//                 ),

//                 // Logout option
//                 _buildProfileOption(
//                   icon: Icons.logout,
//                   label: 'Logout',
//                   color: Colors.red.shade200,
//                   onTap: _signOut,
//                   isLast: true,
//                 ),
//               ],
//             ),
//           ),

//           const Spacer(),

//           // Bottom navigation bar - rendered in HomeScreen
//         ],
//       ),
//       // Note: The bottom navigation is already implemented in HomeScreen
//     );
//   }

//   // Helper method to build profile menu options
//   Widget _buildProfileOption({
//     required IconData icon,
//     required String label,
//     required Color color,
//     required VoidCallback onTap,
//     bool isLast = false,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         child: Row(
//           children: [
//             // Icon with colored background
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(icon, color: color, size: 20),
//             ),
//             const SizedBox(width: 16),
//             // Label
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: isLast ? FontWeight.w600 : FontWeight.w500,
//                 color: isLast ? Colors.red : Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Sign out method
//   Future<void> _signOut() async {
//     try {
//       await _authService.signOut();
//       if (mounted) {
//         Navigator.pushNamedAndRemoveUntil(
//           context,
//           AppRoutes.signup,
//           (route) => false,
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error signing out: ${e.toString()}')),
//       );
//     }
//   }
// }
