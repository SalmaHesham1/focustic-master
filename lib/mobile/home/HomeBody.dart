import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projects/mobile/hardware/on_board.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/tasks/Addtask.dart';
import 'package:projects/shared/component/component.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  CashHelper.getBool(key: "hardware")
                      ? SizedBox()
                      :
                  Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/background.png",
                              ),
                              radius: 55,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Set up your device",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Color(0xff01253D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center),
                            Text("This will take about 5 minutes",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Color(0xff01253D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              child: mainTextButton(
                                  context: context,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Start set up",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                  radius: 30,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnBoardingScreen()),
                                      (route) => false,
                                    );
                                  }),
                            ),
                          ],
                        ),
                  mainContainer(
                      colorOfTheBorder: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add tasks !",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Color(0xff01253D),
                                    ),
                                textAlign: TextAlign.center),
                            FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddTask()));
                              },
                              mini: true,
                              backgroundColor: Color(0xff002B48),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )),
                  mainContainer(
                      colorOfTheBorder: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Today",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Color(0xffE2E2E2),
                                    ),
                                textAlign: TextAlign.center),
                            PopupMenuButton(
                                color: Colors.white,
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.black,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Container(
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    135, 199, 255, 1),
                                                width: 1,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Task " + '1',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 10,
                                                          left: 5,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            // Navigator.push(context,
                                                            //     MaterialPageRoute(builder: (context) => EditScreen()));
                                                          },
                                                          child: Image(
                                                            height: 30,
                                                            width: 30,
                                                            fit: BoxFit.contain,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            image: AssetImage(
                                                              "assets/icons/edit.png",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    DateFormat("hh:mm a")
                                                        .format(DateTime.now()),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    PopupMenuItem(
                                      child: Container(
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    135, 199, 255, 1),
                                                width: 1,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Task " + '1',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 10,
                                                          left: 5,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            // Navigator.push(context,
                                                            //     MaterialPageRoute(builder: (context) => EditScreen()));
                                                          },
                                                          child: Image(
                                                            height: 30,
                                                            width: 30,
                                                            fit: BoxFit.contain,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            image: AssetImage(
                                                              "assets/icons/edit.png",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    DateFormat("hh:mm a")
                                                        .format(DateTime.now()),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ];
                                })
                          ],
                        ),
                      )),
                  mainContainer(
                      colorOfTheBorder: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Yesterday",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Color(0xffE2E2E2),
                                    ),
                                textAlign: TextAlign.center),
                            PopupMenuButton(
                                color: Colors.white,
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.black,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Container(
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    135, 199, 255, 1),
                                                width: 1,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Task " + '1',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 10,
                                                          left: 5,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            // Navigator.push(context,
                                                            //     MaterialPageRoute(builder: (context) => EditScreen()));
                                                          },
                                                          child: Image(
                                                            height: 30,
                                                            width: 30,
                                                            fit: BoxFit.contain,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            image: AssetImage(
                                                              "assets/icons/edit.png",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    DateFormat("hh:mm a")
                                                        .format(DateTime.now()),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    PopupMenuItem(
                                      child: Container(
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    135, 199, 255, 1),
                                                width: 1,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Task " + '1',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 10,
                                                          left: 5,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            // Navigator.push(context,
                                                            //     MaterialPageRoute(builder: (context) => EditScreen()));
                                                          },
                                                          child: Image(
                                                            height: 30,
                                                            width: 30,
                                                            fit: BoxFit.contain,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            image: AssetImage(
                                                              "assets/icons/edit.png",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    DateFormat("hh:mm a")
                                                        .format(DateTime.now()),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ];
                                })
                          ],
                        ),
                      )),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {},
                            child: Container(
                                height: 201,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(40),
                                //   color: Color(0xff89a6b8),
                                // ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 123,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            "assets/images/community-artifici.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 18,
                                          right: 18,
                                          top: 18,
                                        ),
                                        child: Text(
                                            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem",
                                            maxLines: 4,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                )),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
