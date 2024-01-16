import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_scanning/pages/food_scan_screen.dart';
import 'meals/models/dummy_data.dart';
import 'meals/models/meal.dart';
import 'meals/providers/favorite.dart';
import 'meals/screens/category_meals_screen.dart';
import 'meals/screens/meal_detail_screen.dart';
import 'meals/screens/settings_screen.dart';
import 'meals/screens/tabs_screen.dart';
import 'search/search_screen.dart';

void main() {
  runApp(const MyApp());
}

late GlobalKey<NavigatorState> navigatorKey;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = dummyMeal;

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableMeals = dummyMeal.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    navigatorKey = _navigatorKey;

    return ChangeNotifierProvider(
      create: (context) => Favorite(),
      child: MaterialApp(
        title: 'Flutter Food Scanner',
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        // themeMode: ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(224, 168, 0, 1), //GoldenRod
            primary: const Color.fromRGBO(224, 168, 0, 1),
            secondary: const Color.fromARGB(255, 231, 116, 132), //Terra Cotta
          ),
          canvasColor: const Color.fromARGB(255, 238, 240, 242),
        ),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(224, 168, 0, 1), //GoldenRod
            primary: const Color.fromRGBO(224, 168, 0, 1),
            secondary: const Color.fromARGB(255, 231, 116, 132), //Terra Cotta
          ),
          appBarTheme: const AppBarTheme(
              // backgroundColor: Color.fromARGB(255, 238, 240, 242),
              ),
          canvasColor: const Color.fromARGB(255, 238, 240, 242),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge: const TextStyle(
                  // color: Colors.white,
                  fontSize: 20,
                  color: Color.fromARGB(255, 44, 54, 63),
                  overflow: TextOverflow.clip,
                  fontFamily: 'Allan',
                ),
                bodyMedium: const TextStyle(
                  fontSize: 14,
                ),
                bodySmall: const TextStyle(
                  fontSize: 32,
                  fontFamily: 'Allan',
                  // fontWeight: FontWeight.bold,
                ),
                titleMedium: const TextStyle(
                    // color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                displaySmall: const TextStyle(
                  color: Color.fromARGB(255, 44, 54, 63),
                  fontSize: 18,
                  fontFamily: 'Metrophobic',
                ),
                displayLarge: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
                displayMedium: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 1,
                ),
                headlineMedium: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Allan',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 54, 63),
                ),
                titleSmall: const TextStyle(
                  fontSize: 26,
                  fontFamily: 'Allan',
                  color: Color.fromARGB(255, 44, 54, 63),
                ),
              ),
        ),
        home: const FoodScanScreen(), //const MyHomePage(),

        routes: {
          // '/': (ctx) => const TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
          SettingsScreen.routeName: (ctx) =>
              SettingsScreen(_filters, _setFilters)
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();
  int _currentScreenInedex = 0;

  final _screenOptions = [
    const TabsScreen(),
    const SearchScreen(),
    const FoodScanScreen(),
  ];

  void _animateToScreen(int pageIndex) {
    _controller.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _screenOptions,
        onPageChanged: (pageIndex) {
          setState(() {
            _currentScreenInedex = pageIndex;
          });
        },
      ), //const FoodScannerScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenInedex,
        onTap: _animateToScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}
