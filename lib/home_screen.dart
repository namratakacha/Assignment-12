//import 'package:assignment_12/model/plant_list.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'model/plant_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

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
        body: Center(
          child: Container(
              child: (_selectedIndex == 0)
                  ? ListItem(
                      plant: "${data[_selectedIndex].plant}",
                      title: "${data[_selectedIndex].title}",
                    )
                  : GridItem(
                      plant: "${data[_selectedIndex].plant}",
                      title: "${data[_selectedIndex].title}",
                    )),
        ));
  }
}

class ListItem extends StatelessWidget {
  final String plant;
  final String title;
  const ListItem({Key? key, required this.plant, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 16,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Image.asset(
                  "$plant",
                  height: 100,
                  width: 100,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  'Plant Name : $title',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                IconButton(
                    onPressed: () {
                      print('object');
                    },
                    icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
        );
      },
    );
  }
}

class GridItem extends StatelessWidget {
  final String plant;
  final String title;
  const GridItem({Key? key, required this.plant, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 6,
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
                    'assets/plant1.jpg',
                    height: 100,
                    width: 100,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    'Rose',
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
