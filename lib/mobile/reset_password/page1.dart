import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/reset_password/cubit/cubit.dart';

class ResetPasswordPage1 extends StatelessWidget {
  const ResetPasswordPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        Expanded(
          child: Text("Reset password",
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Reset password via your",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  textAlign: TextAlign.left),
              Text("E-MAIL",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  textAlign: TextAlign.left),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: mainTextButton(
                      context: context,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                          ),
                          Text("Via email",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        ResetPasswordCubit.get(context: context)
                            .changePage(page: 1);
                      })),
            ],
          ),
        ),
      ],
    );
  }
}
