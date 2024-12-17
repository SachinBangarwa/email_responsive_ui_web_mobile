import 'package:email_responsive/components/responsive.dart';
import 'package:email_responsive/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          if (Responsive.isMobile(context)) const BackButton(),
          IconButton(
            icon: SvgPicture.asset(
              "Trash.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "Reply.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "ReplyAll.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "Transfer.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          if (Responsive.isDesktop(context))
            IconButton(
              icon: SvgPicture.asset(
                "Printer.svg",
                width: 24,
              ),
              onPressed: () {},
            ),
          IconButton(
            icon: SvgPicture.asset(
              "Markup.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "MoreVertical.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
