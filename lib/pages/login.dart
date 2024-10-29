import 'package:flutter/material.dart';
import 'catalog.dart'; // Halaman utama setelah login
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isError = false;
  String _errorMessage = '';

  void _login() {
    setState(() {
      _isError = false;
      _errorMessage = '';
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CatalogPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E4), // Warna Krem dari palet
      body: Stack(
        children: [
          _buildBackgroundDecorations(),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextKit(
  animatedTexts: [
    TypewriterAnimatedText(
      'Partneria App',
      textStyle: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D6A4F), // Warna Hijau Tua
      ),
      speed: const Duration(milliseconds: 250),
    ),
  ],
  repeatForever: true, // Membuat animasi mengetik berulang selamanya
),
                  SizedBox(height: 10),
                  Text(
                    'Please sign in to continue.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 40),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    isError: _isError && _emailController.text.isEmpty,
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Password',
                    isError: _isError && _passwordController.text.isEmpty,
                    obscureText: true,
                    prefixIcon: Icons.lock_outline,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot',
                      style: TextStyle(
                        color: Color(0xFF2D6A4F), // Warna Hijau Tua
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: _login,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF2D6A4F), Color(0xFFD4F1C5)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF2D6A4F).withOpacity(0.3),
                              offset: Offset(0, 8),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Don’t have an account? ",
                        style: TextStyle(color: Colors.grey[700]),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              color: Color(0xFF2D6A4F),
                              fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isError = false,
    bool obscureText = false,
    IconData? prefixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label.toUpperCase(),
          labelStyle: TextStyle(color: Colors.grey[700]),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey[700]) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          errorText: isError ? '$label tidak boleh kosong' : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF2D6A4F)), // Hijau Tua
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: obscureText ? TextInputType.visiblePassword : TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Stack(
      children: [
        Positioned(
          top: -50,
          right: -50,
          child: _buildDecorativeCircle(120, Color(0xFFD4F1C5)), // Hijau Mint
        ),
        Positioned(
          bottom: -30,
          left: -30,
          child: _buildDecorativeCircle(100, Color(0xFFFFF3E4).withOpacity(0.5)), // Krem
        ),
        Positioned(
          top: 200,
          right: 30,
          child: _buildDecorativeCircle(80, Color(0xFFFFEBCB)), // Warna kuning pastel
        ),
        Positioned(
          bottom: 100,
          right: 80,
          child: _buildDecorativeCircle(60, Color(0xFFD4F1C5).withOpacity(0.7)), // Hijau Mint semi transparan
        ),
        Positioned(
          top: 150,
          left: 100,
          child: _buildDecorativeCircle(50, Color(0xFF98C1D9).withOpacity(0.6)), // Biru lembut transparan
        ),
        Positioned(
          top: 100,
          left: 30,
          child: Opacity(
            opacity: 0.2,
            child: _buildDecorativeWave(),
          ),
        ),
      ],
    );
  }

  Widget _buildDecorativeCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildDecorativeWave() {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [Color(0xFFD4F1C5), Color(0xFFFFF3E4).withOpacity(0.5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
