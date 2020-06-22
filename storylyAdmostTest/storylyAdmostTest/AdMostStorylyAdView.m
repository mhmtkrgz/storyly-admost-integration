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
    NSLog(@"<AdMost> getDuration: %@", @(_banner.bannerView.customNativeBannerDuration));
    return _banner ? (_banner.bannerView.customNativeBannerDuration * 1000) : 0;
}

- (NSURL *)getIcon {
    NSLog(@"<AdMost> getIcon: %@", _banner.bannerView.customNativeBannerIconURL);
    return _banner ? _banner.bannerView.customNativeBannerIconURL : nil;
}

- (NSString *)getTitle {
    NSLog(@"<AdMost> getTitle: %@", _banner.bannerView.customNativeBannerHeaderText);
    return _banner ? _banner.bannerView.customNativeBannerHeaderText : @"";
}

- (void)destroy {
    NSLog(@"<AdMost> destroy");
    [_banner pauseForCustomNativeBanner];
}
- (void)load {
    NSLog(@"<AdMost> load");
    [self addSubview:_banner.bannerView];
    _banner.bannerView.translatesAutoresizingMaskIntoConstraints = FALSE;
    [[_banner.bannerView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:TRUE];
    [[_banner.bannerView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:TRUE];
    [[_banner.bannerView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:TRUE];
    [[_banner.bannerView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:TRUE];
}

- (void)pause {
    NSLog(@"<AdMost> pause");
    [_banner pauseForCustomNativeBanner];
}

- (void)redirect {
    NSLog(@"<AdMost> redirect");
    [_banner triggerCallToActionForCustomNativeBanner];
}

- (void)reset {
    NSLog(@"<AdMost> reset");
}

- (void)resume {
    NSLog(@"<AdMost> resume");
    [_banner playForCustomNativeBanner];
}

#pragma mark - <AMRBannerDelegate>

- (void)didReceiveBanner:(AMRBanner *)banner {
    NSLog(@"Banner duration: %@", @(banner.bannerView.customNativeBannerDuration));
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
