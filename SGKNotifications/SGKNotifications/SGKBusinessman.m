//
//  SGKBusinessman.m
//  SGKNotifications
//
//  Created by Macintosh on 7/23/15.
//  Copyright (c) 2015 SGKapp. All rights reserved.
//

#import "SGKBusinessman.h"
#import "SGKGoverment.h"
#import "AppDelegate.h"

@implementation SGKBusinessman

#pragma mark - Initialization

-(id)init{
    self = [super init];
    if (self){
        _name = @"m.d.House";
        _taxLevel = 15.2f;
        _avarangePrice = 5.f;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taxLevelChangeNotification:)
                                                     name:SGKGovermentTaxLevelDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avarangePriceChangeNotification:)
                                                     name:SGKGovermentAvarangePriceDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationGoBackground)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationBackToActive)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

-(void)taxLevelChangeNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:SGKGovermentTaxLevelUserInfoKey];
    float taxLevel = [value floatValue];
    
    if ( taxLevel > self.taxLevel ) {
        NSLog(@"Businessmans don't like new taxes level");
    } else if ( taxLevel < self.taxLevel ) {
        NSLog(@"Businessmans like new taxes level");
    }
}

-(void)avarangePriceChangeNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:SGKGovermentAvarangePriceUserInfoKey];
    float avarangePrice = [value floatValue];
    
    if ( avarangePrice > self.avarangePrice ) {
        NSLog(@"Businessmans don't like growth of avarange price");
    } else if ( avarangePrice < self.avarangePrice ) {
        NSLog(@"Businessmans like that goverment made price lower");
    }
}

-(void)applicationGoBackground{
    NSLog(@"Businessman %@ has gone sleep", self.name);
}
-(void)applicationBackToActive{
    NSLog(@"Businessman %@ have been waking up", self.name);
}

@end
