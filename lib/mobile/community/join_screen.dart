import 'package:flutter/material.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/shared/component/component.dart';

class JoinCommunityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "These are the most",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Color(0xff0671B9),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "recommended communities",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Color(0xff0671B9),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "for you as a graphic designer",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Color(0xff0671B9),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            height: 2,
                            color: Color(0xffd85105),
                            thickness: 2,
                          )),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image(
                      image: AssetImage("assets/images/join_community.png")),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                HomeCubit.get(context).changeBody(index: 8);
              },
              child: Container(
                color: Colors.black,
              )),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => mainContainer(
                      radius: 20,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  HomeCubit.get(context).changeBody(index: 8);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Community ${(index + 1).toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Text(
                                      "1.4k members",
                                      style:
                                      Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            mainTextButton(
                                context: context,
                                radius: 20,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text("Join "),
                                      Icon(
                                        Icons.add,
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  HomeCubit.get(context).changeBody(index: 8);
                                })
                          ],
                        ),
                      ),
                      color: Color(0xffd85105),
                      colorOfTheBorder: Color(0xffd85105),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}

// title:Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// CircleAvatar(
// backgroundImage: AssetImage(
// "assets/images/background.png",
// ),),
// SizedBox(width: 5,),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// title(text: "Hey",
// context: context,),
// title(text: "Focustic",
// context: context,),
// ],
// ),
// ],
// ),
