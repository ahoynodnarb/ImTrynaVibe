THEOS_DEVICE_IP=localhost
THEOS_DEVICE_PORT=2222

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ImTrynaVibe

ImTrynaVibe_FILES = Tweak.xm
ImTrynaVibe_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += imtrynavibeprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
