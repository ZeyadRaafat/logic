import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> gifts = [
    {"name": "cow", "image": "assets/animals/cow.png"},
    {"name": "deer", "image": "assets/animals/deer.png"},
    {"name": "giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "lion", "image": "assets/animals/lion.png"},
    {"name": "pingeon", "image": "assets/animals/pingeon.png"},
    {"name": "rat", "image": "assets/animals/rat.png"},
    {"name": "tiger", "image": "assets/animals/tiger.png"},
    {"name": "white tiger", "image": "assets/animals/white-tiger.png"},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 40,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  selectedIndex == index
                      ? Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black12,
                                  Colors.black26,
                                  Colors.black12,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),

                  Column(
                    children: [
                      Image.asset(
                        width: 300,
                        height: selectedIndex == index ? 120 : 100,
                        gifts[index]['image'],
                      ),
                      SizedBox(height: 3),
                      selectedIndex == index
                          ? SizedBox.shrink()
                          : Text(
                              gifts[index]['name'].toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                    ],
                  ),

                  selectedIndex == index
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
