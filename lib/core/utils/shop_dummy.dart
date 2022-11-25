import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/strings_manager.dart';

List<Map<String, dynamic>> exclusiveList = [
  {
    'image': ImageAssets.banana,
    'item': 'Organic Bananas',
    'amount': '7pcs, ',
    'price': 5.21,
  },
  {
    'image': ImageAssets.mayonnaise,
    'item': 'Mayonnais Eggless',
    'amount': '325ml, ',
    'price': 4.99,
  },
  {
    'image': ImageAssets.appleJuice,
    'item': 'Apple & Grape Juice',
    'amount': '2L, ',
    'price': 15.99,
  },
];

List<Map<String, dynamic>> bestSellingList = [
  {
    'image': ImageAssets.pepper,
    'item': 'Bell Pepper Red',
    'amount': '1Kg, ',
    'price': 4.99,
  },
  {
    'image': ImageAssets.ginger,
    'item': 'Ginger',
    'amount': '250gm, ',
    'price': 4.99,
  },
  {
    'image': ImageAssets.banana,
    'item': 'Organic Bananas',
    'amount': '7pcs, ',
    'price': 5.21,
  },
];

List<Map<String, dynamic>> groceriesList = [
  {
    'image': ImageAssets.beef,
    'item': 'Beef Bone',
    'amount': '1Kg, ',
    'price': 4.99,
  },
  {
    'image': ImageAssets.chicken,
    'item': 'Broiler Chicken',
    'amount': '1Kg, ',
    'price': 4.99,
  },
  {
    'image': ImageAssets.banana,
    'item': 'Organic Bananas',
    'amount': '7pcs, ',
    'price': 5.21,
  },
];

List<Map<String, dynamic>> categories = [
  {
    AppStrings.image: ImageAssets.pulses,
    AppStrings.color: ColorManager.lightOrange,
    AppStrings.title: AppStrings.pulses,
  },
  {
    AppStrings.image: ImageAssets.rice,
    AppStrings.color: ColorManager.lightGreen,
    AppStrings.title: AppStrings.rice,
  },
  {
    AppStrings.image: ImageAssets.beverages,
    AppStrings.color: ColorManager.lightPurple,
    AppStrings.title: AppStrings.beverages,
  },
];
