//
//  Reminder.h
//  ReminderPlugin
//
//  Created by Ayal Herath on 1/21/15.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface AirPrint : CDVPlugin

- (void)printWebView:(CDVInvokedUrlCommand*)command;

@end
