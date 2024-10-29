import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> partner;

  DetailPage({required this.partner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          partner['name']!,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF2D6A4F),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background decorations
          Positioned(
            top: -100,
            right: -100,
            child: _buildDecorativeCircle(200, Color(0xFFD4F1C5)),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: _buildDecorativeCircle(150, Color(0xFFFFF3E4).withOpacity(0.5)),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Partner Image
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      partner['imageUrl'] ?? 'https://via.placeholder.com/150', // URL image placeholder
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Partner Name
                Text(
                  partner['name']!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Color(0xFF2D6A4F),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                ),
                SizedBox(height: 10),

                // Partner Category
                Row(
                  children: [
                    Icon(Icons.category, color: Color(0xFF2D6A4F)),
                    SizedBox(width: 8),
                    Text(
                      partner['category']!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Partner Description
                Text(
                  partner['description']!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.5,
                        color: Colors.grey[700],
                      ),
                ),
                Spacer(),

                // "Apply for Partnership" Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add action for applying for partnership here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2D6A4F),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.handshake, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Ajukan Kemitraan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Background decoration
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
}
