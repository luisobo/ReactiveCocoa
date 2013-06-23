//
//  UIActionSheet+RACSignalSupport.h
//  ReactiveCocoa
//
//  Created by Dave Lee on 2013-06-22.
//  Copyright (c) 2013 GitHub, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACDelegateProxy;
@class RACSignal;

@interface UIActionSheet (RACSignalSupport)

// A delegate proxy which will be set as the receiver's delegate when any of the
// methods in this category are used.
@property (nonatomic, strong, readonly) RACDelegateProxy *rac_delegateProxy;

// Creates a signal for button clicks on the receiver.
//
// When this method is invoked, the receiver's `delegate` will be set to
// the `rac_delegateProxy` if it is not already. Any existing delegate will be
// set as the proxy's `rac_proxiedDelegate`.
//
// Returns a signal which will send the index of the specific button clicked.
// The signal will complete when the receiver is deallocated.
- (RACSignal *)rac_buttonClickedSignal;

@end
