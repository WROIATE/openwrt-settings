include $(TOPDIR)/rules.mk

PKG_NAME:=wroiate-settings
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/wroiate-settings
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for WROIATE Settings
  PKGARCH:=all
  DEPENDS:=+ipv6helper +lsof +bash +vim-fuller\
  	+luci-theme-argon +luci-app-argon-config +luci-app-socat\
	+luci-app-samba4 +luci-app-timecontrol +luci-app-control-weburl\
	+luci-app-control-webrestriction +luci-app-control-timewol
endef

define Package/wroiate-settings/description
	WROIATE self settings
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/wroiate-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/root
	$(INSTALL_BIN) ./files/settings $(1)/etc/uci-defaults/99-wroiate-settings
	$(INSTALL_BIN) ./files/smartdns $(1)/root/smartdns-gfw.sh
endef

$(eval $(call BuildPackage,wroiate-settings))
