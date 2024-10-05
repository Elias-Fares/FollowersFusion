part of '../home.dart';

class UnmatchedSupport extends StatelessWidget {
  const UnmatchedSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Text(LocalKeys.unmatchedSupport.tr,style: Theme.of(context).textTheme
            .headlineMedium!.copyWith(color: Theme.of(context).colorScheme.tertiary)),


        SizedBox(height: 10,),
        Text(LocalKeys.unmatchedSupportHint.tr,style: Theme.of(context).textTheme
            .bodySmall!),
        SizedBox(height: 20,),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardHome(
              name: 'Support',
              desc: "24/7D",
              imgPath: "",),

          //  SizedBox(width: 10,),

            CardHome(
              name: 'Support',
              desc: "24/7D",
              imgPath: "",),
           // SizedBox(width: 10,),

            CardHome(
              name: 'Support',
              desc: "24/7D",
              imgPath: "",),
          ],
        ),

      ],
    );
  }
}
