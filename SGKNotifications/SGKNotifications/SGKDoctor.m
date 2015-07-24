//
//  SGKDoctor.m
//  SGKNotifications
//
//  Created by Macintosh on 7/23/15.
//  Copyright (c) 2015 SGKapp. All rights reserved.
//

#import "SGKDoctor.h"
#import "SGKGoverment.h"
#import "AppDelegate.h"

@implementation SGKDoctor

-(void)rateYourLifeLevelWithNewSalary:(float)salary {
    float oldLifeLevel = self.salary / self.avarangePrice;
    float newLifeLevel = salary / self.avarangePrice;
    float lifeRatio = oldLifeLevel / newLifeLevel;
    
    if ( lifeRatio >= 1 && lifeRatio <= 1.1 ) {
        NSLog(@"As Doctor, should say that salary is steel good for living now");
    } else if ( lifeRatio > 1.1 && lifeRatio < 1.3 ) {
        NSLog(@"As Doctor, should say that Salary is going much more less then I expect now");
    } else if ( lifeRatio >= 1.3 ) {
        NSLog(@"As Doctor, should say that, Shit, how can I live with this selery now");
    } else if ( lifeRatio > 0.9 ) {
        NSLog(@"As Doctor, should say that, Life is becoming little bit better now");
    } else if ( lifeRatio > 0.6) {
        NSLog(@"As Doctor, should say that, Life is becoming much better now");
    } else {
        NSLog(@"As Doctor, should say that, I'm the boss now, wohoo!");
    }
}

-(void)rateYourLifeWithNewAvarangePrice:(float)avarangePrice{
    float oldLifeLevel = self.salary / self.avarangePrice;
    float newLifeLevel = self.salary / avarangePrice;
    float lifeRatio = oldLifeLevel / newLifeLevel;
    
    if ( lifeRatio >= 1 && lifeRatio <= 1.1 ) {
        NSLog(@"As Doctor, should say that salary is steel good for living");
    } else if ( lifeRatio > 1.1 && lifeRatio < 1.3 ) {
        NSLog(@"As Doctor, should say that salary is going much more less then I expect");
    } else if ( lifeRatio >= 1.3 ) {
        NSLog(@"As Doctor, should say that, Shit, how can I live with this selery");
    } else if ( lifeRatio > 0.9 ) {
        NSLog(@"As Doctor, should say that, Life is becoming little bit better");
    } else if ( lifeRatio > 0.6) {
        NSLog(@"As Doctor, should say that, Life is becoming much better");
    } else {
        NSLog(@"As Doctor, should say that, I'm the boss now, wohoo!");
    }
}

#pragma mark - Initialization

-(id)init{
    self = [super init];
    if (self){
        _name = @"m.d.House";
        _salary = 1200.f;
        _avarangePrice = 5.f;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(salaryChangeNotification:)
                                                     name:SGKGovermentSalaryDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avarangePriceChangeNotification:)
                                                     name:SGKGovermentAvarangePriceDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationGoBackground:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationBackToActive:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
    }
    return self;
}

-(void)dealloc {
    NSLog(@"BLYST OTPISUVAYUS'");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

-(void)salaryChangeNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:SGKGovermentSalaryUserInfoKey];
    float salary = [value floatValue];
    
    if ( salary > self.salary ) {
        NSLog(@"Doctors happy about growth of salary");
    } else if ( salary < self.salary ) {
        NSLog(@"Doctors don't like that salary go lower");
    }
    [self rateYourLifeLevelWithNewSalary:salary];
    self.salary = salary;
}

-(void)avarangePriceChangeNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:SGKGovermentAvarangePriceUserInfoKey];
    float avarangePrice = [value floatValue];
    
    if ( avarangePrice > self.avarangePrice ) {
        NSLog(@"Doctors don't like growth of avarange price");
    } else if ( avarangePrice < self.avarangePrice ) {
        NSLog(@"Doctors like that goverment made price lower");
    }
    [self rateYourLifeWithNewAvarangePrice:avarangePrice];
    self.avarangePrice = avarangePrice;
}

-(void)applicationGoBackground:(NSNotification* )notification{
    NSLog(@"Doctor %@ has gone sleep", self.name);
}
-(void)applicationBackToActive:(NSNotification* )notification{
    NSLog(@"Doctor %@ have been waking up", self.name);
}

@end
