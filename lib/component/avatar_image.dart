import 'package:flutter/material.dart';

class LargeAvatarWithButton extends StatelessWidget {
  final Widget? image;
  final Function()? onPressed;

  const LargeAvatarWithButton({Key? key, this.image, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12.withAlpha(25),
            spreadRadius: .09,
            offset:const Offset(2, 1),
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      width: 140,
      height: 140,
      child: RawMaterialButton(
        child: image,
        onPressed: onPressed,
      ),
    );
  }
}
