//
//  AdMostStorylyAdView.m
//  storylyAdmostTest
//
//  Created by Levent Oral on 15.06.2020.
//  Copyright © 2020 Kokteyl. All rights reserved.
//

#import "AdMostStorylyAdView.h"

@implementation AdMostStorylyAdView{
    AMRBanner *_banner;
}

- (void)loadAd {
    _banner = [AMRBanner bannerForZoneId:@"10217edf-9a99-4fd0-be0a-a0ef2252af15"];
    _banner.delegate = self;
    _banner.customNativeSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    _banner.customeNativeXibName = @"StorlyCustomBanner";
    NSLog(@"%@", @"loading banner");
    [_banner loadBanner];
}

#pragma mark - <StorylyExternalView>

- (NSInteger)getDuration {
    return 5000;
}

- (NSURL * _Nonnull)getIcon {
    return [NSURL URLWithString:@"http://127.0.0.1:8000/nigdedeyiz.jpg"];
}

- (NSString * _Nonnull)getTitle {
    return @"AdMost Monetization";
}

- (void)destroy {
    
}

- (void)load {
    
}

- (void)pause {
    
}

- (void)redirect {
    
}

- (void)reset {
    
}

- (void)resume {
    
}

#pragma mark - <AMRBannerDelegate>

- (void)didReceiveBanner:(AMRBanner *)banner {
    NSLog(@"Banner duration: %@", @(banner.customNativeDuration));
    [self addSubview:banner.bannerView];
    if (self.externalViewListener != nil) {
        [self.externalViewListener onLoad:self];
    }
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
}

- (void)didClickBanner:(AMRBanner *)banner {
    NSLog(@"Native Banner clicked: %@", banner.networkName);
}

@end
