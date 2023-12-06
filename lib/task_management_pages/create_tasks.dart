import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_flow_app/common_pages/app_constants.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController taskNameController = TextEditingController();

  String? _value = "1";

  List<dynamic> values = ['1', '2'];

  final List<String> items = [
    'Manager',
    'Hr',
    'Sales Team',
    'Tech Team',
    'Office Staff',
    // 'Item6',
    // 'Item7',
    // 'Item8',
  ];
  String? selectedValue;
  DateTime? selectedMGFDate;
  TextEditingController? assignedDateController = TextEditingController();

  Future<dynamic> _selectMgfDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedMGFDate ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1988),
        lastDate: DateTime(2101));

    // if(selectedFromDate ==null ){
    //
    //   showAlertDialog(
    //       context, "Select the From Date At First");
    //   return;
    // }

    if (picked != null) {
      print(picked);
      print("line 168 is...");
      print(selectedMGFDate);
      // productionDateController.text = selectedMGFDate
      //     .toString();
      //
      // setState((){
      //
      //
      // });
      //

      // if (selectedEXPDate != null) {
      //   if (picked.day == selectedEXPDate!.day &&
      //       picked.month == selectedEXPDate!.month &&
      //       picked.year == selectedEXPDate!.year) {
      //     print("${DateTime.now().day}... ${picked.day} line 293");
      //
      //     showAlertDialog(context,
      //         "Select the Expired Date Before  Manufaturer Date line 294");
      //
      //     return;
      //   }
      // }

      // if(  selectedMGFDate == null)
      //   {
      //
      //     setState(()
      //     {
      //         selectedMGFDate= DateTime.now();
      //     });
      //   }

      // if (selectedEXPDate != null) {
      //   if (picked.isAfter(selectedMGFDate!) && selectedEXPDate != null) {
      //     print("${DateTime.now().day}... ${picked.day}");
      //
      //     showAlertDialog(
      //         context, "Select the Expired Date Before  Manufaturer Date");
      //     return;
      //   }

      // if (picked.day > selectedEXPDate!.day
      //     &&   selectedEXPDate != null
      // )
      // {
      //
      //   print("${DateTime.now().day}... ${picked.day}");
      //
      //   showAlertDialog(context, "Select the Expired Date Before  Manufaturer Date");
      //   return;
      // }
      // //
      // if (picked.month > selectedEXPDate!.month
      //     &&   selectedEXPDate !=null)
      // {
      //
      //   print("${DateTime.now().month}... ${picked.month}");
      //
      //   showAlertDialog(context, "Select the Expired Date Before  Manufaturer Date month");
      //   return;
      // }
      // //
      // //
      // if (picked.year > selectedEXPDate!.year
      //     &&   selectedEXPDate !=null)
      // {
      //
      //
      //   print("${DateTime.now().year}... ${picked.year}");
      //
      //   showAlertDialog(context, "Select the Expired Date Before  Manufaturer Date");
      //   return;
      // }
    } else {}
    // }

    // if (picked != null) {
    //   print("Selected Date : ${selectedToDate.toString()}");
    //
    //   if(selectedToDate ==null ){
    //
    //     setState((){
    //       selectedToDate = DateTime.now();
    //     });
    //   }
    //   if (picked.day < DateTime.now().day || picked.day > selectedToDate!.day) {
    //     showAlertDialog(
    //         context, "Select the From Date Equal or before To Date");
    //     return;
    //   }
    // }
    setState(() {
      // isFirstLoadFromDate = false;
      selectedMGFDate = picked;
      assignedDateController?.text = DateFormat.yMd().format(selectedMGFDate!);
    });

    // print();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppConstants().appTheme,
        centerTitle: true,
        title: Text("Create Task"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorHeight: 25,
                  controller: taskNameController,
                  decoration: InputDecoration(
                      hintText: "Task Name",
                      isDense: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                SizedBox(
                  height: 10,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                    // backgroundColor: Colors.black26,
                    // cardColor: Colors.black12
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          // Icon(
                          //   Icons.list,
                          //   size: 16,
                          //   color: Colors.yellow,
                          // ),
                          // SizedBox(
                          //   width: 4,
                          // ),
                          Expanded(
                            child: Text(
                              'Select Assigne',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        // width: 160,
                        padding: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.white,
                        ),
                        elevation: 2,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.yellow,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        // width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: Offset(0, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 9,
                          child:
                              Text("Date : ${assignedDateController?.text}")),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              _selectMgfDate(context);
                            },
                            icon: Icon(
                              color: Colors.black,
                              Icons.edit_calendar_outlined,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppConstants().appTheme),
                        onPressed: () {},
                        child: Text(
                          "Add Task",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
