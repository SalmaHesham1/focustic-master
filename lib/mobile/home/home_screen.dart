import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/mobile/home/custom_clipper_for_nar_bar.dart';
import 'package:projects/mobile/library/library_screen.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getAllTasks(token: CashHelper.getString(key: "token"), context: context),
        ),
        // BlocProvider(create: (context)=>ProfileCubit())
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            Fluttertoast.showToast(
                msg: "You have successfully been logged out",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is LogOutFailState) {
            Fluttertoast.showToast(
                msg: "Fail",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return state is AllTasksLoadingState
              ?
          Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(color: Color(0xffF98D47),),))
              : buildHomeScreen(
            context: context,
            pageNum: HomeCubit
                .get(context)
                .indexOfPage,
          );
        },
      ),
    );
  }

  Widget buildHomeScreen({
    required BuildContext context,
    required int pageNum,
  }) =>
      Scaffold(
        floatingActionButton: pageNum == 16 || pageNum == 12 || pageNum == 19
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {
                    HomeCubit.get(context).changeBody(index: 17);
                  },
                  mini: true,
                  backgroundColor: Color(0xff002B48),
                  child: Icon(
                    Icons.play_circle_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.white,
        appBar: pageNum == 19 ? null : appBar(context: context),
        key: HomeCubit.get(context).scaffoldKey,
        endDrawer: drawer(
          context: context,
          scaffoldKey: HomeCubit.get(context).scaffoldKey,
        ),
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: double.infinity,
                child: Container(
                    child: HomeCubit.get(context).screen[(pageNum ?? 0)]),
              ),
              pageNum == 16 || pageNum == 12 || pageNum == 19
                  ? SizedBox()
                  : navBar(context: context),
            ],
          ),
        ),
        // bottomNavigationBar: navBar(context: context),
      );
}

//nav bar
navBar({required BuildContext context}) => Stack(
  alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipPath(
          clipper: CustomClipperForNavBar(
            isBigContainer: true,
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff659FD9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.5,
                        color: Colors.black26,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 2,
                        offset: Offset(4, 10))
                  ]),
              child: ClipPath(
                clipper: CustomClipperForNavBar(
                  isBigContainer: false,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/home.png",
                                  color: HomeCubit.get(context).indexOfPage == 0
                                      ? Color(0xff001B2D)
                                      : Color(0xff0A66C2),
                                ),
                                onPressed: () {
                                  HomeCubit.get(context).changeBody(index: 0);
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/profile.png",
                                  color: HomeCubit.get(context).indexOfPage == 4
                                      ? Color(0xff001B2D)
                                      : Color(0xff0A66C2),
                                ),
                                onPressed: () {
                                  // ProfileCubit.get(context).myProfileState(isMyProfile: true).then((value){
                                  //
                                  // });
                                  HomeCubit.get(context).getAllTasks(token: CashHelper.getString(key: "token"), context: context);
                                  HomeCubit.get(context).changeBody(index: 4);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/library.png",
                                  color: HomeCubit.get(context).indexOfPage == 7
                                      ? Color(0xff001B2D)
                                      : Color(0xff0A66C2),
                                ),
                                onPressed: () {
                                  // HomeCubit.get(context)
                                  //     .scaffoldKey
                                  //     .currentState!
                                  //     .openEndDrawer();
                                  HomeCubit.get(context).changeBody(index: 7);
                                },
                              ),
                              IconButton(
                                icon: /*Icon(Icons.line_weight_sharp),*/
                                    Image.asset(
                                  "assets/icons/more.png",
                                  color: HomeCubit.get(context).indexOfPage == 5
                                      ? Color(0xff001B2D)
                                      : Color(0xff0A66C2),
                                ),
                                onPressed: () {
                                  // HomeCubit.get(context).changeBody(index: 5);
                                  HomeCubit.get(context)
                                      .scaffoldKey
                                      .currentState!
                                      .openEndDrawer();
                                  // HomeCubit.get(context).changeBody(index: 5);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // add button
        // SpeedDial(
        //   elevation: 0,
        //   foregroundColor: Colors.transparent,
        //   buttonSize: Size(35, 35),
        //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //   overlayColor: Theme.of(context).scaffoldBackgroundColor,
        //   overlayOpacity: 0.2,
        //   activeBackgroundColor:
        //       Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
        //   activeForegroundColor:
        //       Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
        //   activeIcon: Icons.close_rounded,
        //   child: Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        //   onOpen: () {
        //     HomeCubit.get(context).changeSpeedDialColor();
        //   },
        //   onClose: () {
        //     HomeCubit.get(context).changeSpeedDialColor();
        //   },
        //   spacing: 0,
        //   spaceBetweenChildren: 0,
        //   // children: [
        //   //   SpeedDialChild(
        //   //       child: Icon(Icons.add),
        //   //       onTap: () {},
        //   //       backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        //   //   SpeedDialChild(
        //   //       child: Icon(Icons.library_add_rounded),
        //   //       onTap: () {},
        //   //       backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        //   //   SpeedDialChild(
        //   //       child: Icon(Icons.library_books_outlined),
        //   //       onTap: () {
        //   //         HomeCubit.get(context).changeBody(index: 10);
        //   //       },
        //   //       backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        //   // ],
        // ),
      ],
    );

