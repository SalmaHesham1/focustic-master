import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/features/feature1_screen.dart';
import 'package:projects/mobile/features/feature2_screen.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/shared/component/component.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return /*CashHelper.getBool(key: "isWeb")
                          ? buildWebSereen(
                              context: context,
                            )
                          : */
              Container(
                color:Theme.of(context).scaffoldBackgroundColor,
                child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: /*CashHelper.getBool(key: "isWeb")? 400:*/ 18,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/backgroundmobile.jpeg",
                      ),
                    )),
            child: Column(
                      children: [
                        Container(
                          height:
                              320,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 11,
                                  child: textInHomeScreen(
                                    context: context,
                                  )),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 40, right: 30),
                                  child: feature1And2(
                                    context: context,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //feature 3and4
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            height: 130,
                            alignment: AlignmentDirectional.topEnd,
                            child: feature3And4(context: context),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        softwareAndUsable(),
                        // joinButton(
                        //   context: context,
                        // ),
                      ],
                    ),
                  ),
                  Feature1Screen(),
                  Feature2Screen(),
                ],
            ),
          ),
              );
        },
      ),
    );
  }
}

// buildWebSereen({
//   required BuildContext context,
// }) =>
//     Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(50.0),
//           child: Container(
// //width: 470,
//             // color: Colors.deepOrange,
//             height: 500,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
// //web
//                     Text("Welcome to Focustic",
//                         style: TextStyle(
//                             fontSize: 100,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold)),
//
//                     Text("Your Ultimate Productivity and Health Companion!",
//                         style: TextStyle(
//                           fontSize: 40,
//                           color: Colors.white,
//                         )),
//
//                     Text("At Focustic,",
//                         style: TextStyle(
//                             fontSize: 70,
//                             color: Colors.deepOrange,
//                             fontWeight: FontWeight.bold)),
//
//                     Text("we understand the demands of a digital lifestyle and the impact it can have on your well-being",
//                         style: TextStyle(
//                             fontSize: 50,
//                             color: Colors.lightBlue[300],
//                             fontWeight: FontWeight.bold)),
//
//                     Text("That's why we've developed a powerful app that combines advanced time management features with personalized healthcare exercises, providing a holistic solution to help you thrive in today's computer-centric world",
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.lightBlue[200],
//                         )),
//
//                     // Text("adipiscing elit,sed do eiusmod tempor",
//                     //     style: TextStyle(
//                     //       fontSize: 15,
//                     //       color: Colors.lightBlue[200],
//                     //     )),
//                     //
//                     // Text("incididunt ut labore et dolore mangna aliqua",
//                     //     style: TextStyle(
//                     //       fontSize: 15,
//                     //       color: Colors.lightBlue[200],
//                     //     )),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     joinButton(
//                       context: context,
//                     ),
// //mobile
//                   ],
//                 ),
// //---------------------------------------------------------------------
//                 SizedBox(
//                   height: 150,
//                   width: 250,
//                 ),
//                 Container(
//                     //alignment: Alignment.topLeft,
//                     height: 190,
//                     // color: Colors.red,
//
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Image.asset("assets/icons/arrow.png"),
//                       ],
//                     )),
//
//                 Container(
//                     width: 290,
//                     height: 200,
//                     // color: Colors.red,
//                     alignment: Alignment.topLeft,
//                     child: Image.asset("assets/icons/arrow.png")),
// //----------------------------------------------------------
//                 Container(
//                   width: 280,
//                   //color: Colors.black,
//                   alignment: Alignment.centerLeft,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // SizedBox(height: 200,),
//                         Image.asset("assets/icons/arrow.png"),
//                         SizedBox(
//                           height: 240,
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(right: 150, bottom: 20),
//                           child: Image.asset("assets/icons/arrow.png"),
//                         ),
//                       ]),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Container(
//           height: 80,
//           width: 1050,
//           alignment: Alignment.centerLeft,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Image.asset("assets/icons/start.png"),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'SOFTWARE',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Text(
//                     'INCLUDED',
//                     style: TextStyle(color: Colors.orangeAccent[100]),
//                   ),
//                 ],
//               ),
//
//               SizedBox(
//                 width: 50,
//               ),
//               Image.asset("assets/icons/start.png"),
//               // SizedBox(height: 100,),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'USABLE',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Text(
//                     'ANYTIME',
//                     style: TextStyle(color: Colors.orangeAccent[100]),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
// //
// // trToWeb({
// //   required BuildContext context,
// // }) =>
// //     Column(
// //       children: [
// //         Padding(
// //           padding: /*CashHelper.getBool(key: "isWeb")
// //                 ? EdgeInsets.all(50.0)
// //                 : */
// //               EdgeInsets.only(top: 20, right: 20, left: 20),
// //           child: Container(
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: Container(
// //                     height: 500,
// //                     color: Colors.black,
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                       children: [
// //                         textInHomeScreen(
// //                           context: context,
// //                         ),
// //                         Container(
// //                           width: 200,
// //                           child: joinButton(
// //                             context: context,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Container(
// //                           height: 190,
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.end,
// //                             children: [
// //                               Image.asset("assets/icons/arrow.png"),
// //                             ],
// //                           )),
// //                       Container(
// //                           width: 290,
// //                           height: 200,
// //                           alignment: Alignment.topLeft,
// //                           child: Image.asset("assets/icons/arrow.png")),
// //                     ],
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: Container(
// //                     width: 280,
// //                     alignment: Alignment.bottomLeft,
// //                     child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.end,
// //                         children: [
// //                           Image.asset("assets/icons/arrow.png"),
// //                           SizedBox(
// //                             height: 240,
// //                           ),
// //                           Padding(
// //                             padding:
// //                                 const EdgeInsets.only(right: 150, bottom: 20),
// //                             child: Image.asset("assets/icons/arrow.png"),
// //                           ),
// //                           Container(
// //                             child: softwareAndUsable(),
// //                           ),
// //                         ]),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     );

Widget softwareAndUsable() => Container(
      height: /* CashHelper.getBool(key: "isWeb") ? 80 :*/ 90,
      child: Row(
        mainAxisAlignment: /* CashHelper.getBool(key: "isWeb")
              ? MainAxisAlignment.spaceAround
              : */
            MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/start.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SOFTWARE',
              ),
              Text(
                'INCLUDED',
                style: TextStyle(color: Colors.orangeAccent[100]),
              ),
            ],
          ),
          //SizedBox(width: 20,),
          Image.asset("assets/icons/start.png"),
          // SizedBox(height: 100,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'USABLE',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'ANYTIME',
                style: TextStyle(color: Colors.orangeAccent[100]),
              )
            ],
          ),
        ],
      ),
    );

