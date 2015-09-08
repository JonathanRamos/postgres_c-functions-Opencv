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
    
#ifdef __cplusplus
}
#endif

cv::Mat cannyEdgeDetection(cv::Mat& image);
cv::Mat ByteArray2Mat(bytea *imagem);
bytea* Mat2ByteArray(cv::Mat& image);


#endif	/* MY_POSTGRES_FUNCTIONS_H */

