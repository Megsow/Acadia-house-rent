import 'package:flutter/material.dart';
import 'package:house_rent/screen/auth/login.dart';
import 'package:house_rent/screen/home/widget/add_house_page.dart';
import 'package:house_rent/screen/home/widget/best_offer.dart';
import 'package:house_rent/screen/home/widget/custom_app_bar.dart';
import 'package:house_rent/screen/home/widget/custom_bottom_navigation_bar.dart';
import 'package:house_rent/screen/home/widget/search_input.dart';
import 'package:house_rent/screen/home/widget/welcome_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: CustomAppBar(
              onLogout: () {
                // Navigate back to the login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeText(),
                  SearchInput(),
                  BestOffer(),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              onAddHousePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddHousePage()),
                );
              },
            ),
          ),
        );
      },
    );
  }
}


