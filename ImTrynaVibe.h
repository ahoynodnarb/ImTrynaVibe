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
