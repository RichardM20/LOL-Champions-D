import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconAppbarContent extends StatelessWidget {
  const IconAppbarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/lol-icon.png',
      width: 35.w,
    );
  }
}
