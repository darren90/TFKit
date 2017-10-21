//
//  GDTAdvertCell.h
//  RollClient
//
//  Created by Tengfei on 2017/8/7.
//  Copyright © 2017年 tengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDTAdvertCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView adId:(NSString *)adId;

- (instancetype)initWithAdId:(NSString *)adId NS_DESIGNATED_INITIALIZER;

@end
