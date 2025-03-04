
import 'package:flutter/material.dart';

void main() {
  runApp(PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetAdoptionScreen(),
    );
  }
}

class PetAdoptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location', style: TextStyle(color: Colors.grey)),
                Text('Kyiv, Ukraine', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1502685104226-e9b8c3c4e1c2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDF8fHBvc3RlcnxlbnwwfHx8fDE2NjIyNzA0Mjg&ixlib=rb-1.2.1&q=80&w=100'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search pet to adopt',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryButton(label: 'Cats'),
                  SizedBox(width: 8),
                  CategoryButton(label: 'Dogs'),
                  SizedBox(width: 8),
                  CategoryButton(label: 'Parrots'),
                  SizedBox(width: 8),
                  CategoryButton(label: 'Bunnies'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  PetCard(
                    name: 'Sola',
                    breed: 'Abyssinian cat',
                    distance: '3.6 km',
                    imageUrl: 'assets/img.png', // Local image path
                  ),
                  PetCard(
                    name: 'Orion',
                    breed: 'Abyssinian cat',
                    distance: '7.6 km',
                    imageUrl: 'assets/images/cat2.jpg', // Local image path
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(label, style: TextStyle(color: Colors.black))),
    );
  }
}

class PetCard extends StatelessWidget {
  final String name;
  final String breed;
  final String distance;
  final String imageUrl;

