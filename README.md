<b><p1> README - How to use<p1></b>

Important notes:

Please consider the recommendations for c functions in postgres sql: 
http://www.postgresql.org/docs/8.2/static/xfunc-c.html

Recomendations:

1 - When including C codes always wrap the code with extern "C".


2 - Return variables always have to be dynamically allocated with palloc() (not malloc()) previous 
to the end of execution of the function, otherwise these values are gonna be lost.


3 - When making your own dynamic library (.so or .dll) It is easier to set the enviroment using an IDE. 
I personally find making a Makefile by hand hard, since you have to include dynamic libraries path, e.g. 
OpenCV. An example of including dynamic libraries can be seen in: https://www.youtube.com/watch?v=UFsJ4P5QYKQ


Makefile example:

g++ -shared   -c -g -I/usr/local/include/opencv2 -I/usr/include/postgresql/9.4/server -fPIC  -MMD -MP -MF "build/Debug/GNU-Linux-x86/cplusplus_functions.o.d" -o build/Debug/GNU-Linux-x86/cplusplus_functions.o cplusplus_functions.cpp
mkdir -p build/Debug/GNU-Linux-x86
rm -f "build/Debug/GNU-Linux-x86/my_postgres_functions.o.d"
g++ -shared   -c -g -I/usr/local/include/opencv2 -I/usr/include/postgresql/9.4/server -fPIC  -MMD -MP -MF "build/Debug/GNU-Linux-x86/my_postgres_functions.o.d" -o build/Debug/GNU-Linux-x86/my_postgres_functions.o my_postgres_functions.cpp
mkdir -p build/Debug/GNU-Linux-x86
rm -f "build/Debug/GNU-Linux-x86/util_converters.o.d"
g++ -shared   -c -g -I/usr/local/include/opencv2 -I/usr/include/postgresql/9.4/server -fPIC  -MMD -MP -MF "build/Debug/GNU-Linux-x86/util_converters.o.d" -o build/Debug/GNU-Linux-x86/util_converters.o util_converters.cpp
mkdir -p dist/Debug/GNU-Linux-x86
g++ -shared    -o dist/Debug/GNU-Linux-x86/libexampleso.so build/Debug/GNU-Linux-x86/cplusplus_functions.o build/Debug/GNU-Linux-x86/my_postgres_functions.o build/Debug/GNU-Linux-x86/util_converters.o -lopencv_calib3d -lopencv_core -lopencv_features2d -lopencv_flann -lopencv_hal -lopencv_highgui -lopencv_imgcodecs -lopencv_imgproc -lopencv_ml -lopencv_objdetect -lopencv_photo -lopencv_shape -lopencv_stitching -lopencv_superres -lopencv_ts -lopencv_video -lopencv_videoio -lopencv_videostab -shared -fPIC



Postgres Examples:

CREATE OR REPLACE FUNCTION get_imgsize(bytea)
  RETURNS bytea AS
'/home/jonathan/NetBeansProjects/exampleso/dist/Debug/GNU-Linux-x86/libexampleso.so', 'get_imgsize'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;
ALTER FUNCTION get_imgsize(bytea)
  OWNER TO postgres;
  
SELECT get_imgsize((SELECT imagem FROM imagem WHERE id = '1'))


CREATE OR REPLACE FUNCTION canny_detector(bytea)
  RETURNS bytea AS
'/home/jonathan/NetBeansProjects/exampleso/dist/Debug/GNU-Linux-x86/libexampleso.so', 'canny_detector'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;
ALTER FUNCTION canny_detector(bytea)
  OWNER TO postgres;
  
SELECT canny_detector(imagem) FROM imagem WHERE id = '2'


CREATE OR REPLACE FUNCTION lbp_extractor(bytea) 
RETURNS bytea AS 
'/home/jonathan/NetBeansProjects/exampleso/dist/Debug/GNU-Linux-x86/libexampleso.so', 'lbp_extractor' 
LANGUAGE c IMMUTABLE STRICT COST 1; 
ALTER FUNCTION lbp_extractor(bytea) OWNER TO postgres;


CREATE OR REPLACE FUNCTION euclidean_distance(bytea, bytea) 
RETURNS double precision AS 
'/home/jonathan/NetBeansProjects/exampleso/dist/Debug/GNU-Linux-x86/libexampleso.so', 'euclidean_distance' 
LANGUAGE c IMMUTABLE STRICT COST 1; 
ALTER FUNCTION euclidean_distance(bytea, bytea) OWNER TO postgres;

SELECT lbp_extractor((SELECT imagem FROM imagem WHERE id = '11'))

SELECT euclidean_distance((SELECT lbp_extractor((SELECT imagem FROM imagem WHERE id = '12'))), (SELECT lbp_extractor((SELECT imagem FROM imagem WHERE id = '11'))))
