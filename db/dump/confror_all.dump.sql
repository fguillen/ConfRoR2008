-- MySQL dump 10.11
--
-- Host: localhost    Database: conferencia_rails
-- ------------------------------------------------------
-- Server version	5.0.51b-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `autores` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) NOT NULL default '',
  `apellidos` varchar(255) NOT NULL default '',
  `resumen` text NOT NULL,
  `web` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `avatar` varchar(255) default NULL,
  `notas` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Arturo','Fernández Montoro','Ingeniero Técnico en Informática de Gestión y está especializado en el desarrollo de aplicaciones web. Ha participado en el desarrollo de aplicaciones J2EE y LAMP (Linux, Apache, MySQL, Perl/PHP/Python) tanto como analista como programador, en pequeñas y grandes empresas. Es colaborador habitual de revistas relacionadas con el software libre como \"Mundo Linux\", \"Todo Linux\", \"Linux Magazine\", \"Linux +\" y \"Free Software Magazine\". Actualmente trabaja como analista programador freelance en proyectos LAMP.','http://www.sanrin.info','arturo@sanrin.info','arturo_fernandez.png',NULL),(2,'Christos','Zisopoulos','Christos escapó hace un año del endogámico mundo de la television interactiva y de la oscuridad de Londres. Ahora trabaja en The Cocktail como desarrollador de Rails y ‘all around systems guy’.\r\n\r\nhttp://42linesofcode.com/','http://42linesofcode.com/','christos@the-cocktail.com','christos_zisopoulos.jpg',NULL),(3,'Daniel','López Ridruejo','Daniel es el fundador de BitRock, empresa centrada en facilitar la instalacion de productos multiplataforma, con un enfasis especial en proyectos open source. Daniel es miembro de la Apache Software Foundation, y en el pasado ha colaborado en otros proyectos como Mono y el LDP. Es autor/coautor de diversos libros sobre software libre, entre ellos \"Apache Phrasebook\", publicado por SAMs. Daniel es Ingeniero de Telecomunicacion por la Universidad de Sevilla y la Danmarks Tekniske Universitet.','http://www.bitrock.com','daniel@bitrock.com','daniel_lopez.jpg',NULL),(4,'Daniel','Lizska','Danoo lleva más de una década siendo usuario de Linux/Open Software y participando en diversas iniciativas, entre ellas la organizacion del congreso de software libre InterInfo2004. Actualmente trabaja en BitRock, donde lidera varios proyectos basados en Ruby On Rails, entre ellos RubyStack, una distribucion de Ruby on Rails libre y multiplataforma. Danoo estudio Ingenieria Informatica en la Silesian University of Technology de Gliwice, Polonia.','http://www.bitrock.com','danoo@bitrock.com','daniel_lizska.jpg',NULL),(5,'Javier','Cañadillas','Arquitecto de Software en Sun Microsystems, especializado en Gestión de Identidad y Seguridad SOA. Ha desarrollado su carrera profesional en el mundo del software desde 1998 en diferentes posiciones y empresas, pero siempre en torno al middleware, el desarrollo y las tecnologías emergentes.\r\n\r\nSpeaker, participante habitual en eventos de software e interesado en las nuevas tecnologías web y plataformas de desarrollo, ha sido blogger de tecnología desde el año 2004 y Podcaster desde 2006.','http://venera7.com','Javier.Canadillas@Sun.COM','javier_canadillas.jpg',NULL),(6,'Jean-Michel','Garnier','Jean-Michel lleva trabajando con frameworks de tests 6 años en Francia y en Inglaterra. Desde 2006, desarrolla aplicaciones ASP con Ruby on Rails en 21croissants para pequeñas empresas y asociaciones.\r\n','http://21croissants.blogspot.com/','jeanmichel.garnier@gmail.com','jean-michel_garnier.jpg',NULL),(7,'Rodrigo','López Escolar','Rodrigo es Ingeniero Técnico de Telecomunicación (rama de Telemática) por la Escuela Universitaria de Ingeniería Técnica de Telecomunicación de la Universidad Politécnica de Madrid. Está a punto de presentar su Proyecto Fin de Carrera en la Escuela Técnica Superior de Ingenieros de Telecomunicaciones de la Universidad Politécnica de Madrid. Además de lo anterior, ha sido becario en una empresa de tarjetas SIM llamada Excel Data, S.A. De vez en cuando, le gusta retocar su aplicación web del PFC, http://www.tublogdearte.com. Es amante del buen baloncesto, le gusta el buen cine, leer, viajar, escuchar música, y jugar al ping-pong.','http://www.tublogdearte.com','rodrigolopezescolar@gmail.com','rodrigo_lopez_escolar.jpg',NULL),(8,'Sam','Lown','Programador freelance con 8 años de experiencia en tecnologías web y Linux con una preferencia profunda a tecnologías y estándares abiertos. De nacionalidad inglesa, estudié Computer Science en Staffordshire University, Inglaterra, y de allí conseguí ser estudiante técnico en el CERN, Ginebra. Ahora me encuentro en Madrid construyendo proyectos en Ruby on Rails.','http://www.samlown.com','me@samlown.com','sam_lown.jpg',NULL),(9,'Sergio','Espeja','Sergio trabaja como investigador de tecnologías del lenguaje en la UPF y es cofundador de una consultoría web llamada bee.com.es.\r\n\r\nHa trabajado en tecnologías web desde 1999. Sergio ha creado proyectos open source como Bayesian Networks for Ruby y General Genetic Algorithms for Ruby, entre otros. También ha desarrollado plugins para aplicaciones RoR como FestivalTTSOnRails.\r\n\r\nMantiene un blog en español (spejman.blogspot.com) y otro en inglés (spejman-on-rails.blogspot.com).\r\n\r\nPresentó junto a Santiago Bel la charla \"Making Rails more (Artificially) Intelligent\" en la RailsConf Europe 2007, así como \"Tareas en background con RoR y BackgrounDRb\" en la Conferencia Rails Hispana 2006.','http://spejman.blogspot.com','sergio.espeja@gmail.com','sergio_espeja.jpg',NULL),(10,'Xavier','Noria','Xavier Noria es un entusiasta de los lenguajes dinámicos. Cofundador y responsable tecnico de ASPgems, y profesor de Llenguatges d\'Scripting en la Universitat de Barcelona. Autor de algunos modulos Perl en CPAN y otras contribuciones open source.','http://www.aspgems.com','fxn@aspgems.com','xavier_noria.png',NULL),(11,'Jaime','Iniesta','Jaime trabaja como desarrollador web independiente desde hace 6 años, empleando únicamente software libre y apostando por el desarrollo ágil. Trabaja en red con otros freelances y pequeñas empresas a través de http://railes.net y mantiene un blog personal en http://jaimeiniesta.com. Es uno de los organizadores de la Conferencia Rails.','http://www.jaimeiniesta.com','jaimeiniesta@gmail.com','jaime_iniesta_aleman.png',NULL),(12,'Juan','Lupión','Juan Lupión dejó atrás una década de desarrollos en C++ para pasar a formar parte de The Cocktail, donde su cometido principal es aumentar la media de edad del equipo de rubistas.','http://www.sobrerailes.com/','pantulis@gmail.com','juan_lupion.jpg',NULL),(13,'Sergio','Gil Pérez de la Manga','Sergio Gil Pérez de la Manga, tras varios años de experiencia en desarrollo web, *aterrizó* en Rails y ahí lleva unos tres años, primero en The Cocktail trabajando en aplicaciones para blogs y CMS de todos conocidas como La Coctelera, y ahora con BeBanjo, desarrollando soluciones para televisión transaccional y Video On Demand. Es miembro activo de la comunidad Rails madrileña y española y le gusta que le invites a cerveza si te gusta su charla.','http://www.lacoctelera.com/porras','sgilperez@gmail.com','sergio_gil_perez_de_la_manga.jpg',NULL),(14,'Jacobo','García López de Araujo','Jacobo García es el Sysadmin de The Cocktail. Convive con miles de personas en la plataforma que soporta LaCoctelera.com, una de las mayores aplicaciones por volumen de usuarios, contenido y tráfico construidas con Ruby on Rails. En un sitio tan vivo, la difícil misión de Jacobo es asegurarse de que todo funciona bien y crear el espacio necesario para que todos sus vecinos y visitantes se encuentren a gusto.\r\n\r\nCuando no administra servidores, reparte pasión y música como DJ o en su blog musical unacancionaldia.','http://www.lacoctelera.com/unacancionaldia','jacobo.garcia@gmail.com','jacobo_garcia.jpg',NULL),(15,'Ernesto','Jiménez Caballero','Ernesto trabaja de desarrollador en tractis.com, proyecto con el que empezó a programar en Rails como colaborador. Además, cuando el\r\ntrabajo se lo permite, intenta mantener actualizado su blog en la coctelera.\r\n','http://www.lacoctelera.com/ernesto-jimenez','ernesto.jimenez@negonation.com','ernesto_jimenez.jpg',NULL),(16,'María','Martínez','María Martínez trabaja en <a href=\"http://the-cocktail.com\">The Cocktail</a> como consultora de experiencia de usuario y experta en programación cliente y estándares web.\r\n\r\nSu misión es analizar y definir productos para internet asi como integrar y optimizar la capa de presentación de sitios y aplicaciones web en el entorno Ruby On Rails dentro de una metodología de desarrollo ágil.\r\n\r\nHa trabajado para empresas del sector financiero y tecnológico en desarrollo de sitios y aplicaciones web, en proyectos RoR como Vocento, Prisacom, rtve, simyo, Universidad Europea de Madrid,  etc...','http://limalimon.com.es','mmartinez.maria@gmail.com','mariamartinez.jpg',NULL),(17,'Manuel','Muñoz Solera','Disfruta de su trabajo desarrollando proyectos en rails en the cocktail junto con un coro de compañeros inmejorable, donde ha tenido la oportunidad de participar en proyectos tan grandes como the shaker y trabajar para clientes tan bonitos como MTV. El tiempo que le queda\r\nlibre lo disfruta maquinando distintos vaporwares con amigos : )','http://mamuso.net','mamuso@mamuso.net','manuel_munoz_solera.jpg',NULL),(18,'Fernando','Blat','Fernando Blat trabaja en The Cocktail como desarrollador web en Ruby on Rails. Allí realiza tareas de programación de páginas web tales como La Coctelera y es ponente habitual en eventos del sector. Fernando es miembro activo de la comunidad de Rails en España y publica periódicamente en su web http://www.inwebwetrust.net','http://www.inwebwetrust.net','ferblape@gmail.com','fernando_blat.png',NULL),(19,'Juan','Gallego Galisteo','Miembro de la tripulación de Flowers in Space: empresa especializada en la programación de aplicaciones web en Ruby on Rails. Se dedican a proyectos web con nuevas metodologías y herramientas.','http://www.flowersinspace.com','juan.gallego.iv@gmail.com','juan_gallego_galisteo.jpg',NULL),(20,'Miguel Ángel','Martínez Triviño','Miembro de la tripulación de Flowers in Space: empresa especializada en la programación de aplicaciones web en Ruby on Rails. Se dedican a proyectos web con nuevas metodologías y herramientas.','http://www.flowersinspace.com','miguelangel@flowersinspace.com','miguel_angel_martinez_trivino.jpg',NULL),(21,'Eduardo J.','Fernández Corrales','Miembro de la tripulación de Flowers in Space: empresa especializada en la programación de aplicaciones web en Ruby on Rails. Se dedican a proyectos web con nuevas metodologías y herramientas.','http://www.flowersinspace.com','eduardo.fernandez@gmail.com','eduardo_fernandez_corrales.jpg',NULL),(22,'Daniel','Escribano Alés','Miembro de la tripulación de Flowers in Space: empresa especializada en la programación de aplicaciones web en Ruby on Rails. Se dedican a proyectos web con nuevas metodologías y herramientas.','http://www.flowersinspace.com','dani55555@gmail.com','daniel_escribano.jpg',NULL),(23,'Cloves','Carneiro Jr','Cloves Carneiro Jr. is a software engineer and web application developer with ten years of programming experience. Shortly after its release, he embraced the Ruby on Rails platform and philosophy as his primary tool for building web applications. Cloves owns and runs SpinBits, a Ruby on Rails consulting and training company, which has clients around the world, and has recently launched \'Beginning Rails\' for Apress, a Rails book for beginners.\r\n\r\nBorn in Brazil and living for some years in Canada, he now lives in Dubai, United Arab Emirates, with his wife Jane. You can read more about him in his blog at http://ccjr.name.','http://spinbits.com','ccjr@spinbits.com',NULL,NULL),(24,'David','Barral','David Barral es socio fundador de Trabe Soluciones (trabesoluciones.com), empresa que ofrece servicios de desarrollo, consultoría y formación en Tecnologías de la Información. Desde su nacimiento Trabe desarrolla sus proyectos utilizando Ruby on Rails.','http://www.trabesoluciones.com','david.barral@trabesoluciones.com','david_barral.jpg',NULL),(25,'Javier','Ramírez','Javier Ramírez trabaja en http://www.aspgems.com desarrollando aplicaciones Rails.\r\n\r\nDicen por ahí que anda escribiendo el libro \"RoR made Easy with Aptana RADRails\" para Packt Publishing, pero habrá que esperarse a 2008 para ver si es verdad.\r\n\r\nCree recordar que en sus años mozos fue cofundador de una empresa de desarrollo, y ocupó los puestos de consultor, jefe de proyecto y arquitecto software principalmente en entornos corporativos con J2EE.\r\n\r\nTambién se ha dedicado a dar clases de varias cosas, entre ellas Java, Ingeniería del Software y Robótica.','http://formatinternet.wordpress.com','supercoco9@gmail.com','javier_ramirez.jpg',NULL),(26,'Javier','Vidal Postigo','Javier Vidal Postigo lleva más de 10 años trabajando como freelance especializado en sistemas solaris y linux. Hace un par de años decidió aprender a fondo un lenguaje programación con el que fuera divertido crear scripts. Buscando y comparando encontró ruby y rails. Desde entonces su vida no ha vuelto a ser la misma. Dedica todo el tiempo que puede al desarrollo de una aplicación de administración proactiva de sistemas solaris y tiene en el tintero varios projectos que algún día verán la luz.\r\n\r\n','http://javiervidal.net/','zanaguara@gmail.com','javier_vidal_postigo.png',NULL),(27,'Marcelino','Llano','','http://www.marze.es','info@marze.es','marcelino_llano.jpg',NULL),(28,'Álvaro','Ortiz','Multinstrumentista web desde hace 10 años. Development roadmapper & User Experience Monkey @ The Cocktail. Creando cosas como lacoctelera.com y The Shaker (gestor que propulsa las comunidades de El País, Cadena Ser, Vocento, Clarín, RTVE, MTV, Turner.','http://www.furilo.com','alvaro.ortiz@the-cocktail.com','alvaro_ortiz.jpg',NULL),(29,'Agustín','Cuenca','Agustín es el CEO y fundador de ASPgems empresa que ha sido creada y ha crecido entorno a Rails. Ha sido fundador de Qarana solutions, así como director general de varias empresas del sector de los servicios alrededor de las tecnologías de la información.','http://blog.loscuenca.com/','agustin@aspgems.com',NULL,NULL),(30,'Nieves','Pérez','Nieves Pérez es co-fundadora de BeRuby.com y directora de la compañía. Con anterioridad a este proyecto ha estado en Telefónica S.A (4 años en control de gestión y análisis de inversiones y 6 años en fusiones y adquisiciones). Además ha trabajado 2 años en Bear Stearns (Londres). Licenciada enCiencias Empresariales por la Universidad de La Laguna.','http://www.beruby.com','nieves@beruby.com','nieves_perez.jpg',NULL),(31,'David','Calavera Palacio','David Calavera trabaja como desarrollador en 11870.com. Además, es colaborador habitual en el desarrollo de Tractis.com y aporta su granito de arena a varios proyectos open source.','http://thinkincode.net','david.calavera@gmail.com','david_calavera.jpg',NULL),(32,'Jaime','Ortiz Soriano','Desde hace 2 años trabaja 3 dias por semana  en \"Semilla de Software libre\" (en la Fundacion IEPALA) y los otros 2 en las huertas del BAH!. En este tiempo ha descubierto el software libre motivo por el cual ha empezado a prestar atencion a la tecnologia. Rails (y las metodologias agiles) le interesan en la medida en que se le puede desbaratar algun negocio a alguna consultora grande (o no tan grande).','http://www.iepala.es','informatica3@iepala.es','jaime_ortiz.jpg',NULL),(33,'Jesús','Renero','','','jesus.renero@ericsson.com',NULL,NULL),(34,'Santiago','Pavón','','','santiago@dit.upm.es',NULL,NULL),(35,'Juan','Quemada','Juan Quemada es catedrático del Dpto. de Ing. de Sistemas Telemáticos (DIT: http://www.dit.upm.es/) de la ETSI de Telecomunicación de la Universidad Politécnica de Madrid. Es representante de UPM en el World Wide Web Consortium (http://www.w3.org/), director de la Cátedrá Telefónica en UPM para Internet NG (http://internetng.dit.upm.es/) y responsable del grupo del mismo nombre (Internet NG) que ha desarrollado entre otros la aplicación Isabel (http://isabel.dit.upm.es/). Su actividad docente e investigadora se centra últimamente en tecnologías para desarrollo ágil como Ruby on Rails, con la que se están desarrollando en su grupo múltiples aplicaciones de colaboración, así como un curso de diseño de sistemas REST con RoR. Es promotor junto con otros profesores del Dpto de la empresa Agora Systems S.A. (http://www.agora-2000.com/) creada dentro del programa de empresas tecnológicas de UPM.','http://greco.dit.upm.es/~quemada/index1.html','jquemada@dit.upm.es','juan_quemada.jpg',NULL),(36,'Joaquín','Salvachúa','Joaquín Salvachúa es profesor titular de la E.T.S.I. de Telecomunicación de la Universidad Politécnica de Madrid, dentro del departamento de Ingeniería de Sistemas Telemáticos (DIT). Su labor docente se centra en el desarrollo de protocolos y servicios para Internet. Su labor de investigación esta relacionado con P2P, protocolos multimedia distribuidos, Redes sociales, así como la aplicación de todos estos temas a teleeducación y otras aplicaciones colaborativas, así como el mundo del teleco 2.0.','http://dit.upm.es/~jsr/','jsr@dit.upm.es','joaquin_salvachua.png',NULL),(37,'Fernando','Padrón Torres','Director de Zero Computing México. Zero Computing es una Empresa Italiana especialista en aplicaciones web RIA.','http://www.zerocomputing.it','fernando@zero.it','fernando_padron.jpg',NULL),(38,'Alberto','Romero','Alberto Romero lleva años trabajando en las primeras etapas de la creación de websites, desde el diseño hasta los estándares web. \r\nActualmente trabaja en DNX como diseñador de interacción y escribe con una irregularidad pasmante en su blog, denegro.com.','http://denegro.com','denegro@gmail.com','alberto_romero.jpg',NULL),(39,'Manuel','Moreno Muñoz','Director Técnico de Noaris y responsable del desarrollo Eurekka','http://www.noaris.com','','manuel_moreno_munoz.png',NULL),(40,'Jaime','Portuondo Aguirre','Responsable de Eurekka.es\r\nwww.eurekka.es ','http://www.portuondo.es','',NULL,NULL),(41,'David','López','David es el director técnico de Vorago, una empresa joven, que se dedica al desarrollo de soluciones basadas en la web. De formación es matemático, se define como uno de esos ocupas que quita el sitio a los verdaderos informáticos. Así lleva unos 7 años dedicado a la informática, tiempo en el que ha ido creciendo con una empresa de origen familiar: Dicampus (origen de Vorago). En Vorago han apostado por basar todos sus desarrollos en Ruby on Rails, y asi han ido desarrollando un buen producto: Voranet. En la conferencia explicará el qué, el cómo y el por qué de Voranet y mostrará los resultados obtenidos.','http://www.vorago.es','david.lopez@vorago.es','david_lopez.jpg',NULL),(42,'Pablo A.','Delgado','Actualmente es ingeniero de software senior en New Bamboo Web Development Ltd. en Londres (http://www.new-bamboo.co.uk), estudia matematicas en la Universidad de Londres y trabaja en temas como statistical machine learning. Previamente trabajó en Terra Networks Espana, como jefe de proyectos del area de desarrollo. Utiliza Ruby desde el 2003/2004 y Rails framework desde el 2005.','http://blog.nbwd.co.uk/','pablete@gmail.com','pablo_a_delgado.jpg',NULL),(43,'Svet','Ivantchev','Svet Ivantchev es cofundador y CEO de la empresa eFaber que desde el año 2000 ofrece servicios de consultoría y desarrollo basado en software libre. Como desarrollador ha trabajado con varias plataformas desde C, Assembler y Clipper pasando por PHP (cuando se llamaba PHP/FI) hasta era fan de Java en 1997. Actualmente una de sus funciones en eFaber es la vigilancia de tecnologías que pueden ser de  \r\ninterés para la empresa y sus clientes.\r\n\r\nEn su \"vida anterior\" fue físico y trabajaba en el campo de teoría de grupos y la física computacional.','http://www.efaber.net/','svet@efaber.net','svet_ivantchev.jpg',NULL),(44,'Amaia','Castro','Amaia es ingeniera en informática y cofundadora de Dabne Tecnologías de la Información (http://www.dabne.net), donde se dedica al desarrollo de aplicaciones web con Rails.','http://apuntesderails.amaiac.net','amaia@dabne.net','foto1.jpg',NULL),(45,'Carolina','García Cataño','Carolina es cofundadora de Dabne Tecnologías de la Información (www.dabne.net) y desarrolladora Rails, entre otras cosas.','http://blog.dabne.net','carolina@dabne.net',NULL,NULL),(46,'Juanjo','Bazán','Desarrollador web y profesor de informática, usa Rails para trabajar y colaborar en distintos proyectos para <a href=\"http://www.cafelink.es\">Cafelink</a>, <a href=\"http://www.ameets.com\">Ameets</a>  <a href=\"http://www.tractis.com\">Tractis</a>. Es miembro de la organización de la Conferencia Rails, aunque en realidad lo que quiso ser siempre es astronauta.','http://www.juanjobazan.com','jjbazan@cafelink.es','juanjo.jpg',NULL),(47,'Luis','Villa','Luis Villa, nacido y criado en la web, es Responsable de Experiencia de Usuario en The Cocktail, cargo que ha desempeñado con anterioridad en Capgemini y Netjuice. Su objetivo, hacer un mundo mejor poniendo la tecnología al servicio de las personas. Ha trabajado para empresas en sectores como media, banca, seguros, telecomunicaciones, media o energía. Ha cofundado alzado.org, sitio dedicado a promover el intercambio de experiencias entre profesionales de la usabilidad, accesibilidad y experiencia de usuario.','http://www.grancomo.com','lvilla@grancomo.com','luis_villa.png',NULL),(48,'Santiago','Bel Rafecas','En su vida anterior, antes de Ruby on Rails y la web 2.0, trabajó como ingeniero informático en proyectos de investigación para la Universidad Politécnica de Catalunya y la Universidad Aristóteles de Salónica. Ahora felizmente casado con la Ruby engendra proyectos innovadores, se declara como un emprendedor anónimo y es cofundador de una consultora web llamada bee.com.es.\r\n\r\nPresentó junto a Sergio Espeja la charla \"Making Rails more (Artificially) Intelligent\" en la pasada RailsConf Europe 2007, no se durmieron muchos...','hhttp://www.santiagobel.com/','santiago.bel@gmail.com',NULL,NULL),(49,'Obie','Fernandez','Obie Fernandez es autor de \"The Rails Way\", la guia definitiva para el desarrollo con Ruby on Rails. Obie es el CTO de HashRocket, una boutique de consultoría y desarrollo de productos radicada en Jacksonville Beach, Florida, USA.\r\n\r\nCon mas de 12 años de experiencia como desarrollador, Obie trabajó en ThougthWorks como consultor senior especializado en desarrollo de aplicaciones empresariales complejas.\r\n\r\nObie es uno de los pioneros de Ruby on Rails, escribe un blog muy popular y contribuye habitualmente al podcast Ruby on Rails; es también el editor para la comunidad Ruby en infoq.com,  uno de los portales mas relevantes del mundo de la tecnología.','http://obiefernandez.com/','obiefernandez@gmail.com','obie_fernandez.jpg',NULL),(50,'Marcos','Sánchez Provencio','Marcos Sánchez Provencio es usuario de Python desde la versión 1.4. Es, además, el mayor contribuidor a la traducción al castellano de la documentación de Python.\r\n\r\nEn la actualidad, trabaja en Burke, donde desarrolla un generador de aplicaciones de gestión (Gotta), que se utiliza en diversos organismos oficiales, y una aplicación GIS sobre Django de apoyo a la prevención y extinción de incendios forestales (SIMIF).\r\n\r\n\r\n','http://www.burke.es','rapto@arrakis.es','rapto100.png',NULL),(51,'Daniel','Ortega Segura','Daniel trabaja en Salenda desarrollando aplicaciones web 2.0 con\r\ntecnología Java EE: Struts 2, Spring 2, JPA, Dojo Toolkit.... Además,\r\nes instructor oficial de Sun Microsystems para el catálogo de cursos\r\nde Java. Daniel es también \"Sun Certified Programmer for the Java\r\nPlatform, 5.0\".','http://www.salenda.es','daniel.ortega@salenda.es',NULL,NULL),(52,'Alberto','Knapp Bjerén','CEO de The Cocktail y La Coctelera, ha trabajado para las principales empresas de España en la definición y desarrollo de nuevos productos y servicios digitales. Lleva toda la vida trabajando en nuevos y viejos medios. En TV diseñando programas, en Netjuice incubando startups y en Xfera definiendo nuevos productos y servicios móviles. Es profesor del Instituto de Empresa y del ISEM Fashion Business School, y editor del libro \"La Experiencia de Usuario\" publicado por Anaya.','http://www.the-mixer.net/','alberto@the-cocktail.com','alberto_knapp.jpg',NULL),(53,'Asís','García','Asís García es socio fundador de Trabe Soluciones (trabesoluciones.com), empresa que ofrece servicios de desarrollo, consultoría y formación en Tecnologías de la Información. Desde su nacimiento Trabe desarrolla sus proyectos utilizando Ruby on Rails.','http://www.trabesoluciones.com','','foto_asis.jpg',NULL),(54,'Lleïr','Borràs Metje','Lleïr Borràs trabaja en \"Click S.C.C.L.\" como desarrollador web en Ruby on Rails y Php además de como programador de dispositivos móviles y administrador de servidores y redes.','http://ntropia.blogspot.com/','lleir@hesperides.cat','Foto_1.jpg',NULL),(55,'Guillermo','García','Nace en Madrid en 1972. Es un freelance/autonomo y un seguidor y amante del software libre. Entre las actividades que desempeña habitualmente se encuentran funciones de dirección y coordinación de proyectos que se basan fundamentalmente en software libre.\r\n\r\nSe siente muy orgulloso de trabajar con software libre y en estos 10 últimos años haber participado en múltiples proyectos para migrar servidores de correo, web, dns, bases de datos, escritorios, etc a sistemas GNU/Linux.\r\n\r\nEn los últimos 2 años forma parte de varios proyectos basados en Ruby On Rails.','http://realidadfutura.com','ggarcia@realidadfutura.com','lunayguille2.jpg',NULL),(56,'Óscar','Berdejo','Es Ingeniero de Sistemas con 15 años de experiencia en Unix y Windows en entornos Productivos y de Gestión.\r\n\r\nHa trabajado siempre para que los Sistema Informáticos sean un beneficio para las empresas con criterios de Rentabilidad y en la búsqueda de Beneficios para los Procesos de Negocio.\r\n\r\nEn la Actualidad es Director de Avancesis, empresa joven que se está especializando en el desarrollo de ERP\'s en Rails y que han desarrollado un software de Contabilidad en Rails multidelegación y multiempresa que previsiblemente llegará liberado a la Conferencia Rails 2008.\r\n\r\nConviene destacar la Red de Profesionales que están montando en torno al Software de Contabilidad y los acuerdos que están alcanzando con diversas Asociaciones a nivel nacional y que serán algunos de los aspectos que nos contará en su ponencia.','http://www.avancesis.com','oberdejo@avancesis.com','OscarBerdejo.jpg',NULL),(57,'Carlos A.','Paramio','Carlos A. Paramio trabaja en <a href=\"http://rmbr.com/\">rmbr</a> como arquitecto de software y desarrollador en Ruby y Ruby on Rails, dedicado a la tarea de explotar al máximo los recursos que ofrecen las redes sociales mediante el funware o juegos casuales. Posee algo más de 2 años de experiencia con Ruby on Rails, más de 8 en el desarrollo de aplicaciones web, y casi toda su vida profesional en buscar soluciones para sistemas Unix open source o en impartir cursos de formación relacionados con todos estos temas. Su contribución más reciente al software libre ha sido publicar uno de los primeros módulos en dar soporte para observers (que puedan desactivarse) a Datamapper 0.9: <a href=\"http://github.com/carlosparamio/dm-observers\">dm-observers</a>.','http://www.evolve.st/articles','carlos@evolve.st','carlos_paramio.png',NULL),(58,'Guillermo','Álvarez','Madrileño del 83, empieza con inquietudes tecnológicas a los 16 cuando empieza a jugar con un 386 programandolo en Basic, C y ASM. Al seguir las inquietudes, se mete en el mundo de la electrónica y robótica habiendo participado en varios concursos nacionales. A día de hoy su tiempo lo dedica a proyectos de software y utiliza como principal lenguaje ruby y C, centrándose sobre todo en Merb. Ha dado charlas anteriormente en el HackLab de Vallekas (Kaslab) donde fue colaborador activo durante años, y donde empezó a conocer el mundo unix a través de *BSD y Linux.\r\n\r\nPese ha haber trabajado más de 3 años como comercial, a día de hoy su vida laboral se centra un 100% como desarrollador rails para la empresa La Coctelera Network S.L.','http://cientifico.net','guillermo@cientifico.net','guillermo_alvarez.jpg',NULL),(59,'Rafael','García','','www.aspgems.com','rgo@aspgems.com',NULL,NULL),(60,'Francesc','Esplugas','','','francesc.esplugas@gmail.com',NULL,NULL),(61,'Daniel','Blanco','','','',NULL,'trabaja en The Cocktail'),(62,'Luis','Bosque','','','',NULL,'Trabaja en The Cocktail'),(63,'Aitor','Garay-Romero','En una vida pasada trabajó como desarrollador de <a href=\"http://en.wikipedia.org/wiki/Embedded_system\">sistemas embebidos</a> tanto en desarrollo de software como de hardware, mayormente en temas de vídeo digital.  Ha trabajado en varias empresas, de esas que llaman de alta tecnología, en España, Alemania y finalmente en Austria.  Hace unos dos años abandonó el árido mundo del hardware y volvió a España para establecerse como consultor independiente.\r\n\r\nTiene gran interés por la web y está desarrollando su actividad profesional en este campo.  Actualmente es el desarrollador principal del proyecto \"b5map\" de la Diputación de Guipúzcoa, trabajo que compagina con proyectos menores de consultoría y de docencia en una escuela privada (todos en temas web).\r\n\r\nHace mucho tiempo que utiliza el lenguaje Ruby como herramienta de soporte para testing, generación de código (ERB también puede generar código ensamblador!), automatización de procesos… por lo que para él elegir Rails como framework de desarrollo web fue una decisión natural y muy acertada.','','yo@aitor.name',NULL,''),(64,'Carlos','Matesanz Rodríguez','Carlos tiene 27 años, estudió Ingeniería Informática Superior en la Universidad de Málaga y lleva casi dos años trabajando en el departamento de I+D+i de la Fundación Andaluza de Servicios Sociales. Ha desarrollado algunas herramientas de uso interno en RoR, siendo ésta que propone presentar la más importante. Laboralmente también está/ha estado involucrado en proyectos con Flash/Flex, Zope/CPS y actualmente algoritmos genéticos.\r\n\r\nEn lo personal además de informático es fotógrafo amateur, y saxofonista, aunque la informática sigue siendo su mayor hobby cuando llega a casa.','http://www.juntadeandalucia.es/fundaciondeserviciossociales ','carlos.matesanz@juntadeandalucia.es','foto.jpg','Departamento I+D+i Fundación Andaluza de Servicios Sociales.'),(65,'Antonio','Garrote Hernández','Antonio es ingeniero en informática, ha trabajado en empresas de tecnología e internet, como Telefónica I+D o The Cocktail y actualmente trabaja en Unkasoft como arquitecto de software, realizando nuevos desarrollos en nuestra tecnología “advergaming on the fly”.','http://lacoctelera.com/antoniogarrote','antoniogarrote@gmail.com','antonio_garrote.png',''),(66,'Diego','Moreno Naharro','Diego es un doctorando del Departamento de Ingeniería de sistemas Telemáticos (DIT) de la Universidad Politécnica de Madrid.','','dmoreno@dit.upm.es',NULL,''),(67,'Javier','Cerviño Arriba','','http://dit.upm.es','jcervino@dit.upm.es',NULL,''),(68,'Daniel','Gallego Vico','','http://dit.upm.es','dgallego@dit.upm.es',NULL,''),(69,'Rafael','García Marín','','http://dit.upm.es','rgmarin@dit.upm.es',NULL,''),(70,'Fernando','Echevarrieta','','','echeva@ideas4all.com',NULL,''),(71,'Phillip','Oertel','Senior Manager Engineering at Xing.com','http://www.xing.com/profile/Phillip_Oertel','phillip.oertel@xing.com',NULL,'');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores_charlas`
