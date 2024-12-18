import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import 'footer_mini_box.dart';

class Footer extends StatelessWidget {
  final bool isMobile, isTablet;

  const Footer({Key? key, required this.isMobile, required this.isTablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.lightGreenbackground,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Box 1
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FooterMiniBox(
                            title: "Support",
                            items: [
                              "Shipping",
                              "Returns & Exchanges",
                              "FAQ",
                              "Contact Us",
                            ],
                          ),
                          const SizedBox(height: 20),
                          FooterMiniBox(
                            title: "Resources",
                            items: [
                              "Lye Calculator",
                              "Fragrance Calculator",
                              "Beginner Guides",
                            ],
                          ),
                          const SizedBox(height: 20),
                          FooterMiniBox(
                            title: "About",
                            items: [
                              "About Us",
                              "Social Causes",
                              "Rewards Program",
                              "Corporate Gifting",
                            ],
                          ),
                          const SizedBox(height: 20),
                          FooterMiniBox(
                            title: "Customer Support",
                            items: [
                              "LIVE CHAT",
                              "info@brambleberry.com",
                              "1-877-627-7883",
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Copyright © 2024 Bramble Berry ®",
                        style:
                            AppTextStyles.lobsterTextMedium(isMobile, isTablet),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Box 2
                Container(
                  padding: const EdgeInsets.all(20),
                  color: AppColors.lightGreenbackground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Join Our Community",
                        style: AppTextStyles.lobsterText(isMobile, isTablet),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Get 20% off your first order!*",
                        style:
                            AppTextStyles.lobsterTextMedium(isMobile, isTablet),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text("SIGN IN"),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "SOCIAL HANDLES",
                        style: AppTextStyles.lobsterText(isMobile, isTablet),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.facebook,
                              color: Colors.white),
                          const SizedBox(width: 10),
                          const FaIcon(FontAwesomeIcons.twitter,
                              color: Colors.white),
                          const SizedBox(width: 10),
                          const FaIcon(FontAwesomeIcons.instagram,
                              color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Box 1 (65%)
                Expanded(
                  flex: 65,
                  child: Container(
                    color: AppColors.lightGreenbackground,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FooterMiniBox(
                                title: "Support",
                                items: [
                                  "Shipping",
                                  "Returns & Exchanges",
                                  "FAQ",
                                  "Contact Us",
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FooterMiniBox(
                                title: "Resources",
                                items: [
                                  "Lye Calculator",
                                  "Fragrance Calculator",
                                  "Beginner Guides",
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FooterMiniBox(
                                title: "About",
                                items: [
                                  "About Us",
                                  "Social Causes",
                                  "Rewards Program",
                                  "Corporate Gifting",
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FooterMiniBox(
                                title: "Customer Support",
                                items: [
                                  "LIVE CHAT",
                                  "info@brambleberry.com",
                                  "1-877-627-7883",
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Copyright © 2024 Bramble Berry ®",
                          style: AppTextStyles.lobsterTextMedium(
                              isMobile, isTablet),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Box 2 (35%)
                Expanded(
                  flex: 35,
                  child: Container(
                    color: AppColors.lightGreenbackground,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Join Our Community",
                          style: AppTextStyles.lobsterText(isMobile, isTablet),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Get 20% off your first order!*",
                          style: AppTextStyles.lobsterTextMedium(
                              isMobile, isTablet),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                          ),
                          child: const Text("SIGN IN"),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "SOCIAL HANDLES",
                          style: AppTextStyles.lobsterText(isMobile, isTablet),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.facebook,
                                color: Colors.black),
                            const SizedBox(width: 10),
                            const FaIcon(FontAwesomeIcons.twitter,
                                color: Colors.black),
                            const SizedBox(width: 10),
                            const FaIcon(FontAwesomeIcons.instagram,
                                color: Colors.black),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
