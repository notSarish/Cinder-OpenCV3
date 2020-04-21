if(NOT TARGET Cinder-OpenCV3)
    # Define ${Cinder-OpenCV3_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(Cinder-OpenCV3_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "${Cinder-OpenCV3_PROJECT_ROOT}/../.." ABSOLUTE)

    # Translate the <staticLibrary> tag.
    # cv-core
    add_library(cv-core STATIC IMPORTED)
    set_property(TARGET cv-core PROPERTY IMPORTED_LOCATION "${Cinder-OpenCV3_PROJECT_ROOT}/lib/macosx/libopencv_core.a")


    # ... keep going ...


    # There are no source files for this project. We have to create a "dummy" source.
    file(WRITE dummy.cc "")
    # Create the library from the source files. The target is now defined.
    add_library(Cinder-OpenCV3 dummy.cc)

    # Link the prebuilt libraries.
    target_link_libraries(Cinder-OpenCV3 cv-core)

    # Translate <includePath> tag.
    target_include_directories(Cinder-OpenCV3 INTERFACE
            "${Cinder-OpenCV3_PROJECT_ROOT}/include"
            "${Cinder-OpenCV3_PROJECT_ROOT}/include/opencv2"
            )

    target_include_directories(Cinder-OpenCV3 SYSTEM BEFORE INTERFACE "${CINDER_PATH}/include" )
endif()