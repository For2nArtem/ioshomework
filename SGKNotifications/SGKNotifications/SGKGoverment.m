//
//  SGKGoverment.m
//  SGKNotifications
//
//  Created by Macintosh on 7/23/15.
//  Copyright (c) 2015 SGKapp. All rights reserved.
//

#import "SGKGoverment.h"

NSString* const SGKGovermentTaxLevelDidChangeNotification = @"SGKGovermentTaxLevelDidChangeNotification";
NSString* const SGKGovermentSalaryDidChangeNotification = @"SGKGovermentSalaryDidChangeNotification";
NSString* const SGKGovermentPensionLevelDidChangeNotification = @"SGKGovermentPensionLevelDidChangeNotification";
NSString* const SGKGovermentAvarangePriceDidChangeNotification = @"SGKGovermentAvarangePriceDidChangeNotification";

NSString* const SGKGovermentTaxLevelUserInfoKey = @"SGKGovermentTaxLevelUserInfoKey";
NSString* const SGKGovermentSalaryUserInfoKey = @"SGKGovermentSalaryUserInfoKey";
NSString* const SGKGovermentPensionLevelUserInfoKey = @"SGKGovermentPensionLevelUserInfoKey";
NSString* const SGKGovermentAvarangePriceUserInfoKey = @"SGKGovermentAvarangePriceUserInfoKey";

@implementation SGKGoverment

-(id)init{
    self = [super init];
    if (self) {
        _avarangePrice = 5.f;
        _salary = 1000.f;
        _taxLevel = 15.6f;
        _pension = 250.f;
    }
    return self;
}

-(void)setTaxLevel:(float)taxLevel {
    if ( taxLevel != _taxLevel ) {
        _taxLevel = taxLevel;
        NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel]
                                                             forKey:SGKGovermentTaxLevelUserInfoKey];
        [[NSNotificationCenter defaultCenter] postNotificationName:SGKGovermentTaxLevelDidChangeNotification
                                                            object:nil
                                                          userInfo:dictionary];
        
    }
}

-(void)setSalary:(float)salary {
    if (salary != _salary) {
        _salary = salary;
        NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary]
                                                               forKey:SGKGovermentSalaryUserInfoKey];
        [[NSNotificationCenter defaultCenter] postNotificationName:SGKGovermentSalaryDidChangeNotification
                                                            object:nil
                                                          userInfo:dictionary];
    }
}

-(void)setPension:(float)pension {
    if (pension != _pension ) {
        _pension = pension;
        NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension]
                                                               forKey:SGKGovermentTaxLevelUserInfoKey];
        [[NSNotificationCenter defaultCenter] postNotificationName:SGKGovermentPensionLevelDidChangeNotification
                                                            object:nil
                                                          userInfo:dictionary];
    }
}

-(void)setAvarangePrice:(float)avarangePrice {
    if ( avarangePrice != _avarangePrice ) {
        _avarangePrice = avarangePrice;
        NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:avarangePrice] forKey:SGKGovermentAvarangePriceUserInfoKey];
        [[NSNotificationCenter defaultCenter] postNotificationName:SGKGovermentAvarangePriceDidChangeNotification
                                                            object:nil
                                                          userInfo:dictionary];
    }
}

@end
