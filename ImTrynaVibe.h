#import <SparkAppListTableViewController.h>
#import <SparkAppList.h>
#import <SpringBoard/SBMediaController.h>
#import <UIKit/UIKit.h>

@interface SBApplication
- (NSString *)bundleIdentifier;
- (NSString *)displayName;
@end
@interface SBMediaController ()
- (BOOL)isPlaying;
- (SBApplication *)nowPlayingApplication;
+ (id)sharedInstance;
@end
@interface SBFluidSwitcherItemContainerHeaderItem
@property(nonatomic, copy) NSString *titleText;
@end
@interface SBFluidSwitcherItemContainer
- (void)setKillable:(BOOL)arg1;
- (BOOL)isKillable;
- (NSArray *)headerItems;
- (void)layoutSubviews;
@end
static BOOL isEnabled = YES;