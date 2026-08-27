import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_enterprise_template/core/adaptive/platform_utils.dart';
import 'package:flutter_enterprise_template/core/theme/app_colors.dart';

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    super.key,
    required this.onPressed,
    this.text = 'Submit',
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.height = 48.0,
    this.width = double.infinity,
    this.isLoading = false,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double width;
  final bool isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isApple) {
      return SizedBox(
        height: height.h,
        width: width == double.infinity ? double.infinity : width.w,
        child: CupertinoButton(
          onPressed: isLoading ? null : onPressed,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: isLoading
              ? const CupertinoActivityIndicator(color: Colors.white)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[icon!, SizedBox(width: 8.w)],
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      );
    }

    return SizedBox(
      height: height.h,
      width: width == double.infinity ? double.infinity : width.w,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: isLoading
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[icon!, SizedBox(width: 8.w)],
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
