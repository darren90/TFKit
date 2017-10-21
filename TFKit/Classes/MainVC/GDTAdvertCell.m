//
//  GDTAdvertCell.m
//  RollClient
//
//  Created by Tengfei on 2017/8/7.
//  Copyright © 2017年 tengfei. All rights reserved.
//

#import "GDTAdvertCell.h"
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <StoreKit/StoreKit.h>
#import "GDTMobBannerView.h"

@interface GDTAdvertCell ()<GDTMobBannerViewDelegate> {
    GDTMobBannerView *bannerView;
}
@end
@implementation GDTAdvertCell

+ (instancetype)cellWithTableView:(UITableView *)tableView adId:(NSString *)adId {
    GDTAdvertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GDTAdvertCell"];
    if (!cell) {
        cell = [[self alloc] initWithAdId:adId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    return [self initWithAdId:@""];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self initWithAdId:@""];
}

- (instancetype)initWithAdId:(NSString *)adId {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])]) {
        [self initliza];
    }
    return self;
}

- (void)initliza {
    // Custom initialization
    NSString *appkey = @"1106126284";
    NSString *posId = @"1060622273752012";
    
    NSLog(@"Banner view init");
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0,0,GDTMOB_AD_SUGGEST_SIZE_728x90.width,GDTMOB_AD_SUGGEST_SIZE_728x90.height)
                                                      appkey:appkey placementId:posId];
    } else {
        bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0,0,GDTMOB_AD_SUGGEST_SIZE_320x50.width,GDTMOB_AD_SUGGEST_SIZE_320x50.height)
                                                      appkey:appkey placementId:posId];
    }
    
    
    //    if (IS_OS_7_OR_LATER) {
    //        self.extendedLayoutIncludesOpaqueBars = NO;
    //        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    //    }
    
    bannerView.delegate = self;
    bannerView.currentViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
    bannerView.isAnimationOn = NO;
    bannerView.showCloseBtn = NO;
    bannerView.isGpsOn = YES;
    [bannerView loadAdAndShow];
    bannerView.isAnimationOn = YES;
    bannerView.interval = 10;
    bannerView.isGpsOn = YES;
    //    UIWindow *fK = [[UIApplication sharedApplication] keyWindow];
    //    [fK addSubview:bannerView];
    [self.contentView addSubview:bannerView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        bannerView.frame = CGRectMake(0,0,GDTMOB_AD_SUGGEST_SIZE_728x90.width,GDTMOB_AD_SUGGEST_SIZE_728x90.height);
    } else {
        bannerView.frame = CGRectMake(0,0,GDTMOB_AD_SUGGEST_SIZE_320x50.width,GDTMOB_AD_SUGGEST_SIZE_320x50.height);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
