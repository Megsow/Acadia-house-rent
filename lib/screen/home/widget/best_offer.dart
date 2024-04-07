import 'package:flutter/material.dart';
import 'package:house_rent/model/house.dart';
import 'package:house_rent/screen/detail/detail.dart'; // Import the DetailPage

class BestOffer extends StatelessWidget {
  final List<House> listOfOffer = House.generateBestOffer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Offers',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          ...listOfOffer.map((house) => GestureDetector(
            onTap: () {
              // Navigate to the DetailPage when the listing is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(house: house)),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8)),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(house.imageUrl),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            house.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            house.address,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )).toList()
        ],
      ),
    );
  }
}
