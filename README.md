# SimpleSettings

I decided to open source this as it is was a very simple tweak to make.

## Code

While using Flexing from BigBoss, I found each cell inside Settings uses part of the Preferences framework (obviously). Upon a closer look, I found each cell was a PSTableCell. I Googled PSTableCell.h and found [this](https://github.com/nst/iOS-Runtime-Headers/blob/master/PrivateFrameworks/Preferences.framework/PSTableCell.h "iOS Runtime Headers"). Inside PSTableCell.h there is a property called frame. This is what we can modify to change the size and location of the cell inside the main view. 

```objective-c
@property (nonatomic, assign, readwrite) CGRect frame;
```
