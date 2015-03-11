//
//  Reminder.m
//  ReminderPlugin
//
//  Created by Ayal Herath on 1/21/15.
//
//

#import "AirPrint.h"
#import "APLPrintPageRenderer.h"

@implementation AirPrint


#pragma mark Initialisation functions

- (CDVPlugin*) initWithWebView:(UIWebView*)theWebView {
    self = (AirPrint*)[super initWithWebView:theWebView];
    if (self) {

    }
    return self;
}

-(void)printWebView:(CDVInvokedUrlCommand*)command
{    
    UIPrintInteractionController *controller = [UIPrintInteractionController sharedPrintController];
    if(!controller){
        NSLog(@"Couldn't get shared UIPrintInteractionController!");
        return;
    }
    
    UIPrintInteractionCompletionHandler completionHandler =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if(!completed && error){
          
        }
        else
        {
            [self.webView stringByEvaluatingJavaScriptFromString:@"printDone();"];
        }
    };
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.jobName = @"test";
    printInfo.duplex = UIPrintInfoDuplexLongEdge;
    
    controller.printInfo = printInfo;
    controller.showsPageRange = YES;
    
//    APLPrintPageRenderer *myRenderer = [[APLPrintPageRenderer alloc] init];
//    myRenderer.jobTitle = printInfo.jobName;
//    UIViewPrintFormatter *viewFormatter = [self.webView viewPrintFormatter];
//    
//    #if SIMPLE_LAYOUT
//        UIFont *font = [UIFont fontWithName:@"Helvetica" size:HEADER_FOOTER_TEXT_HEIGHT];
//        CGSize titleSize = [myRenderer.jobTitle sizeWithFont:font];
//        myRenderer.headerHeight = myRenderer.footerHeight = titleSize.height + HEADER_FOOTER_MARGIN_PADDING;
//    #endif
//    
//    [myRenderer addPrintFormatter:viewFormatter startingAtPageAtIndex:0];
//    controller.printPageRenderer = myRenderer;
    
    UIViewPrintFormatter *formatter = [self.webView viewPrintFormatter];
    controller.printFormatter = formatter;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [controller presentFromRect:CGRectMake(0, 0, 100, 300) inView:self.webView animated:YES completionHandler:completionHandler];
    }
    else {
        [controller presentAnimated:YES completionHandler:completionHandler];  // iPhone
    }
}

@end
