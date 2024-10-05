part of '../home.dart';


class HowToBegin extends StatelessWidget {
  const HowToBegin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Text(LocalKeys.howToBegin.tr,style: Theme.of(context).textTheme
            .headlineMedium!.copyWith(color: Theme.of(context).colorScheme.tertiary)),


        SizedBox(height: 10,),
        Text(LocalKeys.howToBeginHint.tr,style: Theme.of(context).textTheme
            .bodySmall!),
        SizedBox(height: 20,),

        CardBegin(desc: "Create a New Account",imgPath: Res.imgOne,),
        SizedBox(height: 10,),
        CardBegin(desc: "Choose the category that fits you, then select the service that suits your requirements.",imgPath: Res.imgTow,),
        SizedBox(height: 10,),
        CardBegin(desc: "Complete the payment securely through PayPal.",imgPath: Res.imgThree,),
        SizedBox(height: 10,),
      ],
    );
  }
}
