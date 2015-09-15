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
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/1159833440/CStorage.o \
	${OBJECTDIR}/_ext/1159833440/stCellId.o \
	${OBJECTDIR}/_ext/1159833440/stCompress.o \
	${OBJECTDIR}/_ext/1159833440/stCountingTree.o \
	${OBJECTDIR}/_ext/1159833440/stDBMNode.o \
	${OBJECTDIR}/_ext/1159833440/stDFNode.o \
	${OBJECTDIR}/_ext/1159833440/stDiskPageManager.o \
	${OBJECTDIR}/_ext/1159833440/stDummyNode.o \
	${OBJECTDIR}/_ext/1159833440/stGHNode.o \
	${OBJECTDIR}/_ext/1159833440/stGnuplot.o \
	${OBJECTDIR}/_ext/1159833440/stGnuplot3D.o \
	${OBJECTDIR}/_ext/1159833440/stLevelDiskAccess.o \
	${OBJECTDIR}/_ext/1159833440/stListPriorityQueue.o \
	${OBJECTDIR}/_ext/1159833440/stMGrid.o \
	${OBJECTDIR}/_ext/1159833440/stMMNode.o \
	${OBJECTDIR}/_ext/1159833440/stMNode.o \
	${OBJECTDIR}/_ext/1159833440/stMemoryPageManager.o \
	${OBJECTDIR}/_ext/1159833440/stMetricHistogram.o \
	${OBJECTDIR}/_ext/1159833440/stPage.o \
	${OBJECTDIR}/_ext/1159833440/stPartitionNode.o \
	${OBJECTDIR}/_ext/1159833440/stPlainDiskPageManager.o \
	${OBJECTDIR}/_ext/1159833440/stPointSet.o \
	${OBJECTDIR}/_ext/1159833440/stResult.o \
	${OBJECTDIR}/_ext/1159833440/stSeqNode.o \
	${OBJECTDIR}/_ext/1159833440/stSlimNode.o \
	${OBJECTDIR}/_ext/1159833440/stStructUtils.o \
	${OBJECTDIR}/_ext/1159833440/stTreeInformation.o \
	${OBJECTDIR}/_ext/1159833440/stUtil.o \
	${OBJECTDIR}/_ext/1159833440/stVPNode.o \
	${OBJECTDIR}/_ext/905985583/DiscreteCosineTransformation.o \
	${OBJECTDIR}/_ext/905985583/EdgeHistogram.o \
	${OBJECTDIR}/_ext/905985583/HMMDColorSystem.o \
	${OBJECTDIR}/_ext/905985583/HSVColorSystem.o \
	${OBJECTDIR}/_ext/905985583/HaralickFeature.o \
	${OBJECTDIR}/_ext/905985583/SRGBColorSystem.o \
	${OBJECTDIR}/_ext/905985583/XYZColorSystem.o \
	${OBJECTDIR}/_ext/905985583/YCrCbColorSystem.o \
	${OBJECTDIR}/_ext/29042970/ImageBase.o \
	${OBJECTDIR}/_ext/29042970/Pixel.o \
	${OBJECTDIR}/_ext/279563996/BmpLib.o \
	${OBJECTDIR}/_ext/1920220557/DcmLib.o \
	${OBJECTDIR}/_ext/279571768/JpgLib.o \
	${OBJECTDIR}/_ext/279572796/FileHandler.o \
	${OBJECTDIR}/_ext/279572796/KrlLib.o \
	${OBJECTDIR}/_ext/279577472/PngLib.o \
	${OBJECTDIR}/cplusplus_functions.o \
	${OBJECTDIR}/my_postgres_functions.o \
	${OBJECTDIR}/util_converters.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT}

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT}: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libexampleso.${CND_DLIB_EXT} ${OBJECTFILES} ${LDLIBSOPTIONS} -shared -fPIC

${OBJECTDIR}/_ext/1159833440/CStorage.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/CStorage.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/CStorage.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/CStorage.cpp

${OBJECTDIR}/_ext/1159833440/stCellId.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stCellId.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stCellId.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stCellId.cpp

${OBJECTDIR}/_ext/1159833440/stCompress.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stCompress.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stCompress.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stCompress.cpp

${OBJECTDIR}/_ext/1159833440/stCountingTree.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stCountingTree.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stCountingTree.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stCountingTree.cpp

${OBJECTDIR}/_ext/1159833440/stDBMNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDBMNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stDBMNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDBMNode.cpp

${OBJECTDIR}/_ext/1159833440/stDFNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDFNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stDFNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDFNode.cpp

${OBJECTDIR}/_ext/1159833440/stDiskPageManager.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDiskPageManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stDiskPageManager.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDiskPageManager.cpp

${OBJECTDIR}/_ext/1159833440/stDummyNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDummyNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stDummyNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stDummyNode.cpp

${OBJECTDIR}/_ext/1159833440/stGHNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stGHNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stGHNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stGHNode.cpp

${OBJECTDIR}/_ext/1159833440/stGnuplot.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stGnuplot.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stGnuplot.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stGnuplot.cpp

${OBJECTDIR}/_ext/1159833440/stGnuplot3D.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stGnuplot3D.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stGnuplot3D.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stGnuplot3D.cpp

${OBJECTDIR}/_ext/1159833440/stLevelDiskAccess.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stLevelDiskAccess.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stLevelDiskAccess.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stLevelDiskAccess.cpp

${OBJECTDIR}/_ext/1159833440/stListPriorityQueue.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stListPriorityQueue.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stListPriorityQueue.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stListPriorityQueue.cpp

