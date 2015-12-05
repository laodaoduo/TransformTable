//
//  ViewController.m
//  MyTableView
//
//  Created by LWJ on 15-12-5.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ViewController.h"
#import "ArrowBtn.h"
#import "MyTableVC.h"
#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
@interface ViewController ()
@property (nonatomic, retain)UIView *bgView;
@property (nonatomic, retain)ArrowBtn *btn;
@property (nonatomic, retain)MyTableVC *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) mySelf = self;
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    navView.backgroundColor = [UIColor grayColor];
    [self.navigationController.navigationBar addSubview:navView];
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64-SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _bgView.backgroundColor = [UIColor grayColor];
    _bgView.alpha = .5;
    [self.view addSubview:_bgView];
    
    mySelf.table = [[MyTableVC alloc] initWithStyle:UITableViewStylePlain];
    mySelf.table.view.frame = CGRectMake(0, -200+64, SCREEN_WIDTH, 200);
    [self.view addSubview:mySelf.table.view];
    for (int i = 0; i<3; i++)
    {
        _btn = [[ArrowBtn alloc] initWithFrame:CGRectMake(100*i, 0, 100, 44)];
        [_btn setTitle:@"hah" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor orangeColor];
        _btn.arrowBtnClick = ^(){
//            mySelf.bgView.frame = CGRectMake(0, (mySelf.bgView.frame.origin.y<0)?64:-SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-64);
            mySelf.bgView.transform = (mySelf.bgView.frame.origin.y<0)?CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT):CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT);
            [UIView animateWithDuration:1 animations:^{
                CGAffineTransform rotation = mySelf.btn.imageView.transform;
                mySelf.btn.imageView.transform = CGAffineTransformRotate(rotation, M_PI);
                mySelf.table.view.transform = (mySelf.table.view.frame.origin.y<0)?CGAffineTransformMakeTranslation(0, 200):CGAffineTransformMakeTranslation(0, -200);
                
//                mySelf.bgView.transform = (mySelf.bgView.frame.origin.y<0)?CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT):CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT);
            }];
        };
        [navView addSubview:_btn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
