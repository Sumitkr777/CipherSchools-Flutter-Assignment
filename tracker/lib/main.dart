import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes/app_routes.dart';
import 'views/auth/signup_screen.dart';
import 'views/splash/splash_screen.dart';
import 'views/home/home_screen.dart';
import 'views/expense/add_expense_screen.dart';
import 'views/income/add_income_screen.dart';
import 'views/profile/profile_screen_new.dart';
import 'views/initial/intial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
      appId: '1:123456789000:android:1234567890123456789012',
      messagingSenderId: '123456789000',
      projectId: 'cipherx-temp',
      storageBucket: 'cipherx-temp.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CipherX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6C47FF),
        fontFamily: 'ABeeZee',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: const Color(0xFF6C47FF)),
          ),
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.initial: (context) => const InitialScreen(),
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.signup: (context) => const SignUpScreen(),
        AppRoutes.landing: (context) => const HomeScreen(),
        AppRoutes.addExpense: (context) => const AddExpenseScreen(),
        AppRoutes.addIncome: (context) => const AddIncomeScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
      },
    );
  }
}
