<<<<<<< HEAD
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
=======
@interface SBMainSwitcherViewController
-(id)recentAppLayouts;
+(id)sharedInstance;
@end
@interface SBAppLayout
@property (nonatomic,copy) NSDictionary * rolesToLayoutItemsMap;
@end
@interface SBDisplayItem
@property (nonatomic,copy,readonly) NSString * bundleIdentifier;
@end
@interface SBMediaController
@property (nonatomic,weak,readonly) UIApplication * nowPlayingApplication; 
+(id)sharedInstance;
@end
@interface UIApplication()
@property (nonatomic,readonly) NSString * bundleIdentifier;
@end
>>>>>>> 99600abbcead919f4a601e508c5e82b6928c58c3
