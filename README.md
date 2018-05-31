# SimpleSettings

I decided to open source this as it is was a very simple tweak to make.

## Code

While using Flexing from BigBoss, I found each cell inside Settings uses part of the Preferences framework (obviously). Upon a closer look, I found each cell was a PSTableCell. I Googled PSTableCell.h and found [this](https://github.com/nst/iOS-Runtime-Headers/blob/master/PrivateFrameworks/Preferences.framework/PSTableCell.h "iOS Runtime Headers"). Inside PSTableCell.h there is a property called frame. This is what we can modify to change the size and location of the cell inside the main view. 

```objective-c
@property (nonatomic, assign, readwrite) CGRect frame;
```

The process was the same for APTableCell as it is inherited from PSTableCell itself

```objective-c
@interface APTableCell : PSTableCell
```

Now that I knew the property I had to change it was a simple as hooking both PSTableCell and APTableCell. When making the tweak I selected com.apple.Preferences as the MobileSubstrate filter so that it just affected the Settings app.

```objective-c
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

@interface PSTableCell : UITableViewCell
@property (nonatomic, assign, readwrite) CGRect frame;
@end

%hook PSTableCell

- (void)layoutSubviews {

  %orig;

  CGRect newFrame = self.frame;
  newFrame.origin.x = 12;
  newFrame.size.width = 350;
  self.frame = newFrame;

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
```

All I did was make a new frame and copy the values from frame, then set the frame to the new one with my modified values. I made the width of each cell 25 less than what Apple made it, and divided by 2. 25/2 = 12.5 but I had to round down to 12. Next I set the width from 375 to 350. This centered it with an even amount of space on each side. Next I hooked the layoutSubviews() method as it is called when the view appears, similar to viewDidLoad.

![alt text](https://github.com/MTACS/MTACS.github.io/blob/master/content/media/simplesettings.jpg?style=center)

img[src$="center"] {
  display:block;
  margin: 0 auto;
}
