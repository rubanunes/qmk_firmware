cmake_minimum_required(VERSION 3.20)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(ResolveKeyboard)
include(ValidateJSON)

resolve_keyboard(${QMK_KEYBOARD_FOLDER} KEYBOARD_FOLDER_ABS)
validate_json(${KEYBOARD_FOLDER_ABS}/info.json keyboard JSON_STRING)

if(NOT DEFINED QMK_KEYMAP_FOLDER)
    set(QMK_KEYMAP_FOLDER default)
endif()

set(TEMP_PATH ${QMK_KEYBOARD_FOLDER})
cmake_path(IS_RELATIVE TEMP_PATH IS_KEYBOARD_FOLDER_RELATIVE)

set(TEMP_PATH ${QMK_KEYMAP_FOLDER})
cmake_path(IS_RELATIVE TEMP_PATH IS_KEYMAP_FOLDER_RELATIVE)

if(${IS_KEYMAP_FOLDER_RELATIVE})
  set(KEYMAP_NAME ${QMK_KEYMAP_FOLDER})
else()
  if(WIN32)
    set(KEYMAP_NAME $ENV{USERNAME})
  else()
    set(KEYMAP_NAME $ENV{USE})
  endif()
endif()  

string(JSON KEYBOARD_NAME GET ${JSON_STRING} keyboard_name)

if(${IS_KEYBOARD_FOLDER_RELATIVE})
    string(MAKE_C_IDENTIFIER ${QMK_KEYBOARD_FOLDER} KEYBOARD_SLUG)
else()
    string(MAKE_C_IDENTIFIER ${KEYBOARD_NAME} KEYBOARD_SLUG)
endif()

string(JSON MANUFACTURER GET ${JSON_STRING} manufacturer)

set(TARGET_NAME "${KEYBOARD_SLUG}_${KEYMAP_NAME}")
file(APPEND "${CMAKE_SOURCE_DIR}/build/targets" "${TARGET_NAME}|${KEYBOARD_NAME} with ${QMK_KEYMAP_FOLDER}|${QMK_KEYBOARD_FOLDER}|Made by: ${MANUFACTURER}\n")

message(STATUS "Added keyboard '${QMK_KEYBOARD_FOLDER}' with keymap '${QMK_KEYMAP_FOLDER}'")