Widget feature1And2({
  required BuildContext context,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          height: 100,
          duration: Duration(milliseconds: 300),
          child: GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Feature1Screen()));
              },
              child: HomeCubit.get(context).animateFeature1(
                text: HomeCubit.get(context).isFeature1Hover
                    ? Column(
                        children: [
                          Expanded(child: SizedBox()),
                          hoverContainer(
                            isHover: HomeCubit.get(context).isFeature1Hover,
                            context: context,
                            text1: "Manage and Track",
                            text2: "Your Time",
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          top: 5,
                        ),
                        child: arrowImage()),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        AnimatedContainer(
          height: 100,
          duration: Duration(milliseconds: 300),
          child: GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Feature2Screen()));
              },
              child: HomeCubit.get(context).animateFeature2(
                text: HomeCubit.get(context).isFeature2Hover
                    ? Column(
                        children: [
                          Expanded(child: SizedBox()),
                          hoverContainer(
                            isHover: HomeCubit.get(context).isFeature2Hover,
                            context: context,
                            text1: "Daily Reports",
                            text2: "for Your Work",
                          ),
                        ],
                      )
                    : arrowImage(),
              )),
        ),
      ],
    );

Widget feature3And4({
  required BuildContext context,
}) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Feature3Screen()));
                },
                child: HomeCubit.get(context).animateFeature3(
                  text: HomeCubit.get(context).isFeature3Hover
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            hoverContainer(
                              isHover: HomeCubit.get(context).isFeature3Hover,
                              context: context,
                                text1: "Tailored Exercises ",
                                text2: "for Health",
                            ),
                          ],
                        )
                      : Container(
                          padding: EdgeInsets.only(left: 30, top: 20),
                          child: arrowImage(),
                        ),
                )),
          ),
        ),
        Expanded(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Feature4Screen()));
                },
                child: HomeCubit.get(context).animateFeature4(
                  text: HomeCubit.get(context).isFeature4Hover
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            hoverContainer(
                              isHover: HomeCubit.get(context).isFeature4Hover,
                              context: context,
                              text1: "Motivation ",
                              text2: "through Community Ranking Services",
                            ),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: arrowImage(),
                        ),
                )),
          ),
        ),
      ],
    );

