include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = imtrynavibeprefs

imtrynavibeprefs_FILES = ITVPRootListController.m
imtrynavibeprefs_INSTALL_PATH = /Library/PreferenceBundles
imtrynavibeprefs_FRAMEWORKS = UIKit
imtrynavibeprefs_PRIVATE_FRAMEWORKS = Preferences
imtrynavibeprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/imtrynavibeprefs.plist$(ECHO_END)
