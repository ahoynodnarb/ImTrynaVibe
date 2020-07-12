#include "ITVPRootListController.h"

@implementation ITVPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
-(void)openGithub {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://github.com/PopsicleTreehouse/ImTrynaVibe"] options:@{} completionHandler:nil];
}
@end
