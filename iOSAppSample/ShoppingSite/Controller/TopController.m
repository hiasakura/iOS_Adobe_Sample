//
//  TopController.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2014/12/31.
//  Copyright (c) 2014年 hirofumi. All rights reserved.
//

#import "TopController.h"
#import "ADBMobile.h"

@interface TopController ()

@end

@implementation TopController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    [contextData setObject:@"Hello World Shopping" forKey:@"prop1"];
    [ADBMobile trackState:@"Top" data:contextData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// StartShoppinngボタン処理
- (IBAction)StartShopping:(UIButton *)sender {

    [self performSegueWithIdentifier:@"CategorySegue" sender:self];

}

// 画面遷移処理
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"CategorySegue"]) {
        CategoryController *cateCon = segue.destinationViewController;
        cateCon.myValue = @"CategorySegueへ";
    }
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}

@end
