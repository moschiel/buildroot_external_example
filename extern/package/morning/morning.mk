################################################################################
#
# Morning package
#
################################################################################

MORNING_VERSION = main
MORNING_SITE = https://github.com/moschiel/good_morning_app_example.git
MORNING_SITE_METHOD = git

define MORNING_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define MORNING_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/morning $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))