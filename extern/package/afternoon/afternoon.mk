################################################################################
#
# Afternoon package
#
################################################################################

AFTERNOON_VERSION = main
AFTERNOON_SITE = https://github.com/moschiel/good_afternoon_app_example.git
AFTERNOON_SITE_METHOD = git

define AFTERNOON_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define AFTERNOON_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/afternoon $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))