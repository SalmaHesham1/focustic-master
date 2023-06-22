import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/profile/cubit/cubit.dart';
import 'package:projects/mobile/report/chart.dart';
import 'package:projects/mobile/report/cubit/cubit.dart';
import 'package:projects/mobile/report/cubit/state.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportScreenCubit>(
      create: (context) => ReportScreenCubit(),
      child: BlocConsumer<ReportScreenCubit, ReportScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // ProfileCubit.get(context).showReport(context: context);
          return Container(
              height: double.infinity,
              width: double.infinity,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Sessions",
                            style: Theme.of(context).textTheme.headline5,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: PopupMenuButton(
                                      color: Colors.white,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                              BorderRadius.circular(13)),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    ReportScreenCubit.get(
                                                        context: context)
                                                        .time[ReportScreenCubit
                                                        .get(
                                                        context:
                                                        context)
                                                        .index],
                                                    maxLines: 2,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Theme.of(
                                                          context)
                                                          .scaffoldBackgroundColor,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_up_rounded,
                                                  color: Color(0xffF98D47)
                                                      .withOpacity(0.8),
                                                )
                                              ],
                                            ),
                                          )),
                                      itemBuilder: (context) => [
                                        for (int i = 0;
                                        i <
                                            ReportScreenCubit.get(
                                                context: context)
                                                .time
                                                .length;
                                        i++)
                                          PopupMenuItem(
                                            onTap: () {
                                              ReportScreenCubit.get(
                                                  context: context)
                                                  .changeReport(page: i);
                                            },
                                            child: Text(
                                              ReportScreenCubit.get(
                                                  context: context)
                                                  .time[i],
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          BarChartSample7(),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Working progress",
                                    style:
                                    Theme.of(context).textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Color(0xfff98e48),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Completed Tasks",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Color(0xff68b7ec),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Completed Sessions",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Color(0xff0c67c2),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Spent Hours",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      ReportScreenCubit.get(context: context)
                                          .changeDate(add: false);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    )),
                                Text(
                                  ReportScreenCubit.get(context: context).date[
                                  ReportScreenCubit.get(
                                      context: context)
                                      .index][
                                  ReportScreenCubit.get(context: context)
                                      .indexOfDate],
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                IconButton(
                                    onPressed: () {
                                      ReportScreenCubit.get(context: context)
                                          .changeDate(add: true);
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 60),
                                    child: GestureDetector(
                                      onTap: () {
                                        HomeCubit.get(context)
                                            .changeBody(index: 19);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                              BorderRadius.circular(13)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Report Daily report",
                                                    maxLines: 2,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:
                                                      Color(0xfff98940),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ));
        },
      ),
    );
  }
}
