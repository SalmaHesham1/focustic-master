import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/mobile/mode/mode_Screen.dart';
import 'package:projects/mobile/onboarding/cubit/cubit.dart';
import 'package:projects/mobile/onboarding/cubit/state.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  // const OnBoardingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: AlignmentDirectional.topEnd,
                        scale: 1.4,
                        image: AssetImage(
                            "assets/images/onboarding_circle.png"),
                      )
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView(
                          controller: OnBoardingCubit
                              .get(context: context)
                              .pageViewController,
                          onPageChanged: (index) {
                            OnBoardingCubit.get(context: context)
                                .changePageView(numOfPage: index);
                          },
                          children: [
                            page1(
                              context: context,
                            ),
                            page2(context: context, mydata: "Reason",
                            exercise: OnBoardingCubit.get(context: context)
                                .exercise,
                            reason: OnBoardingCubit.get(context: context)
                                .reason),
                            page2(
                              context: context,
                              mydata: "Exercise",
                                exercise: OnBoardingCubit.get(context: context)
                                    .exercise,
                                reason: OnBoardingCubit.get(context: context)
                                    .reason,
                              isPage2:
                                  OnBoardingCubit.get(context: context).index ==
                                          1
                                      ? true
                                      : false,

                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text("${(OnBoardingCubit
                              .get(context: context)
                              .index + 1).toString()}/3"),
                          Row(
                            children: [
                              Spacer(),
                              LinearPercentIndicator(
                                width: 190,
                                lineHeight: 7,
                                percent: (OnBoardingCubit
                                    .get(context: context)
                                    .index + 1) / 3,
                                barRadius: Radius.circular(7),
                                leading: IconButton(
                                    onPressed: () {
                                      if (OnBoardingCubit
                                          .get(context: context)
                                          .index > 0) {
                                        OnBoardingCubit.get(context: context)
                                            .changePageView(
                                            numOfPage: OnBoardingCubit
                                                .get(context: context)
                                                .index - 1);
                                        OnBoardingCubit
                                            .get(context: context)
                                            .pageViewController
                                            .animateToPage(OnBoardingCubit
                                            .get(context: context)
                                            .index,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn);
                                      }
                                      else {
                                        Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ModeScreen()),
                                              (route) => false,);
                                      }
                                    },
                                    icon: Icon(Icons.arrow_back_ios_rounded,
                                      color: Color.fromRGBO(255, 94, 23, 1),
                                      size: 8,)),
                                trailing: IconButton(
                                    onPressed: () {
                                      if (OnBoardingCubit
                                          .get(context: context)
                                          .index < 2) {
                                        OnBoardingCubit.get(context: context)
                                            .changePageView(
                                            numOfPage: OnBoardingCubit
                                                .get(context: context)
                                                .index + 1);
                                        OnBoardingCubit
                                            .get(context: context)
                                            .pageViewController
                                            .animateToPage(OnBoardingCubit
                                            .get(context: context)
                                            .index,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn);
                                      }
                                      else {
                                        CashHelper.putData(
                                                key: "hardware", value: false)
                                            .then((value) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                            (route) => false,
                                          );
                                        }).catchError((error) {
                                          print(error.toString());
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.arrow_forward_ios_rounded,
                                      color: Color.fromRGBO(255, 94, 23, 1),
                                      size: 8,)),
                                progressColor: Colors.white,
                                backgroundColor: Color.fromRGBO(
                                    112, 112, 112, 1),
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  )
              ),
            ),
          );
        },
      ),
    );
  }
}

page1({
  required BuildContext context,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Spacer(),
      Image.asset(
        'assets/images/logo_with_color.png',
        color: Colors.white,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Who are we ?",
        style: TextStyle(
          fontSize: 34,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Color(0xff004573).withOpacity(
                0.41,
              ),
            ),
            child: Text(
              "- Focustic is your solution to a healthier and more productive"
              "  lifestyle. With Focustic, you can say goodbye to computer-related injuries and"
              "  hello to improved wellbeing..",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Color(0xffABC2D1)),
            ),
          )),
      Spacer(),
    ],
  );
}

page2({
  required BuildContext context,
  required var mydata,
  bool isPage2 = true,
  required List reason,
  required List exercise,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/logo_with_color.png',
                      color: Colors.white,
                    ),
                    Text(
                        isPage2
                            ? "I’m using Focustic for :"
                            : "Select a suitable exercise "
                                "category "
                                "based on your health case.",
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.start),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset('assets/images/boy.png'),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Color(0xff004573).withOpacity(
                0.41,
              ),
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: !isPage2 ? 2 : 1,
                        childAspectRatio: !isPage2 ? 2 : 5,
                        children: <Widget>[
                          for (int i=0;isPage2?i<reason.length:i<exercise.length;i++) mainTextButton(
                              context: context,
                               child: Text(isPage2?reason[i]:exercise[i],
                               style: Theme.of(context).textTheme.caption!.copyWith(
                                 color:isPage2?(OnBoardingCubit.get(context: context).reasonClicked[i]?Colors.white:Theme.of(context).primaryColor):(OnBoardingCubit.get(context: context).exerciseClicked[i]?Colors.white:Theme.of(context).primaryColor),
                               ),),
                              onPressed: () {
                                isPage2?(OnBoardingCubit.get(context: context).changeReasonColor(index: i)):(OnBoardingCubit.get(context: context).changeExerciseColor(index: i));

                              },
                              backgroundColor: isPage2?(OnBoardingCubit.get(context: context).reasonClicked[i]?Theme.of(context).primaryColor:Color(0xffF2C783)):(OnBoardingCubit.get(context: context).exerciseClicked[i]?Theme.of(context).primaryColor:Color(0xffF2C783)),
                              borderColor: Colors.transparent),
                          // isPage2 ? SizedBox() : mainTextButton(
                          //     context: context,
                          //     child: Text(mydata.toString()),
                          //     onPressed: () {},
                          //     backgroundColor: Color(0xffF2C783),
                          //     borderColor: Colors.transparent),
                          // isPage2 ? SizedBox() : mainTextButton(
                          //     context: context,
                          //     child: Text(mydata.toString()),
                          //     onPressed: () {},
                          //     backgroundColor: Color(0xffF2C783),
                          //     borderColor: Colors.transparent),
                        ],
                      ),
                    ),
                    isPage2 ? SizedBox() :
                    Row(
                      children: [
                        Expanded(child: mainTextButton(context: context,
                            child: Text(mydata.toString(),
                              style: TextStyle(
                                  color: Colors.white
                              ),),
                            onPressed: () {},
                            backgroundColor: Theme
                                .of(context)
                                .primaryColor,
                            borderColor: Colors.transparent),)
                      ],
                    ),
                  ],
                )
            ),),
        ),
      ],
    ),
  );
}