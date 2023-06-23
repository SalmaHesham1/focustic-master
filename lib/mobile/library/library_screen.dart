import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/library/cubit/cubit.dart';
import 'package:projects/mobile/library/cubit/state.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LibraryCubit>(
      create: (context) => LibraryCubit()
        ..getLibrary(
          token: CashHelper.getString(key: "token"),
          context: context,
        ),
      child: BlocConsumer<LibraryCubit, LibraryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is LibraryLoadingDataState
              ? Center(
                  child: CircularProgressIndicator(color: Color(0xfff98e48),),
                )
              : buildLibraryScreen(context: context);
        },
      ),
    );
  }
}

buildLibraryScreen({
  required BuildContext context,
}) =>
    LibraryCubit.get(context: context)
        .exercisesModel!
        .data!.isEmpty==true?Container():Column(
      children: [
        Column(
          children: [
            title(
              text: "Workout video library",
              context: context,
            ),
            title(
              text: "Checkout these exercises and",
              context: context,
            ),
            title(
              text: "Stretches for better posture",
              context: context,
            ),
            title(
              text: "back and neck health",
              context: context,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 20,
          ),
          child: Container(
            height: 30,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                LibraryCubit.get(context: context)
                                    .changeBody(page: index);
                              },
                              child: title(
                                  text: LibraryCubit.get(context: context)
                                      .exercisesModel!
                                      .data![index]
                                      .attributes!
                                      .name
                                      .toString(),
                                  context: context)),
                          SizedBox(
                            height: 1,
                          ),
                          Container(
                            height: 2,
                            width: 200,
                            color: LibraryCubit
                                .get(context: context)
                                .index ==
                                index
                                ? Color(0xfff98e48)
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: LibraryCubit.get(context: context)
                    .exercisesModel!
                    .data!
                    .length),
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            alignment: AlignmentDirectional.topStart,
            image: AssetImage(
              "assets/images/library_backgroung.png",
            ),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Container(
                          height: 293,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xff89a6b8),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/library_video.png",
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Spacer(),
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    // Spacer(),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //     bottom: 8,
                                    //     right: 20,
                                    //   ),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.end,
                                    //     children: [
                                    //       Text("00:00"),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 18,
                                  right: 18,
                                  top: 6,
                                ),
                                child: Text(
                                  LibraryCubit.get(context: context)
                                      .exercisesModel!
                                      .data![LibraryCubit.get(context: context)
                                          .index]
                                      .relationships!
                                      .exercise![index]
                                      .attributes!
                                      .description!
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          )),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: LibraryCubit.get(context: context)
                    .exercisesModel!
                    .data![LibraryCubit.get(context: context).index]
                    .relationships!
                    .exercise!
                    .length),
          ),
        ))
      ],
    );

Widget title(
        {required String text,
        required BuildContext context,
        TextStyle? style}) =>
    Text(
      text,
      style: style ??
          Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Color(0xff0671B9),
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
      maxLines: 1,
      textAlign: TextAlign.center,
    );
