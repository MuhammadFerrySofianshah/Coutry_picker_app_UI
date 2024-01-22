import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryApp extends StatefulWidget {
  const CountryApp({super.key});
  @override
  State<CountryApp> createState() => _CountryAppState();
}

class _CountryAppState extends State<CountryApp> {
  TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
      phoneCode: "62",
      countryCode: "IND",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Indonesia",
      example: "Indonesia",
      displayName: "Indonesia",
      displayNameNoCountryCode: "IND",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
// Agar ketika lebih dari 9 akan muncul ceklis - 1
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: TextFormField(
              controller: phoneController,
              onChanged: (value) {
                setState(() {
                  phoneController.text = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Your Phone Number...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.blueGrey),
// Mengatur tinggi tampilan card.
                            bottomSheetHeight: 500,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
// Mengatur Card
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                          context: context,
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                    },
                    child: Text(
                      '${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
// Agar ketika lebih dari 9 akan muncul ceklis - 2                
                suffixIcon: phoneController.text.length > 9
                    ? Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
          )),
    );
  }
}
