//
//  BXViewController.m
//  BXWeChatSDK
//
//  Created by Yiming Tang on 01/28/2016.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import <BXWeChatSDK/WXApi.h>
#import "BXViewController.h"


@interface BXViewController () <WXApiDelegate>

@property (nonatomic) UILabel *textLabel;
@property (nonatomic) UIButton *submitButton;

@end


@implementation BXViewController

#pragma mark - Accessors

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _textLabel.font = [UIFont systemFontOfSize:18.0f];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.text = @"WeChat OAuth";
    }
    return _textLabel;
}


- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [[UIButton alloc] init];
        _submitButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_submitButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_submitButton setTitle:@"Sign In" forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(signIn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.textLabel];
    [self.view addSubview:self.submitButton];
    [self setupViewConstraints];
}


#pragma mark - Actions

- (void)signIn:(id)sender {
    SendAuthReq *request = [[SendAuthReq alloc] init];
    request.scope = @"snsapi_userinfo";
    request.state = [[NSUUID UUID] UUIDString];
    [WXApi sendAuthReq:request viewController:self delegate:self];
}


#pragma mark - WXApiDelegate

- (void)onResp:(BaseResp *)resp {
    NSLog(@"WeChat API delegate [onResponse]: <%@>", resp);
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        NSLog(@"Auth Response: %@", resp);
    }
}


#pragma mark - Private

- (void)setupViewConstraints {
    NSDictionary *views = @{
        @"textLabel": self.textLabel,
        @"submitButton": self.submitButton,
    };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100.0-[textLabel]-50.0-[submitButton]" options:kNilOptions metrics:kNilOptions views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[textLabel]-|" options:kNilOptions metrics:kNilOptions views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[submitButton]-|" options:kNilOptions metrics:kNilOptions views:views]];
}

@end
