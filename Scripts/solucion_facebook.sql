--1. Consultar la cantidad de likes por publicaci�n.
SELECT *
FROM TBL_PUBLICACIONES;

SELECT CODIGO_PUBLICACION, COUNT(1) AS CANTIDAD_LIKES
FROM TBL_LIKE_PUBLICACIONES
GROUP BY CODIGO_PUBLICACION;

--2. Consultar la cantidad de likes por fotograf�a.
SELECT *
FROM TBL_FOTOS;

SELECT CODIGO_FOTO, COUNT(1) AS CANTIDAD_LIKES
FROM TBL_LIKE_FOTOGRAFIAS
GROUP BY CODIGO_FOTO;
--3. Consultar los grupos en los cuales la cantidad de usuarios sea mayor que 5, mostrar el nombre del grupo y la cantidad de usuarios.
SELECT *
FROM TBL_GRUPOS;

SELECT NOMBRE_GRUPO, COUNT(1) AS CANTIDAD_USUARIOS
FROM TBL_GRUPOS_X_USUARIO A
INNER JOIN TBL_GRUPOS B
ON (A.CODIGO_GRUPO = B.CODIGO_GRUPO)
GROUP BY NOMBRE_GRUPO
HAVING COUNT(1)>5;

--4. Mostrar la cantidad de amistades pendientes y rechazadas.
SELECT B.NOMBRE_ESTATUS, COUNT(1) AS CANTIDAD_SOLICITUDES
FROM TBL_AMIGOS A
INNER JOIN TBL_ESTATUS_SOLICITUDES B
ON (A.CODIGO_ESTATUS = B.CODIGO_ESTATUS)
WHERE A.CODIGO_ESTATUS IN (2,3)
GROUP BY B.NOMBRE_ESTATUS;

SELECT *
FROM TBL_ESTATUS_SOLICITUDES;

--5. Mostrar el usuario con mayor cantidad de amigos confirmados (El m�s cool).
SELECT A.*, ROWNUM
FROM (
  SELECT CODIGO_USUARIO, COUNT(1) CANTIDAD_AMIGOS
  FROM TBL_AMIGOS 
  WHERE CODIGO_ESTATUS = 1
  GROUP BY CODIGO_USUARIO
  ORDER BY CANTIDAD_AMIGOS DESC
) A
WHERE ROWNUM = 1;

SELECT *
FROM (
  SELECT CODIGO_USUARIO, COUNT(1) CANTIDAD_AMIGOS
  FROM TBL_AMIGOS 
  WHERE CODIGO_ESTATUS = 1
  GROUP BY CODIGO_USUARIO
)
WHERE CANTIDAD_AMIGOS = (  
  SELECT MIN(CANTIDAD_AMIGOS)
  FROM (
    SELECT CODIGO_USUARIO, COUNT(1) CANTIDAD_AMIGOS
    FROM TBL_AMIGOS 
    WHERE CODIGO_ESTATUS = 1
    GROUP BY CODIGO_USUARIO
    ORDER BY CANTIDAD_AMIGOS DESC
  )
);


SELECT A.*, ROWID, ROWNUM
FROM TBL_AMIGOS A;

--6. Mostrar el usuario con m�s solicitudes rechazadas (Forever alone).
--7. Mostrar la cantidad de usuarios registrados mensualmente.
--8. Mostrar la edad promedio de los usuarios por g�nero.
--9. Con respecto al historial de accesos se necesita saber el crecimiento de los accesos del d�a 19 de Agosto del 2015 con respecto al d�a anterior, la f�rmula para calcular dicho crecimiento se muestra a continuaci�n:
--((b-a)/a) * 100
/*Donde:
a = Cantidad de accesos del d�a anterior (18 de Agosto del 2015)
b = Cantidad de accesos del d�a actual (19 de Agosto del 2015)
Mostrar el resultado como un porcentaje (Concatenar %)*/
/*10. Crear una consulta que muestre lo siguiente:
? Nombre del usuario.
? Pa�s donde pertenece.
? Cantidad de publicaciones que tiene.
? Cantidad de amigos confirmados.
? Cantidad de likes que ha dado.
? Cantidad de fotos en las que ha sido etiquetado.
? Cantidad de accesos en el historial.
Tip: utilice subconsultas.*/
--11. De la consulta anterior cree una vista materializada y util�cela desde una tabla din�mica en Excel para mostrar una gr�fica de l�nea que muestre la cantidad de amigos por cada usuario.