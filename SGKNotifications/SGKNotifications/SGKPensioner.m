//
//  SGKPensioner.m
//  SGKNotifications
//
//  Created by Macintosh on 7/23/15.
//  Copyright (c) 2015 SGKapp. All rights reserved.
//

#import "SGKPensioner.h"
#import "SGKGoverment.h"
#import "AppDelegate.h"

@implementation SGKPensioner

-(void)rateYourLifeLevelWithNewPension:(float)pension {
    float oldLifeLevel = self.pension / self.avarangePrice;
    float newLifeLevel = pension / self.avarangePrice;
    float lifeRatio = oldLifeLevel / newLifeLevel;
    
    if ( lifeRatio >= 1 && lifeRatio <= 1.1 ) {
        NSLog(@"As old man, should say pension is steel good for living now");
    } else if ( lifeRatio > 1.1 && lifeRatio < 1.3 ) {
        NSLog(@"As old man, should say pension is going much more less then I expect now");
    } else if ( lifeRatio >= 1.3 ) {
        NSLog(@"As old man, should say shit, how can I live with this pension now");
    } else if ( lifeRatio > 0.9 ) {
        NSLog(@"As old man, should say, Life is becoming little bit better now");
    } else if ( lifeRatio > 0.6) {
        NSLog(@"As old man, should say, Life is becoming much better now");
    } else {
        NSLog(@"As old man, should say, I'm the boss now, wohoo!");
    }
}

-(void)rateYourLifeWithNewAvarangePrice:(float)avarangePrice{
    float oldLifeLevel = self.pension / self.avarangePrice;
    float newLifeLevel = self.pension / avarangePrice;
    float lifeRatio = oldLifeLevel / newLifeLevel;
    
    if ( lifeRatio >= 1 && lifeRatio <= 1.1 ) {
        NSLog(@"As old man, should say, pension is steel good for living");
    } else if ( lifeRatio > 1.1 && lifeRatio < 1.3 ) {
        NSLog(@"As old man, should say pension is going much more less then I expect");
    } else if ( lifeRatio >= 1.3 ) {
        NSLog(@"As old man, should say, Shit, how can I live with this pension");
    } else if ( lifeRatio > 0.9 ) {
        NSLog(@"As old man, should say, Life is becoming little bit better");
    } else if ( lifeRatio > 0.6) {
        NSLog(@"As old man, should say, Life is becoming much better");
    } else {
        NSLog(@"As old man, should say, I'm the boss now, wohoo!");
    }
}

#pragma mark - Initialization

-(id)init{
    self = [super init];
    if (self){
        _name = @"m.d.House";
        _pension = 350.f;
        _avarangePrice = 5.f;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pensionChangeNotification:)
                                                     name:SGKGovermentPensionLevelDidChangeNotification
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

-(void)pensionChangeNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:SGKGovermentPensionLevelUserInfoKey];
    float pension = [value floatValue];
    
    if ( pension > self.pension ) {
        NSLog(@"Pensioners like new pension level");
    } else if ( pension < self.pension ) {
        NSLog(@"Pensioners don't like new pension level");
    }
    [self rateYourLifeLevelWithNewPension:pension];
    self.pension = pension;
}

-(void)avarangePriceChangeNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:SGKGovermentAvarangePriceUserInfoKey];
    float avarangePrice = [value floatValue];
    
    if ( avarangePrice > self.avarangePrice ) {
        NSLog(@"Pensioners don't like growth of avarange price");
    } else if ( avarangePrice < self.avarangePrice ) {
        NSLog(@"Pensioners like that goverment made price lower");
    }
    [self rateYourLifeWithNewAvarangePrice:avarangePrice];
    self.avarangePrice = avarangePrice;
}

-(void)applicationGoBackground{
    NSLog(@"Pensioner %@ has gone sleep", self.name);
}
-(void)applicationBackToActive{
    NSLog(@"Pensioner %@ have been waking up", self.name);
}

@end
