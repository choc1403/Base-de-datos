-- CONSULTAS
-- 1)
SELECT DISTINCT C.nombre_cliente, E.Nombre as Nombre_Represetante, CONCAT(E.Apellido1,' ',E.Apellido2) AS Apellidos
FROM Cliente AS C, Empleado AS E
WHERE C.codigo_empleado_rep_ventas = E.Id;

--2)
SELECT C.nombre_cliente, E.Nombre AS Nombre_Representante
FROM Cliente AS C, Pago AS P, Empleado AS E
WHERE P.codigo_cliente = C.Id AND C.codigo_empleado_rep_ventas = E.Id;

--3)
SELECT DISTINCT C.nombre_cliente, E.Nombre AS Nombre_Representante
FROM Cliente AS C, Pago AS P, Empleado AS E
WHERE P.codigo_cliente != C.Id AND C.codigo_empleado_rep_ventas = E.Id;

--4)
SELECT DISTINCT C.nombre_cliente, E.Nombre AS Nombre_Representante, O.Ciudad
FROM Cliente AS C, Pago AS P, Empleado AS E, Oficina AS O
WHERE P.codigo_cliente = C.Id AND C.codigo_empleado_rep_ventas = E.Id AND E.codigo_oficina = O.Id;

--5)
SELECT DISTINCT C.nombre_cliente, E.Nombre AS Nombre_Representante, O.Ciudad
FROM Cliente AS C, Pago AS P, Empleado AS E, Oficina AS O
WHERE P.codigo_cliente != C.Id AND C.codigo_empleado_rep_ventas = E.Id AND E.codigo_oficina = O.Id;

--6)
SELECT CONCAT(O.linea_direccion1,' - ',O.linea_direccion2) AS DIRECCION
FROM Oficina AS O, Cliente AS C, Empleado AS E
WHERE C.Ciudad = 'Fuenlabrada' AND E.codigo_oficina = O.Id AND C.codigo_empleado_rep_ventas = E.Id;

--7)
SELECT DISTINCT C.nombre_cliente, E.Nombre AS NOMBRE_REPRESENTANTE, O.Ciudad
FROM Oficina AS O, Cliente AS C, Empleado AS E
WHERE E.codigo_oficina = O.Id AND C.codigo_empleado_rep_ventas = E.Id;

