import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PaymentMethodButton extends StatelessWidget {
  final int id;
  final String imageUrl;
  final VoidCallback onTap;
  final Color backgroundColor;

  const PaymentMethodButton({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.onTap,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          key: ValueKey(id),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 35,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
