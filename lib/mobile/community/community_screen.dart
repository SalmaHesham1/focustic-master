import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/community/cubit/cubit.dart';
import 'package:projects/mobile/community/cubit/state.dart';
import 'package:projects/mobile/community/posts.dart';

class CommunityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return buildCommunityScreen(context: context);
  }
}

buildCommunityScreen({
  required BuildContext context,
}) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage("assets/images/community_background.png")),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Text("Community 1",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/community.png",
              ),
            )),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   height: 70,
          //   width: double.infinity,
          //   color: Color(0xffF5F5F5),
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 10,
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       infoBar(
          //         context: context,
          //         infoTitle: "Members",
          //         info: "1.4k",
          //         radius: 16,
          //         padding: 10,
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: EdgeInsets.only(left: 1),
          //           child: Stack(
          //             alignment: AlignmentDirectional.centerEnd,
          //             children: [
          //               Container(
          //                 width: double.infinity,
          //                 padding: EdgeInsets.all(10),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(16),
          //                   color: Color(0xffc8e9ff),
          //                 ),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Text(
          //                       "Rank",
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .caption!
          //                           .copyWith(
          //                               color: Theme.of(context)
          //                                   .scaffoldBackgroundColor),
          //                     ),
          //                     Text(
          //                       "#16",
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .caption!
          //                           .copyWith(
          //                               fontWeight: FontWeight.bold,
          //                               color: Theme.of(context)
          //                                   .scaffoldBackgroundColor),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Image(
          //                 image: AssetImage("assets/images/community_score.png"),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       infoBar(
          //         context: context,
          //         infoTitle: "Coach",
          //         info: "17",
          //         radius: 16,
          //         padding: 10,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            width: double.infinity,
            height: 40,
            color: Color(0xffF5F5F5),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              textAlign: TextAlign.center,
              "Rank",
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Color(0xff01253D),
                    fontWeight: FontWeight.w500,
                  ),
            ),
            // ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) => Padding(
            //           padding:  EdgeInsets.only(left: 20),
            //           child: Column(
            //             children: [
            //               InkWell(
            //                 onTap: () {
            //                   CommunityScreenCubit.get(context: context)
            //                       .onTap(tap: index);
            //                 },
            //                 child: Text(
            //                   textAlign: TextAlign.center,
            //                   CommunityScreenCubit.get(context: context)
            //                       .tapBody[index],
            //                   style: Theme.of(context).textTheme.button!.copyWith(
            //                         color: Color(0xff01253D),
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                 ),
            //               ),
            //               CommunityScreenCubit.get(context: context).index ==
            //                       index
            //                   ? Container(
            //                       height: 1,
            //                       width: 50,
            //                       color: Color(0xffD85003),
            //                     )
            //                   : SizedBox(),
            //             ],
            //           ),
            //         ),
            //     separatorBuilder: (context, index) => SizedBox(
            //           width: 50,
            //         ),
            //     itemCount:
            //         CommunityScreenCubit.get(context: context).tapBody.length),
          ),
          Container(
            height: 1,
            width: 60,
            color: Color(0xffD85003),
          ),
          SizedBox(
            height: 30,
          ),
          Posts(),
          // CommunityScreenCubit.get(context: context)
          //     .body[CommunityScreenCubit.get(context: context).index],
        ],
      ),
    );