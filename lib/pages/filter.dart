import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedCategory;
  String? selectedLocation;
  String? selectedPartnershipType;
  double minCapital = 0;
  String searchQuery = '';

  final List<String> categories = ['Makanan', 'Minuman', 'Jasa'];
  final List<String> locations = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Yogyakarta',
    'Semarang'
  ];
  final List<String> partnershipTypes = [
    'Waralaba',
    'Investor',
    'Kemitraan Usaha'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E4),
      appBar: AppBar(
        title: Text(
          'Filter Mitra',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF2D6A4F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          children: [
            // Pencarian
            Text(
              'Pencarian',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D6A4F),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari mitra...',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFD4F1C5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2D6A4F), width: 1.5),
                ),
                suffixIcon: Icon(Icons.search, color: Color(0xFF2D6A4F)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            SizedBox(height: 24),

            // Kategori Bisnis
            Text(
              'Kategori Bisnis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D6A4F),
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              hint: Text('Pilih Kategori'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFD4F1C5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2D6A4F), width: 1.5),
                ),
              ),
              isExpanded: true,
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 24),

            // Lokasi
            Text(
              'Lokasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D6A4F),
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedLocation,
              hint: Text('Pilih Lokasi'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFD4F1C5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2D6A4F), width: 1.5),
                ),
              ),
              isExpanded: true,
              items: locations.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLocation = value;
                });
              },
            ),
            SizedBox(height: 24),

            // Modal Minimal
            Text(
              'Modal Minimal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D6A4F),
              ),
            ),
            SizedBox(height: 8),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Color(0xFF2D6A4F),
                inactiveTrackColor: Color(0xFFB4D8A7),
                thumbColor: Color(0xFF2D6A4F),
                overlayColor: Color(0x662D6A4F),
                trackHeight: 6.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                valueIndicatorTextStyle: TextStyle(color: Colors.white),
              ),
              child: Slider(
                value: minCapital,
                min: 0,
                max: 100000,
                divisions: 20,
                label: minCapital.round().toString(),
                onChanged: (value) {
                  setState(() {
                    minCapital = value;
                  });
                },
              ),
            ),
            SizedBox(height: 24),

            // Jenis Kemitraan
            Text(
              'Jenis Kemitraan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D6A4F),
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedPartnershipType,
              hint: Text('Pilih Jenis Kemitraan'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFD4F1C5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2D6A4F), width: 1.5),
                ),
              ),
              isExpanded: true,
              items: partnershipTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPartnershipType = value;
                });
              },
            ),
            SizedBox(height: 24),

            // Tombol Terapkan Filter
            ElevatedButton(
              onPressed: () {
                print('Pencarian: $searchQuery');
                print('Kategori: $selectedCategory');
                print('Lokasi: $selectedLocation');
                print('Modal Minimal: $minCapital');
                print('Jenis Kemitraan: $selectedPartnershipType');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2D6A4F),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Terapkan Filter',
                style: TextStyle(
                  color: Color(0xFFFFF3E4),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
