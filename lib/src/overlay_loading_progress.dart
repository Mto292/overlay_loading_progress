import 'package:flutter/material.dart';

class OverlayLoadingProgress {
  static OverlayEntry? _overlay;

  static start(
    BuildContext context, {
    Color? barrierColor = Colors.black54,
    Widget? widget,
    Color color = Colors.black38,
    String? gifOrImagePath,
    bool barrierDismissible = true,
  }) async {
    if (_overlay != null) return;
    _overlay = OverlayEntry(builder: (BuildContext context) {
      return _LoadingWidget(
        color: color,
        barrierColor: barrierColor,
        widget: widget,
        gifOrImagePath: gifOrImagePath,
        barrierDismissible: barrierDismissible,
      );
    });
    Overlay.of(context)!.insert(_overlay!);
  }

  static stop(BuildContext context, [bool rootNavigator = true]) {
    if (_overlay == null) return;
    _overlay!.remove();
    _overlay = null;
  }
}

class _LoadingWidget extends StatelessWidget {
  final Widget? widget;
  final Color? color;
  final Color? barrierColor;
  final String? gifOrImagePath;
  final bool barrierDismissible;

  const _LoadingWidget({
    Key? key,
    this.widget,
    this.color,
    this.barrierColor,
    this.gifOrImagePath,
    required this.barrierDismissible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: barrierDismissible
          ? () {
              OverlayLoadingProgress.stop(context);
            }
          : null,
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: barrierColor,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: widget ??
                SizedBox(
                  width: MediaQuery.of(context).size.width / 9,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: gifOrImagePath != null
                        ? Image.asset(gifOrImagePath!)
                        : const CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
