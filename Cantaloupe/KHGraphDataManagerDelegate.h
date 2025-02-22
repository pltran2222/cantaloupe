//
//  KHGraphDataManagerDelegate.h
//  Cantaloupe
//
//  Created by Kevin Hwang on 2/3/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHGraphDataManagerDelegate <NSObject>

- (void)receivedGraphData:(NSDictionary *)graphData;

@end
