import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfilio/globals/app_assets.dart';
import 'package:portfilio/globals/app_colors.dart';
import 'package:portfilio/globals/constants.dart';
import 'package:portfilio/helper%20class/helper_class.dart';
import '../globals/app_buttons.dart';
import '../globals/app_text_styles.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 35.0),
          // buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  // FadeInRight buildProfilePicture() {
  //   return FadeInRight(
  //     duration: const Duration(milliseconds: 1200),
  //     child: Image.asset(
  //       AppAssets.profile2,
  //       height: 450,
  //       width: 400,
  //     ),
  //   );
  // }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Flutter Developer!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            '''I am a dedicated Flutter developer with two years of professional experience, specializing in creating dynamic and responsive applications. My journey in Flutter development has seen me successfully deliver a range of projects, with a particular focus on e-commerce applications. These projects have honed my skills in building high-performance, user-friendly mobile and web applications that not only meet but exceed client expectations. My technical expertise encompasses the entire development lifecycle, from conceptualization and design to implementation and deployment. I have a strong command of Dart programming, state management solutions, and integrating RESTful APIs.

My work is characterized by a meticulous attention to detail, ensuring seamless user experiences and robust functionality. I am committed to continuous learning and staying abreast of the latest advancements in Flutter and related technologies. This passion for innovation drives me to incorporate the best practices and cutting-edge methodologies into my projects, ensuring that my solutions are always at the forefront of technology.

In addition to my technical skills, I am a proactive problem solver and an effective communicator, able to collaborate efficiently with cross-functional teams to deliver projects on time and within scope. My portfilio reflects a blend of creativity, technical proficiency, and a relentless pursuit of excellence.''',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
      ],
    );
  }
}
