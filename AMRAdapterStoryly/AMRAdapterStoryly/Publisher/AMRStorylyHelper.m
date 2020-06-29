//
//  AMRStorylyHelper.m
//  AMRAdapterStoryly
//
//  Created by Mehmet Karagöz on 29.06.2020.
//  Copyright © 2020 Mehmet Karagöz. All rights reserved.
//

#import "AMRStorylyHelper.h"
#import "AMRStorylyAdView.h"

@implementation AMRStorylyHelper {
    NSString *_zoneId;
    AMRStorylyAdView *_amrStorylyAdView;
}

#pragma mark - Initializer

+ (instancetype)storlyHelperWithZoneId:(NSString *)zoneId {
    return [[[self class] alloc] initWithZoneId:zoneId];
}

- (instancetype)initWithZoneId:(NSString *)zoneId {
    if (!(self = [super init])) return nil;
    
    _zoneId = zoneId;
    
    return self;
}

#pragma mark - <StorylyExternalViewListener>

- (void)onRequest:(id<StorylyExternalViewListener> _Nonnull)externalViewListener :(CGRect)frame {
    _amrStorylyAdView = [[AMRStorylyAdView alloc] initWithFrame:frame];
    _amrStorylyAdView.externalViewListener = externalViewListener;
    [_amrStorylyAdView loadAdWithZoneId:_zoneId];
}

@end
