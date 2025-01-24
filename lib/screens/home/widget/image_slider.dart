import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;

  const ImageSlider({
    super.key,
    required this.currentSlide,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Mendapatkan dimensi layar

    return Column(
      mainAxisSize: MainAxisSize.min, // Memastikan slider tidak memakan ruang ekstra
      children: [
        AspectRatio(
          aspectRatio: 16 / 9, // Menentukan rasio untuk gambar slider
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  "assets/slider.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/image1.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/slider3.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10), // Jarak kecil antara slider dan indikator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3, // Jumlah indikator sesuai jumlah gambar
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: currentSlide == index ? 15 : 8,
              height: 8,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentSlide == index
                    ? Colors.black
                    : Colors.transparent,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
