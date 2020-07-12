static BOOL cancelAnimation;
static NSString *nowPlayingID;
NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.popsicletreehouse.imtrynavibeprefs"];
bool isEnabled = [[bundleDefaults objectForKey:@"isEnabled"]boolValue];

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
@property (nonatomic,readonly) NSString * bundleIdentifier;                                                                                     //@synthesize bundleIdentifier=_bundleIdentifier - In the implementation block
@end
//why tf do I need this many interfaces smh

%hook SBMainSwitcherViewController
-(void)_deleteAppLayout:(id)arg1 forReason:(long long)arg2 {
	if(isEnabled) {
		SBMainSwitcherViewController *switcher = [%c(SBMainSwitcherViewController) sharedInstance];
		NSArray *items = switcher.recentAppLayouts;
		for(SBAppLayout *item in items) {
			SBDisplayItem *displayItem = [item.rolesToLayoutItemsMap objectForKey:@1];
			NSString *bundleID = displayItem.bundleIdentifier;
			nowPlayingID = [[[%c(SBMediaController) sharedInstance] nowPlayingApplication] bundleIdentifier];
			if(![bundleID isEqualToString:nowPlayingID]) {
				cancelAnimation = NO;
				%orig;
			} else {
				cancelAnimation = YES;
			}
		}
	} else {
		%orig;
	}
}
%end