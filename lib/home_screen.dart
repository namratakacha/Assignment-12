import 'package:assignment_12/detail_screen.dart';
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

class _HomeScreenState extends State<HomeScreen> {
  List<PlantModel> myNursery = getPlantList();

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Nursery',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          centerTitle: true,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.lime, Colors.green],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter))),
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
            shadowColor: Colors.green,
            color: Colors.lightGreenAccent[50],
            elevation: 16,
            child: Row(
              children: [
                Image.asset(
                  myNursery[index].plant,
                  height: 80,
                  width: 80,
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${myNursery[index].title}',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(detail: myNursery[index])));
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                )
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              shadowColor: Colors.green,
              color: Colors.lightGreenAccent[50],
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(detail: myNursery[index])));
                      },
                      child: Text('Details', style: TextStyle(fontSize: 14)))
                ],
              ),
            ),
          );
        });
  }
}
