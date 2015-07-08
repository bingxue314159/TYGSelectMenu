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
    TYGSelectMenu *menu;
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
    
    menu = [[TYGSelectMenu alloc] init];
    
    for (int i = 0; i < 10; i++) {
        TYGSelectMenuEntity *menu1 = [[TYGSelectMenuEntity alloc] init];
        menu1.title = [NSString stringWithFormat:@"%d",i];
        [menu addChildSelectMenu:menu1 forParent:nil];
        
        for (int j = 0; j < 15; j++) {
            TYGSelectMenuEntity *menu2 = [[TYGSelectMenuEntity alloc] init];
            menu2.title = [NSString stringWithFormat:@"%@-%d",menu1.title,j];
            [menu addChildSelectMenu:menu2 forParent:menu1];
            
            for (int x = 0; x < 20; x++) {
                TYGSelectMenuEntity *menu3 = [[TYGSelectMenuEntity alloc] init];
                menu3.title = [NSString stringWithFormat:@"%@-%d",menu2.title,x];
                [menu addChildSelectMenu:menu3 forParent:menu2];
            }
        }
    }
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    [menu showFromView:sender];
    [menu selectAtMenu:^(NSMutableArray *selectedMenuArray) {
        NSMutableString *title = [NSMutableString string];
        for (TYGSelectMenuEntity *tempMenu in selectedMenuArray) {
            [title appendString:[NSString stringWithFormat:@"%ld",(long)tempMenu.id]];
        }
        
        [sender setTitle:title forState:UIControlStateNormal];
    }];
}

@end
