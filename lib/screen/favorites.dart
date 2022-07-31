import 'package:flutter/material.dart';
import '../model/user.dart';
import 'detail_page.dart';
import '../widget/user_card.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key, required this.favUsers}) : super(key: key);
  final List<User> favUsers;

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Your Friend'),
      ),
      body: ListView.builder(
        itemCount: widget.favUsers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            child: SizedBox(
              height: 120.0,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Details(
                          user: widget.favUsers[index],
                        );
                      }),
                    );
                  },
                  child: UserCard(
                    users: widget.favUsers,
                    index: index,
                    onTap: () {},
                  )),
            ),
          );
        },
      ),
    );
  }
}
