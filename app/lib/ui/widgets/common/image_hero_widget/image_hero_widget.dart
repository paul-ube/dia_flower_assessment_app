import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

/// make hero better when sliding out
class ImageHeroWidget extends StatefulWidget {
  const ImageHeroWidget({
    super.key,
    required this.child,
    required this.tag,
    required this.slidePageKey,
    this.slideType = SlideType.onlyImage,
  });

  final Widget child;
  final SlideType slideType;
  final Object tag;
  final GlobalKey<ExtendedImageSlidePageState> slidePageKey;

  @override
  State<ImageHeroWidget> createState() => _ImageHeroWidgetState();
}

class _ImageHeroWidgetState extends State<ImageHeroWidget> {
  RectTween? _rectTween;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.tag,
      createRectTween: (Rect? begin, Rect? end) {
        _rectTween = RectTween(begin: begin, end: end);
        return _rectTween!;
      },
      // make hero better when slide out
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        // make hero more smoothly
        final Hero hero =
            (flightDirection == HeroFlightDirection.pop
                    ? fromHeroContext.widget
                    : toHeroContext.widget)
                as Hero;
        if (_rectTween == null) {
          return hero;
        }

        if (flightDirection == HeroFlightDirection.pop) {
          final bool fixTransform =
              widget.slideType == SlideType.onlyImage &&
              (widget.slidePageKey.currentState!.offset != Offset.zero ||
                  widget.slidePageKey.currentState!.scale != 1.0);

          final Widget toHeroWidget = (toHeroContext.widget as Hero).child;
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext buildContext, Widget? child) {
              Widget animatedBuilderChild = hero.child;

              // make hero more smoothly
              animatedBuilderChild = Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: 1 - animation.value,
                    child: UnconstrainedBox(
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        width: _rectTween!.begin!.width,
                        height: _rectTween!.begin!.height,
                        child: toHeroWidget,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: animation.value,
                    child: animatedBuilderChild,
                  ),
                ],
              );

              // fix transform when slide out
              if (fixTransform) {
                final Tween<Offset> offsetTween = Tween<Offset>(
                  begin: Offset.zero,
                  end: widget.slidePageKey.currentState!.offset,
                );

                final Tween<double> scaleTween = Tween<double>(
                  begin: 1.0,
                  end: widget.slidePageKey.currentState!.scale,
                );
                animatedBuilderChild = Transform.translate(
                  offset: offsetTween.evaluate(animation),
                  child: Transform.scale(
                    scale: scaleTween.evaluate(animation),
                    child: animatedBuilderChild,
                  ),
                );
              }

              return animatedBuilderChild;
            },
          );
        }
        return hero.child;
      },
      child: widget.child,
    );
  }
}
