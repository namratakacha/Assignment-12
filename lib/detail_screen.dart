import 'package:assignment_12/model/plant_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.detail}) : super(key: key);
  final PlantModel detail;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Details', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lime, Colors.green],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))),
      ),
      body: Container(
        child: Card(
          elevation: 16,
          shadowColor: Colors.green,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(widget.detail.plant),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                '${widget.detail.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text('Description : ${widget.detail.description}',
                  style: TextStyle(fontSize: 20)),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                'Price: ${widget.detail.price}',
                style: TextStyle(fontSize: 20, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
