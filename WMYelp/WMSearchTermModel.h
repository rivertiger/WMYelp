//
//  WMSearchTermModel.h
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMSearchTermModel : NSObject
@property (nonatomic, strong, readonly) NSArray *businesses;

- (instancetype)initWithModel:(NSDictionary *)dict;


@end
