//
//  ViewController.m
//  TokenTextView
//
//  Created by Hamish Allan on 08/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import "ViewController.h"
#import "OTXTokenTextView.h"

#import "OTXTokenAttachmentTextView.h" // TODO: remove

@implementation ViewController

- (IBAction)button1Pressed:(id)sender
{
    NSLog(@"1 %@", self.textView1.textView.text);
}

- (IBAction)button2Pressed:(id)sender
{
    NSLog(@"2 %@", self.textView2.textView.text);
}

@end
