//
//  UIActionSheetRACSupportSpec.m
//  ReactiveCocoa
//
//  Created by Dave Lee on 2013-06-22.
//  Copyright (c) 2013 GitHub, Inc. All rights reserved.
//

#import "RACSignal.h"
#import "RACSignal+Operations.h"
#import "UIActionSheet+RACSignalSupport.h"

SpecBegin(UIActionSheetRACSupportSpec)

// This test crashes because the iOS unit tests are not "application tests".
pending(@"-rac_buttonClickedSignal", ^{
	__block UIActionSheet *actionSheet;

	beforeEach(^{
		actionSheet = [[UIActionSheet alloc] init];
		[actionSheet addButtonWithTitle:@"Button 0"];
		expect(actionSheet).notTo.beNil();
	});

	it(@"should send the index of the clicked button", ^{
		__block NSNumber *index = nil;
		[actionSheet.rac_buttonClickedSignal subscribeNext:^(NSNumber *i) {
			index = i;
		}];

		[actionSheet dismissWithClickedButtonIndex:0 animated:NO];

		expect(index).to.equal(@0);
	});
});

SpecEnd
