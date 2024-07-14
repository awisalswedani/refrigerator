import 'package:flutter/material.dart';
import 'package:flutter_application_1/images_app.dart';

class FoodItem extends StatelessWidget {
  final String image;
  final String title;
  final String days;
  final String weight;

  const FoodItem({
    super.key,
    required this.image,
    required this.title,
    required this.days,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(
                    image,
                    height: 60,
                    fit: BoxFit.cover,
                    width: 60,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        days,
                        style: const TextStyle(
                          color: Color.fromRGBO(255, 84, 73, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "$weight Kg",
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage(ImagesApp.edit)),
                  Image(image: AssetImage(ImagesApp.delete)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
