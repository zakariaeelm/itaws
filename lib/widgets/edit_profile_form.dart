import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maan_food/GlobalComponents/button_global.dart';
import 'package:maan_food/constant.dart';
import 'package:maan_food/services/user_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../services/geo_location.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userAddressController = TextEditingController();
  final TextEditingController _userPhoneController = TextEditingController();
  var _userEmail = '';
  var _userName = '';
  var _userAddress = '';
  var _userPhone = '';

  Future<void> init() async{
    final UserModel _currentUser = Provider.of<CurrentUserProvider>(context, listen: false).currentUser;
    final Position _currentPosition =
        Provider.of<PositionProvider>(context, listen: false).position;
    List<Placemark> placemarks = await placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);

    String streetName = placemarks[0].name!;
    String locality =  placemarks[0].locality!;
    _userAddressController.text = '$streetName , $locality';
    _userNameController.text = _currentUser.name;
    _userEmailController.text = _currentUser.email;
    //List<Location> locations = await locationFromAddress("1 Stockton St, 94108 ,San Francisco");
    // print(locations[0]);
  }

  void updateProfile() {
    final isValid = _formKey.currentState == null
        ? false
        : _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    init(); // init values of form
    return Expanded(
      child: Form(
        key: _formKey,
        child: Container(
          width: context.width(),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    child: TextFormField(
                      controller: _userEmailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Email not valid !"),
                      ]),
                      enabled: true,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'exemple@exemple.com',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: _userNameController,
                    keyboardType: TextInputType.name,
                    validator: RequiredValidator(errorText: "* Required"),
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Jhon Doe',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) {
                      _userName = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _userAddressController,
                    keyboardType: TextInputType.name,
                    validator: RequiredValidator(errorText: "* Required"),
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      hintText: '21 st patrick, 94289, San francisco',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) {
                      _userAddress = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _userPhoneController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      LengthRangeValidator(
                          min: 10, max: 10, errorText: "Enter a valid 10 digits phone number !"),
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '06 00 00 00 00',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) {
                      _userPhone = value!;
                    },
                  ),
                ),
                ButtonGlobal(
                  buttontext: 'Update profile',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
