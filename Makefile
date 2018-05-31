ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SimpleSettings
SimpleSettings_FILES = Tweak.xm
Springtime_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	@echo "Thanks for using my tweaks! Report any bugs to @mtac8 on Twitter"
	install.exec "killall -9 SpringBoard"
include $(THEOS_MAKE_PATH)/aggregate.mk
