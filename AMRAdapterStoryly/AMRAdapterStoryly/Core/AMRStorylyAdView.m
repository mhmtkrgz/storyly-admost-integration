//
//  AMRStorylyAdView.m
//  AMRAdapterStoryly
//
//  Created by Mehmet Karagöz on 29.06.2020.
//  Copyright © 2020 Mehmet Karagöz. All rights reserved.
//

#import "AMRStorylyAdView.h"

@implementation AMRStorylyAdView {
    AMRBanner *_banner;
}

- (void)loadAdWithZoneId:(NSString *)zoneId {
    NSLog(@"<AdMostStorly> load banner.");
    
    _banner = [AMRBanner bannerForZoneId:zoneId];
    _banner.delegate = self;
    _banner.customNativeSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    _banner.customeNativeXibName = @"AMRStorlyNativeAdBaseView";
    [_banner loadBanner];
}

#pragma mark - <StorylyExternalView>

- (NSInteger)getDuration {
    return _banner ? (_banner.bannerView.customNativeBannerDuration * 1000) : 0;
}

- (NSURL *)getIcon {
    return _banner ? _banner.bannerView.customNativeBannerIconURL : nil;
}

- (NSString *)getTitle {
    return _banner ? _banner.bannerView.customNativeBannerHeaderText : @"";
}

- (void)destroy {
    [_banner pauseForCustomNativeBanner];
}

- (void)load {
    [self addSubview:_banner.bannerView];
    _banner.bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [[_banner.bannerView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
    [[_banner.bannerView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
    [[_banner.bannerView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
    [[_banner.bannerView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
}

- (void)pause {
    [_banner pauseForCustomNativeBanner];
}

- (void)redirect {
    [_banner triggerCallToActionForCustomNativeBanner];
}

- (void)reset {}

- (void)resume {
    [_banner playForCustomNativeBanner];
}

#pragma mark - <AMRBannerDelegate>

- (void)didReceiveBanner:(AMRBanner *)banner {
    NSLog(@"<AdMostStorly> didreceivebanner");
    
    if (self.externalViewListener != nil) {
        [self.externalViewListener onLoad:self];
    }
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    NSLog(@"<AdMostStorly> didFailToReceive banner: %@", error.errorDescription);
}

- (void)didClickBanner:(AMRBanner *)banner {
    NSLog(@"<AdMostStorly> didClickBanner: %@", banner.networkName);
}

@end
