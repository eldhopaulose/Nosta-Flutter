// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// class MobileNumberInput extends StatelessWidget {
//   final PhoneNumber number;
//   final TextEditingController numberController;
//   const MobileNumberInput(
//       {super.key, required this.number, required this.numberController});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30, left: 22, right: 22),
//       child: Container(
//         height: 60,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: Colors.grey,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: InternationalPhoneNumberInput(
//             onInputChanged: (PhoneNumber number) {
//               print(number.phoneNumber);
//             },
//             onInputValidated: (bool value) {
//               print(value);
//             },
//             selectorConfig: SelectorConfig(
//               selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//               setSelectorButtonAsPrefixIcon: true,
//               useBottomSheetSafeArea: true,
//             ),
//             ignoreBlank: false,
//             autoValidateMode: AutovalidateMode.disabled,
//             selectorTextStyle: TextStyle(color: Colors.black),
//             initialValue: number,
//             textFieldController: numberController,
//             formatInput: true,
//             keyboardType:
//                 TextInputType.numberWithOptions(signed: true, decimal: true),
//             inputBorder: InputBorder.none,
//             onSaved: (PhoneNumber number) {
//               print('On Saved: $number');
//             },
//             hintText: 'Phone Number',
//           ),
//         ),
//       ),
//     );
//   }
// }
