import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedPeriod = 'Today';
  final List<String> _periods = ['Today', 'Week', 'Month', 'Year'];
  
  final double _accountBalance = 38000;
  final double _income = 50000;
  final double _expenses = 12000;

  int _selectedNavIndex = 0;
  
  // Auth service for accessing user data
  final AuthService _authService = AuthService();
  String _userName = 'S';
  String? _userPhotoUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    // Set default user data to match the design
    setState(() {
      _userName = 'S';
      _userPhotoUrl = null;
    });
  }

  final List<Map<String, dynamic>> _recentTransactions = [
    {
      'type': 'Shopping',
      'description': 'Buy some grocery',
      'amount': -120,
      'time': '10:00 AM',
      'icon': Icons.shopping_basket_outlined,
      'color': Colors.orange,
    },
    {
      'type': 'Subscription',
      'description': 'Disney+ Annual..',
      'amount': -499,
      'time': '03:30 PM',
      'icon': Icons.receipt_long,
      'color': Colors.purple,
    },
    {
      'type': 'Travel',
      'description': 'Chandigarh to De...',
      'amount': -1000,
      'time': '10:00 AM',
      'icon': Icons.directions_car_outlined,
      'color': Colors.blue,
    },
    {
      'type': 'Food',
      'description': 'Lunch',
      'amount': -32,
      'time': '01:30 PM',
      'icon': Icons.fastfood_outlined,
      'color': Colors.red,
    },
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
    
    // Handle profile tab click to show sign out option
    if (index == 3) {
      _showProfileOptions();
    }
  }
  
  void _showProfileOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: _userPhotoUrl != null ? NetworkImage(_userPhotoUrl!) : null,
                child: _userPhotoUrl == null ? const Icon(Icons.person, color: Colors.grey) : null,
              ),
              title: Text(_userName),
              subtitle: const Text('user@example.com'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to settings screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
              onTap: () async {
                Navigator.pop(context);
                await _signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> _signOut() async {
    try {
      await _authService.signOut();
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/signup',
          (route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: ${e.toString()}')),
      );
    }
  }

  void _onPeriodSelected(String period) {
    setState(() {
      _selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color(0xFFFDF6F0),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with profile and notification
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User profile picture
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple.shade100,
                        border: Border.all(
                          color: Colors.purple.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    
                    // Month selector
                    Row(
                      children: [
                        Text(
                          'October',
                          style: TextStyle(
                            color: const Color(0xFF9C68FE),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: const Color(0xFF9C68FE),
                        ),
                      ],
                    ),
                    
                    // Notification bell
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: const Color(0xFF9C68FE),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Account Balance Section
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Account Balance',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹${_accountBalance.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Income & Expense Cards
              Row(
                children: [
                  // Income Card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A884),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Income',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '₹${_income.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Expense Card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF5252),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.arrow_upward, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Expenses',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '₹${_expenses.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Period selector (Today, Week, Month, Year)
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _periods.length,
                  itemBuilder: (context, index) {
                    final period = _periods[index];
                    final isSelected = period == _selectedPeriod;
                    return GestureDetector(
                      onTap: () => _onPeriodSelected(period),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFFEAC0) : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            period,
                            style: TextStyle(
                              color: isSelected ? Colors.amber.shade800 : Colors.grey.shade500,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Recent Transactions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transaction',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9E1FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'See All',
                      style: TextStyle(color: const Color(0xFF9C68FE)),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Transaction List
              Expanded(
                child: ListView.builder(
                  itemCount: _recentTransactions.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final transaction = _recentTransactions[index];
                    Color bgColor;
                    IconData iconData;
                    Color iconColor;
                    
                    // Set colors and icons based on transaction type
                    switch(transaction['type']) {
                      case 'Shopping':
                        bgColor = const Color(0xFFFCEDCF);
                        iconData = Icons.shopping_basket_outlined;
                        iconColor = Colors.orange;
                        break;
                      case 'Subscription':
                        bgColor = const Color(0xFFE8E1FC);
                        iconData = Icons.receipt_long;
                        iconColor = Colors.purple;
                        break;
                      case 'Travel':
                        bgColor = const Color(0xFFD9EFFF);
                        iconData = Icons.directions_car_outlined;
                        iconColor = Colors.blue;
                        break;
                      case 'Food':
                        bgColor = const Color(0xFFFFE8E8);
                        iconData = Icons.fastfood_outlined;
                        iconColor = Colors.red;
                        break;
                      default:
                        bgColor = Colors.grey.shade100;
                        iconData = Icons.attach_money_outlined;
                        iconColor = Colors.grey;
                    }
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          // Icon
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              iconData,
                              color: iconColor,
                            ),
                          ),
                          
                          const SizedBox(width: 16),
                          
                          // Description
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction['type'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  transaction['description'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Amount and time
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '- ₹${transaction['amount'].abs()}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF5252),
                                ),
                              ),
                              Text(
                                transaction['time'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF9C68FE),
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home
              GestureDetector(
                onTap: () => _onNavItemTapped(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: _selectedNavIndex == 0 ? const Color(0xFF9C68FE) : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 10,
                          color: _selectedNavIndex == 0 ? const Color(0xFF9C68FE) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Transactions
              GestureDetector(
                onTap: () => _onNavItemTapped(1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.swap_horiz_rounded,
                        color: _selectedNavIndex == 1 ? const Color(0xFF9C68FE) : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Transaction',
                        style: TextStyle(
                          fontSize: 10,
                          color: _selectedNavIndex == 1 ? const Color(0xFF9C68FE) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Spacer for FAB
              const SizedBox(width: 40),
              
              // Budget
              GestureDetector(
                onTap: () => _onNavItemTapped(2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pie_chart_outline_rounded,
                        color: _selectedNavIndex == 2 ? const Color(0xFF9C68FE) : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Budget',
                        style: TextStyle(
                          fontSize: 10,
                          color: _selectedNavIndex == 2 ? const Color(0xFF9C68FE) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Profile
              GestureDetector(
                onTap: () => _onNavItemTapped(3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        color: _selectedNavIndex == 3 ? const Color(0xFF9C68FE) : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 10,
                          color: _selectedNavIndex == 3 ? const Color(0xFF9C68FE) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
