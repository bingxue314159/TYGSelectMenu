# TYGSelectMenu
##功能说明
快速的创建下拉多级菜单，无论多少级都可以！但目前只建议最多三级！

##截图
 
![demo1](https://github.com/bingxue314159/TYGSelectMenu/raw/master/screen/TYGSelectMenu.gif "菜单")  


##代码
###数据的初始化
```objc
//初始化一级目录数据
TYGSelectMenu *menuLevel1 = [[TYGSelectMenu alloc] init];
    for (int i = 0; i < 10; i++) {
        TYGSelectMenuEntity *menu1 = [[TYGSelectMenuEntity alloc] init];
        menu1.title = [NSString stringWithFormat:@"%d",i];
        [menuLevel1 addChildSelectMenu:menu1 forParent:nil];
}
```

```objc
//初始化二级目录数据
TYGSelectMenu *menuLevel2 = [[TYGSelectMenu alloc] init];
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
```
```objc
//初始化三级目录数  
TYGSelectMenu *menuLevel3 = [[TYGSelectMenu alloc] init];
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
```
###显示及回调
```objc
//显示并隐藏其它
[menuLevel1 showFromView:sender];
[menuLevel2 disMiss];
[menuLevel3 disMiss];   
//block回调
[menuLevel1 selectAtMenu:^(NSMutableArray *selectedMenuArray) {
    NSMutableString *title = [NSMutableString string];
    for (TYGSelectMenuEntity *tempMenu in selectedMenuArray) {
        [title appendString:[NSString stringWithFormat:@"%ld",(long)tempMenu.id]];
    }
    [sender setTitle:title forState:UIControlStateNormal];
}];
```
##问题反馈
如果你在使用过程中发现了BUG，你可以这样联系到我：  
Email:bingxue314159#163.com(把#换成@)
