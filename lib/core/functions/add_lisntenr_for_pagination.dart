import 'package:flutter/material.dart';

void addListenerForPaginationScrollController(
    {required ScrollController scrollController,
    Future? funcAtStartEdge,
    Future? funcAtEndEdge}) {
  scrollController.addListener(() async {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels == 0) {
        if (funcAtStartEdge != null) {
           funcAtStartEdge;
        }
      } else {
        if (funcAtEndEdge != null) {
          funcAtEndEdge;
        }
      }
    }
  });
}
