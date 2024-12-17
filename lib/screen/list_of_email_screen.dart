import 'package:email_responsive/components/responsive.dart';
import 'package:email_responsive/constants.dart';
import 'package:email_responsive/model/email.dart';
import 'package:email_responsive/screen/email_screen.dart';
import 'package:email_responsive/screen/side_menu.dart';
import 'package:email_responsive/widget/email_cart_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ListOfEmailScreen extends StatefulWidget {
  const ListOfEmailScreen({super.key});

  @override
  State<ListOfEmailScreen> createState() => _ListOfEmailScreenState();
}

class _ListOfEmailScreenState extends State<ListOfEmailScreen> {
  GlobalKey<ScaffoldState> globalKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
    child: const SideMenu(),
    ),
    body:   Container(
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgDarkColor,
      child: SafeArea(
          right: false,
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: 10),
                child: Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                          onPressed: () {
                            globalKey.currentState?.openDrawer();
                          }, icon: const Icon(Icons.menu)),
                    if (Responsive.isDesktop(context))
                      const SizedBox(
                        width: 5,
                      ),
                    Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              fillColor: kBgLightColor,
                              filled: true,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(
                                    kDefaultPadding * 0.75),
                                child: WebsafeSvg.asset(
                                    'Search.svg', width: 24),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'AngleDown.svg',
                      width: 16,color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: WebsafeSvg.asset(
                        'Sort.svg',
                        width: 16,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding,),
              Expanded(
                child: ListView.builder(
                    itemCount: emails.length,
                    itemBuilder: (context, index) {
                      return EmailCartWidget(email:emails[index],
                        isActive: Responsive.isMobile(context)
                            ? false
                            : index == 0, press: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return EmailScreen(email: emails[index],);
                              }));
                        },);
                    }),
              )
            ],
          )),
    ));
  }
}
