//
//  WMSearchCollectionViewCell.m
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMSearchCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation WMSearchCollectionViewCell


- (void)updateImageWithURL:(NSString *)imageURL {
    __weak __typeof__(UIImageView) *weakImageView = self.imageView;
    self.imageView.contentMode = UIViewContentModeCenter;
    [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]]
                          placeholderImage:nil
                                   success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                    
                                       weakImageView.frame = CGRectMake(0,
                                                                        0,
                                                                        image.size.width,
                                                                        image.size.height);
                                       weakImageView.image = image;
                                   } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                       
                                   }];
    
}
@end
