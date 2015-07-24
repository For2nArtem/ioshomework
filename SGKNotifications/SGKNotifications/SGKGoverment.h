//
//  SGKGoverment.h
//  SGKNotifications
//
//  Created by Macintosh on 7/23/15.
//  Copyright (c) 2015 SGKapp. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const SGKGovermentTaxLevelDidChangeNotification;
extern NSString* const SGKGovermentSalaryDidChangeNotification;
extern NSString* const SGKGovermentPensionLevelDidChangeNotification;
extern NSString* const SGKGovermentAvarangePriceDidChangeNotification;

extern NSString* const SGKGovermentTaxLevelUserInfoKey;
extern NSString* const SGKGovermentSalaryUserInfoKey;
extern NSString* const SGKGovermentPensionLevelUserInfoKey;
extern NSString* const SGKGovermentAvarangePriceUserInfoKey;

@interface SGKGoverment : NSObject

@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float salary;
@property (assign, nonatomic) float pension;
@property (assign, nonatomic) float avarangePrice;

-(id)init;

@end
