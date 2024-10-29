import 'package:flutter/material.dart';
import 'detail.dart';
import 'filter.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Map<String, String>> partners = [
    {'name': 'Es Teh Solo', 'category': 'Minuman', 'description': 'Waralaba minuman es teh terkenal dari Solo.'},
    {'name': 'Kebab Turki', 'category': 'Makanan', 'description': 'Waralaba makanan cepat saji khas Turki.'},
    {'name': 'Sate Padang', 'category': 'Makanan', 'description': 'Sate khas Padang yang terkenal dengan saus kentalnya.'},
    {'name': 'Ayam Geprek', 'category': 'Makanan', 'description': 'Ayam geprek pedas yang disukai oleh banyak orang.'},
    {'name': 'Kopi Kenangan', 'category': 'Minuman', 'description': 'Waralaba kopi kekinian yang populer.'},
    {'name': 'Bakso Malang', 'category': 'Makanan', 'description': 'Bakso khas Malang yang nikmat.'},
    {'name': 'Martabak Manis', 'category': 'Makanan', 'description': 'Martabak manis dengan berbagai toping lezat.'},
    {'name': 'Boba Drink', 'category': 'Minuman', 'description': 'Minuman boba yang menyegarkan.'},
    {'name': 'Pizza Italiano', 'category': 'Makanan', 'description': 'Pizza dengan cita rasa asli Italia.'},
    {'name': 'Thai Tea', 'category': 'Minuman', 'description': 'Minuman teh Thailand yang terkenal.'},
  ];

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E4),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.store, size: 28, color: Colors.white),
            ),
            SizedBox(width: 12),
            Text(
              'Katalog Mitra',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF2D6A4F),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(Icons.search, size: 24, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Category Chips
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Color(0xFF2D6A4F),
              child: Row(
                children: [
                  _buildCategoryChip('Semua', true),
                  SizedBox(width: 8),
                  _buildCategoryChip('Makanan', false),
                  SizedBox(width: 8),
                  _buildCategoryChip('Minuman', false),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: partners.length,
                  itemBuilder: (context, index) {
                    final partner = partners[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(partner: partner),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFD1E7DD),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                              ),
                              child: Center(
                                child: Icon(
                                  _getIconForCategory(partner['category']!),
                                  color: Color(0xFF2D6A4F),
                                  size: 48,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    partner['name']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD1E7DD),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      partner['category']!,
                                      style: TextStyle(
                                        color: Color(0xFF2D6A4F),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            _buildNavItem(Icons.home_rounded, ''),
            _buildNavItem(Icons.fastfood_rounded, ''),
            _buildNavItem(Icons.person_rounded, ''),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF2D6A4F),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Icon(icon, size: 28),
      ),
      label: label,
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Color(0xFF2D6A4F) : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'makanan':
        return Icons.restaurant_rounded;
      case 'minuman':
        return Icons.local_cafe_rounded;
      default:
        return Icons.store_rounded;
    }
  }
}
