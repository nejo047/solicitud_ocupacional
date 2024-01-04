<?php
session_start();
if($_SERVER['REQUEST_METHOD'] === 'GET'){
    $empresaId = $_GET['dato1'] ?? '';
    $solicitanteId = $_GET['dato2'] ?? '';

    if($empresaId != null && $solicitanteId != null){
        $_SESSION['empresaId'] = $empresaId;
        $_SESSION['solicitanteId'] = $solicitanteId;
    }else{
        header("location: index.html");
        exit;
    }
}else{
    header("location: index.html");
    exit;
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>solicitudes_ocupacional</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/style_nueva_solicitud.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="content_nueva_solicitud">
        <div class="sidebar"><i class="fas fa-align-justify menu_control"></i>
            <div></div>
            <ul class="menu_sidebar">
                <li><a class="link_menu" href="#"><i class="far fa-calendar-check" data-bs-toggle="tooltip" data-bss-tooltip="" title="Nueva"></i><span class="text_link">Nueva</span></a></li>
                <li><a class="link_menu" href="#"><i class="fas fa-user-friends" data-bs-toggle="tooltip" data-bss-tooltip="" title="Empleados"></i><span class="text_link">Empleados</span></a></li>
                <li><a class="link_menu" href="#"><i class="fas fa-list-ol" data-bs-toggle="tooltip" data-bss-tooltip="" title="Registro"></i><span class="text_link">Registro</span></a></li>
            </ul>
        </div>
        <div class="content">
            <div class="content_left">
                <form class="form_nueva_solicitud">
                    <h5 class="heading_nueva">Nueva Solicitud</h5><label class="form-label">Fecha de solicitud</label><input class="form-control form-control-date" type="date" name="fechaSelect">
                    <div class="div-horarios">
                        <h6>Horarios y Cupos Disponibles</h6>
                        <div class="info-horarios">

                        </div>
                    </div>
                    <div class="div-nueva-btn-primary"><button class="btn btn-primary" type="submit">Crear Nueva</button></div>
                </form>
                <div class="div-table-postulantes">
                    <div class="header-table-postulantes">
                        <h5>SOLICITUD</h5><h5>28-12-2023</h5><button class="btn btn-primary btn-add-postulante" type="button" data-bs-target="#modal-postulante" data-bs-toggle="modal"><i class="fas fa-plus"></i><span>Nuevo Postulante</span></button>
                    </div>
                    <form class="form-search"><i class="fas fa-search"></i><input class="form-control" type="search" placeholder="Buscar Postulante" /><select class="form-select">
                        <optgroup label="Horas Disponibles"></optgroup>
                        </select>
                        <input class="id-solicitud" type="hidden" name="id-solicitud">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-angle-double-down"></i></button>
                    </form>
                    <div class="table-responsive div-table-postulantes">
                        <table class="table">
                            <tbody class="body-postulantes">

                            </tbody>
                        </table>
                    </div>
                    <div class="modal fade" role="dialog" tabindex="-1" id="modal-postulante">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form class="form-data-postulante">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Postulante - Trabajador</h4><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="div-rut"><i class="far fa-id-card"></i><input class="form-control" type="text" name="rut-postulant" placeholder="RUT (11111111-1)" required /></div>
                                        <div class="div-nombre-completo"><i class="fas fa-user"></i><input class="form-control" type="text" name="name-postulant" placeholder="Nombres Y Apellidos" required /></div>                                       
                                        <div class="div-nacimiento"><i class="fas fa-birthday-cake"></i><input class="form-control form-control-sm" type="date" name="birth-postulant" placeholder="F.Nacimiento" required /></div>
                                        <div class="div-telefono"><i class="fas fa-mobile-alt"></i><input class="form-control" type="text" name="phone-postulant" placeholder="Teléfono" required /></div>
                                        <div class="div-puesto"><i class="fas fa-user-tag"></i><input class="form-control" type="text" name="job-postulant" placeholder="Cargo" required /></div>
                                        <div class="div-licencia"><i class="far fa-id-badge"></i><input class="form-control" type="text" name="licence-postulant" placeholder="Clase - Licencia" /></div>
                                    </div>
                                    <div class="modal-footer"><button class="btn btn-light" type="button" data-bs-dismiss="modal">Cancelar</button><button class="btn btn-primary" type="submit">Ingresar</button></div>
                                </form>
                                <span class="span-message">POSTULANTE CREADO</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content_rigth">
                <div class="div-table-solicitudes">
                    <h5>Solicitudes Creadas</h5>
                    <div class="table-responsive">
                        <table class="table table-nueva-solicitud">
                            <tbody class="table-body-nueva">
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="div-baterias">
                    <div class="div-nombre-postulante">
                        <h5>Rodrigo Andrea Araya</h5>
                    </div>
                    <div class="div-select"><select>
                            <option value="" selected="">TIPO DE BATERIA</option>
                            <option value="1">Preocupacional</option>
                            <option value="2">Ocupacional</option>
                        </select></div>
                    <div class="div-lista-baterias">
                        <div class="table-responsive baterias">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Baterias Preocupacional</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="td-bateria">Altura Física</td>
                                        <td><i class="fas fa-file-download"></i></td>
                                    </tr>
                                    <tr></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="div-lista-detalles">
                        <div class="table-responsive examenes">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Contenido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Signos Vitales</td>
                                    </tr>
                                    <tr>
                                        <td>Antropometria</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="div-baterias-asignadas">
                        <div class="table-responsive baterias-seleccionadas">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Baterias Seleccionadas</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Altura Geográfica</td>
                                        <td><i class="fas fa-trash-restore"></i></td>
                                    </tr>
                                    <tr></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/control_menu.js"></script>
    <script src="js/admin_solicitudes.js"></script>
</body>

</html>