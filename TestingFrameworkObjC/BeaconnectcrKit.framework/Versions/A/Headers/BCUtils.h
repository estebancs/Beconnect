//
//  BCUtils.h
//  BeaconnectcrKit
//
//  Created by Esteban Chavarria Solano on 11/15/15.
//  Copyright © 2015 movilmultimedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCUtils : NSObject

+ (void) insertWebViewInView: (UIView *)view withUrl:(NSString*)urlString andWebViewDelegate:(id<UIWebViewDelegate>) delegate;

@end
