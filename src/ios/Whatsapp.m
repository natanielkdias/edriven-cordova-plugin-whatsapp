/********* Whatsapp.m Cordova Plugin Implementation *******/

#import "Whatsapp.h"
#import <Cordova/CDVPlugin.h>

@implementation Whatsapp

- (void)send:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* sendTo = [command.arguments objectAtIndex:0];

    NSURL *whatsappURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://wa.me/%@", sendTo]];
    if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
        [[UIApplication sharedApplication] openURL: whatsappURL];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:sendTo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end