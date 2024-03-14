import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giải Phương Trình Bậc Nhất',
      theme: _theme,
      home: MyHomePage(),
    );
  }
}

ThemeData _theme = ThemeData(
  primaryColor: Color.fromARGB(255, 226, 118, 30),
  canvasColor: const Color.fromARGB(255, 0, 143, 5),
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  String _result = '';
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giải Phương Trình Bậc Nhất'),
        backgroundColor: _theme.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _aController,
                  decoration: InputDecoration(labelText: 'Hệ số a'),
                ),
                TextField(
                  controller: _bController,
                  decoration: InputDecoration(labelText: 'Hệ số b'),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      double a = double.parse(_aController.text);
                      double b = double.parse(_bController.text);
                    
                      if (a == 0) {
                        _result =
                            'Phương trình không phải là phương trình bậc nhất';
                      } else {
                        _result = 'Nghiệm của phương trình là: x = ${-b / a}';
                      }
                    });
                  },
                  child: MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        _hovered = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _hovered = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0,  left:0 , right:0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue,
                              Colors.green,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              double a = double.parse(_aController.text);
                              double b = double.parse(_bController.text);
                      
                              if (a == 0) {
                                _result =
                                    'Phương trình không phải là phương trình bậc nhất';
                              } else {
                                _result = 'Nghiệm của phương trình là: x = ${-b / a}';
                              }
                            });
                          },
                          child: MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                _hovered = true;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hovered = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: _hovered
                                    ? LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromARGB(255, 224, 107, 29),
                                          const Color.fromARGB(255, 194, 33, 243),
                                        ],
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 100.0,
                                  minHeight: 50.0,
                                ),
                                child: Center(
                                  child: Text(
                                    'Giải',
                                    style: TextStyle(
                                      color: _hovered ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(_result),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