--

DROP TABLE IF EXISTS `autores_charlas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `autores_charlas` (
  `autor_id` int(11) default NULL,
  `charla_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `autores_charlas`
--

LOCK TABLES `autores_charlas` WRITE;
/*!40000 ALTER TABLE `autores_charlas` DISABLE KEYS */;
INSERT INTO `autores_charlas` VALUES (54,55),(31,56),(25,57),(16,58),(17,58),(18,58),(56,59),(55,60),(57,61),(10,62),(58,63),(14,64),(59,65),(13,66),(60,67),(61,68),(62,68),(63,69),(64,70),(65,71),(66,72),(67,73),(68,73),(69,73),(70,74),(17,75),(27,75),(39,75),(46,75),(47,75),(54,75),(62,75);
/*!40000 ALTER TABLE `autores_charlas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charlas`
--

DROP TABLE IF EXISTS `charlas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `charlas` (
  `id` int(11) NOT NULL auto_increment,
  `titulo` varchar(255) NOT NULL default '',
  `resumen` text NOT NULL,
  `fecha` datetime default NULL,
  `duracion` int(11) NOT NULL default '60',
  `sala_id` int(11) default NULL,
  `aprobada` tinyint(1) default '0',
  `confirmada` tinyint(1) default '0',
  `notas` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `charlas`
--

LOCK TABLES `charlas` WRITE;
/*!40000 ALTER TABLE `charlas` DISABLE KEYS */;
INSERT INTO `charlas` VALUES (55,'Caso de éxito: Hesperis.eu','Llevo un año más o menos programando un portal para trazabilidad agrícola donde agricultores y técnicos agrícolas intercambian tratamientos, recetas, notícias...\r\n\r\nHay interactuación con googlemaps, generación de pdf\'s y utilizo las librerias extjs.','2008-11-13 11:15:00',30,2,0,0,NULL),(56,'Integración continua y Rails','El proceso de integración de cualquier tipo de aplicación es algo que tiene que ser parte del día a día de un desarrollador. Por desgracia, muchas veces se cae en la confusión de pensar que este proceso no es más que ejecutar una batería de tests en un entorno controlado.\r\n\r\nMuchas de las bondades que tiene construir una aplicación con rails facilitan muchos de los pasos necesarios a la hora de integrar una aplicación. Esta charla pretende discutir por qué un proceso de Integración Continua es mucho más que ejecutar una serie de tests y por qué puede ser construido con un simple script de consola. Además, pretende mostrar todas las bondades que aportan tanto rails como muchas librerías escritas con ruby a la hora de crear todos estos procesos.','2008-11-13 11:15:00',60,1,0,0,NULL),(57,'Rails HOT or NOT','Antes de la charla pediré mediante la lista ror-es que la gente me envíe la lista de componentes (gemas/plugins) que considerían imprescindible para abordar un proyecto rails no trivial (con buscador, caché, versionado, testing, integración con RSS, quizás twitter/IM, envío de mails, procesos en background, ...). Clasificaré esas gemas por tipos y prepararé una presentación por parejas de plugins/gemas al estilo HOT or NOT.\r\n\r\nLos asistentes a la sesión tendrán un folio con dos colores (proporcionado a la entrada), y para cada pareja de opciones pediré que voten su favorito, haciendo una cuenta sobre la marcha para identificar al ganador. Además, pediré a una persona de \"cada bando\" que me cuente su experiencia y los puntos más interesantes de su elegido. Una vez acabada la conferencia publicaré el resultado de los plugins/gemas vencedores para afrontar un proyecto no trivial desde cero.\r\n\r\nLa idea es salir de la típica sesión puramente de tutorial y tratar de fomentar el debate y aprovechar el formato de conferencia.','2008-11-13 12:45:00',60,1,0,0,NULL),(58,'Caso de éxito: iwannagothere.net','iwannagothere.net es una guía on-line de lugares especiales dados de alta por usuarios de todo el mundo. Nación con el objetivo de proporcionar información de calidad a aquellas personas que quieran preparar un viaje, así como un lugar para compartir lugares en los que hemos estado. En esta presentación explicaremos cómo ha sido desarrollado el site, qué problemas hemos encontrado y cómo los hemos ido solucionando hasta llegar a ser lo que es hoy en día.','2008-11-13 11:45:00',30,2,0,0,NULL),(59,'Caso de éxito: contabilidad','Charla sobre caso de éxito en un proyecto de contabilidad desarrollada con rails:\r\n\r\n<ul>\r\n<li>El Estado de liberación del código. Previsiblemente para la fecha de la charla ya será Software Libre.</li>\r\n<li>Lo destacable de Nuestra Contabilidad y su posicionamiento en el mercado.</li>\r\n<li>La Red de Soporte. Contaremos como está la Red de Profesionales que estamos creando y que darán soporte tanto técnico como contable.</li>\r\n<li>El estado de la siguiente versión del Software de Contabilidad.</li>\r\n</ul>','2008-11-13 12:45:00',30,2,0,0,NULL),(60,'Virtualización + rails','Charla sobre como montar proyecto basados en rails en plataformas virtualizadas.\r\n\r\nLa charla esta dividida en 2 partes, una teórica y una práctica.\r\n\r\nPrimera parte:\r\n\r\nExplicación de que es la virtualizacion y sus ventajas.\r\nExplicación de que es rails y sus ventajas.\r\n\r\nSegunda parte:\r\n\r\nEjemplo de Instalación de 2 maquinas virtuales con debian + xen + nginx +\r\nmongrel_cluster + mysql + rails.\r\nEjemplo de movimiento de maquinas virtuales en tiempo real.\r\nEjemplo de alta disponibilidad con nginx.','2008-11-13 14:00:00',60,1,0,0,NULL),(61,'Despliegue de aplicaciones Rails (y cómo empezar fácilmente con Phusion Passenger)','En esta charla técnica se verán algunas de las opciones más usadas para el despliegue de aplicaciones con Ruby on Rails en distintos entornos (incluido Amazon EC2), para posteriormente contar al detalle una de las soluciones más sencillas con Phusion Passenger.\r\n\r\nPhusion Passenger (también conocido como mod_rails o mod_rack) es un módulo para el servidor web Apache, que facilita la puesta en marcha de un servidor de aplicaciones escritas en Ruby, y en especial, aplicaciones desarrolladas en Ruby on Rails. Además de disminuir el tiempo de despliegue de una nueva aplicación a un servidor (al ser extremadamente sencillo de configurar), también tiene un rendimiento parejo al ofrecido por mongrel, y en algunos casos incluso superior. Combinado opcionalmente con Ruby Enterprise Edition, es posible obtener ratios de uso de memoria menores de lo habitual en otro tipo de despliegues. Es, por ejemplo, una opción excelente para aplicaciones pequeñas en servidores compartidos,  al encargarse de forma automática del lanzamiento de nuevas instancias de las mismas según la carga aumenta bajo demanda, permitiendo así dedicar una mayor proporción de los recursos del servidor a la aplicación que más lo necesita en cada momento.','2008-11-13 16:15:00',60,1,0,0,NULL),(62,'Rails desde el código','En esta edición de \"Rails desde el código\" nos centraremos en Active Record. Veremos cómo está estructurada, cómo están implementados aspectos importantes de la librería como son los callbacks, las relaciones, las validaciones, los adaptadores, etc. A su vez, introduciremos los idiomas de Ruby o Active Support necesarios para comprender el código, y demás técnicas de programación Ruby en las que Active Record está basada.','2008-11-13 17:30:00',60,1,0,0,NULL),(63,'Sphinx','Sphinx (SQL Phrase Index) es un buscador sobre texto, que genera sus índices de simples consultas SQL. Sus prioridades han sido dar una buena calidad de resultados, de manera rápida, y minimizando el impacto en los recursos de la máquina, dando incluso posibilidad a su versión embebida.\r\n\r\nEn los últimos tiempos se ha puesto muy de moda debido a la falta de calidad de las alternativas como por ejemplo el uso FULL-TEXT SEARCH de mysql.\r\n\r\nEn la ponencia se hará una breve introducción a la tecnología, su instalación y la instalación de soporte para castellano, y se intentará explicar su implementación en rails así como usos no tan obvios de sphinx.','2008-11-14 11:15:00',60,1,0,0,NULL),(64,'Harder, Better, Faster, Stronger: Rendimiento en servidores de aplicaciones Rails','Durante el último año han aparecido varias alternativas a la hora de servir aplicaciones Ruby on Rails (rubinius, jruby, ebb, thin, evented_mongrel, glassfish, mod_rails).\r\n\r\nEsta ponencia tratará de dar a conocer las distintas opciones, analizar sus ventajas e inconvenientes y realizar una comparativa de rendimiento entre ellas, para poder finalmente discutir con los asistentes sobre la idoneidad de las diferentes soluciones en distintos casos de uso.','2008-11-14 12:45:00',60,1,0,0,NULL),(65,'Introducción a Capistrano','El objetivo de la ponencia sería presentar las bondades de capistrano, explicar su organización, como usarlo de una manera sencilla y a medida que avanzamos modificarlo un poco para que haga alguna cosa un poco mas complicada(deploy teniendo diferentes stages, sobreescribir alguna tarea,...). Y terminar mostrando algunos tips.\r\n\r\nLa charla será sobretodo práctica y de nivel básico (para salir de allí teniendo claro como hacer un deployment).','2008-08-29 13:07:00',60,1,0,0,NULL),(66,'Buenas prácticas de desarrollo en Ruby on Rails','Programar no es aprender un lenguaje y escribir en él. Junto con el propio lenguaje, hay un _acervo cultural_ acuñado en consenso (relativamente pacífico) por la comunidad que lo acompaña y que es lo que lo hace realmente útil. Un conjunto de técnicas y patrones que son consideradas por la comunidad como El Modo Correcto De Hacer Las Cosas (tm).\r\n\r\nEsto, válido para cualquier tecnología y lenguaje, es especialmente válido en Rails, por su condición de _opinionated_, y en su comunidad, por su casi legendaria obsesión por la belleza, la perfección y el pragmatismo.\r\n\r\nEn esta ponencia se tratará de hacer un repaso a las más importantes, y explicar tanto su uso como su razón de ser (por qué esta es la mejor manera de hacerlo), para evitar, por un lado, desaprovechar parte de la potencia de Rails (que sin duda se multiplica siguiendo estas buenas prácticas), y, por otro, caer en el _argumento de autoridad_ (esto es así porque lo dice Fulano).','2008-11-13 19:44:00',60,1,0,0,NULL),(67,'Typus','Harto de programar interficies administrativas para la aplicaciones Rails, pense que era buena idea saltar a Django (Python) ya que ellos me daban algo que Rails no, una buena interficie administrativa por defecto. El problema es que Django, es Python y a mi lo que me gustaba era programar con Ruby.\r\n\r\nAsí que con la experiencia de hacer interficies administrativas para los proyectos de mis clientes, la gran inspiración que cogí de Django decidí extraer poco a poco todas las funcionalidades que iba implementando hasta que finalmente lo extraje todo y nació el plugin Typus.\r\n\r\nMe marqué varios objetivos:\r\n\r\n- Que no dependiera de plugins externos para funcionar.\r\n- Que fuera muy flexible, de manera que se pudieran añadir funcionalidades extras sin tener que tocar el plugin.\r\n- Que el código fuera muy limpio de manera que cualquier persona pudiera enviar sus aportaciones.\r\n- Que la interficie por defecto fuera muy limpia de manera que a cualquier desarrollador o diseñador le gustar lo suficiente.\r\n- Que fuera fiable y estable.\r\n- Que fuera muy fácil de configurar.\r\n- Que tuviera un sistema de usuarios y roles muy sencillo pero potente.\r\n- Que no tocara la aplicación del usuario, de manera que fuera tan facil utilizarlo como poderlo dejar de usar.\r\n\r\n------------------------------------------------------------------------------\r\n\r\nEl código del plugin está disponible en GitHub bajo licencia MIT.\r\n\r\nhttp://github.com/fesplugas/typus/tree/master\r\n\r\nSe está realizando un refactor de algunas partes del plugin para poder hacer un release de una versión 1.0.','2008-11-13 19:56:00',60,1,0,0,NULL),(68,'Alto rendimiento y escalabilidad en plataformas Rails: Casos prácticos. Soluciones y trucos.','En esta charla pretendemos cubrir todos los aspectos relacionados con el rendimiento, estabilidad y escalabilidad de plataformas Rails con altos niveles de exigencia.\r\n\r\nPara reforzar esta exposición hablaremos de los síntomas que muestra una aplicación cuando necesita ser escalada y mostraremos trucos y mejoras, tanto a nivel de código como de sistemas, utilizadas en proyectos reales de cara a mantener el máximo rendimiento.','2008-11-13 11:00:00',60,1,0,0,'Quisiera pedirte un favor, sería posible dejar esta charla para el día jueves 13 de nov, en la jornada de la mañana? Es que para uno de los ponentes sería imposible asistir en otro horario, ya tenía un compromiso de antemano y justo se cruza con estas fechas.'),(69,'Caso de éxito: b5map: Maps on Rails','b5map es un proyecto de la IDEg (Departamento de Infraestructura de Datos Espaciales de Guipúzcoa), que pertenece a la diputación foral de Guipúzcoa.  La IDEg lleva muchos años obteniendo y almacenando datos geográficos de Guipúzcoa. <a href=\"http://b5m.gipuzkoa.net\">b5m</a> es su proyecto más conocido, una aplicación web de mapas que lleva más de 10 años online.  Su valor diferencial es la precisión y fiabilidad de una ingente cantidad de datos almacenados sobre la geografía Guipuzcoana.\r\n\r\nEl objetivo del proyecto b5map es crear una nueva serie de herramientas acordes a las tendencias actuales de la Web 2.0.    Esto incluye un nuevo portal web geográfico que en el futuro reemplazará al actual b5m y una API que permitirá a cualquier interesado el acceso a la gran cantidad de datos de la IDEg y utilizarlos en cualquier aplicación (web o no).  La API también permitirá configurar y embeber fácilmente mapas en una página (blog…).\r\n\r\nAparte de la precisión de los datos, un aspecto diferencial de b5map es la integración de datos de diferentes proveedores aparte de la IDEg, como Google Maps, Yahoo Maps o Microsoft Live Maps.','2008-09-11 12:35:00',60,1,0,0,''),(70,'Caso de éxito: Sistema de información multimedia para un call center de teleasistencia','Uno de los proyectos desarrollados en la Fundación Andaluza de Servicios Sociales, es la creación de un sistema de información multimedia basado en la instalación de televisores LCD y sistemas de sonido en las salas del Servicio Andaluz de Teleasistencia. En dichos televisores se muestra toda la información referente a la ocupación de las lineas, estadisticas, video en directo de las otras sedes, y alertas de emergencias entre otros. El sistema además de permitir la visualización de dicha información por las pantallas de sala, permite acceder a dicha información a través de web desde  cualquier ordenador de la sala. El sistema además cuenta con la funcionalidad suficiente como para configurar y parametrizar las distintas vistas de la información.\r\n\r\nEste sistema está implementado integramente en Ruby on Rails, la información de cada televisor se muestra en un navegador web a pantalla completa y se actualiza utilizando AJAX. Los más de 130,000 hits diarios que producen los televisores, más los producidos por los accesos desde PC son gestionados por un único servidor con Apache/mod_rails y un servidor de Base de Datos corriendo Postgresql.\r\n\r\nAlgunas de los plugins o gems que se han utilizado para la implementación son: daemons, Juggernaut, Json, EventMachine o FasterCSV.','2008-11-13 14:35:00',60,1,0,0,''),(71,'Caso de éxito: lecciones aprendidas en advergaming','En esta charla nos gustaría comentar brevemente las lecciones que hemos tenido que aprender en los últimos meses en nuestra empresa Unkasoft, durante el desarrollo de nuestra solución de advergaming, proceso en el que hemos tenido la oportunidad de experimentar  con distintas tecnologías relacionadas con Ruby y Rails, haciendo hincapié en como pueden servir de elemento transformador para una empresa tecnológica a distintos niveles: tecnológico, de ingeniería y organizacional.\r\n\r\nLos principales puntos que nos gustaría tratar son los siguientes:\r\n\r\n- Integración de Ruby con sistemas empresariales Java a través del uso de JRuby.\r\n- Desarrollo Ruby on Rails con JRuby: soluciones para el uso de gemas nativas, integración de bibliotecas Java, opciones de profiling, uso de Memcached, etc.\r\n- Opciones de despliegue de frameworks web sobre JRuby: contenedor de servlets, Mongrel y Glassfish V3 como alternativa a Mongrel.\r\n- Uso del framework de Minería de Datos Weka en aplicaciones web JRuby.\r\n- Desarrollo de API\'s REST con Merb como backend de clientes ricos ajax (Flex, Sproutcore), ventajas e inconvenientes frente a Rails.\r\n- RSpec como herramienta para la especificación y testing de aplicaciones Ruby y también Java.\r\n- Herramientas de integración continua multilenguaje: servidor de integración continua Hudson.\r\n- Uso de Ruby/JRuby junto a Python/Jython y Common Lisp, para convertir un sistema monolítico Java en un sistema scriptable más sencillo de desarrollar y mantener.\r\n- Extensiones de Capistrano para el despliegue de aplicaciones Merb, Java y ActionScript: uso de Capistrano junto a Sprouts, Apache Ant y Apache Maven.\r\n- Adaptación de un equipo de desarrollo Java al uso de lenguajes dinámicos y sus prácticas asociadas.\r\n\r\nPor último, comentar que aunque nuestra empresa no se dedica al desarrollo web propiamente dicho, creemos que nuestra experiencia puede ampliar el horizonte de los posibles usos de Ruby, y resultar así especialmente interesantes a un gran número de empresas que usan principalmente Java como plataforma de desarrollo y que buscan aumentar la productividad de sus equipos de desarrollo sin renunciar a la inversión ya realizada en tecnología.','2008-11-13 14:43:00',60,2,0,0,''),(72,'Workflows on Rails','Los flujos de trabajo o workflows son una herramienta perfecta para una plataforma web colaborativa. Constituyen el esqueleto que modela las interacciones entre usuarios. Además, permiten definir estas interacciones de forma extremadamente fácil, a través de un archivo XML o incluso un editor gráfico.\r\n\r\nEl proyecto de software libre Open Workflow Engine in Ruby (OpenWFEru) es un motor de workflow ofrecido como gema a la comunidad de RoR. En la ponencia se explicará como obtener las ventajas de trabajar con un un motor de workflow en un proyecto Rails a través de este motor Ruby. Se detallarán las distintas arquitecturas posibles y su puesta en funcionamiento.\r\n\r\nPara terminar, se ejemplificará con un proyecto en marcha de la Universidad Politécnica de Madrid para un entorno bancario. En él se hace un uso avanzado de la herramienta recurriendo a extensiones propias del lenguaje de workflow para la generación automática de vistas. Además, gracias a las interfaces REST, se ha conseguido un nuevo paradigma de usabilidad con la utilización de la tecnología Flex.','2008-11-13 14:47:00',60,1,0,0,''),(73,'Integrando Flex y Rails con ATOM','Actualmente, dentro del movimiento de la Web 2.0, se intentan conseguir nuevas cotas de usabilidad con interfaces de usuario cada vez más avanzados.\r\nComo es lógico, unir los mundos Flex y Rails resulta una solución muy interesante de cara a aprovechar las ventajas que proporciona cada lado: desarrollo ágil de Rails y un cliente que dispone de una interfaz mucho más novedosa que la que dan las aplicaciones tradicionales basadas en HTML/JavaScript.\r\n\r\nEl objetivo de esta charla es proponer el protocolo de publicación ATOM como una interfaz estándar con la que los dos mundos puedan comunicarse. Como es bien sabido, ATOM ya es un protocolo muy utilizado hoy en día en proyectos de gran envergadura y se ha introducido en las APIs de productos de empresas como Google. Por ello, se puede disponer de un gran número de extensiones que definen muchos recursos.\r\n\r\nFinalmente, explicaremos como hemos conseguido esta integración entre Flex y Rails con la ayuda de ATOM.','2008-09-15 18:39:00',60,1,0,0,''),(74,'Caso de éxito: Ideas4all.com: Al principio Rails no parecía una buena idea.','Ideas4all es una plataforma global creada para fomentar el intercambio y la coedición de ideas. Ideas4all inicialemnte iba a ser desarrollado en Java. Cuando RoR se planteo como opción al principio todo eran dudas. Ahora despues de unos meses de experiencia RoR ha demostrado flexibilidad y fiabilidad. En la ponencia contaremos lo que mas nos asustaba de Rails y las cosas que más nos han sorprendido.\r\n\r\nIdeas4all es un site funcionalmente muy rico. Contaremos brevemente la estrucutura de la aplicación, gemas, plugins y servicios de terceros integrados (Google Maps, Geonames, pasarela SMS...)','2008-09-16 11:41:00',60,1,0,0,''),(75,'XING.faster! Speeding up our site with frontend optimiziation','With more than 6.000.000 users and over 40.000 concurrent user sessions XING is on of the large and rapidly growing websites in Europe. In this talk, we’d like to share our experience in getting XING faster. This includes:\r\n                            \r\n                            - a brief overview of our architecture \r\n                            - why optimizing frontend performance has a huge potential \r\n                            - steps we\'ve taken, and the results\r\n                            - our experience with performance measurement tools \r\n                            - measurements beyond gomez \r\n                            - Rails\' out-of the box features to improve frontend performance\r\n                            \r\n                            The session will be held in english, but a spanish speaker will be on the presentation team.','2008-09-16 12:13:00',60,1,1,0,'');
/*!40000 ALTER TABLE `charlas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL auto_increment,
  `recipients` text,
  `from` varchar(255) default NULL,
  `subject` text,
  `sent_on` datetime default NULL,
  `body` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) default NULL,
  `apellido1` varchar(255) default NULL,
  `apellido2` varchar(255) default NULL,
  `telefono` varchar(255) default NULL,
  `empresa` varchar(255) default NULL,
  `url_empresa` varchar(255) default NULL,
  `titulo_blog` varchar(255) default NULL,
  `url_blog` varchar(255) default NULL,
  `cena` tinyint(1) default NULL,
  `publico` tinyint(1) default NULL,
  `usuario_id` int(11) default NULL,
  `facturacion` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'organizacion','conferencia rails','','','','','','',0,0,1,''),(2,'javier','ramirez','','655819687','aspgems','http://www.aspgems.com','format internet','http://formatinternet.wordpress.com',1,1,2,'javier ramirez gomara\r\n25465828K\r\nJulia Mediavilla 37 3Izquierda\r\n28053 Madrid'),(3,'Jaime','Iniesta','Alemán','658513170','Railes.net','http://www.railes.net','Jaime Iniesta - Programador freelance','http://www.jaimeiniesta.com',1,1,3,'NIF: 17728733-B\r\nDirección: Avda. Lluis Pericot, 49-51, 1º 6ª'),(4,'Javier','Vidal','Postigo','609747571','Javier Vidal Postigo','http://javiervidal.net/','Javier Vidal Postigo','http://javiervidal.net/',0,1,4,'Javier Vidal Postigo\r\nC/ Bahía de Algeciras, 1 P3 - 3B\r\n28033 Madrid'),(5,'Amaia','Castro','','606853030','Dabne Tecnologías de la Información','http://www.dabne.net','Apuntes de Rails','http://apuntesderails.amaiac.net',1,1,5,'Dabne Tecnologías de la Información\r\nc/ Los Madrazo, 16 - 3º 4\r\n28014 Madrid\r\nCIF: F-84291905'),(6,'Fernando','Guillen','','','mi empresa','http://fernandoguillen.info','mi blog','http://fernandoguillen.info',1,1,6,'');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'organizador'),(3,'asistente'),(4,'ponente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `roles_usuarios` (
  `role_id` int(11) default NULL,
  `usuario_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (3,1),(1,1),(3,2),(1,2),(2,2),(3,3),(3,4),(3,5),(3,6),(1,6);
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `salas` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,'1'),(2,'2');
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_info`
--

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
INSERT INTO `schema_info` VALUES (10);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifas`
--

DROP TABLE IF EXISTS `tarifas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tarifas` (
  `id` int(11) NOT NULL auto_increment,
  `importe` int(11) default NULL,
  `actual` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tarifas`
--

LOCK TABLES `tarifas` WRITE;
/*!40000 ALTER TABLE `tarifas` DISABLE KEYS */;
INSERT INTO `tarifas` VALUES (1,0,1);
/*!40000 ALTER TABLE `tarifas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `activation_code` varchar(40) default NULL,
  `activated_at` datetime default NULL,
  `password_reset_code` varchar(40) default NULL,
  `password_reseted_at` datetime default NULL,
  `pagado_at` datetime default NULL,
  `tarifa_id` int(11) default NULL,
  `pagado_cena_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'organizador','supercoco9@gmail.com','88ea590f3516d8a97b9c9f95ccb9ac8645f07a09','639de8282c3474d76dc58e201ced337fc181a78a','2008-07-19 00:21:57','2008-07-19 00:30:26',NULL,NULL,NULL,'2008-07-18 22:24:20',NULL,NULL,NULL,1,NULL),(2,'javier','javier.ramirez.gomara@gmail.com','09c84d05cde445498bf1b8c7b9a06403f5617588','247abca3953b307d235fd8dc1c95ed4b1d26c6a5','2008-07-19 00:31:53','2008-07-19 00:34:58',NULL,NULL,NULL,'2008-07-18 22:32:11',NULL,NULL,NULL,1,NULL),(3,'jaimeiniesta','jaimeiniesta@gmail.com','e8814d12eac71f4ea9977906f66d40220afbe9c2','2564a3ced571eca74da6a8536e7b49b34de56290','2008-08-02 21:09:20','2008-08-02 21:10:33',NULL,NULL,NULL,'2008-08-02 19:10:33',NULL,NULL,NULL,1,NULL),(4,'zanaguara','zanaguara@gmail.com','1a893f55b52f7d0714de880a6bf6e359b0ce6205','0a1f60c7a8eae4e9b9ff3fe0b5526ff310f3896b','2008-08-04 10:21:00','2008-08-04 10:22:04',NULL,NULL,NULL,'2008-08-04 08:22:04',NULL,NULL,NULL,1,NULL),(5,'amaia','amaia@dabne.net','ce17b7db2df46213e9cf779ff8384d503a82b59e','21343c0c81c2d46c39546dddcd8a3ca53811d5f6','2008-08-04 17:47:11','2008-08-04 17:48:23',NULL,NULL,NULL,'2008-08-04 15:48:04',NULL,NULL,NULL,1,NULL),(6,'fguillen','fguillen.mail@gmail.com','4bd032f4523068c3ae0cbefd8ad083838065bca5','4dccbd050beb674d351d086e46c780120fae24be','2008-09-22 18:20:38','2008-09-22 18:37:42',NULL,NULL,NULL,'2008-09-22 16:20:55',NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-09-23 15:42:42
