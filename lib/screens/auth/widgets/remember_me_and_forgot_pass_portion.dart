import 'package:flutter/cupertino.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class RememberMeAndForgotPassPortion extends StatelessWidget {
  final bool? switchValue;
  final Function(bool v)? onSwitchPressed;
  final Function()? onForgotPasswordPressed;

  const RememberMeAndForgotPassPortion({
    super.key,
    this.switchValue,
    this.onSwitchPressed,
    this.onForgotPasswordPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(
          value: switchValue ?? false,
          onChanged: onSwitchPressed,
        ),
        SizedBox(width: 10),
        Text(
          "Remember Me",
          style: AppTextStyles.h1.copyWith(
            fontSize: 15,
            color: AppColors.lightGrey,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onForgotPasswordPressed,
          child: Text(
            "Forgot Password?",
            style: AppTextStyles.h1.copyWith(color: Color(0xFF407EC7)),
          ),
        ),
      ],
    );
  }
}
