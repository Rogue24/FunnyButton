//
//  OCViewController.m
//  FunnyButton_Example
//
//  Created by aa on 2022/9/17.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "OCViewController.h"
#import "FunnyButton-Swift.h"
#import "FunnyButton_Example-Swift.h"

@interface OCViewController ()
@property (nonatomic, weak) Box *box;
@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"兼容OC";
    self.view.backgroundColor = UIColor.darkGrayColor;
    
    Box *box = [[Box alloc] init];
    [self.view addSubview:box];
    self.box = box;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.box updateSafeFrame];
    
    [self addFunnyActions:@[
        [[FunnyAction alloc] initWithName:@"你好哇！" work:^{
            NSLog(@"我很好。");
        }],
        
        [[FunnyAction alloc] initWithName:@"买了iPhone 14 Pro Max了吗？" work:^{
            NSLog(@"没钱买。");
        }],
    ]];
    
    [self addFunnyActionWithName:@"无聊点一下" work:^{
        NSLog(@"滚。");
    }];
    
    __weak typeof(self) wSelf = self;
    [self addFunnyActionWithName:@"查看一下 Box.frame" work:^{
        NSLog(@"box.frame --- %@", NSStringFromCGRect(wSelf.box.frame));
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeFunnyActions];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    __weak typeof(self) wSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [wSelf.box updateSafeFrame];
    });
}

@end
