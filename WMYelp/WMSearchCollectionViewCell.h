//
//  WMSearchCollectionViewCell.h
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMSearchCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
- (void)updateImageWithURL:(NSString *)imageURL;
@end
