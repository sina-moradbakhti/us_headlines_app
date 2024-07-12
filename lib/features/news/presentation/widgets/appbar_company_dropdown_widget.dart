// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/utils/enums.dart';
// import '../controller/news_controller.dart';
// import '../../../../core/utils/extensions.dart';

// class AppbarCompanyDropdownWidget extends GetView<NewsController> {
//   final bool enable;

//   const AppbarCompanyDropdownWidget({
//     super.key,
//     required this.enable,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ObxValue(
//         (selectedCompany) => Row(
//               children: [
//                 Text(
//                   'Category:  ',
//                   style: Get.textTheme.labelSmall?.copyWith(
//                     color: AppColors.lightGreyColor,
//                   ),
//                 ),
//                 DropdownButton(
//                   underline: Container(),
//                   hint: Text(
//                     selectedCompany.value.toStrName(),
//                     style: Get.textTheme.labelSmall,
//                   ),
//                   items: [
//                     DropdownMenuItem(
//                       key: Key(FanCompany.microsoft.toStrName()),
//                       value: FanCompany.all,
//                       child: Text(
//                         FanCompany.all.toStrName(),
//                         style: Get.textTheme.labelSmall,
//                       ),
//                     ),
//                     DropdownMenuItem(
//                       key: Key(FanCompany.microsoft.toStrName()),
//                       value: FanCompany.microsoft,
//                       child: Text(
//                         FanCompany.microsoft.toStrName(),
//                         style: Get.textTheme.labelSmall,
//                       ),
//                     ),
//                     DropdownMenuItem(
//                       key: Key(FanCompany.apple.toStrName()),
//                       value: FanCompany.apple,
//                       child: Text(
//                         FanCompany.apple.toStrName(),
//                         style: Get.textTheme.labelSmall,
//                       ),
//                     ),
//                     DropdownMenuItem(
//                       key: Key(FanCompany.google.toStrName()),
//                       value: FanCompany.google,
//                       child: Text(
//                         FanCompany.google.toStrName(),
//                         style: Get.textTheme.labelSmall,
//                       ),
//                     ),
//                     DropdownMenuItem(
//                       key: Key(FanCompany.tesla.toStrName()),
//                       value: FanCompany.tesla,
//                       child: Text(
//                         FanCompany.tesla.toStrName(),
//                         style: Get.textTheme.labelSmall,
//                       ),
//                     ),
//                   ],
//                   onChanged: (item) {
//                     if (enable) {
//                       controller.company.value = item ?? FanCompany.microsoft;
//                     }
//                   },
//                 ),
//               ],
//             ),
//         controller.company);
//   }
// }

// Commented this part of code instead of removing for now