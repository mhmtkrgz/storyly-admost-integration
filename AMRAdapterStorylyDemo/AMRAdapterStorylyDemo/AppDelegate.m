//
//  AppDelegate.m
//  AMRAdapterStorylyDemo
//
//  Created by Mehmet Karagöz on 29.06.2020.
//  Copyright © 2020 Mehmet Karagöz. All rights reserved.
//

#import "AppDelegate.h"
#import <AMRSDK/AMRSDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AMRSDK startWithAppId:@"15066ddc-9c18-492c-8185-bea7e4c7f88c"];
    return YES;
}


@end
