import 'package:polymer/polymer.dart';

@CustomTag('wrapper-element')
class WrapperElement extends PolymerElement {

  WrapperElement.created() : super.created() {
  }

  @override
  void enteredView() {
    super.enteredView();
    var datePicker = querySelector(".date-picker-example");
    datePicker.onSelectDate.listen((_) {
      print(datePicker.selectedDate);
    });
  }
}

