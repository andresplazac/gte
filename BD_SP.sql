/*
Procedimiento para funcionalidades de:
- Ver mis tableros
- Crear tableros
- Entrar a un tablero
*/
use master
USE GTE
GO

CREATE PROCEDURE Agregar_Tablero
    @IDUsuario AS INT,
    @CodigoARS AS VARCHAR(10),
    @LinkSharepoint AS VARCHAR(400),
    @NombreTablero AS VARCHAR(200)
AS
BEGIN    
    INSERT INTO Tablero 
    (
    IDUsuario,
    CodigoARS,
    LinkSharepoint,
    NombreTablero,
    FechaCreacion
    )
    VALUES
    (
    @IDUsuario,
    @CodigoARS,
    @LinkSharepoint,
    @NombreTablero,
    GETDATE()
    )
END

GO

CREATE PROCEDURE Buscar_MisTableros
	@IDUsuario AS INT
AS
BEGIN
    SELECT
		IDTablero,
		IDUsuario,
		CodigoARS,
		LinkSharepoint,
		NombreTablero,
		FechaCreacion
    FROM Tablero
    WHERE 
		IDUsuario = @IDUsuario    
END
GO

CREATE PROCEDURE Buscar_TableroPorID
	@IDTablero AS INT
AS
BEGIN
    SELECT
		IDTablero,
		IDUsuario,
		CodigoARS,
		LinkSharepoint,
		NombreTablero,
		FechaCreacion
    FROM Tablero
    WHERE 
		IDTablero = @IDTablero    
END
GO


CREATE PROCEDURE Buscar_MisTablerosComoInvitado
	@IDUsuario AS INT
AS
BEGIN
     SELECT
		T.IDTablero,
		T.IDUsuario,
		T.CodigoARS,
		T.LinkSharepoint,
		T.NombreTablero,
		T.FechaCreacion
    FROM Invitado I 
    INNER JOIN Tablero T ON I.IDTablero = T.IDTablero
    WHERE 
		I.IDUsuario = @IDUsuario    
END
GO
