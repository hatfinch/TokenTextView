//
//  OTXTokenTextView.m
//  TokenTextView
//
//  Created by Hamish Allan on 08/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import "OTXTokenAttachment.h"
#import "OTXTokenAttachmentTextView.h"
#import "OTXTokenTextView.h"

@implementation OTXTokenTextView
{
    OTXTokenAttachmentTextView *_textView;
}

- (OTXTokenAttachmentTextView *)textView
{
    return _textView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self initWithEither];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initWithEither];
    }
    
    return self;
}

- (void)initWithEither
{
    _textView = [[OTXTokenAttachmentTextView alloc] init];
    _textView.delegate = self;
    _textView.textDragDelegate = self;
    _textView.allowsEditingTextAttributes = NO;
    
    [self addSubview:_textView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _textView.frame = self.bounds;
}

- (NSArray *)tokens
{
    NSMutableArray *tokens = [[NSMutableArray alloc] init];
    
    id block = ^(id value, NSRange range, BOOL *stop)
    {
        if (value)
        {
            OTXTokenAttachment *attachment = value;
            [tokens addObject:attachment.text];
        }
    };
    
    NSAttributedString *attributedText = _textView.attributedText;
    [attributedText enumerateAttribute:NSAttachmentAttributeName inRange:NSMakeRange(0, attributedText.length) options:0 usingBlock:block];
    
    return [tokens copy];
}

- (void)setTokens:(NSArray<NSString *> *)tokens
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                _textView.font, NSFontAttributeName,
                                [UIColor whiteColor], NSForegroundColorAttributeName,
                                [UIColor blueColor], NSBackgroundColorAttributeName,
                                nil];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    
    for (NSString *text in tokens)
    {
        NSTextAttachment *attachment = [[OTXTokenAttachment alloc] initWithText:text];
        
        CGSize size = [text sizeWithAttributes:attributes];
        CGSize paddingSize = CGSizeMake(4.0, 2.0);
        CGSize paddedSize = CGSizeMake(size.width + paddingSize.width, size.height + paddingSize.height);
        
        UIGraphicsBeginImageContextWithOptions(paddedSize, NO, 0.0);
        [text drawAtPoint:CGPointMake(paddingSize.width / 2.0, paddingSize.height / 2.0) withAttributes:attributes];
        attachment.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        NSMutableAttributedString *attachmentString = [[NSAttributedString attributedStringWithAttachment:attachment] mutableCopy];
        
        [attributedText appendAttributedString:attachmentString];
    }
    
    _textView.attributedText = attributedText;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        NSArray *tokens = self.tokens;
        if (tokens)
        {
            NSLog(@"textView.text %@", textView.text);
            self.tokens = [tokens arrayByAddingObject:textView.text];
        }
        else
        {
            self.tokens = [NSArray arrayWithObject:textView.text];
        }
        
        return NO;
    }
    else
    {
        return YES;
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interactiontextViewSho
{
    return YES;
}

@end
