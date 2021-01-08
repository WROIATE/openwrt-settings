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
  DEPENDS:=+default-settings +luci-theme-argon +luci-nginx-ssl +lsof
endef

define Package/wroiate-settings/description
	WROIATE self settings
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/default-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/etc/smartdns
	$(INSTALL_BIN) ./files/settings $(1)/etc/uci-defaults/99-wroiate-settings
	$(INSTALL_BIN) ./files/smartdns $(1)/etc/smartdns/gfw.sh
endef

$(eval $(call BuildPackage,wroiate-settings))