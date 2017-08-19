LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
include $(CLEAR_VARS)

LOCAL_MODULE := sensors.msm8960

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -DLOG_TAG=\"Sensors\"
LOCAL_CFLAGS += -DTARGET_8930

LOCAL_SRC_FILES :=	\
		sensors.cpp 			\
		SensorBase.cpp			\
		LightSensor.cpp			\
		ProximitySensor.cpp		\
		Accelerometer.cpp				\
		Mpu3050.cpp				\
		Bmp180.cpp				\
		InputEventReader.cpp

LOCAL_SHARED_LIBRARIES := liblog libcutils libdl

include $(BUILD_SHARED_LIBRARY)
