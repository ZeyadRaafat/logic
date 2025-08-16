import 'package:flutter/material.dart';
import 'package:logic_learning/screens/image_selection.dart';
import 'package:logic_learning/screens/multi_selection.dart';
import 'package:logic_learning/screens/single_selection.dart';
import 'package:logic_learning/screens/toggle_selection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  List<Widget> screens = [
    SingleSelection(),
    ImageSelection(),
    ToggleSelection(),
    MultiSelection()
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (v) {
          setState(() {
            selectedIndex = v;
          });
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.jumpToPage(selectedIndex - 1);
                });
              },
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [Icon(Icons.arrow_back, color: Colors.black)],
                ),
              ),
            ),
            SizedBox(width: 10),

            GestureDetector(
              onTap: () {
                setState(() {
                  controller.jumpToPage(selectedIndex + 1);
                });
              },
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    Text(
                      'Next Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 14),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
