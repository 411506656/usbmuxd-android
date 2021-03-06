LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := plist
LOCAL_SRC_FILES := ../libplist.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := usb1.0
LOCAL_SRC_FILES := ../libusb1.0.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := imobiledevice
LOCAL_SRC_FILES := ../libimobiledevice.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := usbmuxd_new
LOCAL_SRC_FILES := ../libusbmuxd_new.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := decrepit
LOCAL_SRC_FILES := ../libdecrepit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := crypto
LOCAL_SRC_FILES := ../libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := ssl
LOCAL_SRC_FILES := ../libssl.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
USBMUXD_SRC := \
    client.c \
    conf.c \
    device.c \
    log.c \
    main.c \
    preflight.c \
    usb.c \
    utils.c
    

LOCAL_MODULE := usbmuxd

LOCAL_SRC_FILES := $(addprefix ../../src/, $(USBMUXD_SRC))

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../../src/ \
    $(LOCAL_PATH)/../../../libusb/libusb/os/ \
    $(LOCAL_PATH)/../../../libusb/libusb/ \
    $(LOCAL_PATH)/../../../libimobiledevice/src/ \
    $(LOCAL_PATH)/../../../libimobiledevice/include/ \
    $(LOCAL_PATH)/../../../libimobiledevice/include/libimobiledevice \
    $(LOCAL_PATH)/../../../libimobiledevice/ \
    $(LOCAL_PATH)/../../../libusbmuxd/include \
    $(LOCAL_PATH)/../../../libusbmuxd/ \
    $(LOCAL_PATH)/../../../libplist/libcnary/ \
    $(LOCAL_PATH)/../../../libplist/libcnary/include \
    $(LOCAL_PATH)/../../../libplist/include \
    $(LOCAL_PATH)/../../../libimobiledevice/common \
    $(LOCAL_PATH)/../../../boringssl/include

LOCAL_STATIC_LIBRARIES += libplist libimobiledevice libusbmuxd_new libusb1.0 libssl libcrypto libdecrepit
#LOCAL_SHARED_LIBRARIES += libssl libcrypto libdecrepit
LOCAL_CFLAGS += -pie -fPIE -DHAVE_CLOCK_GETTIME -DHAVE_LIBIMOBILEDEVICE -DHAVE_STPCPY -DHAVE_SYS_TYPES_H
LOCAL_LDFLAGS += -pie -fPIE -llog

#PRODUCI_COPY_FILES +=/home/wuli/work/ndk_develop/usbmuxd/android/jni/1:/home/wuli/work/ndk_develop/usbmuxd/android/jni/2

include $(BUILD_EXECUTABLE)
