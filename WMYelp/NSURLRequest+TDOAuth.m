//
//  NSURLRequest+TDOAuth.m
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "NSURLRequest+TDOAuth.h"
//
//  NSURLRequest+OAuth.m
//  YelpAPISample
//
//  Created by Thibaud Robelain on 7/2/14.
//  Copyright (c) 2014 Yelp Inc. All rights reserved.
//

#import "NSURLRequest+TDOAuth.h"

#import <TDOAuth/TDOAuth.h>

/**
 OAuth credential placeholders that must be filled by each user in regards to
 http://www.yelp.com/developers/getting_started/api_access
 */

//Yelp - 2.0
static NSString * const kConsumerKey =     @"Ou5NFycuTwcyGA3Kp9d57A";
static NSString * const kConsumerSecret =  @"j8LosKaV4w9RJrA_cXslbQQeRmM";
static NSString * const kToken =           @"E4a89kIoL_WbEv8iw4zdN_oUavLghMWf";
static NSString * const kTokenSecret =     @"-qcKar2sLUkuQws75qB7jWvt_IE";


@implementation NSURLRequest (OAuth)

+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path {
    return [self requestWithHost:host path:path params:nil];
}

+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path params:(NSDictionary *)params {
    if ([kConsumerKey length] == 0 || [kConsumerSecret length] == 0 || [kToken length] == 0 || [kTokenSecret length] == 0) {
        NSLog(@"WARNING: Please enter your api v2 credentials before attempting any API request. You can do so in NSURLRequest+OAuth.m");
    }
    
    return [TDOAuth URLRequestForPath:path
                        GETParameters:params
                               scheme:@"https"
                                 host:host
                          consumerKey:kConsumerKey
                       consumerSecret:kConsumerSecret
                          accessToken:kToken
                          tokenSecret:kTokenSecret];
}

@end