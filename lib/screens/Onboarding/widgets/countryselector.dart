// import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
=======
>>>>>>> 0733dab9acb9835ba5c945390ba716d315799a86

class CountrySelector extends StatefulWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
        child: Row(
=======
    return Row(
>>>>>>> 0733dab9acb9835ba5c945390ba716d315799a86
      children: [
        CountryCodePicker(
          initialSelection: 'ET',
          showCountryOnly: false,
<<<<<<< HEAD
          favorite: ['+251', 'ET'],
        ),
        Text(
=======
          favorite: const ['+251', 'ET'],
        ),
        const Text(
>>>>>>> 0733dab9acb9835ba5c945390ba716d315799a86
          "Select country code ",
          style: TextStyle(
              fontSize: 16, color: Color.fromARGB(255, 112, 104, 104)),
        ),
      ],
<<<<<<< HEAD
    ));
=======
    );
>>>>>>> 0733dab9acb9835ba5c945390ba716d315799a86
  }
}
