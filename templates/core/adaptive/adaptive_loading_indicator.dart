import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_enterprise_template/core/adaptive/platform_utils.dart';
import 'package:flutter_enterprise_template/core/theme/app_colors.dart';

/// Platform-Adaptive Loading Indicator using Cupertino UI and Material UI.
/// Utilizes RepaintBoundary so high-frequency tick animations do not cause
/// cascading redraws on parent widgets.
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
          RepaintBoundary(
            child: PlatformUtils.isApple
                ? CupertinoActivityIndicator(radius: (size / 2).r, color: color)
                : SizedBox(
                    height: size.h,
                    width: size.w,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      strokeWidth: 3.0,
                    ),
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
