//
//  AppDelegate.m
//  SGKNotifications
//
//  Created by Macintosh on 7/23/15.
//  Copyright (c) 2015 SGKapp. All rights reserved.
//

#import "AppDelegate.h"
#import "SGKGoverment.h"
#import "SGKDoctor.h"
#import "SGKPensioner.h"
#import "SGKBusinessman.h"


@interface AppDelegate ()
@property (strong, nonatomic) SGKGoverment* goverment;
@property (strong, nonatomic, readwrite) NSMutableArray* populationArray;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.goverment = [[SGKGoverment alloc] init];
    SGKDoctor* doctor = [[SGKDoctor alloc] init]; doctor.name = @"house";
    SGKBusinessman* businessman = [[SGKBusinessman alloc] init]; businessman.name = @"Garold";
    SGKPensioner* pensioner = [[SGKPensioner alloc] init]; pensioner.name = @"Petrovich";
    self.populationArray = [[NSMutableArray alloc] init];
    
    //making strong links on objects
    [self.populationArray addObject:doctor]; [self.populationArray addObject:businessman]; [self.populationArray addObject:pensioner];
    
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
    
    NSLog(@"----Level Trainee && Ymni4ka----");
    
    self.goverment.avarangePrice = 15.f;
    NSLog(@" ");
    self.goverment.taxLevel = 25.f;
    self.goverment.salary = 1500.f;
    self.goverment.pension = 500.f;
    
    NSLog(@"----Level Master----");
    NSLog(@"For check master press 'home' in simulator");
    
    
    
    return YES;
}

-(void)govermentChangeTaxes:(NSNotification*)notification {
    NSLog(@"Goverment has changed taxes");
    NSLog(@" ");
}

-(void)govermentChangeSalary:(NSNotification*)notification {
    NSLog(@"Goverment has changed salary");
    NSLog(@" ");
}

-(void)govermentChangePension:(NSNotification*)notification {
    NSLog(@"Goverment has changed pension");
    NSLog(@" ");
}

@end
