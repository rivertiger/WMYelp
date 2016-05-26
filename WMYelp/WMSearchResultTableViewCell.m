//
//  SearchResultTableViewCell.m
//  WMYelp
//
//  Created by MacBook Pro on 5/24/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMSearchResultTableViewCell.h"

@implementation WMSearchResultTableViewCell

- (void)updateName:(NSString *)name image:(UIImage *)image {
    _nameLabel.text = name;
}

@end
