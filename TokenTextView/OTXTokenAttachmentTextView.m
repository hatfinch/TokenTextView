//
//  OTXTokenAttachmentTextView.m
//  TokenTextView
//
//  Created by Hamish Allan on 09/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import "OTXTokenAttachment.h"
#import "OTXTokenAttachmentTextView.h"

@implementation OTXTokenAttachmentTextView

- (NSString *)textInRange:(UITextRange *)textRange
{
    UITextPosition *startPosition = textRange.start;
    UITextPosition *endPosition = textRange.end;
    
    NSUInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:startPosition];
    NSUInteger length = [self offsetFromPosition:startPosition toPosition:endPosition];
    NSRange range = NSMakeRange(location, length);
    
    NSAttributedString *attributedString = [self.attributedText attributedSubstringFromRange:range];
    
    NSMutableArray *substrings = [NSMutableArray array];
    
    __block NSUInteger currentLocation = 0;
    NSRange wholeRange = NSMakeRange(currentLocation, attributedString.length);
    
    id block = ^(id value, NSRange range, BOOL *stop)
    {
        NSString *substring = nil;
        
        if (range.location == currentLocation)
        {
            OTXTokenAttachment *tokenAttachment = value;
            substring = tokenAttachment.text;
        }
        else
        {
            substring = [[attributedString string] substringWithRange:range];
        }
        
        [substrings addObject:substring];
        currentLocation += range.length;
    };
    [attributedString enumerateAttribute:NSAttachmentAttributeName inRange:wholeRange options:0 usingBlock:block];
    
    return [substrings componentsJoinedByString:@" "];
}

@end
