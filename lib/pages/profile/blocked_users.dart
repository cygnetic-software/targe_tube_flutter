import 'package:aneen/controllers/auth_controller.dart';
import 'package:aneen/controllers/setting_controller.dart';
import 'package:aneen/global/user.dart';
import 'package:aneen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockedUsers extends StatelessWidget {
  const BlockedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(title: Text("Blocked Users")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(children: [
          FutureBuilder(
              future: controller.getBlockedUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) => Dismissible(
                          onDismissed: (direction) async {
                            await authController
                                .unblockUser(snapshot.data![index].id);
                            Get.offAll(() => Home());
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            width: 200,
                            color: Colors.green,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Unblock",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          key: Key(index.toString()),
                          child: ListTile(
                            title: Text(snapshot.data![index].username),
                            subtitle: Text(snapshot.data![index].email),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                await authController
                                    .unblockUser(snapshot.data![index].id);
                                Get.offAll(() => Home());
                              },
                            ),
                            leading: CircleAvatar(
                              radius: 25,
                              child: Text(
                                  snapshot.data![index].username.isNotEmpty
                                      ? snapshot.data![index].username[0]
                                      : "U"),
                            ),
                          )));
                } else {
                  return Center(
                    child: Text("No user blocked!"),
                  );
                }
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("Note: You can swipe to unblock."),
          )
        ]),
      ),
    );
  }
}
