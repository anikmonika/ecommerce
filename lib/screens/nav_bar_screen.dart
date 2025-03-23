import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/Cart/cart_screen.dart';
import 'package:ecommerce/screens/Home/home_screen.dart';
import 'package:ecommerce/screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'Favorite/favorite.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;

  List screens = const [
    Scaffold(),
    Favorite(),
    HomeScreen(),
    CartScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MAXIM SHOP",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: kprimaryColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 80, // Adjusted height for labels
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomIcon(
              icon: Icons.grid_view_outlined,
              label: "Home",
              index: 0,
            ),
            _buildBottomIcon(
              icon: Icons.favorite_border,
              label: "Favorite",
              index: 1,
            ),
            const SizedBox(width: 15),
            _buildBottomIcon(
              icon: Icons.shopping_cart_outlined,
              label: "Cart",
              index: 3,
            ),
            _buildBottomIcon(
              icon: Icons.person,
              label: "Profile",
              index: 4,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }

  Widget _buildBottomIcon({required IconData icon, required String label, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: currentIndex == index ? kprimaryColor : Colors.grey.shade400,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: currentIndex == index ? kprimaryColor : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
