# Inherit AOSP device configuration for speedy.
$(call inherit-product, device/htc/speedy/full_speedy.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_speedy
PRODUCT_BRAND := sprint
PRODUCT_DEVICE := speedy
PRODUCT_MODEL := PG06100
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_speedy BUILD_FINGERPRINT=sprint/htc_speedy/speedy:2.3.3/GRI40/74499:user/release-keys PRIVATE_BUILD_DESC="2.76.651.4 CL74499 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME = Artis

ifeq ($(NIGHTLY_BUILD),true)
    BUILD_VERSION := 2.0.0p1-$(shell date +%m%d%Y)-NIGHTLY
else
    BUILD_VERSION := 2.0.0p1
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=Evervolv-$(PRODUCT_CODENAME)-$(BUILD_VERSION)

PRODUCT_PACKAGES += \
    Camera

#Get eng stuff on our userdebug builds
# Turn on checkjni for non-user builds.
ADDITIONAL_BUILD_PROPERTIES += ro.kernel.android.checkjni=1
# Set device insecure for non-user builds.
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
# Allow mock locations by default for non user builds
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# USB
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage,adb
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb
