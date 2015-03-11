"use strict";
function AirPrint() {
}

Barcode.prototype.printWebView = function (successCallback, errorCallback) {
  cordova.exec(successCallback, errorCallback, "AirPrint", "printWebView");
};

AirPrint.install = function () {
  if (!window.plugins) {
    window.plugins = {};
  }

  window.plugins.AirPrint = new AirPrint();
  return window.plugins.AirPrint;
};

cordova.addConstructor(AirPrint.install);
