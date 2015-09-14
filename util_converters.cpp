#include "cplusplus_header.h"

/* UNIVERSITY OF SAO PAULO - ICMC - GBDI http://www.gbdi.icmc.usp.br/

 *  Author: Jonathan Ramos, jonathan@usp.br 
 *  File: util_converters.cpp
 */

/**
 * Returns an Image object (OpenCV library cv::Mat) containing the 
 * image decoded from ByteArrayAsString 
 * <p>
 * This method always assumes the image is in RGB, i.e., there are three channels 
 *
 * @param  bytea (Postgres) representing na images
 * @return      the image in Mat (OpenCV) format.
 */
cv::Mat ByteArray2Mat(bytea *imagem) {
    // Collect the input image byte stream as string
    std::string str(VARDATA(imagem), VARSIZE(imagem) - VARHDRSZ);

    std::vector<char> vectordata(str.begin(), str.end());

    cv::Mat data_mat(vectordata, true);

    // Encode de bytearray as image considering the original image has 3 channels (i.e. RGB)
    cv::Mat image(cv::imdecode(data_mat, CV_LOAD_IMAGE_COLOR));

    // returns the image as cv::Mat
    return image;
}

/**
 * Converts cv:Mat type to postgres bytea type.
 * <p>
 * This method always assume the image is in RGB, i.e., there are three channels 
 * The encoding is always in .jpg format with 90 of image quality (compression)
 *
 * @param  the image in OpenCV mat format.
 * @return  bytea (postgres) representing an image
 */
bytea* Mat2ByteArray(cv::Mat& image) {
    std::vector<uchar> vectordata;
    std::vector<int> params;

    // Set parameters for image compression
    params.push_back(CV_IMWRITE_JPEG_QUALITY);
    params.push_back(90); //image quality

    //encode image
    cv::imencode(".jpg", image, vectordata, params);

    // converts from std::vector<uchar> to c++ string
    std::string str(vectordata.begin(), vectordata.end());

    // allocs space for byte array 
    // palloc guarantees success of allocation, I dont know how: http://www.postgresql.org/message-id/1108528754.26237.29.camel@localhost.localdomain
    bytea* bytes = (bytea*) palloc(sizeof (bytea) * image.rows * image.cols + VARHDRSZ);

    //copy from local variable memory to the returning varible memory
    memcpy(VARDATA(bytes), str.c_str(), str.size());

    //Set the bytea size value, which is requeried by postgres bytea type
    SET_VARSIZE(bytes, VARHDRSZ + str.size());

    // Return final bytea
    return DatumGetByteaP(bytes);


}

BasicArrayObject<float> ByteArrayToFloatArrayObject(u_int32_t oid, bytea *byte_array, size_t dimensions) {
    std::string byte_string(VARDATA(byte_array), VARSIZE(byte_array) - VARHDRSZ);
    std::istringstream iss(byte_string);
    std::vector<float> my_vec;

    float i;

    while (iss >> i) {
        my_vec.push_back(i);

        if (iss.peek() == ' ')
            iss.ignore();
    }


    return BasicArrayObject<float>(oid, my_vec);
}





