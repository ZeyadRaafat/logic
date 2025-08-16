import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 140),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage('assets/sonic.png'),
                ),
              ),
              Positioned(
                bottom: -20,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFollowed = !isFollowed;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(isFollowed
                              ? 'You are now following Zeyad Raafat'
                              : 'You have unfollowed Zeyad Raafat'),
                        ),
                      );
                    });
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: Icon(
                      isFollowed ? CupertinoIcons.check_mark :
                      CupertinoIcons.add,
                      color: Colors.white,
                      ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isFollowed ? CupertinoIcons.check_mark :
                    CupertinoIcons.add, color: Colors.grey.shade300
                    ),
                  SizedBox(width: 5),
                  Text('Zeyad Raafat', style: TextStyle(color: Colors.grey.shade200, fontSize: 12,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

