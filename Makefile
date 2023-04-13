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
  DEPENDS:=+ipv6helper +lsof +bash +zsh +vim-fuller\
  	+luci-theme-argon-mod +luci-app-argon-config\
	+ss +netcat +findutils-find +bind-dig\
	+bind-host +git-http +curl +wget
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
	$(INSTALL_BIN) ./files/settings $(1)/etc/uci-defaults/zzz-wroiate-settings
	$(INSTALL_BIN) ./files/smartdns $(1)/root/smartdns-gfw.sh
	$(INSTALL_BIN) ./files/zsh $(1)/root/zsh-install.sh
endef

$(eval $(call BuildPackage,wroiate-settings))
