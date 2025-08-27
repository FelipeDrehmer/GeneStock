// ignore: file_names
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final List<CarouselItem> items;
  final void Function(String title)? onItemTap;

  const CarouselWidget({super.key, required this.items, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: items.length,
        controller: PageController(viewportFraction: 0.70),
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () => onItemTap?.call(item.title),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      size: 80,
                      color: const Color.fromARGB(160, 10, 10, 10),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarouselItem {
  final IconData icon;
  final String title;

  CarouselItem({required this.icon, required this.title});
}
