
part of 'home.dart';
class HomeScreen extends StatefulWidget {
  static const routeName="/home_screen";

   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Build the drawer
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          // Create the drawer header
          DrawerHeader(
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  // Add your header content here
                  Text(
                    'Your Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'your_email@example.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add your drawer items here
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              // Close the drawer and    Navigator.pop(context);

            },
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () {
              // Close the drawer and navigate to the about us page

            },
          ),
          ListTile(
            title: Text('Log Out'),
            onTap: () {
              // Close the drawer and handle log out logic
              Navigator.pop(context);
              // TODO: Add log out logic here
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,




      appBar: MainAppBar(appName: "",
        onEditPress: (){},
        onDrawerPress: (){
          _scaffoldKey.currentState!.openDrawer();

        },
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(

              colors:AppColors.gradiantBg
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 50,),

              HeaderHomePage(),
              SizedBox(height: 20,),
              GetStarted(),
              SizedBox(height: 20,),
              UnmatchedSupport(),
              SizedBox(height: 20,),

              HowToBegin(),

              Text("Home Page")
            ],
          ),
        ),
      ),
    );
  }
}
