import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('zh'),
      ],
      theme: ThemeData.light(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: 1 != 1
            ? Dialog(
                insetPadding: EdgeInsets.zero,
                child: DatePicker(
                  initialDate: DateTime.now(),
                  maxDate: DateTime.now().add(const Duration(days: 365 * 3)),
                  minDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
                  enabledCellTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  daysNameTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),

                  daysNameCase: DaysNameCase.camelCase,
                  currentDateTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  currentDateDecoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(96)),

                  leadingDateTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  selectedCellTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  disbaledCellTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  onDateChanged: (value) {},
                  // initialDate: initialDate,
                  // maxDate: maxDate,
                  // minDate: minDate,
                  // onDateChanged: (value) => Navigator.pop(context, value),
                  // initialPickerType: initialPickerType,
                  // padding: contentPadding,
                  // currentDateDecoration: currentDateDecoration,
                  // currentDateTextStyle: currentDateTextStyle,
                  // disbaledCellDecoration: disbaledCellDecoration,
                  // disbaledCellTextStyle: disbaledCellTextStyle,
                  // enabledCellDecoration: enabledCellDecoration,
                  // enabledCellTextStyle: enabledCellTextStyle,
                  // selectedCellDecoration: selectedCellDecoration,
                  // selectedCellTextStyle: selectedCellTextStyle,
                  // currentDateColor: currentDateColor,
                  // daysNameTextStyle: daysNameTextStyle,
                  // disbaledCellColor: disbaledCellColor,
                  // selectedCellColor: selectedCellColor,
                  // enabledCellColor: enabledCellColor,
                  // leadingDateTextStyle: leadingDateTextStyle,
                  // slidersColor: slidersColor,
                  // slidersSize: slidersSize,
                  // highlightColor: highlightColor,
                  // splashColor: splashColor,
                  // splashRadius: splashRadius,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedDate != null)
                    Text(DateFormat(
                      'MMM dd, yy',
                    ).format(selectedDate!)),
                  TextButton(
                    onPressed: () async {
                      final date = await showDatePickerDialog(
                        surfaceTintColor: Colors.white,
                        context: context,
                        backgroundColor: Colors.white,
                        contentPadding: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        initialDate: DateTime.now(),
                        maxDate: DateTime.now().add(const Duration(days: 365 * 3)),
                        minDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
                        enabledCellTextStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        daysNameTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                        daysNameCase: DaysNameCase.camelCase,
                        currentDateTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        currentDateDecoration:
                            BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(96)),
                        leadingDateTextStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        selectedCellTextStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        disbaledCellTextStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      );
                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    },
                    child: const Text('Show Picker'),
                  ),
                ],
              ),
      ),
    );
  }
}
