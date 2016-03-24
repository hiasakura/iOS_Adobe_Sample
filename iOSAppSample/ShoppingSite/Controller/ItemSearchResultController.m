//
//  ItemSearchResultController.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import "ItemSearchResultController.h"
#import "ADBMobile.h"

@interface ItemSearchResultController ()

@end

@implementation ItemSearchResultController

NSString* tmpItemTitle;
NSString* tmpItemImg;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [ADBMobile trackState:@"ItemSearchResult" data:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// アイテム選択処理
- (IBAction)clickItem:(id)sender {
    
    UIButton *clickBtn = (UIButton *) sender;
    tmpItemTitle  = clickBtn.titleLabel.text;
    tmpItemImg    = clickBtn.accessibilityLabel;
    
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
        itemDetailCon.fromScreenName   = @"ItemSearchResultController";
        itemDetailCon.clickedItemTitle = tmpItemTitle;
        itemDetailCon.clieckedItemImg  = tmpItemImg;
        
    }
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}

@end