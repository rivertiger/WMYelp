//
//  WMSearchTermItemModel.m
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMSearchTermItemModel.h"

@interface  WMSearchTermItemModel ()
@end
@implementation WMSearchTermItemModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        _name = dict[@"name"];
        _imageURL = dict[@"imageURL"];
        
    }
    return self;
}
@end
