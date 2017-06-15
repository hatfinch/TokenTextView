//
//  OTXTokenAttachment.m
//  TokenTextView
//
//  Created by Hamish Allan on 08/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import "OTXTokenAttachment.h"

@implementation OTXTokenAttachment
{
    NSString *_text;
}

- (instancetype)initWithText:(NSString *)text
{
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    
    self = [super initWithData:data ofType:@"com.olivetoast.OTXTokenAttachment"];
    
    if (self)
    {
        _text = [text copy];
    }
    
    return self;
}

- (NSString *)text
{
    return _text;
}

@end
