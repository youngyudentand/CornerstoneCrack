//
//  CornerstoneCrack.m
//  CornerstoneCrack
//
//  Created by lixy on 2018/4/11.
//  Copyright © 2018年 ky. All rights reserved.
//

#import "CornerstoneCrack.h"
#import "JRSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (CornerstoneCrack)
+ (void)load
{
    Class class = objc_getClass("ZTrialPeriod");
    [class jr_swizzleMethod:@selector(hasExpired) withMethod:@selector(xy_hasExpired) error:nil];
    [class jr_swizzleMethod:@selector(remaining) withMethod:@selector(xy_remaining) error:nil];
    
    class = objc_getClass("ZTrialPeriodLicensingPolicy");
    [class jr_swizzleMethod:@selector(showWindow) withMethod:@selector(xy_showWindow) error:nil];
}

- (BOOL)xy_hasExpired
{
    return NO;
}

- (unsigned long long)xy_remaining
{
    return 1;
}

- (BOOL)xy_showWindow
{
    return YES;
}

@end
