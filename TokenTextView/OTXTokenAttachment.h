//
//  OTXTokenAttachment.h
//  TokenTextView
//
//  Created by Hamish Allan on 08/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTXTokenAttachment : NSTextAttachment

- (instancetype)initWithText:(NSString *)text;
- (NSString *)text;

@end
