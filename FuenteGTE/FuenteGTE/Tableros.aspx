<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Canvas.master" AutoEventWireup="true"
    CodeBehind="Tableros.aspx.cs" Inherits="FuenteGTE.Tableros" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   

   <div id="content">
      <h1 class="nomTablero">Mis Tableros</h1>

      <div id="misTableros" class="row">
        
      </div>


      <h1 class="nomTablero">Tableros en los que soy invitado </h1>
      <div id="misTablerosComoInvitado" class="row">
        
      </div>



      <!-- FORMULARIO AGREGAR TAREA -->
      <div id="dialog-agregar-tablero" title="Agregar Tablero" >
        <table>
          <tr>
            <td>Nombre Tablero:</td>
            <td><input id="nombreTablero" type="text" /></td>
          </tr>
          <tr>
            <td>Código ARS:</td>
            <td><input id="codigoARS" type="text" /></td>
          </tr>
          <tr>
            <td>Link Sharepoint:</td>
            <td><textarea id="linkSharepoint"  name="textarea" rows="10" cols="50" ></textarea></td>
          </tr>   
        </table>
      </div>
      <!-- FIN FORMULARIO -->
   </div>
   
    <script type="text/javascript">
        //inicializa div de dialogos para crear tablero.
        $("#dialog-agregar-tablero").dialog({
            modal: true,
            autoOpen: false,
            width: 700,
            buttons: {
                Cancelar: function () {
                    $(this).dialog("close");
                },
                Guardar: function () {
                    CrearTablero();
                    $(this).dialog("close");
                }
            }
        });

        function agregarTablero() {
            $("#dialog-agregar-tablero").dialog("open");
        }

        function CrearTablero() {
            var tablero = new Object();

            tablero.CodigoARS = $('#linkSharepoint').val();
            tablero.LinkSharepoint = $('#codigoARS').val();
            tablero.NombreTablero = $('#nombreTablero').val();

            $.ajax({
                type: "POST",
                url: "Tableros.aspx/CrearTablero",
                data: "{'tablero':" + JSON.stringify(tablero) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    //Ver si recargar la página o redireccionar al tablero para empezar agregar invitados.
                }
            });
        }

        function ObtenerMisTablerosComoInvitado() {
            var par = '{idUsuario:1}';
            $.ajax({
                type: "POST",
                url: "Tableros.aspx/ObtenerMisTablerosComoInvitado",
                data: par,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.hasOwnProperty("d")) { result = result.d; }
                    for (i = 0; i < result.length; i++) {
                        $("#misTablerosComoInvitado").append('<div class="col-3">'
                                                 + '<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all tablero">'
                                                 + '<div class="portlet-content">'
                                                 + '<h3> <a href="#" onclick="">' + result[i].NombreTablero + '</a></h3>'
                                                 + '</div>'
                                                 + '</div>'
                                                 + '</div>');
                    }
                }
            });
        }

        function ObtenerMisTableros() {
            var par = '{idUsuario:1}'
            $.ajax({
                type: "POST",
                url: "Tableros.aspx/ObtenerMisTableros",
                data: par,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.hasOwnProperty("d")) { result = result.d; }

                    for (i = 0; i < result.length; i++) {
                        $("#misTableros").append( '<div class="col-3">' 
                                                 + '<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all tablero">'
                                                 + '<div class="portlet-content">'
                                                 + '<h3> <a href="#" onclick="">' + result[i].NombreTablero + '</a></h3>'                                                   
                                                 + '</div>'                   
                                                 + '</div>'
                                                 +'</div>');
                    }

                    //agregar tablero para agregar tableros.
                    $("#misTableros").append('<div class="col-3">'
                                                 + '<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all tablero">'
                                                 + '<div class="portlet-content">'
                                                 + '<br/>'
                                                 + '<center><a href="#" onclick="agregarTablero()">Agregar Tablero</a></center>'
                                                 + '<br/>'
                                                 + '</div>'
                                                 + '</div>'
                                                 + '</div>');

                }
            });
        }

        ObtenerMisTablerosComoInvitado();
        ObtenerMisTableros(); 

    </script>

</asp:Content>
