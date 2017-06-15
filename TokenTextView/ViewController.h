//
//  ViewController.h
//  TokenTextView
//
//  Created by Hamish Allan on 08/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OTXTokenTextView.h"

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet OTXTokenTextView *textView1;
@property (nonatomic, weak) IBOutlet OTXTokenTextView *textView2;

- (IBAction)button1Pressed:(id)sender;
- (IBAction)button2Pressed:(id)sender;

@end

