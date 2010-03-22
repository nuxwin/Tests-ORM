-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `tests_orm`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `hook` longtext NOT NULL,
  `text` longtext NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `title`, `hook`, `text`, `is_published`, `create_date`, `update_date`) VALUES
(1, 'Cr&eacute;ation d\\''un WebService avec Talend Open Studio', '&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;img title=\\&quot;Talend Open Studio\\&quot; alt=\\&quot;Talend Open Studio\\&quot; src=\\&quot;/uploads/talend/tos3.0.0.png\\&quot; /&gt;&lt;/p&gt;\r\n&lt;p&gt;Talend Open Studio est un ETL (&lt;strong&gt;E&lt;/strong&gt;xtract &lt;strong&gt;T&lt;/strong&gt;ransform &lt;strong&gt;L&lt;/strong&gt;oad). Autrement dit, c\\''est un middleware qui permet de manipuler des donn&amp;eacute;es. C\\''est une solution d\\''int&amp;eacute;gration de donn&amp;eacute;es gratuite et tr&amp;egrave;s performante.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Son interface reprend l\\''interface d\\''Eclipse. Il permet de g&amp;eacute;n&amp;eacute;rer du code Java ou Perl, et cela sans m&amp;ecirc;me conna&amp;icirc;tre ces langages. En effet tout se fait &amp;agrave; la souris, il suffit de placer les &amp;eacute;l&amp;eacute;ments &amp;agrave; notre disposition et de les lier entre eux.&lt;/p&gt;', '&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;img title=\\&quot;Talend Open Studio\\&quot; alt=\\&quot;Talend Open Studio\\&quot; src=\\&quot;/uploads/talend/tos3.0.0.png\\&quot; /&gt;&lt;/p&gt;\r\n&lt;p&gt;Talend Open Studio est un ETL (&lt;strong&gt;E&lt;/strong&gt;xtract &lt;strong&gt;T&lt;/strong&gt;ransform &lt;strong&gt;L&lt;/strong&gt;oad). Autrement dit, c\\''est un middleware qui permet de manipuler des donn&amp;eacute;es. C\\''est une solution d\\''int&amp;eacute;gration de donn&amp;eacute;es gratuite et tr&amp;egrave;s performante.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Son interface reprend l\\''interface d\\''Eclipse. Il permet de g&amp;eacute;n&amp;eacute;rer du code Java ou Perl, et cela sans m&amp;ecirc;me conna&amp;icirc;tre ces langages. En effet tout se fait &amp;agrave; la souris, il suffit de placer les &amp;eacute;l&amp;eacute;ments &amp;agrave; notre disposition et de les lier entre eux.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Voil&amp;agrave; l\\''environnement &amp;agrave; notre disposition :&lt;/p&gt;\r\n&lt;p&gt;&lt;a href=\\&quot;/uploads/talend/talend_env.png\\&quot; rel=\\&quot;lightbox\\&quot; title=\\&quot;Environnement Talend Open Studio\\&quot;&gt;&lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;&lt;img height=\\&quot;340\\&quot; width=\\&quot;630\\&quot; title=\\&quot;Talend Open Studio - Environnement\\&quot; alt=\\&quot;Talend Open Studio - Environnement\\&quot; src=\\&quot;/uploads/talend/talend_env.png\\&quot; /&gt;&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;On manipule un flux avec une ou plusieurs entr&amp;eacute;es et la m&amp;ecirc;me chose pour les sorties. L\\''interface est agr&amp;eacute;able, on peut rajouter notre propre code, nos propres librairies et les &amp;eacute;l&amp;eacute;ments &amp;agrave; notre disposition sont nombreux.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h3&gt;Cr&amp;eacute;ation d\\''un WebService&lt;/h3&gt;\r\n&lt;p&gt;Gr&amp;acirc;ce &amp;agrave; Talend Open Studio le d&amp;eacute;veloppement d\\''un WebService devient simpliste. Pour exemple, prenons un WebService qui &amp;eacute;crit ce qu\\''il re&amp;ccedil;oit dans un fichier XML.&lt;/p&gt;\r\n&lt;p&gt;On commence par &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;cr&amp;eacute;er un nouveau projet en local&lt;/span&gt;, donner le nom &lt;em&gt;WebService &lt;/em&gt;et choisir le langage &lt;em&gt;Java&lt;/em&gt;. Dans la partie gauche de l\\''IDE, on clique-droit sur &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;Job Designs&lt;/span&gt; pour &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;cr&amp;eacute;er un job&lt;/span&gt;. On nomme ce job &lt;em&gt;saveXML&lt;/em&gt;.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;img title=\\&quot;R&amp;eacute;f&amp;eacute;renciel Talend Open Studio\\&quot; alt=\\&quot;R&amp;eacute;f&amp;eacute;renciel Talend Open Studio\\&quot; src=\\&quot;/uploads/talend/referenciel.png\\&quot; /&gt;&lt;/p&gt;\r\n&lt;p&gt;On commence par cr&amp;eacute;er l\\''&amp;eacute;l&amp;eacute;ment d\\''entr&amp;eacute;e qui est un &lt;strong&gt;tFixedFlowInput&lt;/strong&gt;. On le glisse dans la zone de dessin :&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;img title=\\&quot;tFixedFlowInput Element\\&quot; alt=\\&quot;tFixedFlowInput Element\\&quot; src=\\&quot;/uploads/talend/tfixedflowinput.png\\&quot; /&gt;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;On cr&amp;eacute;e maintenant notre sortie, un &lt;strong&gt;tFileOutputXML&lt;/strong&gt;. La base de notre WebService est pos&amp;eacute;e, il faut maintenant le configurer.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Dans l\\''onglet &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;Contexts&lt;/span&gt; on ajoute une variable &lt;em&gt;value &lt;/em&gt;:&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;a href=\\&quot;/uploads/talend/onglet_contexts.png\\&quot; rel=\\&quot;lightbox\\&quot; title=\\&quot;Onglet Contexts\\&quot;&gt;&lt;img height=\\&quot;166\\&quot; width=\\&quot;650\\&quot; title=\\&quot;Onglet Contexts\\&quot; alt=\\&quot;Onglet Contexts\\&quot; src=\\&quot;/uploads/talend/onglet_contexts.png\\&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;C\\''est cette variable que nous allons modifier en invoquant le WebService. Maintenant on s&amp;eacute;lectionne l\\''&amp;eacute;l&amp;eacute;ment &lt;strong&gt;tFixedFlowInput&lt;/strong&gt; et on va modifier ses param&amp;egrave;tres dans l\\''onglet &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;Component&lt;/span&gt;. Il s\\''agit d\\''ajouter l\\''attribut &lt;em&gt;value &lt;/em&gt;de type &lt;em&gt;String &lt;/em&gt;&amp;agrave; notre sch&amp;eacute;ma en l\\''&amp;eacute;ditant (1) puis de lui attribuer la valeur du contexte (2) :&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;a href=\\&quot;/uploads/talend/parametre_tfixedflowinput.png\\&quot; rel=\\&quot;lightbox\\&quot; title=\\&quot;Param&amp;egrave;tres tFixedFlowInput\\&quot;&gt;&lt;img height=\\&quot;188\\&quot; width=\\&quot;630\\&quot; title=\\&quot;Param&amp;egrave;tres tFixedFlowInput\\&quot; alt=\\&quot;Param&amp;egrave;tres tFixedFlowInput\\&quot; src=\\&quot;/uploads/talend/parametre_tfixedflowinput.png\\&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Notre point d\\''entr&amp;eacute;e est configur&amp;eacute;, il reste &amp;agrave; le relier &amp;agrave; notre point de sortie. Pour cela :&lt;/p&gt;\r\n&lt;p&gt;&lt;em&gt;Clique-droit sur l\\''&amp;eacute;l&amp;eacute;ment tFixedFlowInput &amp;gt; Ligne &amp;gt; Principal&lt;/em&gt;&lt;/p&gt;\r\n&lt;p&gt;Et on s&amp;eacute;lectionne notre &lt;strong&gt;tFileOutputXML&lt;/strong&gt;. On obtient ceci :&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;img title=\\&quot;Job Designer - WebService\\&quot; alt=\\&quot;Job Designer - WebService\\&quot; src=\\&quot;/uploads/talend/job_complet.png\\&quot; /&gt;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Maintenant il s\\''agit de configurer le &lt;strong&gt;tFileOutputXML&lt;/strong&gt;. Pour cela, on &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;synchronise les colonnes&lt;/span&gt; dans l\\''onglet &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;Component&lt;/span&gt; (1), on indique le chemin du fichier de sortie (2) et on change le &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;row tag&lt;/span&gt; (3) qui correspond au nom de la balise qui encadrera notre &lt;em&gt;value &lt;/em&gt;:&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;a href=\\&quot;/uploads/talend/parametre_tfileoutputxml.png\\&quot; rel=\\&quot;lightbox\\&quot; title=\\&quot;Param&amp;egrave;tres tFileOutputXML\\&quot;&gt;&lt;img height=\\&quot;188\\&quot; width=\\&quot;630\\&quot; title=\\&quot;Param&amp;egrave;tres tFileOutputXML\\&quot; alt=\\&quot;Param&amp;egrave;tres tFileOutputXML\\&quot; src=\\&quot;/uploads/talend/parametre_tfileoutputxml.png\\&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Le WebService est cr&amp;eacute;&amp;eacute;, on peut l\\''ex&amp;eacute;cuter dans l\\''onglet pr&amp;eacute;vu &amp;agrave; cet effet. On doit obtenir une sortie de ce genre :&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&lt;span style=\\&quot;color: rgb(0, 0, 255);\\&quot;&gt;D&amp;eacute;marrage du jobsaveXML a 18:16 13/04/2009.&lt;br /&gt;\r\nJob saveXML termin&amp;eacute; &amp;agrave; 18:16 13/04/2009. [Code sortie=0]&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Cette ex&amp;eacute;cution a g&amp;eacute;n&amp;eacute;r&amp;eacute; le fichier XML suivant :&lt;/p&gt;\r\n&lt;pre class=\\&quot;brush:xhtml\\&quot;&gt;\r\n&amp;lt;?xml version=&amp;quot;1.0&amp;quot; encoding=&amp;quot;ISO-8859-15&amp;quot;?&amp;gt;\r\n&amp;lt;root&amp;gt;\r\n&amp;lt;Value&amp;gt;\r\n&amp;lt;value&amp;gt;null&amp;lt;/value&amp;gt;\r\n&amp;lt;/Value&amp;gt;\r\n&amp;lt;/root&amp;gt;&lt;/pre&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Pour d&amp;eacute;ployer ce job en WebService, il faut l\\''exporter :&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&lt;em&gt;Clique-droit sur le job &amp;gt; Export Job Scripts&lt;/em&gt;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;On choisit le type d\\''export &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;Axis Webservice (WAR)&lt;/span&gt;, on d&amp;eacute;finit le chemin de l\\''archive et on clique sur &lt;span style=\\&quot;text-decoration: underline;\\&quot;&gt;Finish&lt;/span&gt;. On obtient une archive WAR que l\\''on peut d&amp;eacute;ployer sur un serveur Tomcat ou JBoss par exemple.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Le fichier WSDL est disponible &amp;agrave; l\\''adresse &lt;strong&gt;saveXML_0.1/wsdl/saveXML.wsdl&lt;/strong&gt; et le service est disponible &amp;agrave; l\\''adresse &lt;strong&gt;saveXML_0.1/services/saveXML&lt;/strong&gt;.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h3 style=\\&quot;text-align: left;\\&quot;&gt;Invocation du service&lt;/h3&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Pour cr&amp;eacute;er le client, on peut utiliser Eclipse coupl&amp;eacute; au plugin WTP, g&amp;eacute;n&amp;eacute;rer un squelette et &amp;eacute;crire notre client. Pour information, il faudra invoquer la m&amp;eacute;thode &lt;em&gt;jobRun() &lt;/em&gt;et passer l\\''argument de la forme : &lt;em&gt;--context_param value=xxxxx&lt;/em&gt;.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h3 style=\\&quot;text-align: left;\\&quot;&gt;Aller plus loin&lt;/h3&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Pour am&amp;eacute;liorer ce WebService, on peut tenter de passer des objets. Pour cela, on rajoutera une serialisation de l\\''objet, suivi d\\''un encodage en base64 c&amp;ocirc;t&amp;eacute; client, et l\\''inverse c&amp;ocirc;t&amp;eacute; WebService. Dans Talend, il suffira d\\''ajouter un &amp;eacute;l&amp;eacute;ment &lt;strong&gt;tJavaRow&lt;/strong&gt; entre nos deux &amp;eacute;l&amp;eacute;ments.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;On travaillera avec deux valeurs :&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;- un &lt;em&gt;input_row.value&lt;/em&gt; qui proviendra du tFixedFlowInput et qui sera de type String.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;- un &lt;em&gt;output_row.value&lt;/em&gt; qui sera de type Object et qui repr&amp;eacute;sentera notre objet d&amp;eacute;s&amp;eacute;rialis&amp;eacute; en sortie.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;L\\''important est d\\''utiliser le m&amp;ecirc;me processus de s&amp;eacute;rialisation/d&amp;eacute;s&amp;eacute;rialisation.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Par la suite, on pourra acc&amp;eacute;der aux propri&amp;eacute;t&amp;eacute;s de l\\''objet avec une &lt;strong&gt;tMap&lt;/strong&gt;. Si l\\''objet est un objet Java courant, pas de probl&amp;egrave;me. Si l\\''objet nous est propre il faudra charger une librairie &amp;agrave; l\\''aide de l\\''&amp;eacute;l&amp;eacute;ment &lt;strong&gt;tLibrairyLoad&lt;/strong&gt;.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Une &lt;strong&gt;tMap &lt;/strong&gt;permet de transformer notre flux de donn&amp;eacute;es. Par exemple, d\\''un c&amp;ocirc;t&amp;eacute; nous aurons notre objet, et de l\\''autre ses propri&amp;eacute;t&amp;eacute;s. Sur l\\''exemple ci-dessous, la &lt;strong&gt;tMap &lt;/strong&gt;prend en entr&amp;eacute;e un objet &lt;em&gt;value &lt;/em&gt;(d&amp;eacute;s&amp;eacute;rialiser auparavant) et distribue en sortie ses propri&amp;eacute;t&amp;eacute;s &lt;em&gt;id &lt;/em&gt;et &lt;em&gt;type &lt;/em&gt;:&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: center;\\&quot;&gt;&lt;a href=\\&quot;/uploads/talend/tmap.png\\&quot; rel=\\&quot;lightbox\\&quot; title=\\&quot;Exemple de l\\''&amp;eacute;l&amp;eacute;ment tMap\\&quot;&gt;&lt;img height=\\&quot;375\\&quot; width=\\&quot;630\\&quot; title=\\&quot;Exemple de tMap\\&quot; alt=\\&quot;Exemple de tMap\\&quot; src=\\&quot;/uploads/talend/tmap.png\\&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;a href=\\&quot;/uploads/talend/ws_talend.png\\&quot; rel=\\&quot;lightbox\\&quot; title=\\&quot;Exemple plus &amp;eacute;labor&amp;eacute; d\\''un WebService\\&quot;&gt;&lt;img height=\\&quot;227\\&quot; width=\\&quot;630\\&quot; title=\\&quot;Exemple plus &amp;eacute;labor&amp;eacute; d\\''un WebService\\&quot; alt=\\&quot;Exemple plus &amp;eacute;labor&amp;eacute; d\\''un WebService\\&quot; src=\\&quot;/uploads/talend/ws_talend.png\\&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Talend Open Studio offre ainsi de nombreuses possibilit&amp;eacute;s.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h3 style=\\&quot;text-align: left;\\&quot;&gt;Pourquoi utiliser Talend Open Studio&lt;/h3&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Un WebService comme celui-ci est simple &amp;agrave; r&amp;eacute;aliser sous Eclipse + WTP, alors pourquoi se servir de Talend ?&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Une fois le job cr&amp;eacute;&amp;eacute;, je d&amp;eacute;cide de changer ma sortie XML en insertion en base de donn&amp;eacute;es, rien de plus simple, je supprime l\\''&amp;eacute;l&amp;eacute;ment &lt;strong&gt;tFileOutputRow &lt;/strong&gt;et je le remplace par l\\''&amp;eacute;l&amp;eacute;ment &lt;strong&gt;tMysqlOutput &lt;/strong&gt;(si le SGBD est MySQL). J\\''exporte de nouveau et c\\''est tout. Gain de temps non n&amp;eacute;gligeable, et simplicit&amp;eacute; ind&amp;eacute;gnable.&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=\\&quot;text-align: left;\\&quot;&gt;Talend Open Studio apporte beaucoup de solutions quant au traitement des donn&amp;eacute;es, il est tr&amp;egrave;s utilis&amp;eacute;, tr&amp;egrave;s performant, et en plus il est gratuit ! &lt;img title=\\&quot;Smile\\&quot; alt=\\&quot;Smile\\&quot; src=\\&quot;/js/tiny_mce/plugins/emotions/img/smiley-smile.gif\\&quot; class=\\&quot;emoticon\\&quot; /&gt;&lt;/p&gt;', 1, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `article_tag`
--

CREATE TABLE IF NOT EXISTS `article_tag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article_tag`
--


-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `commentaire`
--


-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tag`
--

