#import "ITVPRootListController.h"
#import <spawn.h>
#import "SparkAppListTableViewController.h"

@implementation ITVPRootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
-(void)openGithub {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/PopsicleTreehouse/ImTrynaVibe"] options:@{} completionHandler:nil];
}
-(void)openTwitter {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/ahoynodnarb"] options:@{} completionHandler:nil];
}
-(void)blacklistApps
{
    SparkAppListTableViewController* s = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.popsicletreehouse.imtrynavibeprefs" andKey:@"blacklist"];

    [self.navigationController pushViewController:s animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}
@end
