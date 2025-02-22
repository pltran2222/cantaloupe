//
//  KHMyGamesService.h
//  Cantaloupe
//
//  Created by Kevin Hwang on 3/6/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHMyGamesServiceDelegate.h"

@interface KHMyGamesService : NSObject

- (instancetype)initWithDelegate:(id<KHMyGamesServiceDelegate>)delegate;

/// @brief Request the current user's games
- (void)requestGames;

@end
