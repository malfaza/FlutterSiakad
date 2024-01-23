import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/icons.dart';
import 'dashboard_page.dart';
import 'jadwal_matkul_page.dart';
import 'profile_page.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // const Center(
    //   child: Text('Home'),
    // ),
    // const Center(
    //   child: Text('Schedule'),
    // ),
    // const Center(
    //   child: Text('Person'),
    // ),
    const DashboardPage(),
    const JadwalMatkulPage(),
    const ProfilePage(
      role: 'Mahasiswa',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: ColorName.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(IconName.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(IconName.chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(IconName.profile),
            label: '',
          ),
        ],
      ),
    );
  }
}
