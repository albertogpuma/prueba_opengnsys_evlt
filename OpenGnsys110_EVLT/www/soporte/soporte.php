<?php
//********************************************************************
// Descripción : 
//              Pagina de informacion sobre el proyecto OpenGnsys
//********************************************************************
include_once("../includes/ctrlacc.php");
include_once("../idiomas/php/".$idioma."/acercade_".$idioma.".php");

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Administración web de aulas </title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../estilos.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="template.css?v=1" type="text/css" />
<style type='text/css'>.txtCabeceraTablasEvlt  { color: #000099; font-weight: 700; } </style><link href="http://evlt.uma.es/index2.php?option=com_rss&amp;feed=RSS2.0&amp;no_html=1" rel="alternate" type="application/rss+xml" title="rss"/>
</head>

<body class="acercade">
<!-- INICIO SECCION CABECERAS -->
<header role="banner" id="zona_cabecera" class="navbar navbar-fixed-top moodle-has-zindex">
    <nav role="navigation" class="navbar-inner">
        <div id="cabeceraUMA">
            <div id="zona_logo_UMA">
                <a href="http://www.uma.es">
                    <img id="logouma_ordenador" src="http://evlt.uma.es/templates/evlt2015/images/logouma.png" alt="logouma" title="Universidad de Málaga"/>
                    <img id="logouma_movil" src="http://evlt.uma.es/templates/evlt2015/images/logoumamini.png" alt="logouma" title="Universidad de Málaga"/>
                </a>
            </div>
           <!-- <div class="espacio_entre_zonas" id="espacio_entre_zonas1">&nbsp;</div>   -->
            <div class="espacio_entre_zonas" id="espacio_entre_zonas2">&nbsp;</div>
			
			
            <div id="zona_logos_CV">
                <div class="zona_logos_CV_linea">
                    <a href="http://evlt.uma.es" id = "cv_link">
                        <img src="http://evlt.uma.es/templates/evlt2015/images/EVLT/cvgrande.png" alt="Servicio Enseñanza Virtual y Laboratorios Tecnológicos" title="Servicio Enseñanza Virtual y Laboratorios Tecnológicos">
                    </a>
                    <a href="http://evlt.uma.es" id = "devlt_link">
                        <img src="http://evlt.uma.es/templates/evlt2015/images/EVLT/devlt.png" alt="Servicio de Enseñanza Virtual y Laboratorios Tecnológicos" title="Servicio de Enseñanza Virtual y Laboratorios Tecnológicos">
                    </a>
                </div>
            </div>
            <div class="espacio_entre_zonas" id="espacio_entre_zonas3">&nbsp;</div>



    </nav>
</header>

<!-- FIN SECCION CABECERAS -->


<p>
<?php
// Añadir versión.
$versionfile="../../doc/VERSION.txt";
if (file_exists ($versionfile)){
	ob_start(); # apertura de bufer
	include ($versionfile);
	$version = ob_get_contents();
	ob_end_clean(); # cierre de bufer
	
	$version=split(" ",$version);
	echo "Versión => ".$version[0]." ".$version[1];
}
?>
</p>
<p><strong><?php echo "Pulse aquí para "; ?> <a href="https://proyectos.evlt.uma.es/secure/CreateIssue!default.jspa"  target="_blank" >Crear Incidencia JIRA</a><strong></p>

<img src='soporte.png' alt='*' hspace='10em' vspace='10em' align='left' height="380" width="680" />


</body>
</html>
