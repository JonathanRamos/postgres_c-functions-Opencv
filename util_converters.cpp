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
cv::Mat ByteArray2Mat(const bytea *imagem) {
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

/* 
 * PH code
 */

vector<SignatureElemDType> ByteArray2BasicArrayObject(const bytea *byte_array) {
    vector<SignatureElemDType> my_vec;

    int tam = VARSIZE(byte_array) - VARHDRSZ;

    SignatureElemDType a;

    for (int x = 0; x < tam/sizeof (SignatureElemDType); x++) {
        memcpy(&a, VARDATA(byte_array) + (sizeof (SignatureElemDType) * x), sizeof(SignatureElemDType));
        my_vec.push_back(a);
    }
   // Signature sig(0, my_vec);
    
    return my_vec;
}

/* 
 * Canabrava's code
 */
// ByteArray to Image

Image* ByteArray2Image(const bytea * inputByteArray) {
    Image *outputImage = new Image();

    cv::Mat image = ByteArray2Mat(inputByteArray);

    // XXX: HOW TO SET THEM???
    outputImage->setFilename("asdf.jpg");
    outputImage->setImageID(1);
    outputImage->setChannels(image.channels());
    outputImage->setBitsPerPixel(image.elemSize());

    outputImage->createPixelMatrix(image.cols, image.rows);

    Pixel p;

    for (u_int32_t x = 0; x < outputImage->getWidth(); ++x) {
        for (u_int32_t y = 0; y < outputImage->getHeight(); ++y) {
            p.setRGBPixelValue(image.at<cv::Vec3b>(y, x)[2], image.at<cv::Vec3b>(y, x)[1], image.at<cv::Vec3b>(y, x)[0]);
            outputImage->setPixel(x, y, p);
        } // end for y
    } // end for x

    return outputImage;
} // end function ByteArray2Image


/* 
 * Canabrava's code
 */
// Image to ByteArray

//bytea* Image2ByteArray(const Image& inputImage) {
//    
//
//    cv::Mat image(inputImage.getWidth(), inputImage.getHeight(), inputImage.getChannels());
//
//    for (u_int32_t x = 0; x < inputImage.getWidth(); ++x) {
//        for (u_int32_t y = 0; y < inputImage.getHeight(); ++y) {
//            Pixel p = inputImage.getPixel(x, y);
//            image.at<cv::Vec3b>(x, y)[0] = p.getRedPixelValue();
//            image.at<cv::Vec3b>(x, y)[1] = p.getGreenPixelValue();
//            image.at<cv::Vec3b>(x, y)[2] = p.getBluePixelValue();
//        } // end for y
//    } // end for x
//
//    std::vector<uchar> vectordata;
//    std::vector<int> params;
//
//    // Set parameters for image compression
//    params.push_back(CV_IMWRITE_JPEG_QUALITY);
//    params.push_back(90); //image quality
//
//    //encode image
//    cv::imencode(".jpg", image, vectordata, params);
//
//    // converts from std::vector<uchar> to c++ string
//    std::string str(vectordata.begin(), vectordata.end());
//
//    // allocs space for byte array
//    bytea * outputBytes = (bytea*) palloc(sizeof (bytea) * image.rows * image.cols + VARHDRSZ);
//
//    //copy from local variable memory to the returning varible memory
//    memcpy(VARDATA(outputBytes), str.c_str(), str.size());
//
//    //Set the bytea size value, which is requeried by postgres bytea type
//    SET_VARSIZE(outputBytes, VARHDRSZ + str.size());
//
//    // Return final bytea
//    return DatumGetByteaP(outputBytes);
//} // end function Image2ByteArray

//Signature ByteArray2Signature(const bytea * inputByteArray) {
//    Signature outputSignature;
//
//    // Collect the input image byte stream as string
//    std::string str(VARDATA(inputByteArray), VARSIZE(inputByteArray) - VARHDRSZ);
//
//    // Encode de bytearray as image considering the original image has 3 channels (i.e. RGB)
//    outputSignature.unserializeFromString(str);
//+ VARHDRSZ
//    return outputSignature;
//} // end function ByteArray2Signature
//

//void float2Bytes(byte* bytes_temp[4], float float_variable) {
//    memcpy(bytes_temp, (unsigned char*) (&float_variable), 4);
//}

/* 
 * Canabrava's code
 */
bytea* Signature2ByteArray(Signature& imgSignature) {

    //    int tam = imgSignature.getSize() * sizeof (SignatureElemDType);
    int tam = imgSignature.getSize();
    int tam2 = sizeof (SignatureElemDType) * tam + VARHDRSZ;
    // allocs space for byte array
    bytea * outputBytes = (bytea *) palloc(tam2);

    const unsigned char *a;

    for (int x = 0; x < tam; x++) {
        memcpy(VARDATA(outputBytes) + (sizeof (SignatureElemDType) * x), imgSignature.get(x), sizeof (SignatureElemDType));
    }

    //    SignatureElemDType* imgSizeArray = (SignatureElemDType*) palloc(tam);
    //
    //    for (register int i = 0; i < imgSignature.getSize(); i++) {
    //        imgSizeArray[i] = *imgSignature.get(i);
    //    }

    //    return imgSizeArray;


    //copy from local variable memory to the returning variable memory
  //  memcpy(VARDATA(outputBytes), (unsigned char*) a, tam);

    //Set the bytea size value, which is requeried by postgres bytea type
    SET_VARSIZE(outputBytes, tam2);
    //
    //    // Return final bytea
    return outputBytes;
} // end function Signature2ByteArray





