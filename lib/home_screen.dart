import 'dart:math';

import 'package:assignment_12/model/plant_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'model/plant_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// List<Widget> _list = [
//   const ListItem(),
//   const GridItem(),
// ];

class _HomeScreenState extends State<HomeScreen> {
  List<PlantModel> myNursery = getPlantList();

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Nursery',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 40,
              ),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_sharp,
                size: 30,
              ),
              label: 'Grid',
            ),
          ],
          onTap: (index) {
            _selectedIndex = index;
            setState(() {});
          },
        ),
        body: (_selectedIndex == 0) ? ListItem() : GridItem());
  }
}

List<PlantModel> getPlantList() {
  return data
      .map(
        (item) => PlantModel(
          plant: item["plant"],
          title: item["title"],
        ),
      )
      .toList();
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PlantModel> myNursery = getPlantList();
    return ListView.builder(
      itemCount: myNursery.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Padding(padding: EdgeInsets.all(10)),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          myNursery[index].plant,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${myNursery[index].title}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios)),
                        Spacer()
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PlantModel> myNursery = getPlantList();
    return GridView.builder(
        itemCount: myNursery.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 16,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Image.asset(
                    myNursery[index].plant,
                    height: 100,
                    width: 100,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    "${myNursery[index].title}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Details', style: TextStyle(fontSize: 14)))
                ],
              ),
            ),
          );
        });
  }
}
