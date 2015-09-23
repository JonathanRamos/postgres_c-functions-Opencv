#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/cplusplus_functions.o \
	${OBJECTDIR}/my_postgres_functions.o \
	${OBJECTDIR}/util_converters.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-shared
CXXFLAGS=-shared

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-lopencv_calib3d -lopencv_core -lopencv_features2d -lopencv_flann -lopencv_hal -lopencv_highgui -lopencv_imgcodecs -lopencv_imgproc -lopencv_ml -lopencv_objdetect -lopencv_photo -lopencv_shape -lopencv_stitching -lopencv_superres -lopencv_ts -lopencv_video -lopencv_videoio -lopencv_videostab /home/jonathan/NetBeansProjects/exampleso/SimS/lib/libarboretum-shared.so /home/jonathan/NetBeansProjects/exampleso/SimS/lib/libartemis-shared.so

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT}

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT}: /home/jonathan/NetBeansProjects/exampleso/SimS/lib/libarboretum-shared.so

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT}: /home/jonathan/NetBeansProjects/exampleso/SimS/lib/libartemis-shared.so

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT}: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT} ${OBJECTFILES} ${LDLIBSOPTIONS} -shared -fPIC

${OBJECTDIR}/cplusplus_functions.o: cplusplus_functions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/include/opencv2 -I/usr/include/postgresql/9.4/server -I/home/jonathan/NetBeansProjects/exampleso/SimS/include/ -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/cplusplus_functions.o cplusplus_functions.cpp

${OBJECTDIR}/my_postgres_functions.o: my_postgres_functions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/include/opencv2 -I/usr/include/postgresql/9.4/server -I/home/jonathan/NetBeansProjects/exampleso/SimS/include/ -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/my_postgres_functions.o my_postgres_functions.cpp

${OBJECTDIR}/util_converters.o: util_converters.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/include/opencv2 -I/usr/include/postgresql/9.4/server -I/home/jonathan/NetBeansProjects/exampleso/SimS/include/ -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/util_converters.o util_converters.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
