import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_enterprise_template/core/adaptive/platform_utils.dart';
import 'package:flutter_enterprise_template/core/theme/app_colors.dart';

class AdaptiveLoadingIndicator extends StatelessWidget {
  const AdaptiveLoadingIndicator({
    super.key,
    this.size = 40.0,
    this.color = AppColors.primary,
    this.message,
  });

  final double size;
  final Color color;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PlatformUtils.isApple
              ? CupertinoActivityIndicator(radius: (size / 2).r, color: color)
              : SizedBox(
                  height: size.h,
                  width: size.w,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    strokeWidth: 3.0,
                  ),
                ),
          if (message != null) ...[
            SizedBox(height: 12.h),
            Text(
              message!,
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            ),
          ],
        ],
      ),
    );
  }
}
