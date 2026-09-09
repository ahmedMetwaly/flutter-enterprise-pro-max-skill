import 'package:flutter/material.dart';

class PaginationScrollListener extends StatelessWidget {
  const PaginationScrollListener({
    super.key,
    required this.child,
    required this.onLoadMore,
    this.threshold = 0.8,
  });

  final Widget child;
  final VoidCallback onLoadMore;
  final double threshold;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          final maxScroll = notification.metrics.maxScrollExtent;
          final currentScroll = notification.metrics.pixels;
          if (maxScroll > 0 && currentScroll >= maxScroll * threshold) {
            onLoadMore();
          }
        }
        return false;
      },
      child: child,
    );
  }
}
