import 'package:email_responsive/constants.dart';
import 'package:email_responsive/model/email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailCartWidget extends StatelessWidget {
  const EmailCartWidget(
      {super.key,
      required this.isActive,
      required this.email,
      required this.press});

  final bool isActive;
  final Email email;
  final VoidCallback press;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 5),
                    blurRadius: 15,
                    color: const Color(0xFF234395).withOpacity(0.15),
                  ),
                  const BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 10,
                    color: Colors.white60,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(email.image),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${email.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive ? Colors.white : kTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: email.subject,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color:
                                          isActive ? Colors.white : kTextColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email.time,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: isActive ? Colors.white70 : null,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          if (email.isAttachmentAvailable)
                            SvgPicture.asset(
                              "Paperclip1.svg",
                              color: isActive ? Colors.white70 : Colors.grey,
                              width: 24,
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    email.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : null,
                        ),
                  )
                ],
              ),
            ),
            if (!email.isChecked)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kBadgeColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 4,
                            offset: Offset(2, 2))
                      ]),
                ),
              ),
            if (email.tagColor != null)
              Positioned(
                left: 8,
                top: 0,
                child: SvgPicture.asset(
                  "MarkupFilled.svg",
                  height: 18,
                  color: email.tagColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
