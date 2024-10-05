
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../core/widgets/bars/sub_app_bar.dart';
import '../../core/widgets/progressIndicator/custom_progress_indicator.dart';

class ListScreen extends StatefulWidget {

  //--------Appbar Section--------------------------------------------

  final PreferredSizeWidget? mainAppbar;

 final String? appbarTitle;
 final double? appbarTextSize;
 final FontWeight? appbarFontWeight;
 final VoidCallback? appbarArrowBackFunc;
 final GestureTapCallback? appbarTitleOnTap;

 //--------Body Section ---------------------------------------------

 final int crossAxisCount;
 final double mainAxisSpacing;
 final double crossAxisSpacing;
 final bool shrinkWrap;
 final int? itemCount;
 final ScrollController? scrollController;
 final Axis scrollDirection;
 final IndexedWidgetBuilder itemBuilder;



 //----------------Loading Section --------------------------------

  final bool isLoadingPagination;

  const ListScreen({

    super.key,
    this.mainAppbar,
    this.appbarTitle,
    this.appbarTextSize,
    this.appbarArrowBackFunc,
    this.appbarFontWeight,
    this.appbarTitleOnTap,


    this.crossAxisCount=2,
    this.mainAxisSpacing=20,
    this.crossAxisSpacing=16,
    this.shrinkWrap=true,
    required this.itemCount,
    this.scrollController,
    this.scrollDirection=Axis.vertical,
    required this.itemBuilder,



    this.isLoadingPagination=false


  });

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  // final ScrollController allStoriesScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //-----------Appbar Section------------------------------------------------
      appBar: widget.mainAppbar??SubAppBar(
          title: widget.appbarTitle??"",
          arrowBackFunc: widget.appbarArrowBackFunc,
          fontWeight: widget.appbarFontWeight,
          onTap: widget.appbarTitleOnTap,
          textSize: widget.appbarTextSize,
      ),
      //----------------End Appbar Section -------------------------------------



      //-----------Body Section------------------------------------------------
      body: SingleChildScrollView(
        controller:widget.scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          children: [

            ListView.builder(
                   shrinkWrap: widget.shrinkWrap,
                   physics: const NeverScrollableScrollPhysics(),
                   itemCount: widget.itemCount,
                   scrollDirection: widget.scrollDirection,
                   itemBuilder: widget.itemBuilder
                   ),

            if(widget.isLoadingPagination)...[

              const SizedBox(height: 10,),
              CustomProgressIndicator(isLoading: widget.isLoadingPagination),
              const SizedBox(height: 10,)
            ]


          ],
        ),
      ),
    );

    //-----------End Body Section------------------------------------------------
  }
}
