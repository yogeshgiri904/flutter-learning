import 'package:flutter/material.dart';
import 'package:iMaz/models/userList.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/list.dart';
import 'package:iMaz/provider/authProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BasicNav extends StatelessWidget {
  const BasicNav({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final UserList = authProvider.UsersList;
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(authProvider.navHeader),
      ),
      body: Container(
        height: 100.h,
        child: Column(
          children: [
            UserList?.length != 0
                ? Expanded(
                    child: ListView.builder(
                    itemCount: UserList?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
                        child: Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.asset(
                                'lib/assets/img/heart1.png',
                                width: 10.w,
                              ),
                              title: Text(
                                '${UserList![index].firstName} ${UserList[index].lastName}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: secondaryFont),
                              ),
                              subtitle: Text(UserList[index].mobile),
                              style: ListTileStyle.drawer,
                            ),
                          ),
                        ),
                      );
                    },
                  ))
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
    return scaffold;
  }
}
