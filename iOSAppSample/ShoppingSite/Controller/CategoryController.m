//
//  CategoryController.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2014/12/31.
//  Copyright (c) 2014年 hirofumi. All rights reserved.
//

#import "CategoryController.h"
#import "ADBMobile.h"

@interface CategoryController ()

@end

@implementation CategoryController

const float CONST_BTN_RAD = 9.5;

__weak NSString* tmpCateKey;
__weak NSString* tmpCateName;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ADBMobile trackState:@"Category" data:nil];

    // ボタンレイアウトの変更
    _BtnCateFood.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateFashion.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateElec.layer.cornerRadius = CONST_BTN_RAD;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// カテゴリボタン処理
- (IBAction)ClickCategoryList:(id)sender {
    
    // 押下されたボタン判定
    UIButton *clickBtn = (UIButton *) sender;
    tmpCateKey  = clickBtn.accessibilityLabel;
    tmpCateName = clickBtn.titleLabel.text;
    [self performSegueWithIdentifier:@"ItemListSegue" sender:self];
    
}

// 画面遷移処理
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ItemListController *itemListCon = segue.destinationViewController;
    itemListCon.cateKey    = tmpCateKey;
    itemListCon.cateName   = tmpCateName;
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}
@end
