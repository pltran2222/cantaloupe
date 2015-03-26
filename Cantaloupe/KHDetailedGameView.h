//
//  KHDetailedGameView.h
//  Cantaloupe
//
//  Created by Kevin Hwang on 5/12/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHGameInfo;

@interface KHDetailedGameView : UIView

- (instancetype)initWithGameInfo:(KHGameInfo *)gameInfo NS_DESIGNATED_INITIALIZER;

@end
