import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() {
  runApp(PartneriaApp());
}

class PartneriaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partneria',
      debugShowCheckedModeBanner: false, // Menghapus logo debug
      theme: ThemeData(
        useMaterial3: true, // Mengaktifkan Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2D6A4F), // Hijau Tua sebagai warna utama
          primary: Color(0xFF2D6A4F),
          secondary: Color(0xFFD4F1C5),
          background: Color(0xFFFFF3E4),
        ),
      ),
      home: LoginPage(),
    );
  }
}
