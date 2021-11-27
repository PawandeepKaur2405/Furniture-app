
import 'package:flutter/material.dart';
import 'package:furniture_app/models/item_model.dart';
import 'package:furniture_app/screens/ar_view_screen.dart';

class ItemListScreen extends StatelessWidget {
  List<ItemModel> items = [
    ItemModel(
      'Bed',
      'Bed with single lamp',
      'assets/bed.png',
      12,
    ),
    ItemModel(
      'Double bed',
      'Double bed with 2 lamps',
      'assets/bed_double.png',
      12,
    ),
    ItemModel(
      'Double bed',
      'Double bed with 2 lamps',
      'assets/gun.png',
      12,
    ),
    ItemModel(
      'Double bed',
      'Double bed with 2 lamps',
      'assets/gun.png',
      12,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AR ",
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  Text(
                    "Furniture ",
                    style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                  Text(
                    "App",
                    style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ArViewScreen(items[index].pic)));
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                items[index].pic,
                                width: 60,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    items[index].name,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    items[index].detail,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black87),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              child: Text(
                                items[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.deepPurple),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: items.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}