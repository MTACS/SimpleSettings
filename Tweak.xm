#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

@interface PSTableCell : UITableViewCell
@property (nonatomic, assign, readwrite) CGRect frame;
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

%hook PSTableCell

- (void)layoutSubviews {

  %orig;

  CGRect newFrame = self.frame;
  newFrame.origin.x = 12;
  newFrame.size.width = 350;
  self.frame = newFrame;

  // self.backgroundColor = [UIColor blackColor];

}

%end

@interface APTableCell : PSTableCell
@property (nonatomic, assign, readwrite) CGRect frame;
@end

%hook APTableCell

- (void)layoutSubviews {

  %orig;

  CGRect newFrameTwo = self.frame;
  newFrameTwo.origin.x = 12;
  newFrameTwo.size.width = 350;
  self.frame = newFrameTwo;

}

%end

/*

@interface UITableViewLabel : UILabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

%hook UITableViewLabel

- (void)layoutSubviews {

  %orig;

self.textColor = [UIColor whiteColor];

}

%end */
