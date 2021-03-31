import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walmart Hackathon',
      home: DropDown(),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDown> {
  String _season;
  List summer = [
    'Twinkle Lights',
    'Sunglasses',
    'Garden hose',
    'Portable blender',
    'Matcha',
    'Bluetooth speaker',
    'Earrings',
    'Car air purifier',
    'Manicure kits',
    'Juices'
  ];
  List winter = [
    'Winter boots',
    'Shoe dryer',
    'Scarves',
    'Waterproof shoes',
    'Wool coats',
    'Thick socks',
    'Gloves',
    'Fishing equipment',
    'Skiing equipment',
    'Warm slippers'
  ];
  List fall = [
    'Decor',
    'Tweed jacket',
    'Hoodies',
    'Gloves',
    'Socks',
    'Sweater',
    'Jeans',
    'Camera',
    'Bags',
    'Water bottles'
  ];
  List spring = [
    'T shirt',
    'Canvas',
    'Jacket',
    'Bag',
    'Sleeves',
    'Slipper',
    'Bike accessories',
    'Running shoes',
    'Golf equipment',
    'Fitness tracker'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seasonal Product Recommendation'),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _season,
                    elevation: 16,
                    hint: Text('Choose any season'),
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (String newSeason) {
                      setState(() {
                        _season = newSeason;
                      });
                    },
                    items: <String>['Summer', 'Fall', 'Winter', 'Spring']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                if (_season == null) {
                  return Center(child: Text(''));
                } else if (_season == 'Summer') {
                  return Container(
                    color: Color.fromARGB((index + 1) * 20, 255, 140, 0),
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        '${summer[index]}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  );
                } else if (_season == 'Spring') {
                  return Container(
                    color: Color.fromARGB((index + 1) * 20, 154, 205, 50),
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        '${spring[index]}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  );
                } else if (_season == 'Fall') {
                  return Container(
                    color: Color.fromARGB((index + 1) * 20, 255, 127, 80),
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        '${fall[index]}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  );
                } else if (_season == 'Winter') {
                  return Container(
                    color: Color.fromARGB((index + 1) * 20, 0, 206, 209),
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        '${winter[index]}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
