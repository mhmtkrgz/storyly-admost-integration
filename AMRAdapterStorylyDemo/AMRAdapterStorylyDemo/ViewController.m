//
//  ViewController.m
//  AMRAdapterStorylyDemo
//
//  Created by Mehmet Karagöz on 29.06.2020.
//  Copyright © 2020 Mehmet Karagöz. All rights reserved.
//

#import "ViewController.h"
#import <AMRAdapterStoryly/AMRStorylyHelper.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet StorylyView *storylyView;
@end

@implementation ViewController {
    AMRStorylyHelper *_admostStorylyHelper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _storylyView.storylyInit = [[StorylyInit alloc] initWithStorylyId:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NfaWQiOjk1NSwiYXBwX2lkIjo1NzgsImluc19pZCI6NTY2fQ.IDo71M-GZ-EPGvbHwkw44EKaNDuFHxTD7Tsq7Z6JoAs"];
    _storylyView.rootViewController = self;
    _admostStorylyHelper = [AMRStorylyHelper storlyHelperWithZoneId:@"10217edf-9a99-4fd0-be0a-a0ef2252af15"];
    _storylyView.storylyExternalViewProvider = _admostStorylyHelper;
}


@end
