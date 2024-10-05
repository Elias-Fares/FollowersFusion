import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../../screens/settings/no_internet_screen.dart';
// import '../../../screens/settings/operation_failed_screen.dart';

class StateBodyWidget extends StatefulWidget {
  final Rx<StatusScreenType> status;
  final Widget? initialChild;
  final Widget? loadingChild;
  final Widget? errorChild;
  final Widget? operatorErrorChild;
  final Widget? successChild;
  final Widget? networkErrorChild;
  final RefreshCallback? onRefresh;
  final bool needScrolling;

  const StateBodyWidget(
      {Key? key,
      required this.status,
      this.loadingChild,
      this.errorChild,
      this.operatorErrorChild,
      this.successChild,
      this.networkErrorChild,
      this.initialChild,
      this.needScrolling = true,
      this.onRefresh})
      : super(key: key);

  @override
  State<StateBodyWidget> createState() => _StateBodyWidgetState();
}

class _StateBodyWidgetState extends State<StateBodyWidget> {
  Widget showBody(StatusScreenType statusScreen) {
    Widget? bodyWidget;

    switch (statusScreen) {
      case StatusScreenType.initial:
        bodyWidget = widget.initialChild;
        break;
      case StatusScreenType.loading:
        bodyWidget = widget.loadingChild;
        break;
      case StatusScreenType.success:
        bodyWidget = widget.successChild;
        break;
      case StatusScreenType.operatorError:
        // bodyWidget = widget.operatorErrorChild ?? const OperationFailedScreen();
        break;
      case StatusScreenType.networkError:
        // bodyWidget = widget.operatorErrorChild ?? const NoInternetScreen();
        break;
      case StatusScreenType.error:
        bodyWidget = widget.errorChild;
        break;
    }

    return bodyWidget ?? const SizedBox();
  }

  Widget needScrolling() {
    if (widget.needScrolling) {
      return SingleChildScrollView(
        controller: ScrollController(),
        child: Obx(() {
          return showBody(widget.status.value);
        }),
      );
    }
    return Obx(() {
      return showBody(widget.status.value);
    });
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: (widget.onRefresh) ?? () async {},
      child: needScrolling(),
    );
  }
}

enum StatusScreenType {
  initial,
  loading,
  error,
  success,
  networkError,
  operatorError
}
