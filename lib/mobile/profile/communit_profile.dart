import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/edit/edit_screen.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/profile/cubit/cubit.dart';
import 'package:projects/mobile/profile/cubit/states.dart';

class CommunityProfileScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return buildProfileScreen(
      context: context,
      scaffoldKey: scaffoldKey,
      myProfile: false,
    );
  }
}

//profile image
Widget profileImage({
  // required bool isWeb,
  required BuildContext context,
}) {
  backGrondImage() => Image(
        width: double.infinity,
        height: /*isWeb ? 200 : */ 100,
        fit: BoxFit.cover,
        image: AssetImage(
          "assets/images/background.png",
        ),
      );
  coloredCircle() {
    double size = /* isWeb ? 80 : */ 40;
    return Container(
      width: /*isWeb ? 200 : */ 100,
      height: /*isWeb ? 230 :*/ 100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                  width: size,
                  height: size,
                  image: AssetImage("assets/images/top profile.png"))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          /*isWeb ? Spacer() : */ Container(),
          Row(
            children: [
              Image(
                  width: size,
                  height: size,
                  image: AssetImage("assets/images/bottom profile.png"))
            ],
          ),
        ],
      ),
    );
  }

  smallImage() => CircleAvatar(
        backgroundImage: AssetImage(
          "assets/images/background.png",
        ),
        radius: /*isWeb ? 100 :*/ 40,
      );
  smallImageAndCircel() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 55),
                  child: Center(
                    child: coloredCircle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: smallImage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  return Container(
    height: 160,
    child: Stack(
      children: [
        backGrondImage(),
        smallImageAndCircel(),
      ],
    ),
  );
}

//edit name
Widget editName({
  required BuildContext context,
}) {
  //edit icon

  //person name
  personName() => Container(
        child: Text(
          HomeCubit.get(context).communityProfile!.name,
          style: TextStyle(
            fontSize: 35,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          personName(),
           SizedBox(),
        ],
      ),
      SizedBox(),
    ],
  );
}

//send a message
Widget sendAMessage({
  required BuildContext context,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          linkekdInAndGoogle(
            context: context,
          ),
        ],
      ),
    );
//linked in and google
Widget linkekdInAndGoogle({
  required BuildContext context,
  // required bool isWeb,
}) =>
    Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage("assets/icons/linkedin2.png"),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Linked In",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Color(0xffF2C782)),
        )
      ],
    );

Widget editAndAgeAndSendAMessage({
  required BuildContext context,
  required bool myProfile,
  /*required bool isWeb*/
}) =>
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          editName(
            context: context,
          ),
          //work an age
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "${HomeCubit.get(context).communityProfile!.email} ",
                      style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),Expanded(
                    child: Text(
                      "- ${HomeCubit.get(context).communityProfile!.age} YEARS OLD",
                      style: TextStyle(
                          fontSize: 21,
                          color: Theme.of(context).primaryColor,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //send a message
          myProfile
              ? SizedBox()
              : sendAMessage(
                  context: context,
                ),
        ],
      ),
    );

Widget buildProfileScreen({
  required var scaffoldKey,
  required BuildContext context,
  required bool myProfile,
  // required bool isWeb,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          image: DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage(
              "assets/icons/background2.png",
            ),
          )),
      child: Column(
        children: [
          //profile image
          profileImage(
            context: context,
          ),
          editAndAgeAndSendAMessage(
            context: context,
            myProfile: myProfile,
          ),
          SizedBox(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: false
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("Bio",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                    ],
                  ),
                  SizedBox(),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffF89A54)),
                      ),
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      child: Text(
                        HomeCubit.get(context).communityProfile!.bio.toString(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                      // Column(
                      //   children: [
                      //     Image(image: AssetImage("assets/icons/privacy.png")),
                      //     SizedBox(
                      //       height: 10,
                      //     ),
                      //     Text("Fosuctic"),
                      //     Text(
                      //       "Account is in privacy mode",
                      //       style: TextStyle(
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //     Text(
                      //       "add him to see his profile page",
                      //       style: TextStyle(
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget infoBar({
  required BuildContext context,
  required String infoTitle,
  required String info,
  double? radius,
  double? padding,
}) =>
    Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 1),
        child: Container(
          padding: EdgeInsets.all(padding ?? 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 10),
            color: Color(0xffc8e9ff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                infoTitle,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
              ),
              Text(
                info,
                style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ],
          ),
        ),
      ),
    );

Widget appBarAction({
  required BuildContext context,
  required String text,
  required var onPressed,
}) =>
    Expanded(
      child: Container(
        height: 40,
        child: TextButton(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
