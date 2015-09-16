/* 
 *  UNIVERSITY OF SAO PAULO - ICMC - GBDI http://www.gbdi.icmc.usp.br/
 *  Author: Jonathan Ramos, jonathan@usp.br 
 *  File: cplusplus_header.h
 *
 * Created on September 2, 2015, 1:34 PM
 */

#ifndef MY_POSTGRES_FUNCTIONS_H
#define	MY_POSTGRES_FUNCTIONS_H


// Including C++ libraries
#include <cstdio>
#include <string>
#include <iostream>
#include <vector>

// Including C++ OpenCV Libraries
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs/imgcodecs_c.h>
#include <opencv2/imgcodecs.hpp>
#include "opencv2/opencv.hpp"
#include "opencv2/imgproc/imgproc.hpp"

// ------------------------------------------------------------
// PH Includes
#include "hermes/EuclideanDistance.h"
#include <hermes/ManhattanDistance.h>
#include <hermes/ChebyshevDistance.h>
#include "util/BasicArrayObject.h"


// ------------------------------------------------------------
// ------------------------------------------------------------
// CANABRAVA INCLUDES
//#include "SimS/include/util/BasicArrayObject.h"
#include "artemis/image/ImageBase.h"
#include "artemis/image/Pixel.h"
#include  "artemis/extractor/LocalBinaryPatternExtractor.h" // <artemis/extractor/LocalBinaryPatternExtractor.h>
#include "artemis/extractor/ColorStructure.h" // <artemis/extractor/ColorStructure.h>
#include  "artemis/extractor/ColorLayout.h"


// Including C libraries
#ifdef __cplusplus
extern "C" {
#endif

#include <postgres.h>
#include <fmgr.h>
#include <utils/array.h>
#include <utils/builtins.h>
#include <catalog/pg_type.h>
#include <stdint.h>




    // ------------------------------------------------------------

#ifdef __cplusplus
}
#endif

typedef BasicArrayObject<double> Signature;

cv::Mat cannyEdgeDetection(cv::Mat& image);
cv::Mat ByteArray2Mat(bytea *imagem);
bytea* Mat2ByteArray(cv::Mat& image);
BasicArrayObject<float> *ByteArrayToFloatArrayObject(u_int32_t oid,
													 bytea *byte_array,
													 size_t dimensions);

Image ByteArray2Image(bytea *inputByteArray);
bytea* Image2ByteArray(const Image& inputImage);
//
//Signature ByteArray2Signature(const bytea * inputByteArray);
 bytea * Signature2ByteArray(Signature& imgSignature);


#endif	/* MY_POSTGRES_FUNCTIONS_H */

