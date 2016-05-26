//
//  WMRequestManager.h
//  WMYelp
//
//  Created by MacBook Pro on 5/24/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "WMSearchTermModel.h"
#import "WMSearchTermItemModel.h"

@interface WMRequestManager : NSObject
@property (nonatomic, readonly) WMSearchTermModel *currentSearchModel;

+ (instancetype)sharedManager;

- (void)request:(NSString *)searchTerm
       location:(NSString *)location
     completion:(void (^)(id response, NSError *error))completion;
@end
