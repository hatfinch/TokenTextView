//
//  DebugTextView.m
//  TokenTextView
//
//  Created by Hamish Allan on 09/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import "DebugTextView.h"

@implementation DebugTextView

- (void)paste:(id)sender
{
    [super paste:sender];
}

- (void)pasteItemProviders:(NSArray<NSItemProvider *> *)itemProviders
{
    NSLog(@"break");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
