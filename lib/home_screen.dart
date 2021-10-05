import 'package:assignment_12/model/newmodel.dart';
import 'package:assignment_12/model/plant_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var newModel = getlist() as List;
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
                  ? List(
                      name: newModel.name,
                    )
                  : Grid()),
        ));
  }
}

class List extends StatelessWidget {
  final String name;
  const List({
    Key? key,
    required this.name,
  }) : super(key: key);

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
                  'assets/plant1.jpg',
                  height: 100,
                  width: 100,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  'Plant Name : $name',
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

class Grid extends StatelessWidget {
  const Grid({
    Key? key,
  }) : super(key: key);

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
