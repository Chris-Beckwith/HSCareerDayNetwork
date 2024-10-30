PGDMP      /            	    |           postgres    15.6 (Debian 15.6-1.pgdg120+2)    17.0     E           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            F           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            G           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            H           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                     postgres    false            I           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    3400                        2615    16387    repmgr    SCHEMA        CREATE SCHEMA repmgr;
    DROP SCHEMA repmgr;
                     postgres    false                        3079    16388    repmgr 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS repmgr WITH SCHEMA repmgr;
    DROP EXTENSION repmgr;
                        false    7            J           0    0    EXTENSION repmgr    COMMENT     E   COMMENT ON EXTENSION repmgr IS 'Replication manager for PostgreSQL';
                             false    2            �          0    16405    events 
   TABLE DATA           V   COPY repmgr.events (node_id, event, successful, event_timestamp, details) FROM stdin;
    repmgr               postgres    false    217   �	       �          0    16412    monitoring_history 
   TABLE DATA           �   COPY repmgr.monitoring_history (primary_node_id, standby_node_id, last_monitor_time, last_apply_time, last_wal_primary_location, last_wal_standby_location, replication_lag, apply_lag) FROM stdin;
    repmgr               postgres    false    218   �	       �          0    16389    nodes 
   TABLE DATA           �   COPY repmgr.nodes (node_id, upstream_node_id, active, node_name, type, location, priority, conninfo, repluser, slot_name, config_file) FROM stdin;
    repmgr               postgres    false    216   
       �      x������ � �      �      x������ � �      �      x������ � �     