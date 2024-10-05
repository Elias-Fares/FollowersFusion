part of "../requset_services.dart";




class HeaderRequsetServices extends StatelessWidget {
  const HeaderRequsetServices({super.key});


  Widget doubleWidget({required String title,required String desc,
  required BuildContext context}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.tertiary
        )),
        Flexible(child: Text(desc,style: Theme.of(context).textTheme.bodySmall!,textAlign: TextAlign.end,),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        doubleWidget(title: "${LocalKeys.platform}:",desc: "Instagram",context: context),
        SizedBox(height: 10,),
        doubleWidget(title: "${LocalKeys.category}:",desc: "Increase Followers",context: context),
        SizedBox(height: 10,),
        doubleWidget(title: "${LocalKeys.service}:",desc: "Real Followers (Jordan)",context: context),
        SizedBox(height: 10,),
        doubleWidget(title: "${LocalKeys.cost}:",desc: "\$5 for each 1000 Followers",context: context),
        SizedBox(height: 10,),
        doubleWidget(title: "${LocalKeys.description}:",desc: "Start time: 0-48 hours / Speed: 1-5 thousand/day",context: context),


      ],
    );
  }
}
