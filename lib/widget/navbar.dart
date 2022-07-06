import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('About Us'),
              const SizedBox(
                width: 60,
              ),
              NavBarItem('Assessment Centre'),
            ],
          )
        ],
      ),
    );
  }
}

NavBarLogo() {
  return SizedBox(
    height: 80,
    width: 150,
    child: Image.asset('logo.png'),
  );
}

Widget NavBarItem(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 18),
  );
}
