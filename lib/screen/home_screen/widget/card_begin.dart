part of "../home.dart";



class CardBegin extends StatelessWidget {

  final String desc;
  final String imgPath;
  const CardBegin({super.key,required this.desc,required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderColor
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          GeneralImageAssets(path: imgPath,height: 40,width: 40,),


          SizedBox(width: 12,),


         
          Expanded(
            child: Text(desc,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.white
            ),),
          ),
          
          
          



        ],
      ),
    );
  }
}
