/********* Whatsapp.h Cordova Plugin Header *******/

#import <Cordova/CDVPlugin.h>

@interface Whatsapp : CDVPlugin

- (void)send:(CDVInvokedUrlCommand*)command;

@end