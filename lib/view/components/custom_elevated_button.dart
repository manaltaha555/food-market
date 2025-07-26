import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onTap,
    required this.verticalPadding,
    this.colors,
    this.color,
  });
  final double verticalPadding;
  final List<Color>? colors ;
  final void Function() onTap;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          gradient: (colors != null)? LinearGradient(
            colors: colors!,
          ): null,
          color: (color != null)? color! : null,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: child,
      ),
    );
  }
}
