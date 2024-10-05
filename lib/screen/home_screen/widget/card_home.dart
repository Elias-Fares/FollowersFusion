part of "../home.dart";



class CardHome extends StatelessWidget {
  final String name;
  final String desc;
  final String imgPath;
  const CardHome({super.key,required this.name,required this.desc,required this.imgPath});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Icon(Icons.mic,size: 44,),
          const SizedBox(height: 8,),
          Text(name,style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 12,),
          Text(desc,style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: AppColors.white
          ),),



        ],
      ),
    );
  }
}
