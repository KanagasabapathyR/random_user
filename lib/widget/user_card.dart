import 'package:flutter/material.dart';
import '../model/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.users,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final List<User> users;
  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(16.0))),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 10.0, right: 20.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                    users[index].picture,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(

                      children: [
                        Text(
                          '${users[index].fname} ',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        users[index].gender == 'male'
                            ? const FaIcon(FontAwesomeIcons.male)
                            : const FaIcon(FontAwesomeIcons.female),
                      ],
                    ),
                    Text(
                      users[index].email,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    Text(
                      'Age: ${users[index].age}',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: users[index].isFav
                      ? const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                      : Icon(Icons.favorite_border_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
