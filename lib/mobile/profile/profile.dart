import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/mobile/profile/cubit/cubit.dart';
import 'package:projects/mobile/profile/cubit/states.dart';
import 'package:projects/mobile/send_a_message/send_a_message_screen.dart';
import 'package:projects/shared/component/component.dart';
import 'package:projects/shared/network/local/cash_helper.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()
        ..showProfile(
          token: CashHelper.getString(key: "token"),
          context: context,
        ),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProfileCubit.get(context).myProfileState(isMyProfile: true);
            return state is ShowProfileLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildProfileScreen(
                    context: context,
                    scaffoldKey: ProfileCubit.get(context).scaffoldKey,
                    myProfile: ProfileCubit.get(context).myProfile,
                  );
          }),
    );
  }
}

//main appBar
Widget mainAppBar({
  required BuildContext context,
  required var scaffoldKey,
  // required bool isWeb,
}) =>
    Container(
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/appBar.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 28,
          right: 28,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo button
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
                );
              },
              child: Image(
                image: AssetImage(
                  "assets/icons/logo.png",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState.openEndDrawer();
              },
              child: Image(
                image: AssetImage(
                  "assets/icons/menu.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
              child: /*isWeb
                      ? coloredCircle()
                      : */
              Center(
                child: coloredCircle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: /*isWeb
                      ? Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: smallImage(),
                        )
                      : */
              Center(
                child: smallImage(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  return Container(
    height: /* isWeb ? 300 : */ 160,
    child: Stack(
      children: [
        backGrondImage(),
        /* isWeb
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    smallImageAndCircel(),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: editAndAgeAndSendAMessage(
                          context: context,
                          isWeb: isWeb,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : */
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
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
            left: 5,
          ),
          child: GestureDetector(
            onTap: () {
              HomeCubit.get(context).changeBody(index: 20);
            },
            child: Image(
              height: 15,
              width: 15,
              fit: BoxFit.contain,
              color: Colors.white,
              image: AssetImage(
                "assets/icons/edit.png",
              ),
            ),
          ),
        ),
        // child: AnimatedContainer(
        //   duration: Duration(milliseconds: 300),
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       bottom: 15,
        //       left: 5,
        //     ),
        //     child: GestureDetector(
        //       onTap: () {
        //         HomeCubit.get(context).changeBody(index: 20);
        //           },
        //       child: Image(
        //             height: ProfileCubit.get(context).isEditHover ? 20 : 15,
        //             width: ProfileCubit.get(context).isEditHover ? 20 : 15,
        //             fit: BoxFit.contain,
        //             color: ProfileCubit.get(context).isEditHover
        //                 ? Color(0xffFF5E17)
        //                 : Colors.white,
        //             image: AssetImage(
        //               "assets/icons/edit.png",
        //             ),
        //           ),
        //     ),
        //   ),
        // ),
      );
  //person name
  personName() => Container(
    child: Text(
      ProfileCubit.get(context).userModel!.data.attributes.name,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SendAMessageScreen()));
            },
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/message.png"),
                      )),
                  child: Icon(
                    Icons.message,
                    color: Colors.black.withOpacity(0.3),
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Container(
                  child: Text(
                    "SEND A MESSAGE",
                    style: TextStyle(
                      color: Color(0xffFF5E17),
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image(
            image: AssetImage("assets/icons/linkedin2.png"),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: Color(0xffF2C783),
          radius: 2,
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {},
          child: Image(
            image: AssetImage("assets/icons/facebook.png"),
          ),
        ),
      ],
    );
//tasks to do
// Widget tasksToDo({
//   required String text,
//   required bool isTask,
//   required BuildContext context,
//   required ProfileCubit profileCubit,
//   required var screen,
//   required double fontSize,
// }) =>
//     Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () {
//             profileCubit.animateWhenTap(isTabbed: isTask);
//             print("tap");
//           },
//           onDoubleTap: () {
//             profileCubit.animateWhenTap(isTabbed: isTask);
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => screen));
//           },
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 3000),
//             child: Row(
//               children: [
//                 Text(
//                   text,
//                   style: TextStyle(
//                     fontSize: fontSize,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     bottom: 15,
//                   ),
//                   child: Text(
//                     "+",
//                     style: TextStyle(
//                       fontSize: fontSize,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Spacer(),
//         isTask
//             ? Text(
//                 "4",
//                 style: TextStyle(
//                   fontSize: 23,
//                 ),
//               )
//             : Container(),
//       ],
//     );
//tasks to do list
// Widget tasksToDoList({
//   required BuildContext context,
//   var percent = 0.4,
// }) =>
//     mainContainer(
//       radius:10,
//       color: Theme.of(context).primaryColor.withOpacity(0.6),
//       child: Container(
//         height: 280,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView.separated(
//               shrinkWrap: true,
//               primary: false,
//               itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Container(
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 9),
//                                     child: Text("Task $index"),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   LinearPercentIndicator(
//                                     lineHeight: 5,
//                                     percent: percent,
//                                     progressColor: Color(0xffF2C782),
//                                     backgroundColor: Color(0xff919483),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 right: 10,
//                               ),
//                               child: Container(
//                                   alignment: AlignmentDirectional.centerEnd,
//                                   child: Text("${percent * 100}%")),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               separatorBuilder: (context, index) => SizedBox(
//                     height: 15,
//                   ),
//               itemCount: 10),
//         ),
//       ),
//     );
//communicate list
// Widget communicateList({
//   required BuildContext context,
//   // required bool isWeb,
// }) =>
//     mainContainer(
//       radius: 10,
//       color: Theme.of(context).primaryColor.withOpacity(0.6),
//       child: Container(
//         height: 280,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView.separated(
//               shrinkWrap: true,
//               primary: false,
//               itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.only(top: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               child: Row(
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundColor: Colors.cyan,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                         child: Text(
//                                       "FOCUSTIC",
//                                       overflow: TextOverflow.ellipsis,
//                                     )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: Container(
//                               alignment: AlignmentDirectional.centerEnd,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundColor: Color(0xff02FB3E),
//                                     radius: 4,
//                                   ),
//                                   SizedBox(
//                                     width: 3,
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       child: Text(
//                                         "ONLINE",
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             overflow: TextOverflow.ellipsis),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               separatorBuilder: (context, index) => SizedBox(
//                     height: 10,
//                   ),
//               itemCount: 10),
//         ),
//       ),
//     );

//edit,jop and send message
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
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "${ProfileCubit.get(context).userModel!.data.attributes.email}",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${ProfileCubit.get(context).userModel!.data.attributes.age} YEARS OLD",
                    style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).primaryColor,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
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
//body of the profile
// Widget bodyOfTheProfile({
//   required BuildContext context,
//   required ProfileCubit profileCubit,
// }) {
//   //tasks Ccotainer
//   // tasksContainer() => Container(
//   //       child: Column(
//   //         children: [
//   //           // profileCubit.animateTasks(
//   //           //   text: tasksToDo(
//   //           //     text: "Tasks to do",
//   //           //     isTask: true,
//   //           //     profileCubit: ProfileCubit.get(context),
//   //           //     context: context,
//   //           //     screen: TasksScreen(),
//   //           //     fontSize: profileCubit.isTasksTaped || profileCubit.isTasksHover
//   //           //         ? 35
//   //           //         : 23,
//   //           //   ),
//   //           // ),
//   //           // SizedBox(
//   //           //   height: 7,
//   //           // ),
//   //           // tasksToDoList(
//   //           //   context: context,
//   //           // )
//   //         ],
//   //       ),
//   //     );
//   //commnicat container
//   // commnicateContainer() => Container(
//   //       child: Column(
//   //         children: [
//   //           // profileCubit.animateCommunicate(
//   //           //   text: tasksToDo(
//   //           //     text: "Communicate",
//   //           //     isTask: false,
//   //           //     context: context,
//   //           //     profileCubit: ProfileCubit.get(context),
//   //           //     screen: CommunicateScreen(),
//   //           //     fontSize: profileCubit.isCommunicateTaped ||
//   //           //             profileCubit.isCommunicateHover
//   //           //         ? 35
//   //           //         : 23,
//   //           //   ),
//   //           // ),
//   //           SizedBox(
//   //             height: 7,
//   //           ),
//   //           // communicateList(
//   //           //   context: context,
//   //           // )
//   //         ],
//   //       ),
//   //     );
//   return Padding(
//     padding: const EdgeInsets.only(left: 30, right: 30),
//     child: Container(
//       child: Column(
//         //info about person
//         children: [
//
//           //tasks to doo
//           // tasksContainer(),
//           // SizedBox(
//           //   height: 30,
//           // ),
//           //communicate
//           // commnicateContainer(),
//           // SizedBox(
//           //   height: 30,
//           // ),
//         ],
//       ),
//     ),
//   );
// }

//build prodile screen
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
          //body of the profile
          // bodyOfTheProfile(
          //   context: context,
          //   profileCubit: ProfileCubit.get(context),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: ProfileCubit.get(context).myProfile
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  ProfileCubit.get(context).myProfile ? SizedBox() : Spacer(),
                  ProfileCubit.get(context).myProfile
                      ? Row(
                          children: [
                            infoBar(
                                context: context,
                                infoTitle: "Completed tasks",
                                info: "0 Tasks"),
                            // info: "${ProfileCubit.get(context).reportModel!.attributes.completedTasks.toString()} Tasks"),
                            infoBar(
                                context: context,
                                infoTitle: "Target achieved",
                                info: "0 Targets"),
                            // info: "${ProfileCubit.get(context).reportModel!.attributes.activeSessions.toString()} Targets"),
                            infoBar(
                                context: context,
                                infoTitle: "Sessions",
                                info: "0 Sessions"),
                            // info: "${ProfileCubit.get(context).reportModel!.attributes.completedSession.toString()} Sessions"),
                          ],
                        )
                      : SizedBox(),
                  ProfileCubit.get(context).myProfile
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  mainContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Tasks Rate",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      color: Color(0xff0872b9)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  mainContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Exercises rate",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      color: Color(0xff0872b9)),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  SleekCircularSlider(
                                    // onChangeStart: (double value) {},
                                    // onChangeEnd: (double value) {},
                                    // innerWidget: viewModel.innerWidget,
                                    appearance: CircularSliderAppearance(
                                        startAngle: 180,
                                        angleRange: 180,
                                        infoProperties: InfoProperties(
                                            mainLabelStyle: TextStyle(
                                          color: Colors.white,
                                        )),
                                        customWidths: CustomSliderWidths(
                                          trackWidth: 10,
                                          progressBarWidth: 11,
                                        ),
                                        customColors: CustomSliderColors(
                                          trackColor: Color(0xFFE2EFF7),
                                          dotColor: Color(0xFF0872B9),
                                          progressBarColor: Color(0xFF0872B9),
                                        )),
                                    min: 0,
                                    max: 100,
                                    initialValue: 0,
                                  ),
                                  CircularSeekBar(
                                    width: 115,
                                    height: 115,
                                    progress: 100,
                                    barWidth: 3,
                                    startAngle: 93,
                                    sweepAngle: 192,
                                    strokeCap: StrokeCap.butt,
                                    progressColor: Color(0xFF0872B9),
                                    dashWidth: 3,
                                    dashGap: 13,
                                    animation: false,
                                    interactive: false,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Color(0xffc8e9ff),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 70),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "0%",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.grey,
                                                  ),
                                            ),
                                            Text(
                                              "100%",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.grey,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "0%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                color: Colors.black,
                                              ),
                                        ),
                                        Text(
                                          "Sessions",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/icons/privacy.png")),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Fosuctic"),
                              Text(
                                "Account is in privacy mode",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "add him to see his profile page",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                  ProfileCubit.get(context).myProfile
                      ? SizedBox(
                          height: 70,
                        )
                      : Column(
                          children: [
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                          ],
                        ),
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
