/* 
 *  UNIVERSITY OF SAO PAULO - ICMC - GBDI http://www.gbdi.icmc.usp.br/
 *  Author: Jonathan Ramos, jonathan@usp.br 
 *  File: my_postgres_functions.cpp
 * 
 */

#include "cplusplus_header.h"


#ifdef __cplusplus
extern "C" {
#endif

#ifdef PG_MODULE_MAGIC
    PG_MODULE_MAGIC;
#endif
    
    // ---------------------------------------------------------------------------
    PG_FUNCTION_INFO_V1(canny_detector);

    /**
     * Returns with canny edge detection applied
     * <p>
     * This method always assume the image is in RGB, i.e., there are three channels 
     *
     * @param  bytea from the database
     * @return bytea composed of the arg0 (bytea - image) image after applying 
     *  canny edge detection
     */
    Datum canny_detector(PG_FUNCTION_ARGS) {
        if (PG_ARGISNULL(0)) {
            ereport(ERROR, (errmsg("Null arrays not accepted")));
        }
        bytea *imagem = PG_GETARG_BYTEA_P(0);

        cv::Mat image = ByteArray2Mat(imagem);

        if (image.empty()) {
            ereport(ERROR, (errmsg("ERROR: ByteArray decoding failed")));
        }

        cv::Mat edge = cannyEdgeDetection(image);

        bytea* bytes = Mat2ByteArray(edge);

        // Construct the array to be returned back to the database client
        // ArrayType *res = construct_array(imgSizeArray, image.cols * image.rows, INT4OID, 4, true, 'i');
        PG_RETURN_BYTEA_P(bytes);
    }



    // ---------------------------------------------------------------------------
    PG_FUNCTION_INFO_V1(get_imgsize);

    /**
     * Returns the image size (nxm) in pixels based on the bytea data
     * <p>
     * This method always assume the image is in RGB, i.e., there are three channels 
     *
     * @param  bytea from the database
     * @return      the image in Integer[] type.
     */
    Datum get_imgsize(PG_FUNCTION_ARGS) {
        if (PG_ARGISNULL(0)) {
            ereport(ERROR, (errmsg("Null arrays not accepted")));
        }
        bytea* imagem = PG_GETARG_BYTEA_P(0);

        cv::Mat image = ByteArray2Mat(imagem);

        if (image.empty()) {
            ereport(ERROR, (errmsg("ERROR: ByteArray decoding failed")));
        }

        Datum* imgSizeArray = (Datum*) palloc(sizeof (Datum) * 2);
        imgSizeArray[0] = image.cols;
        imgSizeArray[1] = image.rows;

        // Construct the array to be returned back to the database client
        ArrayType *res = construct_array(imgSizeArray, 2, INT4OID, 4, true, 'i');
        PG_RETURN_ARRAYTYPE_P(res);
    }
    
    PG_FUNCTION_INFO_V1(euclidean_distance);

    Datum euclidean_distance(PG_FUNCTION_ARGS) {
        u_int32_t oid0;
        u_int32_t oid1;

        bytea *byte_array0;
        bytea *byte_array1;

        BasicArrayObject<float> features0;
        BasicArrayObject<float> features1;

        size_t dimensions;

        EuclideanDistance<BasicArrayObject<float> > euclidean;

        oid0        = PG_GETARG_INT32(0);
        byte_array0 = PG_GETARG_BYTEA_P(1);
        oid1        = PG_GETARG_INT32(2);
        byte_array1 = PG_GETARG_BYTEA_P(3);
        dimensions  = PG_GETARG_INT32(4);

        features0 = ByteArrayToFloatArrayObject(oid0, byte_array0, dimensions);
        features1 = ByteArrayToFloatArrayObject(oid1, byte_array1, dimensions);
        
        double *res = (double *) palloc(sizeof(double)); 

        *res = euclidean.getDistance(features0, features1);
        //*res = (double) dimensions;
         PG_RETURN_FLOAT8((double) *res);
        
//         Datum* imgSizeArray = (Datum*) palloc(sizeof (Datum) * 3);
////        imgSizeArray[0] = (unsigned int) *features0.get(0);
////        imgSizeArray[1] = (unsigned int) *features0.get(1);
////        imgSizeArray[2] = (unsigned int) *features0.get(2);
//
//        // Construct the array to be returned back to the database client
//        ArrayType *res = construct_array(imgSizeArray, 3, INT4OID, 4, true, 'i');
//        PG_RETURN_ARRAYTYPE_P(res);
        
    }

#ifdef __cplusplus
}
#endif
