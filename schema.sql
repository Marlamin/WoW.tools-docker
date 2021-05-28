-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2021 at 02:24 PM
-- Server version: 10.3.27-MariaDB-1:10.3.27+maria~bionic-log
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casc`
--
CREATE DATABASE IF NOT EXISTS `casc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `casc`;

-- --------------------------------------------------------

--
-- Table structure for table `agent_buildconfig`
--

CREATE TABLE `agent_buildconfig` (
  `id` int(10) NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `product` varchar(40) DEFAULT NULL,
  `encoding` varchar(32) DEFAULT NULL,
  `encoding_cdn` varchar(32) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `root_cdn` varchar(32) DEFAULT NULL,
  `install` varchar(32) DEFAULT NULL,
  `install_cdn` varchar(32) DEFAULT NULL,
  `download` varchar(32) DEFAULT NULL,
  `download_cdn` varchar(32) DEFAULT NULL,
  `size` varchar(32) DEFAULT NULL,
  `size_cdn` varchar(32) DEFAULT NULL,
  `unarchived` longtext DEFAULT NULL,
  `unarchivedcount` int(20) NOT NULL DEFAULT 0,
  `unarchivedcomplete` int(20) NOT NULL DEFAULT 0,
  `patchconfig` varchar(32) DEFAULT NULL,
  `patch` varchar(32) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `complete` tinyint(1) NOT NULL DEFAULT 0,
  `builton` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agent_cdnconfig`
--

CREATE TABLE `agent_cdnconfig` (
  `id` int(20) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `archives` longtext DEFAULT NULL,
  `archivecount` int(5) NOT NULL DEFAULT 0,
  `archivecomplete` int(5) NOT NULL DEFAULT 0,
  `indexcomplete` int(5) NOT NULL DEFAULT 0,
  `patcharchives` longtext DEFAULT NULL,
  `patcharchivecount` int(5) NOT NULL DEFAULT 0,
  `patcharchivecomplete` int(5) NOT NULL DEFAULT 0,
  `patchindexcomplete` int(5) NOT NULL DEFAULT 0,
  `builds` longtext DEFAULT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agent_versions`
--

CREATE TABLE `agent_versions` (
  `id` int(10) NOT NULL,
  `buildconfig` varchar(32) DEFAULT NULL,
  `cdnconfig` varchar(32) DEFAULT NULL,
  `patchconfig` varchar(32) DEFAULT NULL,
  `product` varchar(40) DEFAULT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `catalogs_buildconfig`
--

CREATE TABLE `catalogs_buildconfig` (
  `id` int(10) NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `description` int(120) DEFAULT NULL,
  `product` varchar(40) DEFAULT NULL,
  `encoding` varchar(32) DEFAULT NULL,
  `encoding_cdn` varchar(32) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `root_cdn` varchar(32) DEFAULT NULL,
  `install` varchar(32) DEFAULT NULL,
  `install_cdn` varchar(32) DEFAULT NULL,
  `download` varchar(32) DEFAULT NULL,
  `download_cdn` varchar(32) DEFAULT NULL,
  `size` varchar(32) DEFAULT NULL,
  `size_cdn` varchar(32) DEFAULT NULL,
  `unarchived` longtext DEFAULT NULL,
  `unarchivedcount` int(20) NOT NULL DEFAULT 0,
  `unarchivedcomplete` int(20) NOT NULL DEFAULT 0,
  `complete` tinyint(1) NOT NULL DEFAULT 0,
  `builton` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `catalogs_cdnconfig`
--

CREATE TABLE `catalogs_cdnconfig` (
  `id` int(20) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `archives` longtext DEFAULT NULL,
  `archivecount` int(5) NOT NULL DEFAULT 0,
  `archivecomplete` int(5) NOT NULL DEFAULT 0,
  `indexcomplete` int(5) NOT NULL DEFAULT 0,
  `patcharchives` longtext DEFAULT NULL,
  `patcharchivecount` int(5) NOT NULL DEFAULT 0,
  `patcharchivecomplete` int(5) NOT NULL DEFAULT 0,
  `patchindexcomplete` int(5) NOT NULL DEFAULT 0,
  `builds` longtext DEFAULT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `catalogs_versions`
--

CREATE TABLE `catalogs_versions` (
  `id` int(10) NOT NULL,
  `buildconfig` varchar(32) DEFAULT NULL,
  `cdnconfig` varchar(32) DEFAULT NULL,
  `product` varchar(40) DEFAULT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `missingfiles`
--

CREATE TABLE `missingfiles` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `triedcdn` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ngdp_history`
--

CREATE TABLE `ngdp_history` (
  `id` int(20) NOT NULL,
  `url_id` int(20) NOT NULL,
  `event` enum('valuechange','statuschange') COLLATE utf8_bin NOT NULL,
  `oldvalue` text COLLATE utf8_bin DEFAULT NULL,
  `newvalue` text COLLATE utf8_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ngdp_products`
--

CREATE TABLE `ngdp_products` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  `program` varchar(25) COLLATE utf8_bin NOT NULL,
  `cdndir` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ngdp_urls`
--

CREATE TABLE `ngdp_urls` (
  `id` int(11) NOT NULL,
  `name` varchar(140) COLLATE utf8_bin NOT NULL,
  `type` enum('ngdp','web') COLLATE utf8_bin NOT NULL,
  `url` varchar(140) COLLATE utf8_bin NOT NULL,
  `lastseqn` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'generic',
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` text NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `recoverytoken` varchar(32) DEFAULT NULL,
  `tokengeneratedon` timestamp NULL DEFAULT NULL,
  `apitoken` varchar(32) DEFAULT NULL,
  `ip` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_buildconfig`
--

CREATE TABLE `wow_buildconfig` (
  `id` int(10) NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `product` varchar(40) DEFAULT NULL,
  `encoding` varchar(32) DEFAULT NULL,
  `encoding_cdn` varchar(32) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `root_cdn` varchar(32) DEFAULT NULL,
  `install` varchar(32) DEFAULT NULL,
  `install_cdn` varchar(32) DEFAULT NULL,
  `download` varchar(32) DEFAULT NULL,
  `download_cdn` varchar(32) DEFAULT NULL,
  `size` varchar(32) DEFAULT NULL,
  `size_cdn` varchar(32) DEFAULT NULL,
  `unarchived` longtext DEFAULT NULL,
  `unarchivedcount` int(20) NOT NULL DEFAULT 0,
  `unarchivedcomplete` int(20) NOT NULL DEFAULT 0,
  `patchconfig` varchar(32) DEFAULT NULL,
  `patch` varchar(32) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `complete` tinyint(1) NOT NULL DEFAULT 0,
  `builton` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_builds`
--

CREATE TABLE `wow_builds` (
  `id` int(11) NOT NULL,
  `version` varchar(20) NOT NULL,
  `expansion` tinyint(4) DEFAULT NULL,
  `major` tinyint(4) DEFAULT NULL,
  `minor` tinyint(4) DEFAULT NULL,
  `build` int(11) DEFAULT NULL,
  `branch` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_cachedentries`
--

CREATE TABLE `wow_cachedentries` (
  `recordID` int(11) NOT NULL,
  `tableName` varchar(100) NOT NULL,
  `md5` varchar(32) DEFAULT NULL,
  `build` int(11) NOT NULL,
  `cachename` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_cdnconfig`
--

CREATE TABLE `wow_cdnconfig` (
  `id` int(20) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `archives` longtext DEFAULT NULL,
  `archivecount` int(5) NOT NULL DEFAULT 0,
  `archivecomplete` int(5) NOT NULL DEFAULT 0,
  `indexcomplete` int(5) NOT NULL DEFAULT 0,
  `patcharchives` longtext DEFAULT NULL,
  `patcharchivecount` int(5) NOT NULL DEFAULT 0,
  `patcharchivecomplete` int(5) NOT NULL DEFAULT 0,
  `patchindexcomplete` int(5) NOT NULL DEFAULT 0,
  `builds` longtext DEFAULT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_communityfiles`
--

CREATE TABLE `wow_communityfiles` (
  `id` int(11) UNSIGNED NOT NULL,
  `filename` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_dbc_tables`
--

CREATE TABLE `wow_dbc_tables` (
  `id` int(11) NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_dbc_table_versions`
--

CREATE TABLE `wow_dbc_table_versions` (
  `id` int(11) NOT NULL,
  `versionid` int(11) NOT NULL,
  `tableid` int(11) NOT NULL,
  `contenthash` varchar(32) NOT NULL,
  `layouthash` varchar(8) DEFAULT NULL,
  `hasDefinition` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_encrypted`
--

CREATE TABLE `wow_encrypted` (
  `filedataid` int(11) NOT NULL,
  `keyname` varchar(16) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_hotfixes`
--

CREATE TABLE `wow_hotfixes` (
  `pushID` int(11) NOT NULL,
  `recordID` int(11) NOT NULL,
  `tableName` varchar(100) NOT NULL,
  `isValid` tinyint(1) NOT NULL,
  `build` int(11) NOT NULL,
  `firstdetected` timestamp NOT NULL DEFAULT current_timestamp(),
  `cachename` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_hotfixes_parsed`
--

CREATE TABLE `wow_hotfixes_parsed` (
  `id` int(11) NOT NULL,
  `md5` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_hotfixlogs`
--

CREATE TABLE `wow_hotfixlogs` (
  `id` int(11) NOT NULL,
  `pushID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('unknown','unverified','verified','official') NOT NULL DEFAULT 'unknown',
  `contributedby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_maps_config`
--

CREATE TABLE `wow_maps_config` (
  `versionid` int(11) NOT NULL,
  `mapid` int(11) NOT NULL,
  `offsetx` int(11) DEFAULT NULL,
  `offsety` int(11) DEFAULT NULL,
  `resx` int(11) NOT NULL,
  `resy` int(11) NOT NULL,
  `zoom` int(11) NOT NULL,
  `minzoom` int(11) NOT NULL,
  `maxzoom` int(11) NOT NULL,
  `bgcolor` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `wow_maps_maps`
--

CREATE TABLE `wow_maps_maps` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `internal` text NOT NULL,
  `internal_mapid` int(11) DEFAULT NULL,
  `wdtFileDataID` int(11) DEFAULT NULL,
  `firstseen` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wow_maps_versions`
--

CREATE TABLE `wow_maps_versions` (
  `map_id` int(11) NOT NULL,
  `versionid` int(11) NOT NULL,
  `md5` text DEFAULT NULL,
  `tilemd5` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `wow_namelog`
--

CREATE TABLE `wow_namelog` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `userip` varchar(40) NOT NULL,
  `numadded` int(11) NOT NULL,
  `submitted` timestamp NOT NULL DEFAULT current_timestamp(),
  `credited` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_patchconfig`
--

CREATE TABLE `wow_patchconfig` (
  `hash` varchar(32) NOT NULL,
  `patch` varchar(32) NOT NULL,
  `patch-entry` text NOT NULL,
  `patch-size` int(11) NOT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_realms`
--

CREATE TABLE `wow_realms` (
  `id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT -1,
  `population` tinyint(1) DEFAULT -1,
  `version` varchar(20) CHARACTER SET utf8 NOT NULL,
  `groupname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `lastseen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles`
--

CREATE TABLE `wow_rootfiles` (
  `id` int(11) NOT NULL,
  `lookup` varchar(16) NOT NULL DEFAULT '',
  `filename` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(20) DEFAULT NULL,
  `firstseen` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles_builds_erorus`
--

CREATE TABLE `wow_rootfiles_builds_erorus` (
  `build` mediumint(8) UNSIGNED NOT NULL,
  `files` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles_chashes`
--

CREATE TABLE `wow_rootfiles_chashes` (
  `filedataid` int(11) NOT NULL,
  `root_cdn` char(32) NOT NULL,
  `contenthash` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles_comments`
--

CREATE TABLE `wow_rootfiles_comments` (
  `id` int(11) NOT NULL,
  `filedataid` int(10) NOT NULL,
  `comment` text NOT NULL,
  `lasteditedby` int(5) DEFAULT NULL,
  `lastedited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles_count`
--

CREATE TABLE `wow_rootfiles_count` (
  `root_cdn` varchar(32) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles_links`
--

CREATE TABLE `wow_rootfiles_links` (
  `parent` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `type` enum('m2 texture','m2 skin','m2 anim','m2 bone','m2 phys','m2 recursive particle','m2 geometry particle','m2 skel','wmo group','wmo doodad','wmo texture','root adt','tex0 adt','lod adt','obj0 adt','obj1 adt','map texture','mapn texture','minimap texture','adt doodad','adt worldmodel','wdt wmo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles_sizes`
--

CREATE TABLE `wow_rootfiles_sizes` (
  `contenthash` char(32) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_rootfiles_suggestions`
--

CREATE TABLE `wow_rootfiles_suggestions` (
  `id` int(11) NOT NULL,
  `filedataid` int(11) NOT NULL,
  `filename` varchar(500) NOT NULL,
  `userid` int(11) NOT NULL,
  `submitted` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('todo','approved','declined') NOT NULL DEFAULT 'todo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_tactkey`
--

CREATE TABLE `wow_tactkey` (
  `id` int(11) DEFAULT NULL,
  `keyname` varchar(16) NOT NULL,
  `keybytes` varchar(32) DEFAULT NULL,
  `added` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wow_versions`
--

CREATE TABLE `wow_versions` (
  `id` int(10) NOT NULL,
  `buildconfig` varchar(32) DEFAULT NULL,
  `cdnconfig` varchar(32) DEFAULT NULL,
  `patchconfig` varchar(32) DEFAULT NULL,
  `product` varchar(40) DEFAULT NULL,
  `releasetime` timestamp NULL DEFAULT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent_buildconfig`
--
ALTER TABLE `agent_buildconfig`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildconfig_2` (`hash`),
  ADD KEY `buildconfig` (`hash`);

--
-- Indexes for table `agent_cdnconfig`
--
ALTER TABLE `agent_cdnconfig`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash_2` (`hash`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `agent_versions`
--
ALTER TABLE `agent_versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildconfig_2` (`buildconfig`),
  ADD KEY `buildconfig` (`buildconfig`);

--
-- Indexes for table `catalogs_buildconfig`
--
ALTER TABLE `catalogs_buildconfig`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildconfig_2` (`hash`),
  ADD KEY `buildconfig` (`hash`);

--
-- Indexes for table `catalogs_cdnconfig`
--
ALTER TABLE `catalogs_cdnconfig`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash_2` (`hash`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `catalogs_versions`
--
ALTER TABLE `catalogs_versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildconfig_2` (`buildconfig`),
  ADD KEY `buildconfig` (`buildconfig`);

--
-- Indexes for table `missingfiles`
--
ALTER TABLE `missingfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_2` (`url`),
  ADD KEY `url` (`url`);

--
-- Indexes for table `ngdp_history`
--
ALTER TABLE `ngdp_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url_id` (`url_id`),
  ADD KEY `event` (`event`),
  ADD KEY `url_id_2` (`url_id`,`event`);
ALTER TABLE `ngdp_history` ADD FULLTEXT KEY `newvalue` (`newvalue`);
ALTER TABLE `ngdp_history` ADD FULLTEXT KEY `oldvalue` (`oldvalue`);

--
-- Indexes for table `ngdp_products`
--
ALTER TABLE `ngdp_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `program` (`program`);

--
-- Indexes for table `ngdp_urls`
--
ALTER TABLE `ngdp_urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wow_buildconfig`
--
ALTER TABLE `wow_buildconfig`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildconfig_2` (`hash`),
  ADD KEY `buildconfig` (`hash`);

--
-- Indexes for table `wow_builds`
--
ALTER TABLE `wow_builds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `build` (`build`),
  ADD KEY `version` (`version`);

--
-- Indexes for table `wow_cachedentries`
--
ALTER TABLE `wow_cachedentries`
  ADD UNIQUE KEY `recordID` (`recordID`,`tableName`,`md5`);

--
-- Indexes for table `wow_cdnconfig`
--
ALTER TABLE `wow_cdnconfig`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash_2` (`hash`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `wow_communityfiles`
--
ALTER TABLE `wow_communityfiles`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `filename` (`filename`),
  ADD KEY `id_3` (`id`,`filename`);

--
-- Indexes for table `wow_dbc_tables`
--
ALTER TABLE `wow_dbc_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wow_dbc_table_versions`
--
ALTER TABLE `wow_dbc_table_versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `versionid` (`versionid`,`tableid`),
  ADD KEY `tableid` (`tableid`),
  ADD KEY `hasDefinition` (`hasDefinition`);

--
-- Indexes for table `wow_encrypted`
--
ALTER TABLE `wow_encrypted`
  ADD UNIQUE KEY `filedataid` (`filedataid`,`keyname`),
  ADD KEY `keyname` (`keyname`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `wow_hotfixes`
--
ALTER TABLE `wow_hotfixes`
  ADD UNIQUE KEY `pushID` (`pushID`,`recordID`,`tableName`);

--
-- Indexes for table `wow_hotfixes_parsed`
--
ALTER TABLE `wow_hotfixes_parsed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `md5` (`md5`);

--
-- Indexes for table `wow_hotfixlogs`
--
ALTER TABLE `wow_hotfixlogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pushID` (`pushID`);

--
-- Indexes for table `wow_maps_config`
--
ALTER TABLE `wow_maps_config`
  ADD UNIQUE KEY `versionid` (`versionid`,`mapid`);

--
-- Indexes for table `wow_maps_maps`
--
ALTER TABLE `wow_maps_maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wow_maps_versions`
--
ALTER TABLE `wow_maps_versions`
  ADD UNIQUE KEY `map_id` (`map_id`,`versionid`);

--
-- Indexes for table `wow_namelog`
--
ALTER TABLE `wow_namelog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wow_patchconfig`
--
ALTER TABLE `wow_patchconfig`
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Indexes for table `wow_realms`
--
ALTER TABLE `wow_realms`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `wow_rootfiles`
--
ALTER TABLE `wow_rootfiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filename` (`filename`),
  ADD KEY `firstseen` (`firstseen`),
  ADD KEY `type` (`type`),
  ADD KEY `verified` (`verified`),
  ADD KEY `lookup` (`lookup`);

--
-- Indexes for table `wow_rootfiles_builds_erorus`
--
ALTER TABLE `wow_rootfiles_builds_erorus`
  ADD PRIMARY KEY (`build`);

--
-- Indexes for table `wow_rootfiles_chashes`
--
ALTER TABLE `wow_rootfiles_chashes`
  ADD UNIQUE KEY `filedataid` (`filedataid`,`contenthash`),
  ADD KEY `contenthash` (`contenthash`),
  ADD KEY `filedataid_2` (`filedataid`);

--
-- Indexes for table `wow_rootfiles_comments`
--
ALTER TABLE `wow_rootfiles_comments`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `filedataid` (`filedataid`);

--
-- Indexes for table `wow_rootfiles_count`
--
ALTER TABLE `wow_rootfiles_count`
  ADD UNIQUE KEY `root_cdn` (`root_cdn`),
  ADD KEY `root_cdn_2` (`root_cdn`,`count`);

--
-- Indexes for table `wow_rootfiles_links`
--
ALTER TABLE `wow_rootfiles_links`
  ADD UNIQUE KEY `parent` (`parent`,`child`),
  ADD KEY `parent_2` (`parent`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `wow_rootfiles_sizes`
--
ALTER TABLE `wow_rootfiles_sizes`
  ADD UNIQUE KEY `contenthash` (`contenthash`,`size`),
  ADD KEY `contenthash_2` (`contenthash`);

--
-- Indexes for table `wow_rootfiles_suggestions`
--
ALTER TABLE `wow_rootfiles_suggestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filedataid` (`filedataid`);

--
-- Indexes for table `wow_tactkey`
--
ALTER TABLE `wow_tactkey`
  ADD UNIQUE KEY `keyname` (`keyname`),
  ADD KEY `keyname_2` (`keyname`);

--
-- Indexes for table `wow_versions`
--
ALTER TABLE `wow_versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildconfig_2` (`buildconfig`),
  ADD KEY `buildconfig` (`buildconfig`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent_buildconfig`
--
ALTER TABLE `agent_buildconfig`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_cdnconfig`
--
ALTER TABLE `agent_cdnconfig`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_versions`
--
ALTER TABLE `agent_versions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalogs_buildconfig`
--
ALTER TABLE `catalogs_buildconfig`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalogs_cdnconfig`
--
ALTER TABLE `catalogs_cdnconfig`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalogs_versions`
--
ALTER TABLE `catalogs_versions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `missingfiles`
--
ALTER TABLE `missingfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ngdp_history`
--
ALTER TABLE `ngdp_history`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ngdp_products`
--
ALTER TABLE `ngdp_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ngdp_urls`
--
ALTER TABLE `ngdp_urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_buildconfig`
--
ALTER TABLE `wow_buildconfig`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_builds`
--
ALTER TABLE `wow_builds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_cdnconfig`
--
ALTER TABLE `wow_cdnconfig`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_dbc_tables`
--
ALTER TABLE `wow_dbc_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_dbc_table_versions`
--
ALTER TABLE `wow_dbc_table_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_hotfixes_parsed`
--
ALTER TABLE `wow_hotfixes_parsed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_hotfixlogs`
--
ALTER TABLE `wow_hotfixlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_maps_maps`
--
ALTER TABLE `wow_maps_maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_namelog`
--
ALTER TABLE `wow_namelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_rootfiles_comments`
--
ALTER TABLE `wow_rootfiles_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_rootfiles_suggestions`
--
ALTER TABLE `wow_rootfiles_suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wow_versions`
--
ALTER TABLE `wow_versions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Database: `wowdata`
--
CREATE DATABASE IF NOT EXISTS `wowdata` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wowdata`;

-- --------------------------------------------------------

--
-- Table structure for table `bag_files`
--

CREATE TABLE `bag_files` (
  `file_id` int(11) NOT NULL,
  `bag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `broadcasttext`
--

CREATE TABLE `broadcasttext` (
  `ID` int(11) NOT NULL,
  `Text` text NOT NULL,
  `Text1` text NOT NULL,
  `SoundKit0` int(11) NOT NULL,
  `SoundKit1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_text`
--

CREATE TABLE `broadcast_text` (
  `Text` text DEFAULT NULL,
  `Text1` text DEFAULT NULL,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `LanguageID` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ConditionID` int(11) NOT NULL DEFAULT 0,
  `EmotesID` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `Flags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ChatBubbleDurationMs` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `SoundEntriesID1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `SoundEntriesID2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `EmoteID1` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `EmoteID2` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `EmoteID3` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `EmoteDelay1` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `EmoteDelay2` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `EmoteDelay3` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `VerifiedBuild` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `builds`
--

CREATE TABLE `builds` (
  `id` int(11) NOT NULL,
  `buildconfig` varchar(32) NOT NULL,
  `cdnconfig` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `build_bags`
--

CREATE TABLE `build_bags` (
  `build_id` int(11) NOT NULL,
  `bag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `change_bag`
--

CREATE TABLE `change_bag` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chrraces`
--

CREATE TABLE `chrraces` (
  `ClientPrefix` varchar(100) NOT NULL,
  `ClientFileString` varchar(100) NOT NULL,
  `Name_lang` varchar(100) NOT NULL,
  `Name_female_lang` varchar(100) NOT NULL,
  `Name_lowercase_lang` varchar(100) NOT NULL,
  `Name_female_lowercase_lang` varchar(100) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `componentmodelfiledata`
--

CREATE TABLE `componentmodelfiledata` (
  `ID` int(11) NOT NULL,
  `GenderIndex` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `RaceID` int(11) NOT NULL,
  `PositionIndex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creaturedisplayinfo`
--

CREATE TABLE `creaturedisplayinfo` (
  `ID` int(5) NOT NULL,
  `ModelID` int(5) DEFAULT NULL,
  `PortraitTextureFileDataID` int(7) DEFAULT NULL,
  `TextureVariationFileDataID[0]` int(7) DEFAULT NULL,
  `TextureVariationFileDataID[1]` int(7) DEFAULT NULL,
  `TextureVariationFileDataID[2]` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `creaturemodeldata`
--

CREATE TABLE `creaturemodeldata` (
  `id` int(11) NOT NULL,
  `filedataid` int(11) NOT NULL,
  `soundid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creatures`
--

CREATE TABLE `creatures` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstseenbuild` int(11) NOT NULL,
  `lastupdatedbuild` int(11) NOT NULL,
  `json` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creaturesounddata`
--

CREATE TABLE `creaturesounddata` (
  `ID` int(4) NOT NULL,
  `SoundExertionID` int(6) DEFAULT NULL,
  `SoundExertionCriticalID` int(6) DEFAULT NULL,
  `SoundInjuryID` int(6) DEFAULT NULL,
  `SoundInjuryCriticalID` int(6) DEFAULT NULL,
  `SoundInjuryCrushingBlowID` int(1) DEFAULT NULL,
  `SoundDeathID` int(6) DEFAULT NULL,
  `SoundStunID` int(6) DEFAULT NULL,
  `SoundStandID` int(6) DEFAULT NULL,
  `SoundFootstepID` int(3) DEFAULT NULL,
  `SoundAggroID` int(6) DEFAULT NULL,
  `SoundWingFlapID` int(6) DEFAULT NULL,
  `SoundWingGlideID` int(5) DEFAULT NULL,
  `SoundAlertID` int(6) DEFAULT NULL,
  `SoundJumpStartID` int(6) DEFAULT NULL,
  `SoundJumpEndID` int(6) DEFAULT NULL,
  `SoundPetAttackID` int(5) DEFAULT NULL,
  `SoundPetOrderID` int(5) DEFAULT NULL,
  `SoundPetDismissID` int(5) DEFAULT NULL,
  `LoopSoundID` int(6) DEFAULT NULL,
  `BirthSoundID` int(6) DEFAULT NULL,
  `SpellCastDirectedSoundID` int(5) DEFAULT NULL,
  `SubmergeSoundID` int(6) DEFAULT NULL,
  `SubmergedSoundID` int(6) DEFAULT NULL,
  `WindupSoundID` int(6) DEFAULT NULL,
  `WindupCriticalSoundID` int(6) DEFAULT NULL,
  `ChargeSoundID` int(6) DEFAULT NULL,
  `ChargeCriticalSoundID` int(6) DEFAULT NULL,
  `BattleShoutSoundID` int(6) DEFAULT NULL,
  `BattleShoutCriticalSoundID` int(6) DEFAULT NULL,
  `TauntSoundID` int(5) DEFAULT NULL,
  `CreatureSoundDataIDPet` int(4) DEFAULT NULL,
  `FidgetDelaySecondsMin` int(2) DEFAULT NULL,
  `FidgetDelaySecondsMax` int(2) DEFAULT NULL,
  `CreatureImpactType` int(1) DEFAULT NULL,
  `NPCSoundID` int(1) DEFAULT NULL,
  `SoundFidget[0]` int(6) DEFAULT NULL,
  `SoundFidget[1]` int(6) DEFAULT NULL,
  `SoundFidget[2]` int(6) DEFAULT NULL,
  `SoundFidget[3]` int(6) DEFAULT NULL,
  `SoundFidget[4]` int(6) DEFAULT NULL,
  `CustomAttack[0]` int(6) DEFAULT NULL,
  `CustomAttack[1]` int(6) DEFAULT NULL,
  `CustomAttack[2]` int(5) DEFAULT NULL,
  `CustomAttack[3]` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_questitem`
--

CREATE TABLE `creature_questitem` (
  `CreatureEntry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Idx` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `VerifiedBuild` int(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_template`
--

CREATE TABLE `creature_template` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `KillCredit1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `KillCredit2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` text DEFAULT NULL,
  `femaleName` text DEFAULT NULL,
  `subname` text DEFAULT NULL,
  `TitleAlt` text DEFAULT NULL,
  `IconName` varchar(64) DEFAULT NULL,
  `HealthScalingExpansion` mediumint(5) NOT NULL DEFAULT 0,
  `RequiredExpansion` mediumint(5) NOT NULL DEFAULT 0,
  `VignetteID` mediumint(5) NOT NULL DEFAULT 0,
  `faction` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `unit_class` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `family` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `type_flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type_flags2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `HealthModifier` float NOT NULL DEFAULT 1,
  `ManaModifier` float NOT NULL DEFAULT 1,
  `RacialLeader` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `movementId` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `FadeRegionRadius` float NOT NULL DEFAULT 0,
  `WidgetSetID` int(11) NOT NULL DEFAULT 0,
  `WidgetSetUnitConditionID` int(11) NOT NULL DEFAULT 0,
  `VerifiedBuild` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `creature_template_model`
--

CREATE TABLE `creature_template_model` (
  `CreatureID` int(10) UNSIGNED NOT NULL,
  `Idx` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `CreatureDisplayID` int(10) UNSIGNED NOT NULL,
  `DisplayScale` float NOT NULL DEFAULT 1,
  `Probability` float NOT NULL DEFAULT 0,
  `VerifiedBuild` int(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `file_build`
-- (See below for the actual view)
--
CREATE TABLE `file_build` (
`file_id` int(11)
,`build_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_template`
--

CREATE TABLE `gameobject_template` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `displayId` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `IconName` varchar(100) NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) NOT NULL DEFAULT '',
  `unk1` varchar(100) NOT NULL DEFAULT '',
  `size` float NOT NULL DEFAULT 1,
  `Data0` int(10) NOT NULL DEFAULT 0,
  `Data1` int(10) NOT NULL DEFAULT 0,
  `Data2` int(10) NOT NULL DEFAULT 0,
  `Data3` int(10) NOT NULL DEFAULT 0,
  `Data4` int(10) NOT NULL DEFAULT 0,
  `Data5` int(10) NOT NULL DEFAULT 0,
  `Data6` int(10) NOT NULL DEFAULT 0,
  `Data7` int(10) NOT NULL DEFAULT 0,
  `Data8` int(10) NOT NULL DEFAULT 0,
  `Data9` int(10) NOT NULL DEFAULT 0,
  `Data10` int(10) NOT NULL DEFAULT 0,
  `Data11` int(10) NOT NULL DEFAULT 0,
  `Data12` int(10) NOT NULL DEFAULT 0,
  `Data13` int(10) NOT NULL DEFAULT 0,
  `Data14` int(10) NOT NULL DEFAULT 0,
  `Data15` int(10) NOT NULL DEFAULT 0,
  `Data16` int(10) NOT NULL DEFAULT 0,
  `Data17` int(10) NOT NULL DEFAULT 0,
  `Data18` int(10) NOT NULL DEFAULT 0,
  `Data19` int(10) NOT NULL DEFAULT 0,
  `Data20` int(10) NOT NULL DEFAULT 0,
  `Data21` int(10) NOT NULL DEFAULT 0,
  `Data22` int(10) NOT NULL DEFAULT 0,
  `Data23` int(10) NOT NULL DEFAULT 0,
  `Data24` int(10) NOT NULL DEFAULT 0,
  `Data25` int(10) NOT NULL DEFAULT 0,
  `Data26` int(10) NOT NULL DEFAULT 0,
  `Data27` int(10) NOT NULL DEFAULT 0,
  `Data28` int(10) NOT NULL DEFAULT 0,
  `Data29` int(10) NOT NULL DEFAULT 0,
  `Data30` int(10) NOT NULL DEFAULT 0,
  `Data31` int(10) NOT NULL DEFAULT 0,
  `Data32` int(10) NOT NULL DEFAULT 0,
  `Data33` int(11) NOT NULL DEFAULT 0,
  `RequiredLevel` int(10) NOT NULL DEFAULT 0,
  `AIName` char(64) NOT NULL DEFAULT '',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `VerifiedBuild` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gameobject System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `itemdisplayinfo`
--

CREATE TABLE `itemdisplayinfo` (
  `ID` int(11) NOT NULL,
  `ModelResourcesID0` int(11) NOT NULL,
  `ModelResourcesID1` int(11) NOT NULL,
  `ModelMaterialResourcesID0` int(11) NOT NULL,
  `ModelMaterialResourcesID1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manifestinterfacedata`
--

CREATE TABLE `manifestinterfacedata` (
  `filedataid` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manifestmp3`
--

CREATE TABLE `manifestmp3` (
  `ID` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modelfiledata`
--

CREATE TABLE `modelfiledata` (
  `FileDataID` int(11) NOT NULL,
  `ModelResourcesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moviefiledata`
--

CREATE TABLE `moviefiledata` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE `quests` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `firstseenbuild` int(11) NOT NULL,
  `lastupdatedbuild` int(11) NOT NULL,
  `json` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_objectives`
--

CREATE TABLE `quest_objectives` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `QuestID` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `Type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `StorageIndex` tinyint(3) NOT NULL DEFAULT 0,
  `ObjectID` int(10) NOT NULL DEFAULT 0,
  `Amount` int(10) NOT NULL DEFAULT 0,
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Flags2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ProgressBarWeight` float NOT NULL DEFAULT 0,
  `Description` text DEFAULT NULL,
  `VerifiedBuild` int(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_poi`
--

CREATE TABLE `quest_poi` (
  `QuestID` int(11) NOT NULL DEFAULT 0,
  `BlobIndex` int(11) NOT NULL DEFAULT 0,
  `Idx1` int(11) NOT NULL DEFAULT 0,
  `ObjectiveIndex` int(11) NOT NULL DEFAULT 0,
  `QuestObjectiveID` int(11) NOT NULL DEFAULT 0,
  `QuestObjectID` int(11) NOT NULL DEFAULT 0,
  `MapID` int(11) NOT NULL DEFAULT 0,
  `UiMapID` int(11) NOT NULL DEFAULT 0,
  `Priority` int(11) NOT NULL DEFAULT 0,
  `Flags` int(11) NOT NULL DEFAULT 0,
  `WorldEffectID` int(11) NOT NULL DEFAULT 0,
  `PlayerConditionID` int(11) NOT NULL DEFAULT 0,
  `SpawnTrackingID` int(11) NOT NULL DEFAULT 0,
  `AlwaysAllowMergingBlobs` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `VerifiedBuild` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_poi_points`
--

CREATE TABLE `quest_poi_points` (
  `QuestID` int(11) NOT NULL DEFAULT 0,
  `Idx1` int(11) NOT NULL DEFAULT 0,
  `Idx2` int(11) NOT NULL DEFAULT 0,
  `X` int(11) NOT NULL DEFAULT 0,
  `Y` int(11) NOT NULL DEFAULT 0,
  `VerifiedBuild` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_template`
--

CREATE TABLE `quest_template` (
  `ID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `QuestType` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `QuestLevel` int(11) NOT NULL DEFAULT -1,
  `ScalingFactionGroup` int(11) NOT NULL DEFAULT 0,
  `MaxScalingLevel` int(11) NOT NULL DEFAULT 255,
  `QuestPackageID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `MinLevel` int(11) NOT NULL DEFAULT 0,
  `QuestSortID` smallint(6) NOT NULL DEFAULT 0,
  `QuestInfoID` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `SuggestedGroupNum` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `RewardNextQuest` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardXPDifficulty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardXPMultiplier` float NOT NULL DEFAULT 1,
  `RewardMoney` int(11) NOT NULL DEFAULT 0,
  `RewardMoneyDifficulty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardMoneyMultiplier` float NOT NULL DEFAULT 1,
  `RewardBonusMoney` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardDisplaySpell1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardDisplaySpell2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardDisplaySpell3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardSpell` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardHonor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardKillHonor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `StartItem` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardArtifactXPDifficulty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardArtifactXPMultiplier` float NOT NULL DEFAULT 1,
  `RewardArtifactCategoryID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `FlagsEx` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `FlagsEx2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardItem1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardAmount1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardItem2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardAmount2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardItem3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardAmount3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardItem4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardAmount4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDrop1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDropQuantity1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDrop2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDropQuantity2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDrop3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDropQuantity3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDrop4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemDropQuantity4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemID1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemQuantity1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemDisplayID1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemID2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemQuantity2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemDisplayID2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemID3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemQuantity3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemDisplayID3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemID4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemQuantity4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemDisplayID4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemID5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemQuantity5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemDisplayID5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemID6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemQuantity6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardChoiceItemDisplayID6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `POIContinent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `POIx` float NOT NULL DEFAULT 0,
  `POIy` float NOT NULL DEFAULT 0,
  `POIPriority` int(11) NOT NULL DEFAULT 0,
  `RewardTitle` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardArenaPoints` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardSkillLineID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardNumSkillUps` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `PortraitGiver` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `PortraitGiverMount` int(11) NOT NULL DEFAULT 0,
  `PortraitTurnIn` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionID1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionValue1` int(11) NOT NULL DEFAULT 0,
  `RewardFactionOverride1` int(11) NOT NULL DEFAULT 0,
  `RewardFactionCapIn1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionID2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionValue2` int(11) NOT NULL DEFAULT 0,
  `RewardFactionOverride2` int(11) NOT NULL DEFAULT 0,
  `RewardFactionCapIn2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionID3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionValue3` int(11) NOT NULL DEFAULT 0,
  `RewardFactionOverride3` int(11) NOT NULL DEFAULT 0,
  `RewardFactionCapIn3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionID4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionValue4` int(11) NOT NULL DEFAULT 0,
  `RewardFactionOverride4` int(11) NOT NULL DEFAULT 0,
  `RewardFactionCapIn4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionID5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionValue5` int(11) NOT NULL DEFAULT 0,
  `RewardFactionOverride5` int(11) NOT NULL DEFAULT 0,
  `RewardFactionCapIn5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardFactionFlags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyID1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyQty1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyID2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyQty2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyID3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyQty3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyID4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RewardCurrencyQty4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AcceptedSoundKitID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `CompleteSoundKitID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AreaGroupID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TimeAllowed` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AllowableRaces` bigint(20) UNSIGNED DEFAULT 0,
  `TreasurePickerID` int(11) NOT NULL DEFAULT 0,
  `Expansion` int(11) NOT NULL DEFAULT 0,
  `ManagedWorldStateID` int(11) NOT NULL DEFAULT 0,
  `QuestSessionBonus` int(11) NOT NULL DEFAULT 0,
  `LogTitle` text DEFAULT NULL,
  `LogDescription` text DEFAULT NULL,
  `QuestDescription` text DEFAULT NULL,
  `AreaDescription` text DEFAULT NULL,
  `PortraitGiverText` text DEFAULT NULL,
  `PortraitGiverName` text DEFAULT NULL,
  `PortraitTurnInText` text DEFAULT NULL,
  `PortraitTurnInName` text DEFAULT NULL,
  `QuestCompletionLog` text DEFAULT NULL,
  `VerifiedBuild` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';

-- --------------------------------------------------------

--
-- Table structure for table `quest_visual_effect`
--

CREATE TABLE `quest_visual_effect` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `Index` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `VisualEffect` mediumint(8) NOT NULL DEFAULT 0,
  `VerifiedBuild` int(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scene_template`
--

CREATE TABLE `scene_template` (
  `SceneId` int(10) UNSIGNED NOT NULL,
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ScriptPackageID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `soundkitentry`
--

CREATE TABLE `soundkitentry` (
  `id` int(11) NOT NULL,
  `entry` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `soundkitname`
--

CREATE TABLE `soundkitname` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `texturefiledata`
--

CREATE TABLE `texturefiledata` (
  `FileDataID` int(11) NOT NULL,
  `MaterialResourcesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `file_build`
--
DROP TABLE IF EXISTS `file_build`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `file_build`  AS SELECT `bag_files`.`file_id` AS `file_id`, `build_bags`.`build_id` AS `build_id` FROM (`bag_files` join `build_bags` on(`bag_files`.`bag_id` = `build_bags`.`bag_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bag_files`
--
ALTER TABLE `bag_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `bags_to_files` (`bag_id`);

--
-- Indexes for table `broadcasttext`
--
ALTER TABLE `broadcasttext`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SoundKit0` (`SoundKit0`),
  ADD KEY `SoundKit1` (`SoundKit1`);

--
-- Indexes for table `broadcast_text`
--
ALTER TABLE `broadcast_text`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildconfig` (`buildconfig`,`cdnconfig`);

--
-- Indexes for table `build_bags`
--
ALTER TABLE `build_bags`
  ADD PRIMARY KEY (`build_id`,`bag_id`),
  ADD KEY `bags_to_build` (`bag_id`);

--
-- Indexes for table `change_bag`
--
ALTER TABLE `change_bag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chrraces`
--
ALTER TABLE `chrraces`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `componentmodelfiledata`
--
ALTER TABLE `componentmodelfiledata`
  ADD UNIQUE KEY `FileDataID` (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `creaturedisplayinfo`
--
ALTER TABLE `creaturedisplayinfo`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `creaturemodeldata`
--
ALTER TABLE `creaturemodeldata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filedataid` (`filedataid`);

--
-- Indexes for table `creatures`
--
ALTER TABLE `creatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `creaturesounddata`
--
ALTER TABLE `creaturesounddata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `creature_questitem`
--
ALTER TABLE `creature_questitem`
  ADD PRIMARY KEY (`CreatureEntry`,`Idx`);

--
-- Indexes for table `creature_template`
--
ALTER TABLE `creature_template`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `creature_template_model`
--
ALTER TABLE `creature_template_model`
  ADD PRIMARY KEY (`CreatureID`,`Idx`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gameobject_template`
--
ALTER TABLE `gameobject_template`
  ADD PRIMARY KEY (`entry`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `itemdisplayinfo`
--
ALTER TABLE `itemdisplayinfo`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `manifestinterfacedata`
--
ALTER TABLE `manifestinterfacedata`
  ADD UNIQUE KEY `filedataid` (`filedataid`);

--
-- Indexes for table `manifestmp3`
--
ALTER TABLE `manifestmp3`
  ADD UNIQUE KEY `ID_2` (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `modelfiledata`
--
ALTER TABLE `modelfiledata`
  ADD UNIQUE KEY `FileDataID` (`FileDataID`),
  ADD KEY `FileDataID_2` (`FileDataID`);

--
-- Indexes for table `moviefiledata`
--
ALTER TABLE `moviefiledata`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `quest_objectives`
--
ALTER TABLE `quest_objectives`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quest_poi`
--
ALTER TABLE `quest_poi`
  ADD PRIMARY KEY (`QuestID`,`BlobIndex`,`Idx1`),
  ADD KEY `idx` (`QuestID`,`BlobIndex`);

--
-- Indexes for table `quest_poi_points`
--
ALTER TABLE `quest_poi_points`
  ADD PRIMARY KEY (`QuestID`,`Idx1`,`Idx2`),
  ADD KEY `questId_id` (`QuestID`);

--
-- Indexes for table `quest_template`
--
ALTER TABLE `quest_template`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quest_visual_effect`
--
ALTER TABLE `quest_visual_effect`
  ADD PRIMARY KEY (`ID`,`Index`);

--
-- Indexes for table `scene_template`
--
ALTER TABLE `scene_template`
  ADD PRIMARY KEY (`SceneId`);

--
-- Indexes for table `soundkitentry`
--
ALTER TABLE `soundkitentry`
  ADD UNIQUE KEY `id` (`id`,`entry`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`);

--
-- Indexes for table `soundkitname`
--
ALTER TABLE `soundkitname`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`);

--
-- Indexes for table `texturefiledata`
--
ALTER TABLE `texturefiledata`
  ADD UNIQUE KEY `FileDataID` (`FileDataID`),
  ADD KEY `FileDataID_2` (`FileDataID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bag_files`
--
ALTER TABLE `bag_files`
  ADD CONSTRAINT `bag_files_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`),
  ADD CONSTRAINT `bag_files_ibfk_2` FOREIGN KEY (`bag_id`) REFERENCES `change_bag` (`id`);

--
-- Constraints for table `build_bags`
--
ALTER TABLE `build_bags`
  ADD CONSTRAINT `build_bags_ibfk_1` FOREIGN KEY (`build_id`) REFERENCES `builds` (`id`),
  ADD CONSTRAINT `build_bags_ibfk_2` FOREIGN KEY (`bag_id`) REFERENCES `change_bag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
