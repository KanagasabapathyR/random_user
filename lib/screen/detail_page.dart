import 'package:flutter/material.dart';
import '../model/user.dart';
import '../widget/row_widget.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          elevation: 0,
          title: Text(
        "${user.fname} ${user.lname}",
            style: TextStyle(

              fontSize: 25.0,

            ),
        ),),
        body: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 100.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.picture),
                  radius: 100.0,
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(9.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: ListView(children: [
                      RowWidget(
                        title: 'Email',
                        detail: user.email,
                        icon: Icons.email,
                      ),
                      RowWidget(
                        title: 'Age',
                        detail: user.age,
                        icon: Icons.calendar_month,
                      ),
                      RowWidget(
                        title: 'Cell',
                        detail: user.cell,
                        icon: Icons.phone_android,
                      ),
                      RowWidget(
                          title: 'Nationality',
                          detail: user.nat,
                          icon: Icons.location_city),
                      RowWidget(
                        title: 'Address',
                        detail: user.adress,
                        icon: Icons.home,
                      ),
                    ])),
              ),
            ],
          ),
        ));
  }
}
