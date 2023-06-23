import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/seccions/cubit/cubit.dart';
import 'package:projects/mobile/seccions/cubit/state.dart';
import 'package:projects/shared/component/component.dart';
import 'package:projects/shared/component/const.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class EditSessionsScreen extends StatelessWidget {
  const EditSessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
          width: double.infinity,
          child: mainContainer(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      mainTextForm(
                          isPassword: false,
                          borderColor: Colors.white,
                          textColor: Color(0xffF98D47),
                          hintText: "session1",
                          prefixIcon: Icons.sunny,
                          validator: "Enter the name of session",
                          controller: HomeCubit.get(context)
                              .sessionEditName,
                          keyboardType: TextInputType.name,
                          context: context)
                      // Container(
                      //   height: 60,
                      //   child: Row(children: [
                      //     // Icon(Icons.sunny,
                      //     //   color: Colors.black,),
                      //     // SizedBox(width: 10,),
                      //     // Expanded(
                      //     //   child: Text(
                      //     //     "Session " + '1',
                      //     //     style: TextStyle(
                      //     //       fontWeight: FontWeight.w500,
                      //     //       color: Color(0xffF98D47),
                      //     //       overflow: TextOverflow.ellipsis,
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //     mainTextForm(isPassword: false,
                      //         hintText: 'session1',
                      //         prefixIcon: Icons.sunny,
                      //         validator:"Enter the name of session",
                      //         controller: SessionsCubit.get(context: context).sessionEditName,
                      //         keyboardType: TextInputType.name,
                      //         context: context)
                      //   ],),
                      // ),
                      ,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 2,
                          color: Colors.black12,
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.av_timer_rounded,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Session ",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffF98D47),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "from",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffF98D47),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: PopupMenuButton(
                                                color: Colors.orangeAccent,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        HomeCubit.get( context)
                                                            .time![0],
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .button!
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 11,
                                                              color: Color(
                                                                      0xffF98D47)
                                                                  .withOpacity(
                                                                      0.8),
                                                            ),
                                                      ),
                                                    )),
                                                itemBuilder: (context) => [
                                                      for (int i = 0;
                                                          i < time_splot.length;
                                                          i++)
                                                        PopupMenuItem(
                                                          onTap: () {
                                                            HomeCubit.get( context)
                                                                .changeTime(
                                                                    to: HomeCubit.get( context)
                                                                        .time![1],
                                                                    from: time_splot[i]);
                                                          },
                                                          child: Text(
                                                            time_splot[i],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                    ]),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "to",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffF98D47),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: PopupMenuButton(
                                                color: Colors.orangeAccent,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        HomeCubit.get( context)
                                                            .time![1],
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .button!
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 11,
                                                              color: Color(
                                                                      0xffF98D47)
                                                                  .withOpacity(
                                                                      0.8),
                                                            ),
                                                      ),
                                                    )),
                                                itemBuilder: (context) => [
                                                      for (int i = 0;
                                                          i < time_splot.length;
                                                          i++)
                                                        PopupMenuItem(
                                                          onTap: () {
                                                            HomeCubit.get( context)
                                                                .changeTime(
                                                                    from: HomeCubit.get( context)
                                                                        .time![0],
                                                                    to: time_splot[i]);
                                                          },
                                                          child: Text(
                                                            time_splot[i],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                    ]),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 2,
                          color: Colors.black12,
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Add task",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffF98D47),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              child: PopupMenuButton(
                                  color: Colors.orangeAccent,
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Color(0xff87C7FF),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "To do list",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      color: Colors.black,
                                                    ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      )),
                                  itemBuilder: (context) => [
                                    for (int i=0;i<HomeCubit.get(context).tasksModel!.data.length;i++)PopupMenuItem(
                                      child: Text(
                                          HomeCubit.get(context).tasksModel!.data[i].attributes.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                      ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
