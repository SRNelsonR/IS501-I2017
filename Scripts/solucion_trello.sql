/*Desarrollar las siguientes consultas:
1. Mostrar todos los usuarios que no han creado ning�n tablero, para dichos usuarios mostrar el nombre completo y correo, utilizar producto cartesiano con el operador (+).*/

SELECT A.NOMBRE||' '||A.APELLIDO, A.CORREO
FROM TBL_USUARIOS A,
    TBL_TABLERO B
WHERE A.CODIGO_USUARIO = B.CODIGO_USUARIO_CREA(+)
AND B.CODIGO_USUARIO_CREA IS NULL;

/*
2. Mostrar la cantidad de usuarios que se han registrado por cada red social, mostrar inclusive la cantidad de usuarios que no est�n registrados con redes sociales.*/
SELECT NVL(B.NOMBRE_RED_SOCIAL,'Ninguno') AS RED_SOCIAL, COUNT(1) as CANTIDAD_USUARIOS
FROM TBL_USUARIOS A
LEFT JOIN TBL_REDES_SOCIALES B
ON (A.CODIGO_RED_SOCIAL = B.CODIGO_RED_SOCIAL)
GROUP BY NVL(B.NOMBRE_RED_SOCIAL,'Ninguno');


/*
3. Consultar el usuario que ha hecho m�s comentarios sobre una tarjeta (El m�s prepotente), para este usuario mostrar el nombre completo, correo, cantidad de comentarios y cantidad de tarjetas a las que ha comentado (pista: una posible soluci�n para este �ltimo campo es utilizar count(distinct campo))*/

SELECT B.NOMBRE||' '|| B.APELLIDO AS NOMBRE_COMPLETO, 
      A.CODIGO_USUARIO, CANTIDAD_COMENTARIOS,
      B.CORREO
      CANTIDAD_TARJETAS_DISTINTAS
FROM (
  SELECT CODIGO_USUARIO, 
          COUNT(1) CANTIDAD_COMENTARIOS,
          COUNT(DISTINCT CODIGO_TARJETA) CANTIDAD_TARJETAS_DISTINTAS
  FROM TBL_COMENTARIOS
  GROUP BY CODIGO_USUARIO
  ORDER BY CANTIDAD_COMENTARIOS DESC
) A
LEFT JOIN TBL_USUARIOS B
ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO)
WHERE ROWNUM = 1;



SELECT *
FROM (
  SELECT CODIGO_USUARIO, 
          COUNT(1) CANTIDAD_COMENTARIOS,
          COUNT(DISTINCT CODIGO_TARJETA) CANTIDAD_TARJETAS_DISTINTAS
  FROM TBL_COMENTARIOS
  GROUP BY CODIGO_USUARIO
)
WHERE CANTIDAD_COMENTARIOS = (
  SELECT MAX(CANTIDAD_COMENTARIOS) AS CANTIDAD_COMENTARIOS      
  FROM (
    SELECT CODIGO_USUARIO, 
            COUNT(1) CANTIDAD_COMENTARIOS
    FROM TBL_COMENTARIOS
    GROUP BY CODIGO_USUARIO
  )
);



SELECT ()
FROM ()
WHERE CAMPO IN (select CAMPO FROM TABLA);

/*
4. Mostrar TODOS los usuarios con plan FREE, de dichos usuarios mostrar la siguiente informaci�n:
? Nombre completo
? Correo
? Red social (En caso de estar registrado con una)
? Cantidad de organizaciones que ha creado, mostrar 0 si no ha creado ninguna.
5. Mostrar los usuarios que han creado m�s de 5 tarjetas, para estos usuarios mostrar:
Nombre completo, correo, cantidad de tarjetas creadas
6. Un usuario puede estar suscrito a tableros, listas y tarjetas, de tal forma que si hay alg�n cambio se le notifica en su tel�fono o por tel�fono, sabiendo esto, se necesita mostrar los nombres de todos los usuarios con la cantidad de suscripciones de cada tipo, en la consulta se debe mostrar:
? Nombre completo del usuario
? Cantidad de tableros a los cuales est� suscrito
? Cantidad de listas a las cuales est� suscrito
? Cantidad de tarjetas a las cuales est� suscrito
7. Consultar todas las organizaciones con los siguientes datos:
? Nombre de la organizaci�n
? Cantidad de usuarios registrados en cada organizaci�n
? Cantidad de Tableros por cada organizaci�n
? Cantidad de Listas asociadas a cada organizaci�n
? Cantidad de Tarjetas asociadas a cada organizaci�n
8. Crear una vista materializada con la informaci�n de facturaci�n, los campos a incluir son los siguientes:
? C�digo factura
? Nombre del plan a facturar
? Nombre completo del usuario
? Fecha de pago (Utilizar fecha inicio, mostrarla en formato D�a-Mes-A�o)
? A�o y Mes de pago (basado en la fecha inicio)
? Monto de la factura
? Descuento
? Total neto
9. Crear una tabla din�mica en excel que consulte la informaci�n de la vista materializada del inciso anterior, de dicha tabla din�mica crear un gr�fico de l�nea que muestre en el eje X el campo A�o/mes de pago y en el eje Y los nombres de los planes, el valor num�rico a mostrar en la grafica deber� ser el Total neto.*/




SELECT REPLACE(TO_CHAR(TO_DATE('25/12/2015','DD/MM/YYYY'),'YYYYMM-DD'), '/','#') as fecha
FROM dual;