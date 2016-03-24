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
NSString * const CONST_URL_NEW_YEAR_BANNER = @"http://news.goo.ne.jp/article/mycom/life/mycom_1104042.html";

__weak NSString* tmpCateKey;
__weak NSString* tmpCateName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ADBMobile trackState:@"Category" data:nil];

    // ボタンレイアウトの変更
    _BtnSearch.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateFood.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateFashion.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateElec.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateOutdoor.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateBooks.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateGames.layer.cornerRadius = CONST_BTN_RAD;
    _BtnCateNursing.layer.cornerRadius = CONST_BTN_RAD;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 検索ボタン処理
- (IBAction)ClickSearch:(id)sender {

    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    [contextData setObject:_TextSearchKeyword.text forKey:@"eVar3"];
    [ADBMobile trackAction:@"ClickSearch" data:contextData];
    
    [self performSegueWithIdentifier:@"ItemSearchResultSegue" sender:self];

}

// カテゴリボタン処理
- (IBAction)ClickCategoryList:(id)sender {
    
    // 押下されたボタン判定（accessibilityLabelの使い方が間違ってるが、、、）
    UIButton *clickBtn = (UIButton *) sender;
    tmpCateKey  = clickBtn.accessibilityLabel;
    tmpCateName = clickBtn.titleLabel.text;

    
    [self performSegueWithIdentifier:@"ItemListSegue" sender:self];
    
}

// キャンペーンバナー処理
- (IBAction)ClickNewYearBanner:(id)sender {
    
    UIAlertController *alert =
    [UIAlertController alertControllerWithTitle:@"外部リンク"
                                        message:@"外部サイトに遷移します"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"キャンセル"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                [ADBMobile trackAction:@"ClickNewYearBanner" data:nil];
                                                NSURL *url = [NSURL URLWithString:CONST_URL_NEW_YEAR_BANNER];
                                                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                                                    [[UIApplication sharedApplication] openURL:url];
                                                }
                                            }]];
    
    
    [self presentViewController:alert animated:YES completion:nil];

}

// 画面遷移処理
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ItemSearchResultSegue"]) {
        ItemSearchResultController *itemSearchCon = segue.destinationViewController;
        itemSearchCon.myValue = @"ItemSearchResultSegueへ";
        
    } else if ([segue.identifier isEqualToString:@"ItemListSegue"]) {
        
        ItemListController *itemListCon = segue.destinationViewController;
        itemListCon.cateKey    = tmpCateKey;
        itemListCon.cateName   = tmpCateName;
    }
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}
@end
