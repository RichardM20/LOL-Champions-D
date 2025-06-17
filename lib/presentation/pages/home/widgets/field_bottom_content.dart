import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/presentation/blocs/riot/riot_cubit.dart';

class FieldBottomSheetContent extends StatelessWidget {
  const FieldBottomSheetContent({super.key});

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
      borderSide: BorderSide(
        color: color,
        strokeAlign: 0.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return TextFormField(
      onChanged: cubit.searchChampion,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontFamily: FontFamilyApp.bold,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        hintText: "Search ...",
        hintStyle: TextStyle(
          fontFamily: FontFamilyApp.bold,
          color: Colors.grey.shade500,
        ),
        filled: false,
        enabledBorder: _buildBorder(Colors.grey),
        focusedBorder: _buildBorder(Colors.amber),
      ),
    );
  }
}
