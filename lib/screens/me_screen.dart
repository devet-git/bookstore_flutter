import 'package:book_app/helpers/change_screen.dart';
import 'package:book_app/helpers/gen_edge_insets.dart';
import 'package:book_app/screens/favoritebooks_screen.dart';
import 'package:book_app/screens/orders_screen.dart';
import 'package:book_app/services/auth_service.dart';
import 'package:book_app/services/user_service.dart';
import 'package:flutter/material.dart';

import 'signin_screen.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  String name = '';
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (mounted) {
    //   AccountService().getAll((data) {
    //    setState(() {});
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: body(context),
    );
  }

  ListView body(BuildContext context) {
    var userInfo = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.blue, Colors.white],
        ),
      ),
      padding: genEdgeInsets([20, 0, 45]),
      child: ListTile(
        onTap: () {
          if (AuthService().currentUser() != null) {
            //update infor Dialog
            showDialog(
              context: context,
              builder: (BuildContext contextntext) => AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      UserService().update2(
                          AuthService().currentUser()!.uid, {'name': name});
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
                title: const Text("Thay đổi thông tin của bạn"),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        child: Image.asset("assets/images/book-cover.jpg"),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(label: Text("Tên")),
                        initialValue: "Thắng",
                        onChanged: (value) => {
                          name = value,
                          setState(() => {name = value})
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Số điện thoại"),
                        ),
                        initialValue: "0813839079",
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Email"),
                        ),
                        initialValue: AuthService().currentUser()?.email(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person_outlined,
            color: Colors.grey,
          ),
        ),
        title: Text(
          AuthService().currentUser() == null
              ? "Bạn chưa đăng nhập"
              : AuthService().currentUser()!.email()!,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: AuthService().currentUser() != null
            ? Text(AuthService().currentUser()!.uid)
            : null,
        trailing: AuthService().currentUser() != null
            ? IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Bạn muốn đăng xuất?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            AuthService().signOut();
                            ChangeScreen.newUniqueScreen(
                                context, const SignInScreen());
                            // Navigator.pop(context, 'OK');
                          },
                          child: const Text("Đúng"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Hủy'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.logout),
              )
            : IconButton(
                icon: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                onPressed: () =>
                    ChangeScreen.nextScreen(context, const SignInScreen()),
              ),
      ),
    );
    var nonameSection = Container(
      padding: genEdgeInsets([10, 0]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () =>
                ChangeScreen.nextScreen(context, const FavoriteBooksScreen()),
            child: Column(
              children: const [
                Icon(Icons.favorite_border),
                Text("Yêu thích"),
              ],
            ),
          ),
          TextButton(
            onPressed: () =>
                ChangeScreen.nextScreen(context, const OrdersScreen()),
            child: Column(
              children: const [
                Icon(Icons.shopping_bag_outlined),
                Text("Đơn hàng"),
              ],
            ),
          )
        ],
      ),
    );
    //
    return ListView(
      children: [
        userInfo,
        nonameSection,
        //other sections
        const Divider(),
        const ListTile(
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          title: Text("Cài đặt ứng dụng"),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.support_agent),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          title: Text("Hỗ trợ"),
        ),
        const ListTile(
          leading: Icon(Icons.bug_report_outlined),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          title: Text("Báo lỗi"),
        ),
        const ListTile(
          leading: Icon(Icons.info_outline_rounded),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          title: Text("Thông tin ứng dụng"),
          subtitle: Text("Version 1.1.0"),
        ),
      ],
    );
  }
}
