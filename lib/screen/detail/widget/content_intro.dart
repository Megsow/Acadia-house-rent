import 'package:flutter/material.dart';
import 'package:house_rent/model/house.dart';

class ContentIntro extends StatelessWidget {
  final House house;
  const ContentIntro({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(house.name,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Text(
            house.address,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            '3000 sqft',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '\$1500 ',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(
                text: 'per Month',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              )
            ]),
          )
        ],
      ),
    );
  }
}
