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
        bytea *byte_array0;
        bytea *byte_array1;

        BasicArrayObject<float> *features0;
        BasicArrayObject<float> *features1;

        size_t dimensions;
        double *result;

        EuclideanDistance< BasicArrayObject<float> > euclidean;

        byte_array0 = PG_GETARG_BYTEA_P(0);
        byte_array1 = PG_GETARG_BYTEA_P(1);
        dimensions  = PG_GETARG_INT32(2);

        features0 = ByteArrayToFloatArrayObject(0, byte_array0, dimensions);
        features1 = ByteArrayToFloatArrayObject(1, byte_array1, dimensions);

        result = (double *)(palloc(sizeof(double)));
        *result = euclidean.getDistance(*features0, *features1);

        PG_RETURN_FLOAT8(*result);
    }

    PG_FUNCTION_INFO_V1(manhattan_distance);

    Datum manhattan_distance(PG_FUNCTION_ARGS) {
        bytea *byte_array0;
        bytea *byte_array1;

        BasicArrayObject<float> *features0;
        BasicArrayObject<float> *features1;

        size_t dimensions;
        double *result;

        ManhattanDistance< BasicArrayObject<float> > manhattan;

        byte_array0 = PG_GETARG_BYTEA_P(0);
        byte_array1 = PG_GETARG_BYTEA_P(1);
        dimensions  = PG_GETARG_INT32(2);

        features0 = ByteArrayToFloatArrayObject(0, byte_array0, dimensions);
        features1 = ByteArrayToFloatArrayObject(1, byte_array1, dimensions);

        result = (double *)(palloc(sizeof(double)));
        *result = manhattan.getDistance(*features0, *features1);

        PG_RETURN_FLOAT8(*result);
    }

    PG_FUNCTION_INFO_V1(chebyshev_distance);

    Datum chebyshev_distance(PG_FUNCTION_ARGS) {
        bytea *byte_array0;
        bytea *byte_array1;

        BasicArrayObject<float> *features0;
        BasicArrayObject<float> *features1;

        size_t dimensions;
        double *result;

        ChebyshevDistance< BasicArrayObject<float> > chebyshev;

        byte_array0 = PG_GETARG_BYTEA_P(0);
        byte_array1 = PG_GETARG_BYTEA_P(1);
        dimensions  = PG_GETARG_INT32(2);

        features0 = ByteArrayToFloatArrayObject(0, byte_array0, dimensions);
        features1 = ByteArrayToFloatArrayObject(1, byte_array1, dimensions);

        result = (double *)(palloc(sizeof(double)));
        *result = chebyshev.getDistance(*features0, *features1);

        PG_RETURN_FLOAT8(*result);
    }

    PG_FUNCTION_INFO_V1(lbp_extractor);

    Datum lbp_extractor(PG_FUNCTION_ARGS) {
        if(PG_ARGISNULL(0)) {
            ereport(ERROR, (errmsg("[ERROR] Null arrays not accepted.\n")));
        }

        Signature imgSignature;
        LocalBinaryPatternExtractor<Signature,Image> *descriptor;

        // ByteArray to Image
        bytea * inputByteArray = PG_GETARG_BYTEA_P(0);
        Image * image = ByteArray2Image(inputByteArray);

        // Extract
        descriptor = new LocalBinaryPatternExtractor<Signature, Image>();
        descriptor->setNumFeatures(256); // TODO: WHY 256?
        descriptor->generateSignature(*image, imgSignature);

        // Signature to ByteArray
        bytea * characteristics = Signature2ByteArray(imgSignature);

        PG_RETURN_BYTEA_P(characteristics);
    }

    PG_FUNCTION_INFO_V1(color_layout_extractor);

    Datum color_layout_extractor(PG_FUNCTION_ARGS) {
        if(PG_ARGISNULL(0)) {
            ereport(ERROR, (errmsg("[ERROR] Null array not accepted.\n")));
        }

        Signature imgSignature;
        ColorLayoutExtractor<Signature,Image> *descriptor;

        // ByteArray to Image
        bytea * inputByteArray = PG_GETARG_BYTEA_P(0);
        Image * image = ByteArray2Image(inputByteArray);

        // Extract
        descriptor = new ColorLayoutExtractor<Signature, Image>();
        descriptor->setNumFeatures(256); // TODO: WHY 256?
        descriptor->setNumBlocks(256); // TODO: WHY 256?
        descriptor->generateSignature(*image, imgSignature);

        // Signature to ByteArray
        bytea * characteristics = Signature2ByteArray(imgSignature);

        PG_RETURN_BYTEA_P(characteristics);
    }

    PG_FUNCTION_INFO_V1(color_structure_extractor);

    Datum color_structure_extractor(PG_FUNCTION_ARGS) {
        if(PG_ARGISNULL(0)) {
            ereport(ERROR, (errmsg("[ERROR] Null array not accepted.\n")));
        }

        Signature imgSignature;
        ColorStructureExtractor<Signature,Image> *descriptor;

        // ByteArray to Image
        bytea * inputByteArray = PG_GETARG_BYTEA_P(0);
        Image * image = ByteArray2Image(inputByteArray);

        // Extract
        descriptor = new ColorStructureExtractor<Signature, Image>();
        descriptor->setNumFeatures(256); // TODO: WHY 256?
        descriptor->generateSignature(*image, imgSignature);

        // Signature to ByteArray
        bytea * characteristics = Signature2ByteArray(imgSignature);

        PG_RETURN_BYTEA_P(characteristics);
    }

#ifdef __cplusplus
}
#endif
