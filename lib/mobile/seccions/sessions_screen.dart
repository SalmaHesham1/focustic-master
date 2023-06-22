import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/seccions/cubit/cubit.dart';
import 'package:projects/mobile/seccions/cubit/state.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionsCubit>(
      create: (context) => SessionsCubit()
        ..getAllSession(
            token: CashHelper.getString(key: "token"), context: context),
      child: BlocConsumer<SessionsCubit, SessionsStates>(
        listener: (context, state) {
          if(HomeCubit.get(context).tasksModel!.data.length==0){
            print("--------");
            Fluttertoast.showToast(
                msg: "you should have a tasks",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          else{

            print(state);
            if (state is SessionsAddSessionsSuccessState ||
                state is SessionsGetAllSessionsSuccessState) {
              Fluttertoast.showToast(
                  msg: "Success",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (state is SessionsAddSessionsFailState ||
                state is SessionsGetAllSessionsFailState) {
              Fluttertoast.showToast(
                  msg: "Fail",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          if(HomeCubit.get(context).tasksModel!.data.length==0){
            print("--------");
            Fluttertoast.showToast(
                msg: "you should have a tasks",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          return state is SessionsGetAllSessionsLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(0xfff98e48),
                  ),
                )
              : sessionsBody(
                  context: context,
                  state: state,
                );
        },
      ),
    );
  }
}

sessionsBody({
  required BuildContext context,
  required var state,
}) =>
    Form(
      key: SessionsCubit.get(context: context).addFormKey,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfff98e48),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  height: 133,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SessionsCubit.get(context: context).index == 2
                                ? Text(
                                    "Add new",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  )
                                : SizedBox(),
                            Text(
                              SessionsCubit.get(context: context).index == 2
                                  ? "Session"
                                  : "Seccions",
                              style: Theme.of(context).textTheme.headline5,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset('assets/images/session.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SessionsCubit.get(context: context)
                    .screens[SessionsCubit.get(context: context).index],
                state is SessionsAddSessionsLoadingState || state is SessionsEditSessionsLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: mainTextButton(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      radius: 14,
                                      context: context,
                                      child: Text(
                                        SessionsCubit.get(context: context)
                                                    .index ==
                                                0
                                            ? "Add Session"
                                            : "Submit",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      onPressed: () {
                                        if (SessionsCubit.get(context: context)
                                                .index ==
                                            0) {
                                          SessionsCubit.get(context: context)
                                              .changeSessionsScreen(
                                                  numOfScreen: 2);
                                          // SessionsCubit.get(context: context).getAllSession(
                                          //       token: CashHelper.getString(key: "token"), context: context);
                                        } else if (SessionsCubit.get(
                                                    context: context)
                                                .index ==
                                            1 &&
                                            SessionsCubit.get(context: context)
                                                .addFormKey
                                                .currentState!
                                                .validate()&& HomeCubit.get(context).tasksModel!.data.length!=0) {
                                          SessionsCubit.get(context: context)
                                              .changeSessionsScreen(
                                                  numOfScreen: 0);
                                          SessionsCubit.get(context: context)
                                              .getAllSession(
                                                  token: CashHelper.getString(
                                                      key: "token"),
                                                  context: context);
                                          SessionsCubit.get(context: context)
                                              .editSession(
                                            id: SessionsCubit.get(context: context).idOfEditSession,
                                              name: SessionsCubit.get(
                                                  context: context)
                                                  .sessionEditName
                                                  .text,
                                              token: CashHelper.getString(
                                                  key: "token"),
                                              context: context);

                                        } else if (SessionsCubit.get(
                                                        context: context)
                                                    .index ==
                                                2 &&
                                            SessionsCubit.get(context: context)
                                                .addFormKey
                                                .currentState!
                                                .validate()
                                        && HomeCubit.get(context).tasksModel!.data.length!=0) {
                                          print(SessionsCubit.get(
                                                  context: context)
                                              .sessionName
                                              .text);
                                          SessionsCubit.get(context: context)
                                              .addSession(
                                                  name: SessionsCubit.get(
                                                          context: context)
                                                      .sessionName
                                                      .text,
                                                  token: CashHelper.getString(
                                                      key: "token"),
                                                  context: context);
                                        }
                                        ;
                                      }))
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
