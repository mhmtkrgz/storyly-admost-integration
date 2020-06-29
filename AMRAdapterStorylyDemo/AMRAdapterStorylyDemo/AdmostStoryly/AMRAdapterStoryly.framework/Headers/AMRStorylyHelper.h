//
//  AMRStorylyHelper.h
//  AMRAdapterStoryly
//
//  Created by Mehmet Karagöz on 29.06.2020.
//  Copyright © 2020 Mehmet Karagöz. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Storyly;

NS_ASSUME_NONNULL_BEGIN

@interface AMRStorylyHelper : NSObject <StorylyExternalViewProvider>
+ (instancetype)storlyHelperWithZoneId:(NSString *)zoneId;
@end

NS_ASSUME_NONNULL_END
