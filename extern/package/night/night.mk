################################################################################
#
# Night package
#
################################################################################

NIGHT_VERSION = main
NIGHT_SITE = https://github.com/moschiel/good_night_app_example.git
NIGHT_SITE_METHOD = git

define NIGHT_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define NIGHT_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/night $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))