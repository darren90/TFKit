//
//  GDTAdvertView.h
//  FileMaster
//
//  Created by Tengfei on 2017/4/29.
//  Copyright © 2017年 tengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
-(void)initAdView{
    GDTAdvertView *adView = [[GDTAdvertView alloc]init];
    [self.view addSubview:adView];
    [adView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(@50);
    }];
}
 */

@interface GDTAdvertView : UIView

-(instancetype)initWithMovieList:(BOOL)isMovieList;

@property (nonatomic,assign)BOOL isMovieList;

@end
