//
//  BCUtils.h
//  BeaconnectcrKit
//
//  Created by Esteban Chavarria Solano on 11/15/15.
//  Copyright © 2015 movilmultimedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCUtils : NSObject

+ (UIViewController*) insertWebViewInViewController:(UIViewController *)viewController withUrl:(NSString*)urlString withWebViewDelegate:(id<UIWebViewDelegate>) delegate andCloseButton:(UIButton*)closeButton;

+ (void)sendLocalNotificationWithMessage:(NSString*)message fireDateSinceNow:(NSTimeInterval)secs url:(NSString*)url timeZone:(NSTimeZone*)timeZone inApplication:(UIApplication*)application;

@end
