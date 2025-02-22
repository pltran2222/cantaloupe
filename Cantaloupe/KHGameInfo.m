//
//  KHGameInfo.m
//  Cantaloupe
//
//  Created by Kevin Hwang on 1/17/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHGameInfo.h"

@interface KHGameInfo()

@property (nonatomic, strong) NSDictionary *dictionary;

@property (nonatomic, strong) UIImage *coverImage;
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *formattedEarnings;

@property (nonatomic, assign) NSUInteger views;
@property (nonatomic, assign) NSUInteger purchases;
@property (nonatomic, assign) NSUInteger downloads;
@property (nonatomic, assign) NSUInteger priceInCents;
@property (nonatomic, strong) NSString *priceString;

@end

static NSString* const KHkCoverKey = @"cover_url";
static NSString* const KHkTitleKey = @"title";
static NSString* const KHkShortDescriptionKey = @"short_text";
static NSString *const KHkEarningsKey = @"earnings";
static NSString *const KHkFormattedEarningsKey = @"amount_formatted";
static NSString *const KHkViewsKey = @"views_count";
static NSString *const KHkPurchasesKey = @"purchases_count";
static NSString *const KHkDownloadsKey = @"downloads_count";
static NSString *const KhkPriceKey = @"min_price";


@implementation KHGameInfo

- (instancetype)initWithGameDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _dictionary = dictionary;
    }
    return self;
}

#pragma mark - Lazy Instantiation

- (UIImage *)coverImage {
    if (!_coverImage) {
        _coverImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.dictionary valueForKey:KHkCoverKey]]]];
        
        if (!_coverImage) {
            _coverImage = [UIImage imageNamed:@"placeholder"];
        }
    }
    return _coverImage;
}

- (NSString *)titleString {
    if (!_titleString) {
        _titleString = [self.dictionary valueForKey:KHkTitleKey];
    }
    return _titleString;
}

- (NSString *)shortDescription {
    if (!_shortDescription) {
        _shortDescription = [self.dictionary valueForKey:KHkShortDescriptionKey];
    }
    return _shortDescription;
}

- (NSString *)formattedEarnings {
    if (!_formattedEarnings) {
        _formattedEarnings = [[[self.dictionary valueForKey:KHkEarningsKey] firstObject] valueForKey:KHkFormattedEarningsKey];
        if (!_formattedEarnings) {
            _formattedEarnings = NSLocalizedString(@"None", nil);
        }
    }
    return _formattedEarnings;
}

- (NSUInteger)views {
    if (!_views) {
        _views = [[self.dictionary valueForKey:KHkViewsKey] unsignedIntegerValue];
    }
    return _views;
}

- (NSUInteger)purchases {
    if (!_purchases) {
        _purchases = [[self.dictionary valueForKey:KHkPurchasesKey] unsignedIntegerValue];
    }
    return _purchases;
}

- (NSUInteger)downloads {
    if (!_downloads) {
        _downloads = [[self.dictionary valueForKey:KHkDownloadsKey] unsignedIntegerValue];
    }
    return _downloads;
}

- (NSUInteger)priceInCents {
    if (!_priceInCents) {
        _priceInCents = [[self.dictionary valueForKey:KhkPriceKey] unsignedIntegerValue];
    }
    return _priceInCents;
}

- (NSString *)priceString {
    if (!_priceString) {
        NSNumber *numberInCents = [NSNumber numberWithInteger:self.priceInCents];
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numberFormatter setMultiplier:@0.01];
        
        // http://objectivetoast.com/2014/05/05/nsnumberformatter-and-objective-c-types/
        // Ensure that the number to format has a floating-point Objective-C type
        NSNumber *floatingPointNumberInCents = @([numberInCents floatValue]);
        _priceString = [numberFormatter stringFromNumber:floatingPointNumberInCents];
    }
    return _priceString;
}

@end
