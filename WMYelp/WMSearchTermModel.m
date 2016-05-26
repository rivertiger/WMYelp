//
//  WMSearchTermModel.m
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMSearchTermModel.h"
#import "WMSearchTermItemModel.h"

@interface WMSearchTermModel ()
@property (nonatomic, strong) NSDictionary *response;
@property (nonatomic, strong, readwrite) NSArray *businesses;
@end

@implementation WMSearchTermModel

- (instancetype)initWithModel:(NSDictionary *)dict {
    if (self = [super init]) {
        _response = [dict copy];
        NSMutableArray *Businesses = [[NSMutableArray alloc] init];
        NSArray *array = dict[@"businesses"];
        for (NSDictionary *eachElement in array) {
            WMSearchTermItemModel *item = [[WMSearchTermItemModel alloc] initWithDict:eachElement];
            [Businesses addObject:item];
        }
        _businesses = [NSArray arrayWithArray:Businesses];
        
    }
    return self;
}

@end
