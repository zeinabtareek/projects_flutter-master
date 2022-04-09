import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projects_flutter/constants.dart';

class ChooseImageDialog extends StatelessWidget {
  const ChooseImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 100,
        child: Material(
          borderRadius: BorderRadius.circular(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      MdiIcons.imagePlus,
                      size: 40,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      'Gallery',
                      style: K.textStyleAlert,
                      maxFontSize: 18,
                      minFontSize: 16,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                width: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      MdiIcons.cameraPlus,
                      size: 40,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      'Camera',
                      style: K.textStyleAlert,
                      maxFontSize: 18,
                      minFontSize: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
