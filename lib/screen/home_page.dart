import 'package:flutter/material.dart';
import 'detail_page.dart';
import '../controller/users.dart';
import '../model/user.dart';
import '../screen/favorites.dart';
import '../widget/user_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool favorite = false;
  UserRepository repository = UserRepository();
  List<User> users = [];
  List<User> favUsers = [];

  getUsers() {
    repository.getAll().then((value) {
      setState(() {
        isLoading = true;
        users.addAll(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.favorite_border_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Favorites(
                    favUsers: favUsers,
                  );
                }));
              },
            ),
          ),
          // add more IconButton
        ],
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                  child: SizedBox(
                    height: 120.0,
                    child: GestureDetector(
                      onDoubleTap: () {
                        switch (users[index].isFav) {
                          case true:
                            setState(() {
                              users[index].isFav = false;
                              favUsers.remove(users[index]);
                            });
                            break;
                          case false:
                            setState(() {
                              users[index].isFav = true;
                              favUsers.add(users[index]);
                            });
                        }
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Details(
                              user: users[index],
                            );
                          }),
                        );
                      },
                      child: UserCard(
                        users: users,
                        index: index,
                        onTap: () {
                          switch (users[index].isFav) {
                            case true:
                              setState(() {
                                users[index].isFav = false;
                                favUsers.remove(users[index]);
                              });
                              break;
                            case false:
                              setState(() {
                                users[index].isFav = true;
                                favUsers.add(users[index]);
                              });
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
