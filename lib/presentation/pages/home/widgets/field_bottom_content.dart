import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/presentation/blocs/riot/riot_cubit.dart';

class FieldBottomSheetContent extends StatelessWidget {
  const FieldBottomSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return TextFormField(
      onChanged: (value) {
        cubit.searchChampion(value);
      },
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontFamily: FontFamilyApp.bold,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        hintText: "Search ...",
        hintStyle: TextStyle(
          fontFamily: FontFamilyApp.bold,
          color: Colors.grey.shade500,
        ),
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            strokeAlign: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.amber,
            strokeAlign: 0.5,
          ),
        ),
      ),
    );
  }
}
