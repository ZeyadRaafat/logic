import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  List<String> images = [
    'assets/laptop/labtop1.png',
    'assets/laptop/labtop4.png',
    'assets/laptop/labtop2.png',
    'assets/laptop/labtop3.png',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Column(
        children: [
          SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Image.asset(images[selectedIndex], fit: BoxFit.cover),
          ),
          SizedBox(height: 80),
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                images.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        images[index],
                        width: selectedIndex==index ? 120 : 100,
                        height: selectedIndex == index ? 120 : 100
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
