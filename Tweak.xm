#import "ImTrynaVibe.h"

static void refreshPrefs() {
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.popsicletreehouse.imtrynavibeprefs"];
	isEnabled = [bundleDefaults objectForKey:@"isEnabled"] ? [[bundleDefaults objectForKey:@"isEnabled"]boolValue] : YES;
}
static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    refreshPrefs();
}
%hook SBFluidSwitcherItemContainer
-(void)layoutSubviews
{
	%orig;
	if(isEnabled) {
		SBMediaController *mediaController = [%c(SBMediaController) sharedInstance];
		SBApplication *nowPlayingApp = [mediaController nowPlayingApplication];
		if(mediaController && [mediaController isPlaying]) {
			for(SBFluidSwitcherItemContainerHeaderItem *appHeader in [self headerItems]) {
					if([[appHeader titleText] isEqualToString: [nowPlayingApp displayName]] && ![%c(SparkAppList) doesIdentifier:@"com.popsicletreehouse.imtrynavibeprefs" andKey:@"blacklist" containBundleIdentifier:[nowPlayingApp bundleIdentifier]])
						[self setKillable: NO];
			}
		}
	}
}
%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.popsicletreehouse.imtrynavibe.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	refreshPrefs();
}