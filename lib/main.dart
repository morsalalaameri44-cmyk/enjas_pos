import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rosajcndvdporndzovih.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJvc2FqY25kdmRwb3JuZHpvdmloIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk2NTg0NzIsImV4cCI6MjEwNTIzNDQ3Mn0.ZnSz4TYpGriSVVExc-Uq0No08XSulhufAZdqm36He_k',
  );

  runApp(const EnjasPosApp());
}

class EnjasPosApp extends StatelessWidget {
  const EnjasPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enjas POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('شاشة نقطة البيع (POS)')),
    const Center(child: Text('شاشة المنتجات (Products)')),
    const Center(child: Text('شاشة الإعدادات (Settings)')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enjas POS - نظام إنجاز'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.point_of_sale), label: 'نقطة البيع'),
          NavigationDestination(icon: Icon(Icons.inventory_2), label: 'المنتجات'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'الإعدادات'),
        ],
      ),
    );
  }
}
