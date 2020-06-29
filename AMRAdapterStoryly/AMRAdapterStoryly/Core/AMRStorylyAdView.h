//
//  AMRStorylyAdView.h
//  AMRAdapterStoryly
//
//  Created by Mehmet Karagöz on 29.06.2020.
//  Copyright © 2020 Mehmet Karagöz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMRSDK/AMRSDK.h>
@import Storyly;

NS_ASSUME_NONNULL_BEGIN

@interface AMRStorylyAdView : UIView <StorylyExternalView, AMRBannerDelegate>
@property (nonatomic, strong) id<StorylyExternalViewListener> externalViewListener;
- (void)loadAdWithZoneId:(NSString *)zoneId;
@end

NS_ASSUME_NONNULL_END
