//
//  SearchResultTableViewCell.h
//  WMYelp
//
//  Created by MacBook Pro on 5/24/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMSearchResultTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

- (void)updateName:(NSString *)name image:(UIImage *)image;
@end
