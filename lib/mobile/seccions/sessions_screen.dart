import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/seccions/cubit/cubit.dart';
import 'package:projects/mobile/seccions/cubit/state.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
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
    );
  }
}

sessionsBody({
  required BuildContext context,
  required var state,
}) =>
    Form(
      key: HomeCubit.get( context).addFormKey,
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
                            HomeCubit.get(context).index == 2
                                ? Text(
                                    "Add new",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  )
                                : SizedBox(),
                            Text(
                              HomeCubit.get(context).index == 2
                                  ? "Session"
                                  : "Sessions",
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
                HomeCubit.get(context)
                    .screens[HomeCubit.get(context).index],
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
                                        HomeCubit.get(context)
                                                    .index ==
                                                0
                                            ? "Add Session"
                                            : "Submit",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      onPressed: () {
                                        if (HomeCubit.get(context)
                                                .index ==
                                            0) {
                                          HomeCubit.get(context)
                                              .changeSessionsScreen(
                                                  numOfScreen: 2);
                                          // SessionsCubit.get(context: context).getAllSession(
                                          //       token: CashHelper.getString(key: "token"), context: context);
                                        } else if (HomeCubit.get(context)
                                                .index ==
                                            1 &&
                                            HomeCubit.get(context)
                                                .addFormKey
                                                .currentState!
                                                .validate()&& HomeCubit.get(context).tasksModel!.data.length!=0) {
                                          HomeCubit.get(context)
                                              .changeSessionsScreen(
                                                  numOfScreen: 0);
                                          HomeCubit.get(context)
                                              .getAllSession(
                                                  token: CashHelper.getString(
                                                      key: "token"),
                                                  context: context);
                                          HomeCubit.get(context)
                                              .editSession(
                                            id: HomeCubit.get(context).idOfEditSession,
                                              name: HomeCubit.get(context)
                                                  .sessionEditName
                                                  .text,
                                              token: CashHelper.getString(
                                                  key: "token"),
                                              context: context);

                                        } else if (HomeCubit.get(context)
                                                    .index ==
                                                2 &&
                                            HomeCubit.get(context)
                                                .addFormKey
                                                .currentState!
                                                .validate()
                                        && HomeCubit.get(context).tasksModel!.data.length!=0) {
                                          print(HomeCubit.get(context)
                                              .sessionName
                                              .text);
                                          HomeCubit.get(context)
                                              .addSession(
                                                  name: HomeCubit.get(context)
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
