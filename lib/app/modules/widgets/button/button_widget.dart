import 'package:e_log_social/app/modules/widgets/colors/light_colors.dart';
import 'package:e_log_social/app/modules/widgets/spacing/spacing.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool isLoading;
  final void Function()? onTap;
  final bool outline;
  final double height;
  final Widget? leading;
  final Color? color;
  final Color textColor;
  final double? width;
  final double? elevation;

  ///  Button
  /// button that will be execute show a circular progress indicator
  ///
  /// [text] is the text inside button
  ///
  /// [onTap] is a function will be execute when button is clicked
  ///
  /// [isLoading] is a bool that check if  circular progress
  /// indicator is active.
  /// IMPORTANT -  You need change manually [isLoading]
  /// to activated the circular progress indicator
  ///
  /// [color] is a background color of button

  const ButtonWidget({
    Key? key,
    required this.title,
    this.disabled = false,
    this.isLoading = false,
    this.onTap,
    this.height = 60,
    this.leading,
    this.color,
    this.textColor = Colors.white,
    this.width,
    this.elevation,
  })  : outline = false,
        super(key: key);

  const ButtonWidget.outline({
    Key? key,
    required this.title,
    this.onTap,
    this.leading,
    this.height = 46,
    this.color,
    this.textColor = Colors.white,
    this.width,
    this.elevation,
  })  : disabled = false,
        isLoading = false,
        outline = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      height: height,
      minWidth: width ?? double.maxFinite,
      shape: outline
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: outline ? LightColors().kcBlue : color!))
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
      color: color ?? const Color.fromRGBO(0, 103, 35, 1),
      disabledColor: Theme.of(context).primaryColor,
      child: !isLoading
          ? _buildContent()
          : const CircularProgressIndicator(
              color: Colors.white,
            ),
      onPressed: !isLoading ? onTap : null,
    );
  }

  Widget _buildContent() {
    if (leading != null) {
      return _buildWithIcon();
    }
    return _buildText();
  }

  Widget _buildText() {
    return Builder(
      builder: (context) {
        return BoxText.bodyLight(
          title,
          color: textColor,
        );
      },
    );
  }

  Widget _buildWithIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Center(
          child: _buildText(),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: Spacing.x10),
            child: leading,
          ),
        ),
      ],
    );
  }
}
