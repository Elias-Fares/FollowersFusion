
part of '../home.dart';


class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GeneralImageAssets(path: Res.imgBigHeart,boxFit: BoxFit.contain,height: 80,
        width: 80,),

        SizedBox(width: 40,),

        Expanded(
          child: RichText(text: TextSpan(
              text:LocalKeys.theLargestHint.tr,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 22,color: Theme.of(context).colorScheme.tertiary
              ),
              children:<InlineSpan>[
                TextSpan(
                  text: " ${LocalKeys.inTheMiddleEast.tr}",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 22,color: Theme.of(context).secondaryHeaderColor
                    )
                )
          
              ]
          )),
        )

      ],
    );
  }
}
