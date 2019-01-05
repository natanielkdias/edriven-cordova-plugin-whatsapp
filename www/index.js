var exec = require('cordova/exec');

var Whatsapp = {
    send: function (send_to, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "Whatsapp", "send", [send_to]);
    }
};

module.exports = Whatsapp;