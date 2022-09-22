import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../typedefs/typedefs.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final MenuItems items;
  final int currentIndex;
  final Function(int) onTap;
  final bool hasFAB;
  const BottomNavigationBarWidget({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
    this.hasFAB = false,
  })  : assert(currentIndex >= 0, 'Invalid index'),
        super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomBarHeight,
      child: BottomAppBar(
        elevation: 4,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).backgroundColor,
        notchMargin: 5,
        child: SafeArea(
          minimum: Theme.of(context).platform == TargetPlatform.android
              ? EdgeInsets.zero
              : const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: Theme.of(context).platform == TargetPlatform.android
                ? kBottomBarHeight
                : kBottomBarHeightCupertino,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: _builder(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _builder() {
    final itemCount = widget.items.length;

    List<Widget> items = [];

    for (int i = 0; i < itemCount; i++) {
      items.add(
        Expanded(
          child: SizedBox(
            height: kBottomBarHeight,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => widget.onTap(i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.items[i].icon,
                      color: widget.currentIndex == i
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    Text(
                      widget.items[i].title,
                      style: TextStyle(
                        fontSize: 9,
                        color: widget.currentIndex == i
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      if (widget.hasFAB && i == itemCount - 1) {
        // Adiciona um gap entre o fab e os itens
        items.add(const SizedBox(width: 72));
      }
    }

    return items;
  }
}
