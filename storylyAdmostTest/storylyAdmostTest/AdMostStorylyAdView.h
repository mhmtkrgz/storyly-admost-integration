//
//  AdMostStorylyAdView.h
//  storylyAdmostTest
//
//  Created by Levent Oral on 15.06.2020.
//  Copyright © 2020 Kokteyl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AMRSDK/AMRSDK.h>
@import Storyly;

NS_ASSUME_NONNULL_BEGIN

@interface AdMostStorylyAdView : UIView<StorylyExternalView, AMRBannerDelegate>

@property (weak, nonatomic) id<StorylyExternalViewListener> externalViewListener;

-(void)loadAd;

@end

NS_ASSUME_NONNULL_END