  const PetCard({
    Key? key,
    required this.name,
    required this.breed,
    required this.distance,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4, // 40% width
                height: MediaQuery.of(context).size.height * 0.25, // Height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
              ),
              // Overflow effect
              Positioned(
                top: -20, // Adjust this value to control how much the image overflows
                left: 10, // Adjust this value to control horizontal positioning
                child: Container(
                  width: 120, // Width of the overflowing image
                  height: 120, // Height of the overflowing image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 8), // Space between image and info
          // Info section
          Container(
            width: MediaQuery.of(context).size.width * 0.5, // 50% width
            height: MediaQuery.of(context).size.height * 0.2, // 20% height
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(breed, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Text('Distance: $distance', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:swis_warehouse/bloc/ForgetPassword/forget_password_cubit.dart';
// import 'package:swis_warehouse/bloc/Home/home_cubit.dart';
// import 'package:swis_warehouse/bloc/Inventory/inventory_cubit.dart';
// import 'package:swis_warehouse/bloc/Login/login_cubit.dart';
// import 'package:swis_warehouse/bloc/Material/material_cubit.dart';
// import 'package:swis_warehouse/bloc/Profile/profile_cubit.dart';
// import 'package:swis_warehouse/bloc/Register/register_cubit.dart';
// import 'package:swis_warehouse/bloc/TransictionStatus/transiction_status_cubit.dart';
// import 'package:swis_warehouse/bloc/details_cubit/details_cubit.dart';
// import 'package:swis_warehouse/bloc/donorhome/donor_home_cubit.dart';
// import 'package:swis_warehouse/ui/screens/Auth/complete_profile.dart';
// import 'package:swis_warehouse/ui/screens/Auth/loginPage.dart';
// import 'package:swis_warehouse/ui/screens/HomePage/widgets/navigation_menu.dart';
// import 'app_routes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import 'bloc/TransictionStatusDonor/transiction_donor_status_cubit.dart';
// import 'bloc/Transiction_info/transiction_info_cubit.dart';
// import 'bloc/create_donor_transiction_cubit/create_donor_transiction_cubit.dart';
// import 'bloc/create_transiction_cubit/create_transiction_cubit.dart';
//
// void main() {
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => LoginCubit(),
//         ),
//         BlocProvider(
//           create: (context) => RegisterCubit(),
//         ),
//         BlocProvider(
//           create: (context) => ForgetPasswordCubit(),
//         ),
//         BlocProvider(
//           create: (context) => ProducCubit(),
//         ),
//         BlocProvider(
//           create: (context) => DetailsCubit(),
//         ),
//         BlocProvider(
//           create: (context) => HomeCubit(),
//         ),
//         BlocProvider(
//           create: (context) => TransictionStatusCubit(),
//         ),
//         BlocProvider(
//           create: (context) => TransictionDonorStatusCubit(),
//         ),
//         BlocProvider(
//           create: (context) => InventoryCubit(),
//         ),
//         BlocProvider(
//           create: (context) => TransictionInfoCubit(),
//         ),
//         BlocProvider(
//           create: (context) => ProfileCubit(),
//         ),
//         BlocProvider(
//           create: (context) => CreateTransictionCubit(),
//         ),
//         BlocProvider(
//           create: (context) => CreateDonorTransictionCubit(),
//         ),
//         BlocProvider(
//           create: (context) => DonorHomeCubit(),
//         ),
//       ],
//       child: MyApp(
//         appRouter: AppRouter(),
//       ),
//     ),
//   );
// }
//
// class MyApp extends StatefulWidget {
//   final AppRouter appRouter;
//
//   const MyApp({Key? key, required this.appRouter}) : super(key: key);
//
//
//   @override
//   State<MyApp> createState() => _MyAppState();
//
// }
//
//
// class _MyAppState extends State<MyApp> {
//   String? _destination ;
//   bool _isChecking = true;
//
//   bool _isLoggedIn = false;
//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }
//
//   Future<void> _checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     // Retrieve necessary values
//     String? token = prefs.getString('token');
//     int? firstLogin = prefs.getInt('first_login');
//     int? userType = prefs.getInt('type');
//
//     // Determine navigation destination
//     String? destination;
//
//     if (token != null && token.isNotEmpty) {
//       if (firstLogin == 0) {
//         if (userType == 2) {
//           // First login = 0, type = 2, navigate to homepage
//           destination = 'keeper_home';
//         } else if (userType == 3) {
//           // First login = 0, type = 3, navigate to profile page
//           destination = 'donor_home';
//         }
//       }
//     }
//
//     setState(() {
//       _destination = destination;
//       _isChecking = false;
//     });
//   }
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: buildThemeData(),
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: widget.appRouter.generateRoute,
//       home: _isChecking
//           ? const LoginPage()
//           : _determineInitialScreen(),
//     );
//   }
//   Widget _determineInitialScreen() {
//     // If no specific destination is determined, default to login page
//     switch (_destination) {
//       case 'complete_profile':
//         return CompleteProfile();
//       case 'keeper_home':
//         return NavigationMenu();
//       case 'donor_home':
//         return NavigationMenu();
//       default:
//         return LoginPage();
//     }
//   }
//   ThemeData buildThemeData() {
//     return ThemeData(
//       iconTheme: const IconThemeData(color: Colors.white),
//       appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
//       inputDecorationTheme: const InputDecorationTheme(
//           focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//         width: 2,
//         color: Color.fromARGB(255, 244, 0, 0),
//       ))),
//       primaryColor: const Color.fromARGB(255, 244, 0, 0),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';
// // import 'package:ionicons/ionicons.dart'; // Make sure to import Ionicons
// // // Import your pages for navigation
// // // import 'warehouse_report_page.dart';
// // // import 'post_date.dart';
// // // import 'custom_search.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Stock Trading App',
// //       theme: ThemeData(
// //         primaryColor: Color(0xFF003366), // Deep Blue
// //         scaffoldBackgroundColor: Color(0xFFF5F5F5), // Light Gray
// //         textTheme: TextTheme(
// //           bodyLarge: TextStyle(color: Color(0xFF333333)), // Charcoal Gray
// //           bodyMedium: TextStyle(color: Color(0xFF666666)), // Lighter Gray for secondary text
// //         ),
// //       ),
// //       home:StockScreen (),
// //     );
// //   }
// // }
// //
// // class StockScreen extends StatefulWidget {
// //   @override
// //   _StockScreenState createState() => _StockScreenState();
// // }
// //
// // class _StockScreenState extends State<StockScreen> {
// //   String selectedChartType = 'Spline Chart'; // Default chart type
// //   final List<String> chartTypes = ['Spline Chart', 'Bar Chart', 'Pie Chart'];
// //   final String warehouseCode = "WH12345"; // Example warehouse code
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Warehouse Title
// //             SizedBox(height: 10,),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //
// //               children: [
// //                 Text(
// //                   "Warehouse",
// //                   style: TextStyle(
// //                     fontSize: 32,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFF003366), // Deep Blue
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Ionicons.notifications),
// //                   onPressed: () {
// //                     // Handle notification action
// //                   },
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //
// //             // Search Widget
// //             _buildSearchBar(),
// //             SizedBox(height: 16),
// //
// //             // Row for Dropdown, Warehouse Code, and Notification Icon
// //             Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding for the row
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   // Warehouse Code Display
// //                   Text(
// //                     warehouseCode,
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Color(0xFF003366), // Deep Blue
// //                     ),
// //                   ),
// //                   // Dropdown Button for Chart Type
// //                   DropdownButton<String>(
// //                     value: selectedChartType,
// //                     onChanged: (String? newValue) {
// //                       setState(() {
// //                         selectedChartType = newValue!;
// //                       });
// //                     },
// //                     items: chartTypes.map<DropdownMenuItem<String>>((String value) {
// //                       return DropdownMenuItem<String>(
// //                         value: value,
// //                         child: Text(value),
// //                       );
// //                     }).toList(),
// //                   ),
// //                   // Notification Icon
// //
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //
// //             // Chart Container
// //             Container(
// //               height: 300,
// //               decoration: BoxDecoration(
// //                 color: Colors.white, // Card background
// //                 borderRadius: BorderRadius.circular(16),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black12,
// //                     blurRadius: 8,
// //                     offset: Offset(0, 4),
// //                   ),
// //                 ],
// //               ),
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(16),
// //                 child: _buildChart(),
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //
// //             // Inventory Section
// //             Container(
// //               padding: EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.red[800], // Dark Red
// //                 borderRadius: BorderRadius.circular(16),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black12,
// //                     blurRadius: 8,
// //                     offset: Offset(0, 4),
// //                   ),
// //                 ],
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     "Inventory",
// //                     style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
// //                   ),
// //                   SizedBox(height: 8),
// //                   Text(
// //                     "Manage your inventory effectively to optimize your trading.",
// //                     style: TextStyle(color: Colors.white, fontSize: 14),
// //                   ),
// //                   SizedBox(height: 16),
// //                   ElevatedButton(
// //                     onPressed: () {},
// //                     child: Text("Manage Inventory"),
// //                     style: ElevatedButton.styleFrom(
// //                       foregroundColor: Color(0xFF8B0000), backgroundColor: Colors.white, // Dark Red
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //
// //             // Summary Section
// //             Text(
// //               "Summary",
// //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 8),
// //             _buildSummaryItem("Total Cash:", "45,800 B"),
// //             _buildSummaryItem("Market Cap:", "260.199 B"),
// //             SizedBox(height: 16),
// //
// //             // Place Trade Button
// //
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomAppBar(
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             IconButton(icon: Icon(Icons.home), onPressed: () {}),
// //             IconButton(icon: Icon(Icons.swap_horiz), onPressed: () {}),
// //             IconButton(icon: Icon(Icons.settings), onPressed: () {}),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Method to build the search bar
// //   Widget _buildSearchBar() {
// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(30),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black12,
// //             blurRadius: 8,
// //             offset: Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: TextField(
// //         decoration: InputDecoration(
// //           hintText: 'Search...',
// //           border: InputBorder.none,
// //           prefixIcon: Icon(Icons.search, color: Colors.grey),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Method to build the chart based on selected type
// //   Widget _buildChart() {
// //     List<CartesianSeries<ChartData, String>> series = []; // Use CartesianSeries
// //
// //     // Sample data for imports and exports
// //     List<ChartData> chartData = _getChartData();
// //
// //     if (selectedChartType == 'Spline Chart') {
// //       series.add(SplineSeries<ChartData, String>(
// //         dataSource: chartData,
// //         xValueMapper: (ChartData data, _) => data.x,
// //         yValueMapper: (ChartData data, _) => data.y,
// //         color: Color(0xFF003366), // Deep Blue
// //       ));
// //     } else if (selectedChartType == 'Bar Chart') {
// //       series.add(BarSeries<ChartData, String>(
// //         dataSource: chartData,
// //         xValueMapper: (ChartData data, _) => data.x,
// //         yValueMapper: (ChartData data, _) => data.y,
// //         color: Color(0xFF003366), // Deep Blue
// //       ));
// //     }
// //
// //     // Return Cartesian Chart
// //     if (selectedChartType == 'Spline Chart' || selectedChartType == 'Bar Chart') {
// //       return SfCartesianChart(
// //         primaryXAxis: CategoryAxis(),
// //         primaryYAxis: NumericAxis(),
// //         series: series,
// //         title: ChartTitle(text: 'Imports and Exports'),
// //         legend: Legend(isVisible: true),
// //         tooltipBehavior: TooltipBehavior(enable: true),
// //       );
// //     } else {
// //       // Return Circular Chart
// //       return SfCircularChart(
// //         title: ChartTitle(text: 'Imports and Exports Distribution'),
// //         series: <CircularSeries>[
// //           PieSeries<ChartData, String>(
// //             dataSource: chartData,
// //             xValueMapper: (ChartData data, _) => data.x,
// //             yValueMapper: (ChartData data, _) => data.y,
// //             dataLabelSettings: DataLabelSettings(isVisible: true),
// //           ),
// //         ],
// //         tooltipBehavior: TooltipBehavior(enable: true),
// //       );
// //     }
// //   }
// //
// //   // Sample data for imports and exports
// //   List<ChartData> _getChartData() {
// //     return [
// //       ChartData('Imports', 200), // Example import value
// //       ChartData('Exports', 150), // Example export value
// //     ];
// //   }
// //
// //   Widget _buildSummaryItem(String title, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(title, style: TextStyle(fontSize: 16)),
// //           Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // Data class for chart data
// // class ChartData {
// //   final String x;
// //   final double y;
// //
// //   ChartData(this.x, this.y);
