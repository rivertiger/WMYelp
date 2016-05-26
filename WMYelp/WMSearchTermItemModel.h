//
//  WMSearchTermItemModel.h
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMSearchTermItemModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageURL;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