${OBJECTDIR}/_ext/1159833440/stMGrid.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMGrid.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stMGrid.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMGrid.cpp

${OBJECTDIR}/_ext/1159833440/stMMNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMMNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stMMNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMMNode.cpp

${OBJECTDIR}/_ext/1159833440/stMNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stMNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMNode.cpp

${OBJECTDIR}/_ext/1159833440/stMemoryPageManager.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMemoryPageManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stMemoryPageManager.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMemoryPageManager.cpp

${OBJECTDIR}/_ext/1159833440/stMetricHistogram.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMetricHistogram.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stMetricHistogram.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stMetricHistogram.cpp

${OBJECTDIR}/_ext/1159833440/stPage.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPage.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stPage.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPage.cpp

${OBJECTDIR}/_ext/1159833440/stPartitionNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPartitionNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stPartitionNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPartitionNode.cpp

${OBJECTDIR}/_ext/1159833440/stPlainDiskPageManager.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPlainDiskPageManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stPlainDiskPageManager.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPlainDiskPageManager.cpp

${OBJECTDIR}/_ext/1159833440/stPointSet.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPointSet.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stPointSet.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stPointSet.cpp

${OBJECTDIR}/_ext/1159833440/stResult.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stResult.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stResult.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stResult.cpp

${OBJECTDIR}/_ext/1159833440/stSeqNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stSeqNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stSeqNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stSeqNode.cpp

${OBJECTDIR}/_ext/1159833440/stSlimNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stSlimNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stSlimNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stSlimNode.cpp

${OBJECTDIR}/_ext/1159833440/stStructUtils.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stStructUtils.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stStructUtils.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stStructUtils.cpp

${OBJECTDIR}/_ext/1159833440/stTreeInformation.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stTreeInformation.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stTreeInformation.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stTreeInformation.cpp

${OBJECTDIR}/_ext/1159833440/stUtil.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stUtil.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stUtil.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stUtil.cpp

${OBJECTDIR}/_ext/1159833440/stVPNode.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stVPNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1159833440
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1159833440/stVPNode.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/arboretum/stVPNode.cpp

${OBJECTDIR}/_ext/905985583/DiscreteCosineTransformation.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/DiscreteCosineTransformation.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/DiscreteCosineTransformation.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/DiscreteCosineTransformation.cpp

${OBJECTDIR}/_ext/905985583/EdgeHistogram.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/EdgeHistogram.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/EdgeHistogram.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/EdgeHistogram.cpp

${OBJECTDIR}/_ext/905985583/HMMDColorSystem.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/HMMDColorSystem.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/HMMDColorSystem.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/HMMDColorSystem.cpp

${OBJECTDIR}/_ext/905985583/HSVColorSystem.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/HSVColorSystem.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/HSVColorSystem.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/HSVColorSystem.cpp

${OBJECTDIR}/_ext/905985583/HaralickFeature.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/HaralickFeature.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/HaralickFeature.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/HaralickFeature.cpp

${OBJECTDIR}/_ext/905985583/SRGBColorSystem.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/SRGBColorSystem.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/SRGBColorSystem.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/SRGBColorSystem.cpp

${OBJECTDIR}/_ext/905985583/XYZColorSystem.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/XYZColorSystem.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/XYZColorSystem.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/XYZColorSystem.cpp

${OBJECTDIR}/_ext/905985583/YCrCbColorSystem.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/YCrCbColorSystem.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/905985583
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/905985583/YCrCbColorSystem.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/extractor/YCrCbColorSystem.cpp

${OBJECTDIR}/_ext/29042970/ImageBase.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/ImageBase.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/29042970
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/29042970/ImageBase.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/ImageBase.cpp

${OBJECTDIR}/_ext/29042970/Pixel.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/Pixel.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/29042970
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/29042970/Pixel.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/Pixel.cpp

${OBJECTDIR}/_ext/279563996/BmpLib.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/bmp/BmpLib.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/279563996
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/279563996/BmpLib.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/bmp/BmpLib.cpp

${OBJECTDIR}/_ext/1920220557/DcmLib.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/dicom/DcmLib.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1920220557
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1920220557/DcmLib.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/dicom/DcmLib.cpp

${OBJECTDIR}/_ext/279571768/JpgLib.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/jpg/JpgLib.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/279571768
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/279571768/JpgLib.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/jpg/JpgLib.cpp

${OBJECTDIR}/_ext/279572796/FileHandler.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/krl/FileHandler.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/279572796
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/279572796/FileHandler.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/krl/FileHandler.cpp

${OBJECTDIR}/_ext/279572796/KrlLib.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/krl/KrlLib.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/279572796
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/279572796/KrlLib.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/krl/KrlLib.cpp

${OBJECTDIR}/_ext/279577472/PngLib.o: nbproject/Makefile-${CND_CONF}.mk /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/png/PngLib.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/279577472
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/279577472/PngLib.o /home/jonathan/NetBeansProjects/exampleso/SimS/src/artemis/image/png/PngLib.cpp

${OBJECTDIR}/cplusplus_functions.o: nbproject/Makefile-${CND_CONF}.mk cplusplus_functions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/cplusplus_functions.o cplusplus_functions.cpp

${OBJECTDIR}/my_postgres_functions.o: nbproject/Makefile-${CND_CONF}.mk my_postgres_functions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/my_postgres_functions.o my_postgres_functions.cpp

${OBJECTDIR}/util_converters.o: nbproject/Makefile-${CND_CONF}.mk util_converters.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/util_converters.o util_converters.cpp

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
