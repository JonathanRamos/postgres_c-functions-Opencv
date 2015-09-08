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

#ifdef __cplusplus
}
#endif
