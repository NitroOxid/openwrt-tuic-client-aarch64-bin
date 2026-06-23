# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=tuic-client
PKG_VERSION:=1.8.8
PKG_RELEASE:=1
PKG_LICENSE:=MIT
PKG_MAINTAINER:=Itsusinn <sun@ihsin.dev>

include $(INCLUDE_DIR)/package.mk

PKG_HASH:=skip
TUIC_FOOT:=linux-musl

ifeq ($(ARCH),aarch64)
  TUIC_ARCH:=tuic-client-aarch64-$(TUIC_FOOT)
else ifeq ($(ARCH),arm)
  ifeq ($(CONFIG_SOFT_FLOAT),y)
    TUIC_ARCH:=tuic-client-armv7-$(TUIC_FOOT)
  else
    TUIC_ARCH:=tuic-client-armv7-$(TUIC_FOOT)hf
  endif
else ifeq ($(ARCH),i386)
  TUIC_ARCH:=tuic-client-i686-$(TUIC_FOOT)
else ifeq ($(ARCH),x86_64)
  TUIC_ARCH:=tuic-client-x86_64-$(TUIC_FOOT)
endif

define Download/tuic-client
	URL:=https://github.com/Itsusinn/tuic/releases/download/v$(PKG_VERSION)/
	URL_FILE:=$(TUIC_ARCH)
	FILE:=$(TUIC_ARCH)
	HASH:=skip
endef

define Package/tuic-client
	SECTION:=net
	CATEGORY:=Network
	TITLE:=TUIC client (0-RTT proxy protocol)
	URL:=https://github.com/Itsusinn/tuic/
	DEPENDS:=@USE_MUSL @(aarch64||arm||i386||x86_64)
	CONFLICTS:=tuic-server
endef

define Package/tuic-client/description
	TUIC client binary for Linux (musl builds).
	Downloaded from official GitHub releases.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(call Download,tuic-client)
endef

define Build/Compile
endef

define Package/tuic-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(DL_DIR)/$(TUIC_ARCH) $(1)/usr/bin/tuic-client

	$(INSTALL_DIR) $(1)/etc/tuic
	$(INSTALL_DATA) ./files/config.toml.example $(1)/etc/tuic/

	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_CONF) ./files/tuic.conf $(1)/etc/config/tuic
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/tuic.init $(1)/etc/init.d/tuic
endef

$(eval $(call BuildPackage,tuic-client))
