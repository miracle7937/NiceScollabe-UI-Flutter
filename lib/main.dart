import 'package:doubleScroll/FeedPage/mainContent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScrollPage(),
    );
  }
}

class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  double percentOfPosition;
  @override
  Widget build(BuildContext context) {
    var mQ = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: mQ.height,
          width: mQ.width,
          child: Stack(
            children: <Widget>[
              Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: SizedBox(
                          height: mQ.height - 25,
                          child: Stack(
                            children: <Widget>[
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 500),
                                bottom:
                                    positionValue(percentOfPosition, mQ.height),
                                left: (mQ.width / 2) - 50,
                                child: Column(
                                  children: <Widget>[
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      height:
                                          115 * scaleImage(percentOfPosition),
                                      width:
                                          115 * scaleImage(percentOfPosition),
                                      child: Center(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                              NetworkImage(imageUrl),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Nello Blue',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(102, 80, 68, 1)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: mQ.height,
                  width: mQ.width),
              SizedBox(
                  child: MyCustomDraggable(
                bgColor: Color.fromRGBO(215, 239, 252, 1),
                intialChildSized: 0.4,
                onScroll: (value) {
                  print('ello');
                  setState(() {
                    percentOfPosition = value;
                  });
                },
              )),
              SizedBox(
                  child: MyCustomDraggable(
                onScroll: (value) {
                  setState(() {
                    percentOfPosition = value;
                  });
                },
                bgColor: Color.fromRGBO(46, 20, 20, 1),
                intialChildSized: 0.25,
              )),
            ],
          ),
        ),
      ),
    );
  }

  double positionValue(double value, screenSize) {
    if (value == null) {
      return screenSize * 0.5;
    } else if (value * screenSize > screenSize * 0.7) {
      return screenSize * 0.8;
    } else if (value * screenSize < screenSize * 0.5) {
      return screenSize * 0.5;
    } else {
      return value * screenSize;
    }
  }

  double scaleImage(double value) {
    if (value == null) {
      return 1;
    }
    if (value > 0.8) {
      return 0.6;
    } else if (value < 0.8 && value > 0.5) {
      return 0.8;
    } else if (value < 0.5) {
      return 1;
    }
  }
}

class MyCustomDraggable extends StatelessWidget {
  final Color bgColor;
  final double intialChildSized;
  final Function(double value) onScroll;

  const MyCustomDraggable(
      {Key key, this.bgColor, this.intialChildSized, this.onScroll})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        onScroll(notification.extent);
        print("${notification.extent}");
      },
      child: DraggableScrollableSheet(
        initialChildSize: intialChildSized,
        builder: (BuildContext context, ScrollController scrollController) {
          return Material(
              elevation: 12,
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(19),
            topRight: Radius.circular(19)),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
            topLeft: Radius.circular(19),
            topRight: Radius.circular(19)),
          color: bgColor,
                     ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Feed()
                    
                  ),
                ),
            );
        },
      ),
    );
  }
}

var imageUrl =
    "https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
