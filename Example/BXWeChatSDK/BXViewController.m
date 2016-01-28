//
//  BXViewController.m
//  BXWeChatSDK
//
//  Created by Yiming Tang on 01/28/2016.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import <BXWeChatSDK/WechatAuthSDK.h>
#import "BXViewController.h"


@interface BXViewController ()

@property (nonatomic) UILabel *textLabel;

@end


@implementation BXViewController

#pragma mark - Accessors

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _textLabel.font = [UIFont systemFontOfSize:18.0f];
    }
    return _textLabel;
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.textLabel];
    [self setupViewConstraints];
    
    WechatAuthSDK *wechatAuth = [[WechatAuthSDK alloc] init];
    self.textLabel.text = [NSString stringWithFormat:@"WeChat Auth SDK Version: %@", wechatAuth.sdkVersion];
}


#pragma mark - Private

- (void)setupViewConstraints {
    NSDictionary *views = @{
        @"textLabel": self.textLabel
    };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[textLabel]-|" options:kNilOptions metrics:kNilOptions views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100.0-[textLabel]" options:kNilOptions metrics:kNilOptions views:views]];
}

@end
