//
//  LoginViewController.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import "ApiService.h"
#import "ThirdPartyTool.h"

@interface LoginViewController : BaseViewController <ApiServiceDelegate, ThirdPartyToolDelegate>

@property (weak, nonatomic) IBOutlet UIButton *weiboButton;

@end
