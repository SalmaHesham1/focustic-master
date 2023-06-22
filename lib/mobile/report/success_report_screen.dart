import 'package:flutter/material.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';

class SuccessReportScreen extends StatelessWidget {
  const SuccessReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              HomeCubit.get(context).changeBody(index: 18);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xffffa65b),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Text(
                              "Success!",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                  ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.check_circle_outlined,
                            color: Color(0xffFF5E17),
                            size: 120,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: AlignmentDirectional.topCenter,
                            child: Text(
                              "Check your mail",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                  ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Didn't get an email?",
                          ),
                          Text(
                            "Check your spam, or contact",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Customer support",
                            style: TextStyle(color: Color(0xffF29972)),
                          ),
                          Text(
                            "Terms and conditions",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
