import 'package:flutter/material.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/library/library_screen.dart';
import 'package:projects/mobile/register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/background.png",
                ),
                radius: 55,
              ),
              SizedBox(
                height: 6,
              ),
              title(
                text: "Welcome",
                context: context,
              ),
              title(
                text: "To Focustic communities",
                context: context,
              ),
            ],
          ),
          Spacer(),
          Image(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/welcome_community.png",
            ),
          ),
          Spacer(),
          Column(
            children: [
              title(
                text: "Let's see Which",
                context: context,
              ),
              title(
                text: "Community fit you",
                context: context,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: mainTextButton(
                  context: context,
                  child: Text(
                    "Get start",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  onPressed: () {
                    HomeCubit.get(context).changeBody(index: 12);
                  },
                  backgroundColor: Color(0xFFD85105),
                  borderColor: Color(0xFFD85105),
                ),
              ))
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
