import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 1;

  @override
  Widget build(BuildContext context) {
    int age = 20;
    var appName = 'iMaz';
    String name = 'Yogesh Giri';
    int maxAge = add(a: age);
    var scaffold = Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                color: Colors.lightBlueAccent,
                width: 92.5.w,
                height: 30.h,
                child: Center(
                    child: Image.asset(
                  'lib/assets/img/heart1.png',
                  width: 40.w,
                ))),
            Container(
                color: Colors.lightGreenAccent,
                width: 92.5.w,
                height: 20.h,
                child: Center(
                    child: Image.asset(
                  'lib/assets/img/goal.png',
                  width: 30.w,
                ))),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      color: Colors.redAccent,
                      width: 45.w,
                      height: 20.h,
                      child: Center(
                          child: Image.asset(
                        'lib/assets/img/graphic-designer.png',
                        width: 20.w,
                      ))),
                  Container(
                      color: Colors.indigoAccent,
                      width: 45.w,
                      height: 20.h,
                      child: Center(
                          child: Image.asset(
                        'lib/assets/img/working-hours.png',
                        width: 20.w,
                      ))),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: .2,
                    blurRadius: 5)
              ]),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
            icon: const Icon(Icons.pending_actions),
            color: Colors.white,
          )),
      drawer: const Drawer(),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(
              onPressed: () {},
              child: Column(
                children: [
                  Icon(
                    isSelected == 1 ? Icons.home : Icons.home_outlined,
                    color: isSelected == 1 ? Colors.purple : Colors.grey,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: isSelected == 1 ? Colors.purple : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            CupertinoButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, MyRoutes.roughRoute);

                  isSelected = 2;
                });
              },
              child: Column(
                children: [
                  Icon(
                    isSelected == 2 ? Icons.book : Icons.book_outlined,
                    color: isSelected == 2 ? Colors.purple : Colors.grey,
                  ),
                  Text(
                    'Marks',
                    style: TextStyle(
                      color: isSelected == 2 ? Colors.purple : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            CupertinoButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, MyRoutes.roughRoute);

                  isSelected = 3;
                });
              },
              child: Column(
                children: [
                  Icon(
                    isSelected == 3 ? Icons.note_add : Icons.note_add_outlined,
                    color: isSelected == 3 ? Colors.purple : Colors.grey,
                  ),
                  Text(
                    'Fees',
                    style: TextStyle(
                      color: isSelected == 3 ? Colors.purple : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            CupertinoButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, MyRoutes.roughRoute);

                  isSelected = 4;
                });
              },
              child: Column(
                children: [
                  Icon(
                    isSelected == 4
                        ? Icons.account_circle
                        : Icons.account_circle_outlined,
                    color: isSelected == 4 ? Colors.purple : Colors.grey,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: isSelected == 4 ? Colors.purple : Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
    return scaffold;
  }

  add({required int a, int b = 2}) {
    return a + b;
  }
}
