import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_gradients.dart';
import '../../../core/app_text_styles.dart';
import '../score_card/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: user.name, style: AppTextStyles.titleBold)
                          ])),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(user.photoUrl))),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(percent: user.score / 100),
                )
              ],
            ),
          ),
        );
}
