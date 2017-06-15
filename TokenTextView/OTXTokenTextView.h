//
//  OTXTokenTextView.h
//  TokenTextView
//
//  Created by Hamish Allan on 08/06/2017.
//  Copyright © 2017 Olive Toast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OTXTokenAttachmentTextView; // TODO: remove

@interface OTXTokenTextView : UIView <UITextViewDelegate, UITextDragDelegate, UITextDropDelegate>

@property (nonatomic, copy) NSArray <NSString *> *tokens;

- (OTXTokenAttachmentTextView *)textView;

@end
