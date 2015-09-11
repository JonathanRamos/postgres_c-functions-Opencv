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


Postgres Examples:

CREATE OR REPLACE FUNCTION openImage(varchar)
  RETURNS integer AS
'/home/jonathan/NetBeansProjects/exampleso/dist/Debug/GNU-Linux-x86/libexampleso.so', 'openImage'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;
ALTER FUNCTION openImage(varchar)
  OWNER TO postgres;

  SELECT openImage('//home/jonathan/Downloads/teste.jpg')



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
