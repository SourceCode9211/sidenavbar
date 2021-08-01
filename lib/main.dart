import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sidenav(),
  ));
}

class Sidenav extends StatefulWidget {
  const Sidenav({Key? key}) : super(key: key);

  @override
  _SidenavState createState() => _SidenavState();
}

class _SidenavState extends State<Sidenav> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int isFocused = 1;
  double top = 30;
  Color offFocusColor = Colors.white.withOpacity(0.5);
  Color onFocusColor = Colors.deepOrangeAccent.shade200;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
        vsync: this
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width/2 + 30,
        color:Colors.blueGrey.shade900,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
              curve: Curves.fastOutSlowIn,
              top: (screenHeight/7) + 30,
              left: 189,
              child: Container(
                margin: EdgeInsets.only(top:40),
                width: 7,
                height: (screenHeight/7) + 30 + (screenHeight/2),
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white.withOpacity(0.3)
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
              curve: Curves.fastOutSlowIn,
              top: top,
              left: 189,
              child: Container(
                margin: EdgeInsets.only(top:40),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(10)),
                    color: onFocusColor
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1400),
              curve: Curves.fastOutSlowIn,
              top: top,
              left: 189,
              child: Container(
                margin: EdgeInsets.only(top:60),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(10)),
                    color: onFocusColor
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1800),
              curve: Curves.fastOutSlowIn,
              top: top,
              left: 189,
              child: Container(
                margin: EdgeInsets.only(top:80),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(10)),
                    color: onFocusColor
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              top: top,
              left: 180,
              child: Icon(
                Icons.flight,
                color: onFocusColor,
                size: 27,
              )
            ),
            Positioned(
              top: (screenHeight/7) + 30,
              left: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    top = (screenHeight/7) +30;
                    isFocused =1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6,left: 6,right: 10,bottom: 6),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.5),
                    border: Border.all(color: isFocused == 1 ? onFocusColor : offFocusColor),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: isFocused == 1 ? onFocusColor : offFocusColor,
                        size: isFocused== 1? 25:20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: isFocused == 1? 20 : 18,
                          color: isFocused == 1 ? onFocusColor : offFocusColor,
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(1.0,1.0),
                              blurRadius: 3.0,
                              color: Colors.black
                            ),
                            Shadow(
                                offset: Offset(1.0,1.0),
                                blurRadius: 8.0,
                                color: Colors.black
                            ),
                          ],
                          fontWeight: isFocused == 1? FontWeight.bold : FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (screenHeight*2/7) + 30,
              left: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    top = (screenHeight*2/7) +30;
                    isFocused =2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6,left: 6,right: 10,bottom: 6),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.5),
                      border: Border.all(color: isFocused == 2 ? onFocusColor : offFocusColor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.save_outlined,
                        color: isFocused == 2 ? onFocusColor : offFocusColor,
                        size: isFocused== 2 ? 25:20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Saved",
                        style: TextStyle(
                            fontSize: isFocused == 2 ? 20 : 18,
                            color: isFocused == 2 ? onFocusColor : offFocusColor,
                            shadows: const <Shadow>[
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black
                              ),
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 8.0,
                                  color: Colors.black
                              ),
                            ],
                            fontWeight: isFocused == 2 ? FontWeight.bold : FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (screenHeight*3/7) + 30,
              left: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    top = (screenHeight*3/7) +30;
                    isFocused =3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6,left: 6,right: 10,bottom: 6),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.5),
                      border: Border.all(color: isFocused == 3 ? onFocusColor : offFocusColor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: isFocused == 3 ? onFocusColor : offFocusColor,
                        size: isFocused== 3 ? 25:20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Chats",
                        style: TextStyle(
                            fontSize: isFocused == 3 ? 20 : 18,
                            color: isFocused == 3 ? onFocusColor : offFocusColor,
                            shadows: const <Shadow>[
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black
                              ),
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 8.0,
                                  color: Colors.black
                              ),
                            ],
                            fontWeight: isFocused == 3 ? FontWeight.bold : FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (screenHeight*4/7) + 30,
              left: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    top = (screenHeight*4/7) +30;
                    isFocused =4;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6,left: 6,right: 10,bottom: 6),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.5),
                      border: Border.all(color: isFocused == 4 ? onFocusColor : offFocusColor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.feedback_outlined,
                        color: isFocused == 4 ? onFocusColor : offFocusColor,
                        size: isFocused== 4 ? 25:20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Feedback",
                        style: TextStyle(
                            fontSize: isFocused == 4 ? 20 : 18,
                            color: isFocused == 4 ? onFocusColor : offFocusColor,
                            shadows: const <Shadow>[
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black
                              ),
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 8.0,
                                  color: Colors.black
                              ),
                            ],
                            fontWeight: isFocused == 4 ? FontWeight.bold : FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (screenHeight*5/7) + 30,
              left: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    top = (screenHeight*5/7) +30;
                    isFocused =5;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6,left: 6,right: 10,bottom: 6),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.5),
                      border: Border.all(color: isFocused == 5 ? onFocusColor : offFocusColor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: isFocused == 5 ? onFocusColor : offFocusColor,
                        size: isFocused== 5 ? 25:20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Setting",
                        style: TextStyle(
                            fontSize: isFocused == 5 ? 20 : 18,
                            color: isFocused == 5 ? onFocusColor : offFocusColor,
                            shadows: const <Shadow>[
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black
                              ),
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 8.0,
                                  color: Colors.black
                              ),
                            ],
                            fontWeight: isFocused == 5 ? FontWeight.bold : FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (screenHeight*6/7) + 30,
              left: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    top = (screenHeight*6/7) +30;
                    isFocused =6;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6,left: 6,right: 10,bottom: 6),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.5),
                      border: Border.all(color: isFocused == 6 ? onFocusColor : offFocusColor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: isFocused == 6 ? onFocusColor : offFocusColor,
                        size: isFocused== 6 ? 25:20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: isFocused == 6 ? 20 : 18,
                            color: isFocused == 6 ? onFocusColor : offFocusColor,
                            shadows: const <Shadow>[
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black
                              ),
                              Shadow(
                                  offset: Offset(1.0,1.0),
                                  blurRadius: 8.0,
                                  color: Colors.black
                              ),
                            ],
                            fontWeight: isFocused == 6 ? FontWeight.bold : FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
