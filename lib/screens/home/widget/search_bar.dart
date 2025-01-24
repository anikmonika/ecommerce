import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 150, // Tinggi diperbesar untuk mencegah overflow
        width: double.infinity,
        decoration: BoxDecoration(
          color: kcontentColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Flexible(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                ),
                Container(
                  height: 25,
                  width: 1.5,
                  color: Colors.grey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  // Dropdown untuk kategori
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      hint: const Text("Category"),
                      items: ["men fashion", "women fashion", "jewelry", "shoes"]
                          .map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // Handle kategori yang dipilih
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Slider untuk harga
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Price:", style: TextStyle(fontSize: 12)),
                        Slider(
                          value: 50,
                          min: 0,
                          max: 500,
                          divisions: 100,
                          label: "\$50",
                          onChanged: (double value) {
                            // Handle perubahan harga
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
