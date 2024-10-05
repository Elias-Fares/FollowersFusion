part of 'requset_services.dart';


class RequestServicesScreen extends StatefulWidget {
  static const routeName="/rq_services_screen";
  const RequestServicesScreen({super.key});

  @override
  State<RequestServicesScreen> createState() => _RequestServicesScreenState();
}

class _RequestServicesScreenState extends State<RequestServicesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? emailTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextEditingController=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // key: _scaffoldKey,
        appBar: MainAppBar(appName: "",
          onEditPress: (){},
          onDrawerPress: (){
            //_scaffoldKey.currentState!.openDrawer();

          },
        ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            HeaderRequsetServices(),

            SizedBox(height: 20,),
            Row(
              children: [
                BaseText(
                    title: LocalKeys.link.tr,
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

                ),
              ],
            ),
            CustomTextFormField(
                borderStyleType: BorderStyleType.outlineInput,
                hintText: "ex: https://www.platform.com/username",
                controller: emailTextEditingController,
               ),

            SizedBox(height: 20,),
            Row(
              children: [
                BaseText(
                    title: LocalKeys.amount.tr,
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

                ),
              ],
            ),
            CustomTextFormField(
              borderStyleType: BorderStyleType.outlineInput,
              hintText: LocalKeys.amount_hint.tr,
              keyboardType: TextInputType.number,
              controller: emailTextEditingController,
            ),


            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                LoadingButton(
                  loading: false,
                  onPressed: (){},
                  elevation: 0,
                  height: 57,
                  width: 0.45.sw,
                  child: BaseText(
                      title: LocalKeys.add_to_orders_list.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14, color: AppColors.white)
                  ),
                ),

                LoadingButton(
                  loading: false,
                  onPressed: (){},
                  elevation: 0,
                  height: 57,


                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  gradient: null,
                  borderColor: AppColors.borderColor,

                  width: 0.3.sw,
                  child: BaseText(
                      title: LocalKeys.back.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14, color: AppColors.white)
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

