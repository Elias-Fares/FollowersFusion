part of '../home.dart';


class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,

      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
      clipBehavior: Clip.hardEdge,
      decoration:  BoxDecoration(
      border: Border.all(
        color: AppColors.backgroundColor,
      ),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(Res.imgBigHeart)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Flexible(child:
          Text(LocalKeys.get_started.tr,style: Theme.of(context).textTheme.headlineMedium!
            .copyWith(color: AppColors.textColor3),)
          ),
          
          const GeneralImageAssets(path: Res.editColorImg,height: 40,width: 40,)

        ],
      ),
    );
  }
}
