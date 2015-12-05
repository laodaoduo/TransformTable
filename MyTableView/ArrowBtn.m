//
//  ArrowBtn.m
//  MyTableView
//
//  Created by LWJ on 15-12-5.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ArrowBtn.h"

@implementation ArrowBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setImage:[UIImage imageNamed:@"Arrow"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(ArrowClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)ArrowClick
{
    if (self.arrowBtnClick)
    {
        self.arrowBtnClick();
    }
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(80, 10, 20, 20);
}
@end
