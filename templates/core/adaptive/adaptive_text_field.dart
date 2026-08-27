import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_enterprise_template/core/adaptive/platform_utils.dart';
import 'package:flutter_enterprise_template/core/theme/app_colors.dart';

class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField({
    super.key,
    this.controller,
    this.hintText = '',
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 8.0,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final double borderRadius;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isApple) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text(
              labelText!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 6.h),
          ],
          CupertinoTextField(
            controller: controller,
            placeholder: hintText,
            obscureText: obscureText,
            maxLines: maxLines,
            onChanged: onChanged,
            keyboardType: keyboardType,
            enabled: enabled,
            prefix: prefixIcon != null
                ? Padding(padding: EdgeInsets.only(left: 12.w), child: prefixIcon)
                : null,
            suffix: suffixIcon != null
                ? Padding(padding: EdgeInsets.only(right: 12.w), child: suffixIcon)
                : null,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: CupertinoColors.extraLightBackgroundGray,
              borderRadius: BorderRadius.circular(borderRadius.r),
              border: Border.all(color: AppColors.border),
            ),
          ),
        ],
      );
    }

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      enabled: enabled,
      style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
