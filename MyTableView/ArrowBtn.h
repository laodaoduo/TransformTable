//
//  ArrowBtn.h
//  MyTableView
//
//  Created by LWJ on 15-12-5.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArrowBtn : UIButton
@property (nonatomic, copy)void(^arrowBtnClick)();
@end
