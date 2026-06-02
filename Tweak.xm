
#import <UIKit/UIKit.h>

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;

    // Delay added to ensure the main window is ready
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        if (window) {
            CGRect frame = CGRectMake(100, 200, 150, 150);
            UIView *blackBox = [[UIView alloc] initWithFrame:frame];
            blackBox.backgroundColor = [UIColor blackColor];
            blackBox.layer.borderWidth = 2.0f;
            blackBox.layer.borderColor = [UIColor whiteColor].CGColor;
            
            [window addSubview:blackBox];
        }
    });
}

%end
