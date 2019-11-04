import 'package:flutter/material.dart';

void main() => runApp(MyApp());

List<Widget> _list = [
  CirclesContainer(1),
  CirclesContainer(2),
  CirclesContainer(3),
  CirclesContainer(4),
  CirclesContainer(5),
  CirclesContainer(6),
  CirclesContainer(7),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(screenAwereSize(10, context)),
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <RowWrapper>[
                      RowWrapper(
                        _list.getRange(0, 2).toList(),
                      ),
                      RowWrapper(
                        _list.getRange(2, 5).toList(),
                      ),
                      RowWrapper(
                        _list.getRange(5, 7).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CirclesContainer extends StatelessWidget {
  final int text;
  CirclesContainer(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(screenAwereSize(5, context)),
      height: screenAwereSize(100, context),
      width: screenAwereSize(100, context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: Text(text.toString()),
    );
  }
}

class RowWrapper extends StatelessWidget {
  final List<Widget> children;
  RowWrapper(this.children);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

double screenAwereSize(double pt, BuildContext context) {
  double factor;
  double width;
  const double originDesignWidth = 375;
  factor = pt / originDesignWidth;
  width = MediaQuery.of(context).size.width * factor;
  return width;
}
