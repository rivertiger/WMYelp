//
//  NSURLRequest+TDOAuth.h
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import <Foundation/Foundation.h>


//
//  NSURLRequest+OAuth.h
//  YelpAPISample
//
//  Created by Thibaud Robelain on 7/2/14.
//  Copyright (c) 2014 Yelp Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (TDOAuth)

/**
 @param host The domain host
 @param path The path on the domain host
 @return Builds a NSURLRequest with all the OAuth headers field set with the host and path given to it.
 */
+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path;

/**
 @param host The domain host
 @param path The path on the domain host
 @param params The query parameters
 @return Builds a NSURLRequest with all the OAuth headers field set with the host, path, and query parameters given to it.
 */
+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path params:(NSDictionary *)params;

@end




