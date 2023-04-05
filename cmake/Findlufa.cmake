include(UpdateSubmodule)
update_submodule(lib/lufa)
set(LUFA_PATH ${CMAKE_SOURCE_DIR}/lib/lufa)
set(LUFA_ROOT_PATH ${LUFA_PATH}/LUFA)
target_sources(qmk PUBLIC
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/USBController_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/USBInterrupt_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/ConfigDescriptors.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/Events.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/USBTask.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Class/Common/HIDParser.c

    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/Host_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/Pipe_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/PipeStream_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/HostStandardReq.c

    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/Device_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/Endpoint_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/${ARCH}/EndpointStream_${ARCH}.c
    ${LUFA_ROOT_PATH}/Drivers/USB/Core/DeviceStandardReq.c
    ${LUFA_PATH}/LUFA/Drivers/USB/USB.h
)
target_include_directories(qmk PUBLIC ${LUFA_PATH})
# target_link_libraries(lufa ${QMK_TARGET})
# target_link_libraries(lufa tmk_core_protocol)
# target_link_libraries(lufa tmk_core_protocol_lufa)