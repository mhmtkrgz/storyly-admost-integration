//
//  ViewController.m
//  storylyAdmostTest
//
//  Created by Mehmet Karagöz on 2.06.2020.
//  Copyright © 2020 Kokteyl. All rights reserved.
//

#import "ViewController.h"
#import <AMRSDK/AMRSDK.h>

@interface ViewController () <AMRBannerDelegate>
@property (weak, nonatomic) IBOutlet UIView *VBannerContainer;
@end

@implementation ViewController {
    AMRBanner *_banner;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBanner];
}

- (void)loadBanner {
    _banner = [AMRBanner bannerForZoneId:@"10217edf-9a99-4fd0-be0a-a0ef2252af15"];
    _banner.delegate = self;
    _banner.customNativeSize = CGSizeMake(self.VBannerContainer.frame.size.width, self.VBannerContainer.frame.size.height);
    _banner.customeNativeXibName = @"StorlyCustomBanner";
    [_banner loadBanner];
}

#pragma mark - Actions

- (IBAction)pause:(id)sender {
    [_banner pauseForCustomNativeBanner];
}

- (IBAction)play:(id)sender {
    [_banner playForCustomNativeBanner];
}

- (IBAction)click:(id)sender {
    [_banner triggerCallToActionForCustomNativeBanner];
}

#pragma mark - <AMRBannerDelegate>

- (void)didReceiveBanner:(AMRBanner *)banner {
    NSLog(@"Banner duration: %@", @(banner.customNativeDuration));
    
    [self.VBannerContainer addSubview:banner.bannerView];
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
}

- (void)didClickBanner:(AMRBanner *)banner {
    NSLog(@"Native Banner clicked: %@", banner.networkName);
}


@end
