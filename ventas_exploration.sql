
--EXPLORACION DE DATOS

select * from VENDEDOR order by 2,3
select * from PEDIDO

--clientes del estado de Nueva York
select * from CLIENTE where DIRCLI like '%NY%'

--vendedores y sus pedidos despachados
select ven.NOMVEND, ven.APELLVEND, COUNT(PEDIDO.CODVEND) as Cant_Ped 
from VENDEDOR as ven
inner join PEDIDO on ven.CODVEND = PEDIDO.CODVEND
group by ven.NOMVEND, ven.APELLVEND
order by Cant_Ped desc


select * from PEDIDO


--vendedores que atendiero pedidos en el mes de noviembre de 1999
select NOMVEND, APELLVEND, E_MAIL 
from VENDEDOR where exists(
       select * from PEDIDO where FECHA_PED between '1999-11-1' and '1999-11-30')



select * from ARTICULO
select * from DETALLE_PED
select * from PEDIDO
select * from CLIENTE
select * from VENDEDOR

--informacion completa de ventas
select ped.NUMPED, cli.NUMCLI, cli.NOMCLI, cli.DIRCLI, (RTRIM(ven.NOMVEND) +' '+ RTRIM(ven.APELLVEND)) as Vendedor, FECHA_PED, ar.NUMART,
ar.DESCRIPCION, dp.CANTIDAD, ar.PRECIO, (dp.CANTIDAD * ar.PRECIO) as TOTAL
from cliente as cli
inner join PEDIDO as ped on cli.NUMCLI  = ped.NUMCLI
inner join DETALLE_PED as dp on ped.NUMPED = dp.NUMPED
inner join ARTICULO as ar on dp.NUMART = ar.NUMART
INNER JOIN VENDEDOR as ven ON ped.CODVEND = ven.CODVEND



--productos vendidos en NY, basandonos en la direccion del cliente
select ar.DESCRIPCION, COUNT(ar.DESCRIPCION) as cantidad_ped_NY, sum(dp.CANTIDAD)as cantidad_articulos_NY
from ARTICULO as ar
inner join DETALLE_PED as dp on ar.NUMART = dp.NUMART
inner join PEDIDO as ped on dp.NUMPED = ped.NUMPED
inner join CLIENTE as cli on ped.NUMCLI = cli.NUMCLI
where cli.DIRCLI like '%NY%'
group by ar.DESCRIPCION
order by cantidad_ped_NY desc

select * from ARTICULO
select * from DETALLE_PED
select * from PEDIDO
select * from CLIENTE


