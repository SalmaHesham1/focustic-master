import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/about/about_screen.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';

//import 'package:grade2/form%20test.dart';
class Feature2Screen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return buildFeatureScreen(
                context: context,
              );
              // return ScreenTypeLayout(
              //   mobile: Builder(builder: (context) {
              //     CashHelper.putData(key: "isWeb", value: false);
              //     return buildFeatreScreen();
              //   }),
              //   desktop: Builder(builder: (context) {
              //     CashHelper.putData(key: "isWeb", value: true).then((value) {
              //       print(CashHelper.getBool(key: "isWeb").toString());
              //       print(
              //           "--------------------------------------------------------------------");
              //     });
              //     return buildFeatreScreen();
              //   }),
              //   breakpoints: ScreenBreakpoints(
              //     desktop: 600,
              //     tablet: 600,
              //     watch: 100,
              //   ),
              // );
            }));
  }

  Widget buildFeatureScreen({
    required BuildContext context,
  }) =>
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/backgroundmobile8.jpeg",
          ),
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: /*CashHelper.getBool(key: "isWeb")? 400:*/ 25,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              ),
              Text(
                'Your way fot better producing by watch over '
                'Your "HEALTH" ,while Working For long time. ',
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text('FOUCSTIC',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        "Lorem ipsum dolor sit amet , cnsectetur "
                        "adipiscing elit,sed do eiusmod tempor "
                        "incididunt ut labore et dolore mangna aliqua",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 7,
                        )),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                        "Lorem ipsum dolor sit amet , cnsectetur "
                        "adipiscing elit,sed do eiusmod tempor "
                        "incididunt ut labore et dolore mangna aliqua",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 7,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 70,
                ),
                alignment: Alignment.topRight,
                width: 310,
                //height: 200,
                child: Image.asset(
                  "assets/icons/display.png",
                ),
              ),
              Text(
                "Lorem ipsum dolor sit amet , cnsectetur adipiscing"
                " elit,sed do eiusmod tempor incididunt ut labore et "
                "dolore mangna aliqua",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
              // Container(
              //     alignment: AlignmentDirectional.bottomCenter,
              //     child: joinButton(context: context)),
            ],
          ),
        ),
      );
}
