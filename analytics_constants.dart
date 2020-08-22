class AnalyticsEvent {
  static const showDialog = _ShowDialogEvent();
  static const showPage = _ShowPageEvent();
}
    
class _ShowDialogEvent {
  const _ShowDialogEvent();
  
  static const name = 'show_dialog';
  static const params = _ShowDialogEventParams();
}

class _ShowDialogEventParams {
  const _ShowDialogEventParams();
  
  static const value01 = 'value_01';
  static const value02 = 'value_02';
  static const value03 = 'value_03';
  static const value04 = 'value_04';
  static const value05 = 'value_05';
  static const value06 = 'value_06';
  static const value07 = 'value_07';

}


class _ShowPageEvent {
  const _ShowPageEvent();
  
  static const name = 'show_page';
  static const params = _ShowPageEventParams();
}

class _ShowPageEventParams {
  const _ShowPageEventParams();
  
  static const value01 = 'value_01';
  static const value02 = 'value_02';
  static const value03 = 'value_03';
  static const value04 = 'value_04';
  static const value05 = 'value_05';
  static const value06 = 'value_06';

}



