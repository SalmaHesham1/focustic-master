import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projects/mobile/hardware/cubit/cubit.dart';
import 'package:projects/mobile/hardware/cubit/state.dart';
import 'package:projects/mobile/hardware/fifthboard.dart';
import 'package:projects/mobile/hardware/fourthboard.dart';
import 'package:projects/mobile/hardware/onboardfirst.dart';
import 'package:projects/mobile/hardware/onboardlast.dart';
import 'package:projects/mobile/hardware/onboardsecond.dart';
import 'package:projects/mobile/hardware/onboardthrid.dart';
import 'package:projects/mobile/hardware/sixboard.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocProvider<OnBoardingCubit>(
            create: (context) => OnBoardingCubit(),
            child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView(
                                controller:
                                    OnBoardingCubit.get(context: context)
                                        .pageViewController,
                                onPageChanged: (index) {
                                  OnBoardingCubit.get(context: context)
                                      .changePageView(numOfPage: index);
                                },
                                children: [
                                  firstboard(),
                                  secondboard(),
                                  thirdboard(),
                                  fourthdboard(),
                                  fifthboard(),
                                  sixboard(),
                                  lastboard(),
                                ],
                              ),
                            ),
                            //indecatour
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Container(
                                //alignment: Alignment.bottomCenter,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, //New
                                        blurRadius: 10.0,
                                        offset: Offset(10, 0))
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    LinearPercentIndicator(
                                      width: 210,
                                      lineHeight: 7,
                                      percent:
                                          (OnBoardingCubit.get(context: context)
                                                      .index +
                                                  1) /
                                              7,
                                      barRadius: Radius.circular(7),
                                      leading: IconButton(
                                          onPressed: () {
                                            if (OnBoardingCubit.get(
                                                        context: context)
                                                    .index >
                                                0) {
                                              OnBoardingCubit.get(
                                                      context: context)
                                                  .changePageView(
                                                      numOfPage:
                                                          OnBoardingCubit.get(
                                                                      context:
                                                                          context)
                                                                  .index -
                                                              1);
                                              OnBoardingCubit.get(
                                                      context: context)
                                                  .pageViewController
                                                  .animateToPage(
                                                      OnBoardingCubit.get(
                                                              context: context)
                                                          .index,
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.easeIn);
                                            }
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: Colors.black,
                                            size: 20,
                                          )),
                                      trailing: IconButton(
                                          onPressed: () {
                                            if (OnBoardingCubit.get(
                                                        context: context)
                                                    .index <
                                                6) {
                                              OnBoardingCubit.get(
                                                      context: context)
                                                  .changePageView(
                                                      numOfPage:
                                                          OnBoardingCubit.get(
                                                                      context:
                                                                          context)
                                                                  .index +
                                                              1);
                                              OnBoardingCubit.get(
                                                      context: context)
                                                  .pageViewController
                                                  .animateToPage(
                                                      OnBoardingCubit.get(
                                                              context: context)
                                                          .index,
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.easeIn);
                                            } else {
                                              CashHelper.putData(
                                                      key: "hardware",
                                                      value: true)
                                                  .then((value) {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()),
                                                  (route) => false,
                                                );
                                              });
                                            }
                                            ;
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.black,
                                            size: 20,
                                          )),
                                      progressColor: Colors.white,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
