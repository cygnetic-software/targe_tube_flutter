import 'package:aneen/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockedUsers extends StatelessWidget {
  const BlockedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    return Scaffold(
      appBar: AppBar(title: Text("Blocked Users")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(children: [
          ListView.builder(
              itemCount: 25,
              itemBuilder: (ctx, index) => Dismissible(
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
                          style: TextStyle(color: Colors.white, fontSize: 24),
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
                    title: Text(controller.name.value),
                    subtitle: Text(controller.email.value),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print("delete");
                      },
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      child: Text(controller.name.value.isNotEmpty
                          ? controller.name.value[0]
                          : "U"),
                    ),
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("Note: You can swipe to unblock."),
          )
        ]),
      ),
    );
  }
}
