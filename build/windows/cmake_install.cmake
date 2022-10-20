# Install script for directory: D:/Workspace/Flutter/MOBILE-APP/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "$<TARGET_FILE_DIR:psychohelp_app>")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Workspace/Flutter/MOBILE-APP/build/windows/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/agora_rtc_engine/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/permission_handler_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/url_launcher_windows/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/psychohelp_app.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug" TYPE EXECUTABLE FILES "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/psychohelp_app.exe")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/psychohelp_app.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile" TYPE EXECUTABLE FILES "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/psychohelp_app.exe")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/psychohelp_app.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release" TYPE EXECUTABLE FILES "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/psychohelp_app.exe")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/data" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/icudtl.dat")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/data" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/icudtl.dat")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/data" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/icudtl.dat")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/flutter_windows.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/flutter_windows.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/flutter_windows.dll")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/agora_rtc_engine_plugin.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/AgoraRtcScreenSharing.exe;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/AgoraRtcWrapper.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/agora_rtc_sdk.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/av1.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libagora_ai_denoise_extension.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libagora_dav1d_extension.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libagora-core.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libagora_fdkaac.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libagora-ffmpeg.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libagora_mpg123.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libagora-soundtouch.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/libhwcodec.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/permission_handler_windows_plugin.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/url_launcher_windows_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug" TYPE FILE FILES
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/agora_rtc_engine/Debug/agora_rtc_engine_plugin.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/x64/Release/AgoraRtcScreenSharing.exe"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/x64/Release/AgoraRtcWrapper.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/agora_rtc_sdk.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/av1.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_ai_denoise_extension.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_dav1d_extension.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-core.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_fdkaac.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-ffmpeg.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_mpg123.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-soundtouch.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libhwcodec.dll"
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/permission_handler_windows/Debug/permission_handler_windows_plugin.dll"
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/url_launcher_windows/Debug/url_launcher_windows_plugin.dll"
      )
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/agora_rtc_engine_plugin.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/AgoraRtcScreenSharing.exe;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/AgoraRtcWrapper.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/agora_rtc_sdk.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/av1.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libagora_ai_denoise_extension.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libagora_dav1d_extension.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libagora-core.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libagora_fdkaac.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libagora-ffmpeg.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libagora_mpg123.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libagora-soundtouch.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/libhwcodec.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/permission_handler_windows_plugin.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/url_launcher_windows_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile" TYPE FILE FILES
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/agora_rtc_engine/Profile/agora_rtc_engine_plugin.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/x64/Release/AgoraRtcScreenSharing.exe"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/x64/Release/AgoraRtcWrapper.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/agora_rtc_sdk.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/av1.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_ai_denoise_extension.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_dav1d_extension.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-core.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_fdkaac.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-ffmpeg.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_mpg123.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-soundtouch.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libhwcodec.dll"
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/permission_handler_windows/Profile/permission_handler_windows_plugin.dll"
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/url_launcher_windows/Profile/url_launcher_windows_plugin.dll"
      )
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/agora_rtc_engine_plugin.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/AgoraRtcScreenSharing.exe;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/AgoraRtcWrapper.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/agora_rtc_sdk.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/av1.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libagora_ai_denoise_extension.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libagora_dav1d_extension.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libagora-core.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libagora_fdkaac.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libagora-ffmpeg.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libagora_mpg123.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libagora-soundtouch.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/libhwcodec.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/permission_handler_windows_plugin.dll;D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/url_launcher_windows_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release" TYPE FILE FILES
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/agora_rtc_engine/Release/agora_rtc_engine_plugin.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/x64/Release/AgoraRtcScreenSharing.exe"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/x64/Release/AgoraRtcWrapper.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/agora_rtc_sdk.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/av1.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_ai_denoise_extension.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_dav1d_extension.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-core.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_fdkaac.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-ffmpeg.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora_mpg123.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libagora-soundtouch.dll"
      "D:/Workspace/Flutter/MOBILE-APP/windows/flutter/ephemeral/.plugin_symlinks/agora_rtc_engine/windows/third_party/iris/iris_0.0.0_RTC_Windows_20220506_0256/RTC/Agora_Native_SDK_for_Windows_FULL/libs/x86_64/libhwcodec.dll"
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/permission_handler_windows/Release/permission_handler_windows_plugin.dll"
      "D:/Workspace/Flutter/MOBILE-APP/build/windows/plugins/url_launcher_windows/Release/url_launcher_windows_plugin.dll"
      )
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    
  file(REMOVE_RECURSE "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/data/flutter_assets")
  
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    
  file(REMOVE_RECURSE "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/data/flutter_assets")
  
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    
  file(REMOVE_RECURSE "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/data/flutter_assets")
  
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Debug/data" TYPE DIRECTORY FILES "D:/Workspace/Flutter/MOBILE-APP/build//flutter_assets")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/data" TYPE DIRECTORY FILES "D:/Workspace/Flutter/MOBILE-APP/build//flutter_assets")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/data" TYPE DIRECTORY FILES "D:/Workspace/Flutter/MOBILE-APP/build//flutter_assets")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Profile/data" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/build/windows/app.so")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Workspace/Flutter/MOBILE-APP/build/windows/runner/Release/data" TYPE FILE FILES "D:/Workspace/Flutter/MOBILE-APP/build/windows/app.so")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/Workspace/Flutter/MOBILE-APP/build/windows/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
