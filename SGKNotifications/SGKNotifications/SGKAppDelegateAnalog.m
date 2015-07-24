//
//  SGKAppDelegateAnalog.m
//  SGKNotifications
//
//  Created by Macintosh on 7/24/15.
//  Copyright (c) 2015 SGKapp. All rights reserved.
//

#import "SGKAppDelegateAnalog.h"
#import "SGKGoverment.h"

@implementation SGKAppDelegateAnalog

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(govermentChangeTaxes:)
                                                 name:SGKGovermentTaxLevelDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(govermentChangeSalary:)
                                                 name:SGKGovermentSalaryDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(govermentChangePension:)
                                                 name:SGKGovermentPensionLevelDidChangeNotification
                                               object:nil];
    
    return YES;
}

-(void)govermentChangeTaxes:(NSNotification*)notification {
    NSLog(@"Goverment has changed taxes");
}

-(void)govermentChangeSalary:(NSNotification*)notification {
    NSLog(@"Goverment has changed salary");
}

-(void)govermentChangePension:(NSNotification*)notification {
    NSLog(@"Goverment has changed pension");
}

@end
