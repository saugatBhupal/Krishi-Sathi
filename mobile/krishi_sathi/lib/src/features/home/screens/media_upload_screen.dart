import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krishi_sathi/src/config/app_routes/app_route.dart';
import 'package:krishi_sathi/src/core/constants/app_colors.dart';
import 'package:krishi_sathi/src/core/constants/app_enums.dart';
import 'package:krishi_sathi/src/core/constants/app_strings.dart';
import 'package:krishi_sathi/src/core/constants/custom_locale.dart';
import 'package:krishi_sathi/src/core/functions/build_toast.dart';
import 'package:krishi_sathi/src/core/widgets/button/custom_rounded_button.dart';
import 'package:krishi_sathi/src/features/home/widgets/home_app_bar.dart';
import 'package:krishi_sathi/src/features/home/widgets/media_upload_camera.dart';

class MediaUploadScreen extends StatefulWidget {
  const MediaUploadScreen({super.key});

  @override
  State<MediaUploadScreen> createState() => _MediaUploadScreenState();
}

class _MediaUploadScreenState extends State<MediaUploadScreen> {
  File? _media;
  void _toggleLocale() {
    Locale newLocale = context.locale.languageCode == 'en'
        ? CustomLocale.nepali
        : CustomLocale.english;
    context.setLocale(newLocale);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(
            onLocaleChange: _toggleLocale,
          ),
          Flexible(
            flex: 5,
            child: MediaUploadCamera(
              onMediaCaptured: (File media) {
                setState(() {
                  _media = media;
                });
              },
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomRoundedButton(
              title: AppStrings.askAgriBot.tr(),
              onPressed: () {
                if (_media != null) {
                  print(_media!.path);
                } else {
                  buildToast(
                    toastType: ToastType.error,
                    msg: "Please capture an image first.",
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
