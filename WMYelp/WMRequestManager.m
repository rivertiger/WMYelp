//
//  WMRequestManager.m
//  WMYelp
//
//  Created by MacBook Pro on 5/24/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMRequestManager.h"
#import "NSURLRequest+TDOAuth.h"
#import "WMSearchTermModel.h"

//Yelp API Endpoints

static NSString * const kAPIHost           = @"api.yelp.com";
static NSString * const kSearchPath        = @"/v2/search/";
static NSString * const kBusinessPath      = @"/v2/business/";
static NSString * const kSearchLimit       = @"3";
static NSString * const kDefaultLimit      = @"10";
static NSString * const kDefaultOffset     = @"0";

@interface WMRequestManager ()
@property (nonatomic, readwrite) WMSearchTermModel *currentSearchModel;
@end

@implementation WMRequestManager

+ (instancetype)sharedManager {
    static WMRequestManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}


- (void)request:(NSString *)searchTerm
          limit:(NSInteger)limit
         offset:(NSInteger)offset
       location:(NSString *)location
     completion:(void (^)(id response, NSError *error))completion {
    
    NSDictionary *params;
    if (!searchTerm || !location) {
        params = @{@"term":@"burgers",
                   @"location":@"Anaheim",
                   @"limit":[NSString stringWithFormat:@"%li",(long)limit],
                   @"offset":[NSString stringWithFormat:@"%li",(long)offset]};
    } else {
        params = @{@"term": searchTerm,
                   @"location":location,
                   @"limit":[NSString stringWithFormat:@"%li",(long)limit],
                   @"offset":[NSString stringWithFormat:@"%li",(long)offset]};
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithHost:kAPIHost path:kSearchPath params:params];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
//            NSLog(@"Error: %@", error);
            completion(nil, error);
        } else {
//            NSLog(@"%@ %@", response, responseObject);
            if (offset == 0) {
                WMSearchTermModel *model = [[WMSearchTermModel alloc] initWithModel:responseObject];
                weakSelf.currentSearchModel = model;
                completion(model, nil);
            } else {
                [weakSelf.currentSearchModel addItems:(NSDictionary *)responseObject];
                completion(weakSelf.currentSearchModel, nil);
            }
        }
    }];
    [dataTask resume];
}

@end
