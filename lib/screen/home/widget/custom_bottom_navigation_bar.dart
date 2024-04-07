import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function onAddHousePressed; // Callback function for adding new houses

  CustomBottomNavigationBar({required this.onAddHousePressed});

  final bottomBarItem = [
    'notification',
    'chat',
    'home_mark'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomBarItem
            .map(
              (e) => GestureDetector(
                onTap: () {
                  if (e == 'notification') {
                    // Trigger the callback function for adding new houses
                    onAddHousePressed();
                  } else {
                    // Handle other navigation actions
                    
                  }
                },
                child: SvgPicture.asset(
                  'assets/icons/$e.svg', 
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
