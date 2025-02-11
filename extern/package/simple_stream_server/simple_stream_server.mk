################################################################################
#
# Simple Stream Server package
#
################################################################################

SIMPLE_STREAM_SERVER_VERSION = main
SIMPLE_STREAM_SERVER_SITE = https://github.com/moschiel/simple_stream_server.git
SIMPLE_STREAM_SERVER_SITE_METHOD = git

define SIMPLE_STREAM_SERVER_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

# @D is external repository directory,  TARGET_DIR is the rootfs directory (staging) that will be built for the target
define SIMPLE_STREAM_SERVER_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/simple_stream_server $(TARGET_DIR)/usr/bin/
endef

# Function to Install the startup script as SXXsimple_stream_server, where XX is the init priority
define SIMPLE_STREAM_SERVER_INSTALL_INIT_SCRIPT
    $(INSTALL) -m 0755 $(@D)/start-stop $(TARGET_DIR)/etc/init.d/S$(BR2_PACKAGE_SIMPLE_STREAM_SERVER_INIT_PRIORITY)simple_stream_server
endef

# Function to Remove the startup script
define SIMPLE_STREAM_SERVER_REMOVE_INIT_SCRIPT
    $(RM) -f $(TARGET_DIR)/etc/init.d/S*simple_stream_server
endef

#Execute function SIMPLE_STREAM_SERVER_INSTALL_INIT_SCRIPT if auto-start is enabled
#else, excute function SIMPLE_STREAM_SERVER_REMOVE_INIT_SCRIPT
ifeq ($(BR2_PACKAGE_SIMPLE_STREAM_SERVER_INIT),y)
SIMPLE_STREAM_SERVER_POST_INSTALL_TARGET_HOOKS += SIMPLE_STREAM_SERVER_INSTALL_INIT_SCRIPT
else
SIMPLE_STREAM_SERVER_POST_INSTALL_TARGET_HOOKS += SIMPLE_STREAM_SERVER_REMOVE_INIT_SCRIPT
endif

$(eval $(generic-package))