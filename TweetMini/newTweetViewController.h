//
//  newTweetViewController.h
//  TweetMini
//
//  Created by Ayush on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterAccessAPI.h"

@interface newTweetViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *tweetText;

@end
