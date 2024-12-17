import 'package:email_responsive/components/responsive.dart';
import 'package:email_responsive/screen/email_screen.dart';
import 'package:email_responsive/screen/list_of_email_screen.dart';
import 'package:email_responsive/screen/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Responsive(
      mobile: ListOfEmailScreen(),
      tablet: Row(
        children: [
          Expanded(flex: 6, child: ListOfEmailScreen()),
          Expanded(flex: 9 ,child: EmailScreen())
        ],
      ),
      desktop: Row(
        children: [
          Expanded(flex: size.width > 1340 ? 2 : 4, child: SideMenu()),
          Expanded(flex: size.width > 1340 ? 3 : 5, child: ListOfEmailScreen()),
          Expanded(flex: size.width > 1340 ? 8 : 10, child: EmailScreen()),
        ],
      ),
    ));
  }
}
