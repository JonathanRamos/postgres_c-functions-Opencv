#include "cplusplus_header.h"

/**
 * Returns a string of bytes from a cv:Mat type.
 * <p>
 * This method always assume the image is in RGB, i.e., there are three channels 
 * The encoding is always in .jpg format (OpenCV default quality params)
 *
 * @param  the image in OpenCV mat format.
 * @return  string with the ByteArray as a String (byteArrayAsString) 
 */
cv::Mat cannyEdgeDetection(cv::Mat& image) {
    cv::Mat srcGray, edges;


    edges.create(image.size(), CV_8UC1);

    if (image.channels() > 1) {
        // Convert the input image to gray-scale using the OpenCV cvtColor function
        cv::cvtColor(image, srcGray, cv::COLOR_BGR2GRAY);
    }


    // Smooth the gray-scale image to reduce noise by using the OpenCV blur function.
    cv::blur(srcGray, edges, cv::Size(3, 3));


    // Call the OpenCV Canny function to find edges.
    cv::Canny(edges, edges, 10, 30, 3);

    return edges;
}
