import 'package:email_responsive/components/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              // Header with logo and close button
              Row(
                children: [
                  Image.asset(
                    "LogoOutlook.png",
                    width: 46,
                  ),
                  const Spacer(),
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: kDefaultPadding),

              // "New Message" button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: const Color(0xFF234395).withOpacity(0.2),
                      offset: const Offset(4, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "Edit.svg",
                    width: 16,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "New message",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: kDefaultPadding),

              // "Get Messages" button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBgDarkColor,
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: const Color(0xFF30384D).withOpacity(0.3),
                      offset: const Offset(4, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: WebsafeSvg.asset("Download.svg", width: 16),
                  label: const Text(
                    "Get messages",
                    style: TextStyle(color: kTextColor),
                  ),
                ),
              ),

              const SizedBox(height: kDefaultPadding * 2),

              // Side Menu Items
              ...[
                {
                  "title": "Inbox",
                  "iconSrc": "Inbox.svg",
                  "isActive": true,
                  "itemCount": 3,
                },
                {
                  "title": "Sent",
                  "iconSrc": "Send.svg",
                  "isActive": false,
                  "itemCount": null,
                },
                {
                  "title": "Drafts",
                  "iconSrc": "File.svg",
                  "isActive": false,
                  "itemCount": null,
                },
                {
                  "title": "Deleted",
                  "iconSrc": "Trash.svg",
                  "isActive": false,
                  "itemCount": null,
                },
              ].map((item) {
                return Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          (item['isActive'] as bool)
                              ? SvgPicture.asset(
                            "AngleRight.svg",
                            width: 15,
                          )
                              : const SizedBox(width: 15),
                          const SizedBox(width: kDefaultPadding / 4),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  bottom: 15, right: 5),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFDFE2EF)),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    item['iconSrc'] as String,
                                    height: 20,
                                    color: (item['isActive'] as bool)
                                        ? kPrimaryColor
                                        : kGrayColor,
                                  ),
                                  const SizedBox(width: kDefaultPadding * 0.75),
                                  Text(
                                    item['title'] as String,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                      color: (item['isActive'] as bool)
                                          ? kTextColor
                                          : kGrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (item['itemCount'] != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: kBadgeColor,
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: Text(
                                        item['itemCount'].toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              const SizedBox(height: kDefaultPadding * 2),

              // Tags Section
              Column(
                children: [
                  Row(
                    children: [
                      WebsafeSvg.asset("AngleDown.svg", width: 16),
                      const SizedBox(width: kDefaultPadding / 4),
                      WebsafeSvg.asset("Markup.svg", width: 20),
                      const SizedBox(width: kDefaultPadding / 2),
                      const Spacer(),
                      MaterialButton(
                        padding: const EdgeInsets.all(10),
                        minWidth: 40,
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                          color: kGrayColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  ...[
                    {"color": const Color(0xFF23CF91), "title": "Design"},
                    {"color": const Color(0xFF3A6FF7), "title": "Work"},
                    {"color": const Color(0xFFF3CF50), "title": "Friends"},
                    {"color": const Color(0xFF8338E1), "title": "Family"},
                  ].map((tag) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              kDefaultPadding * 1.5, 10, 0, 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "MarkupFilled.svg",
                                height: 18,
                                color: tag['color'] as Color,
                              ),
                              const SizedBox(width: kDefaultPadding / 2),
                              Text(
                                tag['title'] as String,
                                style: const TextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

