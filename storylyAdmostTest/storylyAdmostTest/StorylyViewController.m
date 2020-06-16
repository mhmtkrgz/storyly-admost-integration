//
//  StorylyViewController.m
//  storylyAdmostTest
//
//  Created by Levent Oral on 15.06.2020.
//  Copyright © 2020 Kokteyl. All rights reserved.
//

#import "StorylyViewController.h"
#import "AdMostStorylyAdView.h"

@interface StorylyViewController ()
@property (weak, nonatomic) IBOutlet StorylyView *storylyView;
@end

@implementation StorylyViewController {
    AdMostStorylyAdView *admostStorylyAdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _storylyView.storylyInit = [[StorylyInit alloc] initWithStorylyId:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NfaWQiOjk1NSwiYXBwX2lkIjo1NzgsImluc19pZCI6NTY2fQ.IDo71M-GZ-EPGvbHwkw44EKaNDuFHxTD7Tsq7Z6JoAs"];
    _storylyView.rootViewController = self;
    _storylyView.storylyExternalViewProvider = self;
}

- (void)onRequest:(id<StorylyExternalViewListener> _Nonnull)externalViewListener {
    NSLog(@"%@", @"onRequestWithExternalViewListener");
    admostStorylyAdView = [[AdMostStorylyAdView alloc] initWithFrame:self.view.bounds];
    admostStorylyAdView.externalViewListener = externalViewListener;
    [admostStorylyAdView loadAd];
}

@end
