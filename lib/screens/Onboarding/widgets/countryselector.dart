// import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
            CountryCodePicker(
                initialSelection: 'ET',
                showCountryOnly: false,
                favorite: ['+251','ET'],),
            Text("Select country code ", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 112, 104, 104)),),          
        ],
      )
    );
  }
}
