import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';
import 'package:js/js.dart' as js;

/**
 * A Polymer datepicker element.
 *
 * This element wraps a jQuery UI Datepicker.
 */
@CustomTag('date-picker')
class DatePicker extends PolymerElement {

  static const EventStreamProvider<CustomEvent> selectDateEvent = const EventStreamProvider<CustomEvent>('selectdate');
  String _dateFormat = 'yy-mm-dd';
  @published String selectedDate;

  DatePicker.created() : super.created() {
  }

  @override
  void enteredView() {
    super.enteredView();
    var options = js.map({ 'dateFormat': _dateFormat,
      'numberOfMonths': 1,
      'showOtherMonths': true,
      'selectOtherMonths': true,
      'onSelect': _updateSelectedDate,
      'defaultDate': selectedDate
    });
    js.context['jQuery'](".q-datepicker-placeholder")['datepicker'](options);
  }

  void _updateSelectedDate(String date, proxy) {
    selectedDate = date;
    dispatchEvent(new CustomEvent("selectdate"));
  }

  Stream<CustomEvent> get onSelectDate => selectDateEvent.forTarget(this);
}

