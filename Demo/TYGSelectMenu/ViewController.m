//
//  ViewController.m
//  TYGSelectMenu
//
//  Created by tanyugang on 15/7/6.
//  Copyright (c) 2015年 tanyugang. All rights reserved.
//

#import "ViewController.h"
#import "TYGSelectMenu.h"   

@interface ViewController (){
    TYGSelectMenu *menuLevel1;
    TYGSelectMenu *menuLevel2;
    TYGSelectMenu *menuLevel3;
}

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadMenu{
    
    //一级目录
    menuLevel1 = [[TYGSelectMenu alloc] init];
    for (int i = 0; i < 10; i++) {
        TYGSelectMenuEntity *menu1 = [[TYGSelectMenuEntity alloc] init];
        menu1.title = [NSString stringWithFormat:@"%d",i];
        [menuLevel1 addChildSelectMenu:menu1 forParent:nil];

    }
    
    //二级目录
    menuLevel2 = [[TYGSelectMenu alloc] init];
    for (int i = 0; i < 10; i++) {
        TYGSelectMenuEntity *menu1 = [[TYGSelectMenuEntity alloc] init];
        menu1.title = [NSString stringWithFormat:@"%d",i];
        [menuLevel2 addChildSelectMenu:menu1 forParent:nil];
        
        for (int j = 0; j < 15; j++) {
            TYGSelectMenuEntity *menu2 = [[TYGSelectMenuEntity alloc] init];
            menu2.title = [NSString stringWithFormat:@"%@-%d",menu1.title,j];
            [menuLevel2 addChildSelectMenu:menu2 forParent:menu1];

        }
    }
    
    //三级目录
    menuLevel3 = [[TYGSelectMenu alloc] init];
    for (int i = 0; i < 10; i++) {
        TYGSelectMenuEntity *menu1 = [[TYGSelectMenuEntity alloc] init];
        menu1.title = [NSString stringWithFormat:@"%d",i];
        [menuLevel3 addChildSelectMenu:menu1 forParent:nil];
        
        for (int j = 0; j < 15; j++) {
            TYGSelectMenuEntity *menu2 = [[TYGSelectMenuEntity alloc] init];
            menu2.title = [NSString stringWithFormat:@"%@-%d",menu1.title,j];
            [menuLevel3 addChildSelectMenu:menu2 forParent:menu1];
            
            for (int x = 0; x < 20; x++) {
                TYGSelectMenuEntity *menu3 = [[TYGSelectMenuEntity alloc] init];
                menu3.title = [NSString stringWithFormat:@"%@-%d",menu2.title,x];
                [menuLevel3 addChildSelectMenu:menu3 forParent:menu2];
            }
        }
    }
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    NSArray *menuArray = @[menuLevel1,menuLevel2,menuLevel3];
    TYGSelectMenu *actionMenu = [menuArray objectAtIndex:sender.tag];
    
    for (TYGSelectMenu *tempMenu in menuArray) {
        //隐藏目录
        [tempMenu disMiss];
    }
    [actionMenu showFromView:sender];//显示目录
    
    //block回调
    [actionMenu selectAtMenu:^(NSMutableArray *selectedMenuArray) {
        
//        NSMutableString *title = [NSMutableString string];
//        for (TYGSelectMenuEntity *tempMenu in selectedMenuArray) {
//            [title appendString:[NSString stringWithFormat:@"%ld",(long)tempMenu.id]];
//        }
        
        TYGSelectMenuEntity *lastMenu = [selectedMenuArray lastObject];
        
        [sender setTitle:lastMenu.title forState:UIControlStateNormal];
    }];
    
}

@end
