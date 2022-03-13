import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class TableBooking extends StatefulWidget {
  const TableBooking({Key? key}) : super(key: key);

  @override
  _TableBookingState createState() => _TableBookingState();
}

class _TableBookingState extends State<TableBooking> {
  String gender = 'Male';
  String table = 'Table 1';
  int person = 4;
  TimeOfDay selectedTime = TimeOfDay.now();
  final dateController = TextEditingController();
  bool timeSelected = false;

  @override
  void dispose() {
    dateController.dispose();
    _selectTime(context).dispose();
    super.dispose();
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        timeSelected = true;
      });
    }
  }

  DropdownButton<String> getGender() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String gender in genderList) {
      var item = DropdownMenuItem(
        child: Text(gender),
        value: gender,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );
  }

  DropdownButton<String> getTable() {
    List<DropdownMenuItem<String>> dropDownLangItems = [];
    for (String table in tableList) {
      var item = DropdownMenuItem(
        child: Text(table),
        value: table,
      );
      dropDownLangItems.add(item);
    }
    return DropdownButton(
      items: dropDownLangItems,
      value: table,
      onChanged: (value) {
        setState(() {
          table = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Card(
          elevation: 0.0,
          color: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kMainColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Now',
                              style: kTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/authbg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Icon(
                        Icons.arrow_back,
                        color: kTitleColor,
                      ).onTap(() {
                        Navigator.pop(context);
                      }),
                    ),
                    Text(
                      'Book Your Table',
                      style: kTextStyle.copyWith(
                          color: kTitleColor, fontSize: 18.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Expanded(
                  child: Container(
                    width: context.width(),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 60.0,
                                  child: FormField(
                                    builder: (FormFieldState<dynamic> field) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'Select Gender',
                                            labelStyle: GoogleFonts.poppins(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.0))),
                                        child: DropdownButtonHideUnderline(
                                            child: getGender()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  readOnly: true,
                                  onTap: () async {
                                    var date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    dateController.text =
                                        date.toString().substring(0, 10);
                                  },
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      suffixIcon: Icon(
                                        Icons.date_range_rounded,
                                        color: kGreyTextColor,
                                      ),
                                      labelText: 'Select Date',
                                      hintText: 'Booking Date'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 60.0,
                                  child: FormField(
                                    builder: (FormFieldState<dynamic> field) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'Select Table',
                                            labelStyle: GoogleFonts.poppins(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.0))),
                                        child: DropdownButtonHideUnderline(
                                            child: getTable()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: timeSelected,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: kGreyTextColor),
                                    ),
                                    child: Row(
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              _selectTime(context);
                                            },
                                            child: Text(
                                                "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.toString().substring(10, 12)}")),
                                        const Spacer(),
                                        const Icon(
                                          Icons.date_range_rounded,
                                          color: kGreyTextColor,
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !timeSelected,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    readOnly: true,
                                    onTap: () async {
                                      _selectTime(context);
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        suffixIcon: Icon(
                                          Icons.date_range_rounded,
                                          color: kGreyTextColor,
                                        ),
                                        labelText: 'Select Time',
                                        hintText: 'Booking Time'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'How Many People?',
                            style: kTextStyle.copyWith(
                                color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  person >1 ? person -= 1 : person = 1;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: kGreyTextColor.withOpacity(0.2),
                                child: const Icon(Icons.remove,color: kTitleColor,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text(person.toString(),style: kTextStyle.copyWith(color: kTitleColor),),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  person <4 ? person += 1 : person = 4;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: kGreyTextColor.withOpacity(0.2),
                                child: const Icon(Icons.add,color: kTitleColor,),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0,),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const Image(image: AssetImage('images/table.png'),fit: BoxFit.cover,),
                            Column(
                              children: [
                                Text(person.toString(), style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
                                Text('People', style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
