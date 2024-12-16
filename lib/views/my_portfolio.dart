import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfilio/globals/app_assets.dart';
import 'package:portfilio/globals/app_inbuilts.dart';
import 'package:portfilio/helper%20class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

class Myportfilio extends StatefulWidget {
  const Myportfilio({Key? key}) : super(key: key);

  @override
  State<Myportfilio> createState() => _MyportfilioState();
}

class _MyportfilioState extends State<Myportfilio> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);


  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: AppInBuilds.images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 450,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.themeColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // Apply border radius
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10), // Optional, for clarity
                          ),
                          child: Image.asset(
                            AppInBuilds.images[index],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        AppInBuilds.projects[index],
                        style: AppTextStyles.montserratStyle(
                            color: Colors.black87, fontSize: 20),
                      ),
                      Constants.sizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text(
                          AppInBuilds.description[index],
                          style: AppTextStyles.comfortaaStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Constants.sizedBox(height: 30.0),
                    ],
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onH0verEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.themeColor.withOpacity(1.0),
                          AppColors.themeColor.withOpacity(0.9),
                          AppColors.themeColor.withOpacity(0.8),
                          AppColors.themeColor.withOpacity(0.6),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Constants.sizedBox(height: 15.0),
                        // Android Button
                        InkWell(
                          onTap: () {
                            if (AppInBuilds.androidUrls.isNotEmpty) {
                              _launchURL(AppInBuilds.androidUrls[index]);
                            }
                          },
                          child: Container(
                            width: 130,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/android.png',
                                  width: 20,
                                  height: 20,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 8),
                                Text('Play Store',
                                    style: AppTextStyles.italianaStye()),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Only show iOS button if the iOS URL is non-empty
                        if (AppInBuilds.iosUrls[index].isNotEmpty)
                          InkWell(
                            onTap: () {
                              if (AppInBuilds.iosUrls[index].isNotEmpty) {
                                _launchURL(AppInBuilds.iosUrls[index]);
                              }
                            },
                            child: Container(
                              width: 130,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    color: Colors.black,
                                    'assets/images/apple.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text('App Store',
                                      style: AppTextStyles.italianaStye()),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}