//app bar
appBar({required BuildContext context}) => AppBar(
      backgroundColor: HomeCubit.get(context).indexOfPage == 17
          ? Color(0xfff98e48)
          : HomeCubit.get(context).indexOfPage == 4 ||
                  HomeCubit.get(context).indexOfPage == 3 ||
                  HomeCubit.get(context).indexOfPage == 20 ||
                  HomeCubit.get(context).indexOfPage == 18
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.transparent,
      elevation: 0,
      title: HomeCubit.get(context).indexOfPage == 7 ||
              HomeCubit.get(context).indexOfPage == 16 ||
              HomeCubit.get(context).indexOfPage == 20 ||
              HomeCubit.get(context).indexOfPage == 17
          ? SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title(
                  text: "Hey",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: HomeCubit.get(context).indexOfPage == 4 ||
                              HomeCubit.get(context).indexOfPage == 18
                          ? Colors.white
                          : Colors.black),
                  context: context,
                ),
                title(
                  text: "Focustic",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: HomeCubit.get(context).indexOfPage == 4 ||
                              HomeCubit.get(context).indexOfPage == 18
                          ? Colors.white
                          : Colors.black),
                  context: context,
                ),
              ],
            ),
      centerTitle: false,
      leading: HomeCubit.get(context).indexOfPage == 7 ||
              HomeCubit.get(context).indexOfPage == 16
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.only(left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/background.png",
                    ),
                  ),
                ],
              ),
            ),
      actions: [
        HomeCubit.get(context).indexOfPage == 14 ||
                HomeCubit.get(context).indexOfPage == 7 ||
                HomeCubit.get(context).indexOfPage == 16 ||
                HomeCubit.get(context).indexOfPage == 20 ||
                HomeCubit.get(context).indexOfPage == 17
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    HomeCubit.get(context).changeBody(index: 14);
                  },
                  child: Image(
                    color: HomeCubit.get(context).indexOfPage == 4 ||
                            HomeCubit.get(context).indexOfPage == 18
                        ? Color(0xfff98e48)
                        : Theme.of(context).iconTheme.color,
                    image: AssetImage("assets/icons/notification.png"),
                  ),
                ),
              ),
      ],
    );

//drawer
Widget drawer({
  required BuildContext context,
  required var scaffoldKey,
}) =>
    Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            scaffoldKey.currentState.closeEndDrawer();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff66b4e8),
                          )),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      "COMMUNITY",
                      style: TextStyle(
                        color: Color(0xff66b4e8),
                      ),
                    ),
                    onTap: () {
                      scaffoldKey.currentState.closeEndDrawer();

                      HomeCubit.get(context).changeBody(index: 16);
                    },
                  ),
                  ListTile(
                    title: Text(
                      "MY TASKS",
                      style: TextStyle(
                        color: Color(0xff66b4e8),
                      ),
                    ),
                    onTap: () {
                      scaffoldKey.currentState.closeEndDrawer();
                      HomeCubit.get(context).getAllTasks(
                          context: context,
                          token: CashHelper.getString(key: "token"));

                      HomeCubit.get(context).changeBody(index: 1);
                    },
                  ),
                  // ListTile(
                  //   title: Text(
                  //     "MY TARGET",
                  //     style: TextStyle(
                  //       color: Color(0xff66b4e8),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     scaffoldKey.currentState.closeEndDrawer();
                  //     // HomeCubit.get(context).changeBody(index: 4);
                  //   },
                  // ),
                  ListTile(
                    title: Text(
                      "My Sessions",
                      style: TextStyle(
                        color: Color(0xff66b4e8),
                      ),
                    ),
                    onTap: () {
                      scaffoldKey.currentState.closeEndDrawer();
                      HomeCubit.get(context).changeBody(index: 17);
                    },
                  ),
                  ListTile(
                    title: Text(
                      "REPORT",
                      style: TextStyle(
                        color: Color(0xff66b4e8),
                      ),
                    ),
                    onTap: () {
                      scaffoldKey.currentState.closeEndDrawer();
                      HomeCubit.get(context).changeBody(index: 18);
                    },
                  ),
                  ListTile(
                    title: Text(
                      "SERVICES",
                      style: TextStyle(
                        color: Color(0xff66b4e8),
                      ),
                    ),
                    onTap: () {
                      scaffoldKey.currentState.closeEndDrawer();
                      HomeCubit.get(context).changeBody(index: 3);
                    },
                  ),
                  // ListTile(
                  //   title: Text(
                  //     "ABOUT",
                  //     style: TextStyle(
                  //       color: Color(0xff66b4e8),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     scaffoldKey.currentState.closeEndDrawer();
                  //     // HomeCubit.get(context).changeBody(index: 3);
                  //   },
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: ListTile(
                  title: Text(
                    "LOG-OUT",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff66b4e8),
                    ),
                  ),
                  onTap: () {
                    HomeCubit.get(context).logout(
                        token: CashHelper.getString(key: "token"),
                        context: context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );