import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatelessWidget {
  final dynamic item;
  const MyCarousel({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: item.length,
      itemBuilder: (context, index, realIndex) {
        final product = item[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
              color: const Color(0xFFE3D8B7),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.network(
                          product['image'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
    );
  }
}
