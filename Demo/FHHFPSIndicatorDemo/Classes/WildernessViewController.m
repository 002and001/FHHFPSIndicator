//
//  WildernessViewController.m
//  FHHFPSIndicator
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "WildernessViewController.h"
#import "UIViewController+CustomNavigationBar.h"
#import "UIView+FHH.h"

@interface WildernessViewController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation WildernessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBColor(246, 246, 246);
    
    [self setNavigationBarTitle:@"Wilderness" navLeftButtonIcon:@"deleteButton"];
    [self removeNavLeftButtonDefaultEvent];
    [self.navLeftButton addTarget:self action:@selector(p_leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self p_setupUI];
}

- (void)p_setupUI {
    [self.view addSubview:self.textView];
    
    self.textView.width = [UIScreen mainScreen].bounds.size.width;
    self.textView.height = [UIScreen mainScreen].bounds.size.height - 64 - 20;
    self.textView.x = 0;
    self.textView.y = 64 + 20;    
}

- (void)p_leftButtonClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (UITextView *)textView {
    if(!_textView) {
        _textView = [[UITextView alloc] init];
        NSMutableString *strM = [NSMutableString string];
        for (int i = 0; i < 500; i++) {
            [strM appendString:@"O(∩_∩)！%>_<% 😙😙😐😣😡😚😱(‧_‧？)😱🌮🍩🏝💖🍫🍦🏦🍦(*^__^*)(ˉ▽￣～) 😚😚😚😣😡😱(→_→)😱😚🌮😚🗽🍻🍯🗽🚋🎊🎂💗💛🍫🎂🍜🍜🍜(¯^¯ )"];
        }
        _textView.text = strM;
    }
    return _textView;
}

@end