Widget hoverContainer({
  required BuildContext context,
  required bool isHover,
  required String text1,
  required String text2,
}) =>
    mainContainer(
      radius: 5,
      color: Colors.black26,
      child: Row(
        children: [
          Container(
              alignment: AlignmentDirectional.centerStart,
              padding: isHover ? EdgeInsets.zero : EdgeInsets.only(left: 20),
              child: Image.asset(
                "assets/icons/arrow.png",
                height: 40,
                width: 40,
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text1,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Theme.of(context).primaryColor)),
              SizedBox(
                height: 3,
              ),
              Text(text2, style: Theme.of(context).textTheme.caption),
            ],
          )),
        ],
      ),
    );
//arrowImage
arrowImage({var height, var width}) => Container(
    alignment: AlignmentDirectional.bottomStart,
    padding: EdgeInsets.only(left: 20, top: 20),
    child: Image.asset(
      "assets/icons/arrow.png",
      height: height ?? 90,
      width: width ?? 90,
    ));
//joinButton
// Widget joinButton({
//   required BuildContext context,
// }) =>
//     Row(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 60,
//             ),
//             child: MaterialButton(
//               onPressed: () {
//                 // HomeCubit.get(context).joinButtonClicked();
//               },
//               child: AnimatedContainer(
//                   duration: Duration(seconds: 500),
//                   decoration: BoxDecoration(),
//                   child: Container(
//                     height: 52,
//                     width: 195,
//                     decoration: HomeCubit.get(context).isJoinButtonClicked
//                         ? BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(color: Colors.blue),
//                           )
//                         : BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: DecorationImage(
//                               image:
//                                   AssetImage("assets/images/join_button.png"),
//                             )),
//                     child: Center(
//                       child: Text(
//                         "JOIN",
//                       ),
//                     ),
//                   )),
//             ),
//           ),
//         ),
//       ],
//     );
//text
Widget textInHomeScreen({
  required BuildContext context,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome to Focustic",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                )),
        Text("Your Ultimate Productivity and Health Companion!",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                )),
        Text("At Focustic, ",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        Text("we understand the demands of a digital lifestyle and the impact it can have on your well-being.",
            style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.lightBlue[300], fontWeight: FontWeight.bold)),
        Text(
            "That's why we've developed a powerful app that combines advanced time management features with personalized healthcare exercises, providing a holistic solution to help you thrive in today's computer-centric world.",
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.lightBlue[200]),
        overflow: TextOverflow.ellipsis,
        maxLines: 5,),
      ],
    );

//
// Welcome to Focustic - Your Ultimate Productivity and Health Companion!
//
// At Focustic, we understand the demands of a digital lifestyle and the impact it can have on your well-being. That's why we've developed a powerful app that combines advanced time management features with personalized healthcare exercises, providing a holistic solution to help you thrive in today's computer-centric world.
//
// ## Manage and Track Your Time:
//
// Efficiently manage your time with our intuitive time management tools. Stay organized,  and track your progress effortlessly. Focustic empowers you to optimize your workflow, ensuring that every minute counts.
//
// ## Daily Reports for Your Work:
//
// Gain valuable insights into your computer usage habits with our comprehensive daily reports. Understand how you spend your time, identify patterns, and make informed decisions to enhance your productivity. With Focustic, you'll have the power to make each day more productive than the last.
//
// ## Tailored Exercises for Health:
//
// Combat the strains of prolonged computer use with our carefully curated exercises. Whether you're experiencing neck and shoulder pain, eyestrain, or overuse injuries in your arms and hands, Focustic provides a diverse range of suitable exercises to alleviate discomfort and promote optimal health.
//
// ## Motivation through Community Ranking Services:
//
// Stay motivated and inspired by joining our thriving community of like-minded individuals. Engage in friendly competition through our community ranking services, where you can track your progress, celebrate milestones, and strive for greater productivity. Together, we can accomplish more.
//
// With Focustic, you can boost your productivity, prioritize your health, and find a harmonious balance between work and well-being. Take control of your digital journey and unlock your full potential with Focustic - your partner in success and vitality.
//
// ---
//