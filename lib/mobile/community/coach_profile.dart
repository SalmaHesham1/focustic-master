import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../edit/edit_screen.dart';
import '../profile/communit_profile.dart';
import '../profile/cubit/cubit.dart';
import '../profile/cubit/states.dart';
import '../register/register_screen.dart';

class CoachProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProfileCubit.get(context).myProfileState(isMyProfile: false);
            ProfileCubit.get(context).coachProfile(isCoach: true);
            return buildProfileScreen(
              context: context,
              scaffoldKey: ProfileCubit.get(context).scaffoldKey,
              myProfile: ProfileCubit.get(context).myProfile,
            );
          }),
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
        height: 100,
        fit: BoxFit.cover,
        image: AssetImage(
          "assets/images/background.png",
        ),
      );
  coloredCircle() {
    double size = 40;
    return Container(
      width: 100,
      height: 100,
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
                  padding: EdgeInsets.only(top: 55),
                  child: Center(
                    child: coloredCircle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
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
  Widget editIcon() => ProfileCubit.get(context).animateEdit(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 15,
              left: 5,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditScreen()));
              },
              child: Image(
                height: ProfileCubit.get(context).isEditHover ? 20 : 15,
                width: ProfileCubit.get(context).isEditHover ? 20 : 15,
                fit: BoxFit.contain,
                color: ProfileCubit.get(context).isEditHover
                    ? Color(0xffFF5E17)
                    : Colors.white,
                image: AssetImage(
                  "assets/icons/edit.png",
                ),
              ),
            ),
          ),
        ),
      );
  //person name
  personName() => Container(
        child: Text(
          "FOCUSTIC",
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
          ProfileCubit.get(context).myProfile ? editIcon() : SizedBox(),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(
          bottom: 15,
          left: 5,
        ),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_remove_outlined,
            )),
      ),
    ],
  );
}

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
            child: Text(
              "Coach - 20 YEARS OLD",
              style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                  overflow: TextOverflow.ellipsis),
            ),
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: ProfileCubit.get(context).myProfile
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      infoBar(
                        context: context,
                        infoTitle: "Trainee",
                        info: "14",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      infoBar(
                        context: context,
                        infoTitle: "Rate",
                        info: "5.0",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: SizedBox(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xff0872b9),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "About me",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/library_video.png",
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Text(
                                  "Checkout these exercises and",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                Text(
                                  "tretches for better posture",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                Text(
                                  "back and neck health",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: mainTextButton(
                              context: context,
                              onPressed: () {},
                              child: Text(
                                "Start With me!",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                              borderColor: Color(0xffc8e9ff),
                              backgroundColor: Color(0xffc8e9ff),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: mainTextButton(
                              context: context,
                              onPressed: () {},
                              child: Text(
                                "Contact Coach Name",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              borderColor: Color(0xffff5f19),
                              backgroundColor: Color(0xffff5f19),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
