#---------------------------------------------------------------------
# PART 1: General Setting

TEMPLATE = app
CONFIG += c++11
TARGET = FlvParser
OBJECTS_DIR = .objs
QT += core gui widgets network

include(gitversion.pri)

#---------------------------------------------------------------------
# PART 2: target, library, flags
TARGET = bin/FlvParser
INCLUDEPATH += src
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += BUILD_VERSION=\\\"$$VERSION\\\"

win32 {
  INCLUDEPATH += third_party/win32/jsoncpp/include
  LIBS += -Lthird_party/win32/jsoncpp/lib -ljsoncpp
}

macx {
  INCLUDEPATH += $$PWD/third_party/mac/yaml-cpp/include
  LIBS += -L$$PWD/third_party/mac/yaml-cpp/lib -lyaml-cpp
}

#---------------------------------------------------------------------
# PART 3: Clean
QMAKE_CLEAN += $(TARGET) $(QMAKE_TARGET) bin/FlvParser

#---------------------------------------------------------------------
# PART 4: Input
SOURCES += \
    src/main.cpp \
    src/view/main_widget.cpp \
    src/controller/http_client.cpp \
    src/model/flv_header.cpp \
    src/model/flv_body.cpp \
    src/model/flv_tag.cpp \
    src/model/flv_video.cpp \
    src/model/flv_audio.cpp \
    src/controller/flv_parser.cpp \
    src/commons/read_bytes.cpp \
    src/model/flv_data.cpp \
    src/model/flv_script.cpp \
    src/view/about_dialog.cpp \
    src/view/main_menubar.cpp
HEADERS  += \
    src/view/main_widget.h \
    src/controller/http_client.h \
    src/model/flv_header.h \
    src/model/flv_body.h \
    src/model/flv_tag.h \
    src/model/flv_data.h \
    src/model/flv_video.h \
    src/model/flv_audio.h \
    src/controller/flv_parser.h \
    src/commons/read_bytes.h \
    src/model/flv_script.h \
    src/view/about_dialog.h \
    src/view/main_menubar.h \
    src/commons/definations.h
RESOURCES += \
    resource.qrc

win32 {
  RC_FILE = resource.rc
}

macx {
  ICON = icon.icns
}
