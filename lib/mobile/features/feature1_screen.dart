import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/about/about_screen.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';

//import 'package:grade2/form%20test.dart';
class Feature1Screen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return buildFeature1Screen(
                context: context,
              );
              // return ScreenTypeLayout(
              //   mobile: Builder(builder:(context) {
              //     CashHelper.putData(key: "isWeb", value: false);
              //     return buildFeatre1Screen();}),
              //   desktop: Builder(builder:(context) {
              //     CashHelper.putData(key: "isWeb", value: true).then((value){
              //       print(CashHelper.getBool(key: "isWeb").toString());
              //       print("--------------------------------------------------------------------");
              //     });
              //     return buildWebScreen();}),
              //   breakpoints: ScreenBreakpoints(
              //     desktop: 600,
              //     tablet: 600,
              //     watch: 100,
              //   ),
              // );
            }));
  }

  Widget buildFeature1Screen({
    required BuildContext context,
  }) =>
      Container(
        width: double.infinity,
        height: 700,
        decoration: BoxDecoration(
            image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/backgroundmobile8.jpeg",
          ),
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: /*CashHelper.getBool(key: "isWeb")? 400:*/ 25,
            vertical: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: 10,
                    width: 10,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text(
                      'Focustic empowers you to optimize your workflow, ensuring that every minute counts.',
                      style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            overflow: TextOverflow.ellipsis
                          ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: 10,
                    width: 10,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text(
                      "With Focustic, you'll have the power to make each day more productive than the last.",
                      style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                              overflow: TextOverflow.ellipsis
                          ),
                        maxLines: 4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: 10,
                    width: 10,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text(
                      "Focustic provides a diverse range of suitable exercises to alleviate discomfort and promote optimal health.",
                      style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                              overflow: TextOverflow.ellipsis
                          ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: 10,
                    width: 10,
                  ),
                  SizedBox(width: 5,),
                   Expanded(
                     child: Text(
                      'Engage in friendly competition through our community ranking services, where you can track your progress, celebrate milestones, and strive for greater productivity. Together, we can accomplish more.',
                      style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                              overflow: TextOverflow.ellipsis
                          ),
                       maxLines: 4,
                  ),
                   ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      );
}

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

Widget buildWebScreen({
  required BuildContext context,
}) =>
    Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.25,
                      //width: double.infinity*2/3,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "assets/images/backgroundweb2.jpg",
                            ),
                          )),
                      //color: Colors.deepOrange,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // joinButton(
                            //   context: context,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,

                        //height: 2000,
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height,
                        //width: double.infinity*2/3,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assets/images/webbackground.jpeg",
                              ),
                            )),
                        //color: Colors.deepOrange,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 70.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/icons/SHAPE.png",
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("START",
                                                style: TextStyle(
                                                  fontSize: 80,
                                                  color: Colors.deepOrange,
                                                )),
                                            // SizedBox(height: 30,),
                                            Expanded(
                                              child: Text(
                                                  "ORGANIZING YOUR TASKS",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                "Lorem ipsum dolor sit amet , cnsectetur",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                )),

                                            Text(
                                                "adipiscing elit,sed do eiusmod tempor",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                )),

                                            Text(
                                                "incididunt ut labore et dolore mangna aliqua",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 600, bottom: 40),
                                              child: Container(
                                                //height: 200,
                                                //  color: Colors.red,
                                                // alignment: Alignment.topRight,
                                                child: Image.asset(
                                                    "assets/icons/logoicon.png"),
                                                width: 300,
                                                height: 200,
                                              ),
                                            ),
                                            Text(
                                              'What this feature provide ?',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 30),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'Easily adding tasks to an organized table.',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              'Easily timeline for the tasks and alert for the deadlines.',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              'Momentary indicator for the tasks you are doing the concerned task.',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                /*Padding(
                  padding: const EdgeInsets.only(left: 0),
                ),*/

                SizedBox(
                  height: 100,
                ),

                /* Container(
                  height: 200,
                  //color: Colors.lightBlue,
                  //  width: 150,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Image.asset("assets/icons/start.png"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('What this feature provide ?',style: TextStyle(color: Colors.white70,fontSize: 25),),
                          SizedBox(height: 20,),
                          Text('Easily adding tasks to an organized table',style: TextStyle(color: Colors.white70,fontSize: 20),),
                          Text('Easily adding tasks to an organized table',style: TextStyle(color: Colors.white70,fontSize: 20),),
                          Text('Easily adding tasks to an organized table',style: TextStyle(color: Colors.white70,fontSize: 20),),

                        ],
                      ),

                      //SizedBox(width: 20,),

                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
