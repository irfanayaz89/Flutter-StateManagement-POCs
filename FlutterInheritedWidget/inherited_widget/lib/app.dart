import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class WidgetInherited extends InheritedWidget {

  final String username;
  final String name;

  WidgetInherited({@required this.username, this.name, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(WidgetInherited oldWidget) {
  
    return (username != oldWidget.username || name != oldWidget.name);
  }

  static WidgetInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WidgetInherited>();
  }
}

class InheritedWidgetProvider extends StatelessWidget {

  final String username;
  final String name;

  InheritedWidgetProvider({this.username, this.name});

  @override
  Widget build(BuildContext context) {
    return (
      WidgetInherited(username: this.username, name: this.name, child: const MainWidget())
    );
  }
}

class MainWidget extends StatelessWidget {

  const MainWidget();

  @override
  Widget build(BuildContext context) {
    
    return (
      Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: 
            Container(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Expanded(child: Center(child: Text('This is the MAIN widget')), flex: 1),
                  Expanded(child: WidgetOne(), flex: 4),
                  Text('MAIN widget ends here'),
                ],

              ),
              alignment: FractionalOffset(0.5, 0),
            ),
          )
        )
    );
  }
}

class WidgetOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return (
        Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              Expanded(child: Center(child: Text('This is the Widget ONE')), flex: 1),
              Expanded(child: WidgetTwo(),  flex: 3),
              Text('Widget ONE ends here'),
            ]
          ),
          alignment: FractionalOffset(0.5, 0),
      )
    );
  }
}

class WidgetTwo extends StatelessWidget {

  const WidgetTwo();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (
      
        Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              Expanded(child: Center(child: Text('This is the Widget TWO')), flex: 1),
              Expanded(child: WidgetThree(),  flex: 2),
              Text('Widget TWO ends here'),
            ]
          ),
          alignment: FractionalOffset(0.5, 0),
      )
    );
  }
}

class WidgetThree extends StatelessWidget {

  const WidgetThree();

  @override
  Widget build(BuildContext context) {
    
    final inherited = WidgetInherited.of(context);

    return (
        Container(
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('This is the widget THREE'),
              Text(inherited.username),
              Text(inherited.name),
            ]
        ),
        alignment: FractionalOffset(0.5, 0),
      )
    );
  }
}