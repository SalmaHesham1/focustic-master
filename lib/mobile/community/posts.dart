import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/community/cubit/cubit.dart';
import 'package:projects/mobile/community/cubit/state.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';

class Posts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommunityScreenCubit>(
      create: (context) => CommunityScreenCubit(),
      child: BlocConsumer<CommunityScreenCubit, CommunityScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xfff5f5f5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        HomeCubit.get(context)
                                            .changeBody(index: 9);
                                      },
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                              "assets/images/background.png",
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Focustic",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button!
                                                      .copyWith(
                                                        color:
                                                            Color(0xff01253D),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  "3h ago.",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: Image(
                                  //     image: AssetImage(
                                  //         "assets/images/user-add.png"),
                                  //   ),
                                  //   color: Colors.black,
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(
                                  color: Colors.grey.shade200,
                                  height: 2,
                                  thickness: 2)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rank in Community ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .button!
                                            .copyWith(
                                              color: Color(0xff01253D),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      // SizedBox(
                                      //   height: 15,
                                      // ),
                                      // Text(
                                      //   "Target achieved",
                                      //   overflow: TextOverflow.ellipsis,
                                      //   maxLines: 2,
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .button!
                                      //       .copyWith(
                                      //         color: Color(0xff01253D),
                                      //         fontWeight: FontWeight.w500,
                                      //       ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Image(
                                    height: 123,
                                    image: AssetImage(
                                        "assets/images/community_target.png")),
                              ],
                            ),
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     Image(
                        //         height: 123,
                        //         image: AssetImage(
                        //             "assets/images/community_target.png")),
                        //     Text(
                        //       "Come and see my new Completed",
                        //       style:
                        //           Theme.of(context).textTheme.button!.copyWith(
                        //                 color: Color(0xff01253D),
                        //                 fontWeight: FontWeight.w500,
                        //               ),
                        //     ),
                        //     Text(
                        //       "Target for this month!!",
                        //       style:
                        //           Theme.of(context).textTheme.button!.copyWith(
                        //                 color: Color(0xff01253D),
                        //                 fontWeight: FontWeight.w500,
                        //               ),
                        //     ),
                        //   ],
                        // ),
                        // Container(
                        //   height: 40,
                        //   decoration: BoxDecoration(
                        //       color: Color(0xff0671B9),
                        //       // color: Color(0xC8E9FFFF),
                        //       borderRadius: BorderRadius.only(
                        //         bottomRight: Radius.circular(30),
                        //         bottomLeft: Radius.circular(30),
                        //       )),
                        //   // child: Row(
                        //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   //   children: [
                        //   //     Expanded(
                        //   //       child: IconButton(
                        //   //           onPressed: () {},
                        //   //           icon: Icon(Icons.favorite_border_outlined)),
                        //   //     ),
                        //   //     Expanded(
                        //   //       child: IconButton(
                        //   //           onPressed: () {},
                        //   //           icon: Icon(Icons.chat_outlined)),
                        //   //     ),
                        //   //   ],
                        //   // ),
                        // )
                      ],
                    )),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: 10),
          );
        },
      ),
    );
  }
}
