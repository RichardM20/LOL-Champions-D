import 'package:flutter/material.dart';

class ButtonButtomWidget extends StatelessWidget {
  final Function()? onTap;
  final Widget? icon;
  final bool? decorated;
  final double? height;
  final double? width;
  const ButtonButtomWidget({
    super.key,
    this.onTap,
    this.icon,
    this.decorated = true,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 65,
        width: width ?? 65,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          boxShadow: decorated == false
              ? []
              : [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    offset: Offset(
                      -6,
                      -0,
                    ),
                  )
                ],
          gradient: LinearGradient(
            colors: [
              Colors.amber.shade600,
              Colors.amberAccent,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Transform.translate(
          offset: const Offset(2.5, 0),
          child: icon ??
              const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
        ),
      ),
    );
  }
}
