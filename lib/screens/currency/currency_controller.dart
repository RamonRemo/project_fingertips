class CurrencyController {
  dynamic _api;

  CurrencyController() {
    //_api = new API();

    call();
  }

  call() async {
   var data = await _api(); 
  } 
}