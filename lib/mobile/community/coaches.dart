import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/community/cubit/cubit.dart';
import 'package:projects/mobile/community/cubit/state.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/shared/component/component.dart';

import '../home/app_cubit/cubit.dart';

class Coaches extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommunityScreenCubit>(
      create: (context) => CommunityScreenCubit(),
      child: BlocConsumer<CommunityScreenCubit, CommunityScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: mainContainer(
                  radius: 30,
                  color: Color(0xfffef7ec),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Coaches active with us",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => mainTextButton(
                                    backgroundColor: Color(0xffFF5E17),
                                    borderColor: Color(0xffFF5E17),
                                    radius: 10,
                                    context: context,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundImage: AssetImage(
                                                    "assets/images/background.png"),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "Coach : Name Name",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .caption!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Trainee",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption!
                                                                .copyWith(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            "Rate",
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption!
                                                                .copyWith(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "14",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption!
                                                                .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption!
                                                                .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                        ),
                                        Expanded(
                                            child: Container(
                                                alignment: AlignmentDirectional
                                                    .centerEnd,
                                                child: Image.asset(
                                                    "assets/icons/add_coaches.png")))
                                      ],
                                    ),
                                    onPressed: () {
                                      HomeCubit.get(context)
                                          .changeBody(index: 13);
                                    },
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: 10),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
