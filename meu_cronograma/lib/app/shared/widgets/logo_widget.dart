import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Widget? image; //final Widget? image; se for nulo sem required
  final String? title;

  const LogoWidget({Key? key, this.image, this.title}) : super(key: key);

  Image getImage() {
    return Image.asset(
      "assets/images/logo.png",
      key: const Key("logo_image_key"),
      scale: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image ?? getImage(),
        Visibility(
            visible: title != null,
            child: Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  title ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )),
      ],
    );
  }
}
