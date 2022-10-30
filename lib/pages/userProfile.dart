import 'dart:convert';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/provider/authProvider.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
  static const devName = 'Yogesh Giri';

  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      child: Column(
        children: [
          Container(
            color: primaryColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hii, $devName',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 3.w,
                            color: Colors.grey,
                            fontFamily: secondaryFont),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: const Icon(
                          Icons.notifications_rounded,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Container(
            width: 100.w,
            height: 15.h,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: pureWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            'lib/assets/img/astronot.gif',
                            width: 40.w,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            },
                            child: Text(
                              '${StringUtils.capitalize(authProvider.userSession!.firstName)} ${StringUtils.capitalize(authProvider.userSession!.lastName)}',
                              style: TextStyle(
                                  color: pureWhite,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: secondaryFont),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            },
                            child: Text(
                              authProvider.userSession!.mobile,
                              // StringUtils.capitalize(
                              //     authProvider.userSession?[0]['mobile']),
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(208, 207, 194, 194),
                                  fontFamily: secondaryFont),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
          SizedBox(
              height: 46.h,
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.all(6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: ListTile(
                            tileColor: pureWhite,
                            leading: Icon(
                              Icons.abc,
                              size: 10.w,
                            ),
                            title: Text(
                              'Setting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: secondaryFont),
                            ),
                            subtitle: Text('setting details'),
                            style: ListTileStyle.drawer,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: ListTile(
                            tileColor: pureWhite,
                            leading: Icon(
                              Icons.abc,
                              size: 10.w,
                            ),
                            title: Text(
                              'Setting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: secondaryFont),
                            ),
                            subtitle: Text('setting details'),
                            style: ListTileStyle.drawer,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: ListTile(
                            tileColor: pureWhite,
                            leading: Icon(
                              Icons.abc,
                              size: 10.w,
                            ),
                            title: Text(
                              'Setting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: secondaryFont),
                            ),
                            subtitle: Text('setting details'),
                            style: ListTileStyle.drawer,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: ListTile(
                            tileColor: pureWhite,
                            leading: Icon(
                              Icons.abc,
                              size: 10.w,
                            ),
                            title: Text(
                              'Setting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: secondaryFont),
                            ),
                            subtitle: Text('setting details'),
                            style: ListTileStyle.drawer,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: const Text(
                      'Switch to other account',
                      style: TextStyle(
                          color: defaultColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
