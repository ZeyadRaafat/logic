import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {

  List<String> items = [
    'Flutter',
    'Dart',
    'React',
    'JavaScript',
    'Python',
    'Java',
    'C++',
    'Ruby',
    'Swift',
    'Kotlin',
    'kelma tweela shweya',
    'PHP',
    'Go',
  ];

  List<String> emptyList = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Text('What do you want to learn?', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  items.length,
                  (index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          if (emptyList.contains(items[index])) {
                            emptyList.remove(items[index]);
                          } else {
                            emptyList.add(items[index]);
                          }
                        });
          
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: emptyList.contains(items[index])?Colors.blue: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10) ,
                        child: Text(
                          items[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }
                   )
              ),
              SizedBox(height: 40,),
              Text('Selected Items:', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: emptyList.map((item) {
                    return Chip(
                      label: Text(item, style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.grey.shade700,
                      onDeleted: () {
                        setState(() {
                          emptyList.remove(item);
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}