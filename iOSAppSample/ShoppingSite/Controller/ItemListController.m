//
//  ItemListController.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import "ItemListController.h"
#import "ItemModel.h"
#import "ADBMobile.h"

@interface ItemListController ()

@end

@implementation ItemListController

NSString* tmpItemTitle;
NSString* tmpItemImg;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    [contextData setObject:_cateKey forKey:@"prop2"];
    [ADBMobile trackState:@"ItemList" data:contextData];
    
    _NaviItemList.title = _cateName;
    
    // カテゴリ別の商品と画像の設定
    id item   = [[ItemModel alloc] init];
    tmpItemTitle = [item getItemText:_cateKey];
    tmpItemImg   = [item getItemImg:_cateKey];
    
    [_ItemTitle setTitle:tmpItemTitle forState:UIControlStateNormal];
    UIImage *img = [UIImage imageNamed:tmpItemImg];
    [_ItmImg setBackgroundImage:img forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// アイテム選択処理
- (IBAction)clickItem:(id)sender {
    
    [self performSegueWithIdentifier:@"ItemDetailSegue" sender:self];
    
}

// 戻るボタン処理
- (IBAction)BtnBack:(id)sender {
    [self performSegueWithIdentifier:@"BackCategorySegue" sender:self];
}

// 画面遷移処理
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ItemDetailSegue"]) {
        ItemDetailController *itemDetailCon = segue.destinationViewController;
        itemDetailCon.fromScreenName = @"ItemListController";
        itemDetailCon.cateName = _cateName;
        itemDetailCon.cateKey = _cateKey;
        itemDetailCon.clickedItemTitle = tmpItemTitle;
        itemDetailCon.clieckedItemImg = tmpItemImg;
    }
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}

@end
