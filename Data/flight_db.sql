PGDMP                          z            flight    14.1    14.1 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    19947    flight    DATABASE     b   CREATE DATABASE flight WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';
    DROP DATABASE flight;
                ayush    false            ?            1255    20205    seat_count()    FUNCTION     ,  CREATE FUNCTION public.seat_count() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    cat varchar := new.seat_class;
    es int;
    bs int;
    fs int;
BEGIN
    IF EXISTS(SELECT * FROM main_flight AS mf WHERE mf.id = new.flight_id) THEN
        RAISE NOTICE 'INSIDE IF';
        SELECT available_economy, available_business, available_first INTO es, bs, fs FROM main_flight AS mf WHERE mf.id = new.flight_id;
        IF ((cat='economy') AND (es=0)) THEN
            RAISE NOTICE '%',es;
            RAISE 'No economy seats available';
        ELSEIF ((cat='business') AND (bs=0)) THEN
            RAISE 'No business seats available';
        ELSEIF ((cat='first') AND (fs=0)) THEN
            RAISE 'No first seats available';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;
 #   DROP FUNCTION public.seat_count();
       public          ayush    false            ?            1259    19974 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    ayush    false            ?            1259    19973    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          ayush    false    216            ?           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          ayush    false    215            ?            1259    19983    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    ayush    false            ?            1259    19982    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          ayush    false    218            ?           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          ayush    false    217            ?            1259    19967    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    ayush    false            ?            1259    19966    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          ayush    false    214            ?           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          ayush    false    213            ?            1259    20174    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    ayush    false            ?            1259    20173    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          ayush    false    240            ?           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          ayush    false    239            ?            1259    19958    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    ayush    false            ?            1259    19957    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          ayush    false    212            ?           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          ayush    false    211            ?            1259    19949    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    ayush    false            ?            1259    19948    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          ayush    false    210            ?           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          ayush    false    209            ?            1259    20195    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    ayush    false            ?            1259    20041    main_flight    TABLE     M  CREATE TABLE public.main_flight (
    id bigint NOT NULL,
    depart_time time without time zone NOT NULL,
    duration interval,
    arrival_time time without time zone NOT NULL,
    plane character varying(24) NOT NULL,
    airline character varying(64) NOT NULL,
    economy_fare double precision,
    business_fare double precision,
    first_fare double precision,
    capacity integer NOT NULL,
    available_economy integer NOT NULL,
    available_business integer NOT NULL,
    available_first integer NOT NULL,
    destination_id bigint NOT NULL,
    origin_id bigint NOT NULL
);
    DROP TABLE public.main_flight;
       public         heap    ayush    false            ?            1259    20085    main_flight_depart_day    TABLE     ?   CREATE TABLE public.main_flight_depart_day (
    id bigint NOT NULL,
    flight_id bigint NOT NULL,
    week_id bigint NOT NULL
);
 *   DROP TABLE public.main_flight_depart_day;
       public         heap    ayush    false            ?            1259    20084    main_flight_depart_day_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_flight_depart_day_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.main_flight_depart_day_id_seq;
       public          ayush    false    238            ?           0    0    main_flight_depart_day_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.main_flight_depart_day_id_seq OWNED BY public.main_flight_depart_day.id;
          public          ayush    false    237            ?            1259    20040    main_flight_id_seq    SEQUENCE     {   CREATE SEQUENCE public.main_flight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_flight_id_seq;
       public          ayush    false    226            ?           0    0    main_flight_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_flight_id_seq OWNED BY public.main_flight.id;
          public          ayush    false    225            ?            1259    20048    main_passenger    TABLE     ?   CREATE TABLE public.main_passenger (
    id bigint NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    gender character varying(20) NOT NULL
);
 "   DROP TABLE public.main_passenger;
       public         heap    ayush    false            ?            1259    20047    main_passenger_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.main_passenger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.main_passenger_id_seq;
       public          ayush    false    228            ?           0    0    main_passenger_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.main_passenger_id_seq OWNED BY public.main_passenger.id;
          public          ayush    false    227            ?            1259    20055 
   main_place    TABLE     ?   CREATE TABLE public.main_place (
    id bigint NOT NULL,
    city character varying(64) NOT NULL,
    airport character varying(64) NOT NULL,
    code character varying(3) NOT NULL,
    country character varying(64) NOT NULL
);
    DROP TABLE public.main_place;
       public         heap    ayush    false            ?            1259    20054    main_place_id_seq    SEQUENCE     z   CREATE SEQUENCE public.main_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.main_place_id_seq;
       public          ayush    false    230            ?           0    0    main_place_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.main_place_id_seq OWNED BY public.main_place.id;
          public          ayush    false    229            ?            1259    20069    main_ticket    TABLE     g  CREATE TABLE public.main_ticket (
    id bigint NOT NULL,
    ref_no character varying(6) NOT NULL,
    flight_ddate date,
    flight_adate date,
    flight_fare double precision,
    other_charges double precision,
    coupon_used character varying(15) NOT NULL,
    coupon_discount double precision NOT NULL,
    total_fare double precision,
    seat_class character varying(20) NOT NULL,
    booking_date timestamp with time zone NOT NULL,
    mobile character varying(20) NOT NULL,
    email character varying(45) NOT NULL,
    status character varying(45) NOT NULL,
    flight_id bigint,
    user_id bigint
);
    DROP TABLE public.main_ticket;
       public         heap    ayush    false            ?            1259    20068    main_ticket_id_seq    SEQUENCE     {   CREATE SEQUENCE public.main_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_ticket_id_seq;
       public          ayush    false    234            ?           0    0    main_ticket_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_ticket_id_seq OWNED BY public.main_ticket.id;
          public          ayush    false    233            ?            1259    20078    main_ticket_passengers    TABLE     ?   CREATE TABLE public.main_ticket_passengers (
    id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    passenger_id bigint NOT NULL
);
 *   DROP TABLE public.main_ticket_passengers;
       public         heap    ayush    false            ?            1259    20077    main_ticket_passengers_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_ticket_passengers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.main_ticket_passengers_id_seq;
       public          ayush    false    236            ?           0    0    main_ticket_passengers_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.main_ticket_passengers_id_seq OWNED BY public.main_ticket_passengers.id;
          public          ayush    false    235            ?            1259    20016 	   main_user    TABLE     ?  CREATE TABLE public.main_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.main_user;
       public         heap    ayush    false            ?            1259    20027    main_user_groups    TABLE     }   CREATE TABLE public.main_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.main_user_groups;
       public         heap    ayush    false            ?            1259    20026    main_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.main_user_groups_id_seq;
       public          ayush    false    222            ?           0    0    main_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.main_user_groups_id_seq OWNED BY public.main_user_groups.id;
          public          ayush    false    221            ?            1259    20015    main_user_id_seq    SEQUENCE     y   CREATE SEQUENCE public.main_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.main_user_id_seq;
       public          ayush    false    220            ?           0    0    main_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.main_user_id_seq OWNED BY public.main_user.id;
          public          ayush    false    219            ?            1259    20034    main_user_user_permissions    TABLE     ?   CREATE TABLE public.main_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.main_user_user_permissions;
       public         heap    ayush    false            ?            1259    20033 !   main_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.main_user_user_permissions_id_seq;
       public          ayush    false    224            ?           0    0 !   main_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.main_user_user_permissions_id_seq OWNED BY public.main_user_user_permissions.id;
          public          ayush    false    223            ?            1259    20062 	   main_week    TABLE     ?   CREATE TABLE public.main_week (
    id bigint NOT NULL,
    number integer NOT NULL,
    name character varying(16) NOT NULL
);
    DROP TABLE public.main_week;
       public         heap    ayush    false            ?            1259    20061    main_week_id_seq    SEQUENCE     y   CREATE SEQUENCE public.main_week_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.main_week_id_seq;
       public          ayush    false    232            ?           0    0    main_week_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.main_week_id_seq OWNED BY public.main_week.id;
          public          ayush    false    231            ?           2604    19977    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    215    216    216            ?           2604    19986    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    217    218    218            ?           2604    19970    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    214    213    214            ?           2604    20177    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    240    239    240            ?           2604    19961    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    211    212    212            ?           2604    19952    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    210    209    210            ?           2604    20044    main_flight id    DEFAULT     p   ALTER TABLE ONLY public.main_flight ALTER COLUMN id SET DEFAULT nextval('public.main_flight_id_seq'::regclass);
 =   ALTER TABLE public.main_flight ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    225    226    226            ?           2604    20088    main_flight_depart_day id    DEFAULT     ?   ALTER TABLE ONLY public.main_flight_depart_day ALTER COLUMN id SET DEFAULT nextval('public.main_flight_depart_day_id_seq'::regclass);
 H   ALTER TABLE public.main_flight_depart_day ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    238    237    238            ?           2604    20051    main_passenger id    DEFAULT     v   ALTER TABLE ONLY public.main_passenger ALTER COLUMN id SET DEFAULT nextval('public.main_passenger_id_seq'::regclass);
 @   ALTER TABLE public.main_passenger ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    227    228    228            ?           2604    20058    main_place id    DEFAULT     n   ALTER TABLE ONLY public.main_place ALTER COLUMN id SET DEFAULT nextval('public.main_place_id_seq'::regclass);
 <   ALTER TABLE public.main_place ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    230    229    230            ?           2604    20072    main_ticket id    DEFAULT     p   ALTER TABLE ONLY public.main_ticket ALTER COLUMN id SET DEFAULT nextval('public.main_ticket_id_seq'::regclass);
 =   ALTER TABLE public.main_ticket ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    234    233    234            ?           2604    20081    main_ticket_passengers id    DEFAULT     ?   ALTER TABLE ONLY public.main_ticket_passengers ALTER COLUMN id SET DEFAULT nextval('public.main_ticket_passengers_id_seq'::regclass);
 H   ALTER TABLE public.main_ticket_passengers ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    236    235    236            ?           2604    20019    main_user id    DEFAULT     l   ALTER TABLE ONLY public.main_user ALTER COLUMN id SET DEFAULT nextval('public.main_user_id_seq'::regclass);
 ;   ALTER TABLE public.main_user ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    219    220    220            ?           2604    20030    main_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.main_user_groups ALTER COLUMN id SET DEFAULT nextval('public.main_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.main_user_groups ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    222    221    222            ?           2604    20037    main_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.main_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.main_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.main_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    224    223    224            ?           2604    20065    main_week id    DEFAULT     l   ALTER TABLE ONLY public.main_week ALTER COLUMN id SET DEFAULT nextval('public.main_week_id_seq'::regclass);
 ;   ALTER TABLE public.main_week ALTER COLUMN id DROP DEFAULT;
       public          ayush    false    232    231    232            ?          0    19974 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          ayush    false    216   ??       ?          0    19983    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          ayush    false    218   ??       ?          0    19967    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          ayush    false    214   ??       ?          0    20174    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          ayush    false    240   z?       ?          0    19958    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          ayush    false    212   ??       ?          0    19949    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          ayush    false    210   #?       ?          0    20195    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          ayush    false    241   ??       ?          0    20041    main_flight 
   TABLE DATA           ?   COPY public.main_flight (id, depart_time, duration, arrival_time, plane, airline, economy_fare, business_fare, first_fare, capacity, available_economy, available_business, available_first, destination_id, origin_id) FROM stdin;
    public          ayush    false    226   ??       ?          0    20085    main_flight_depart_day 
   TABLE DATA           H   COPY public.main_flight_depart_day (id, flight_id, week_id) FROM stdin;
    public          ayush    false    238   x?       ?          0    20048    main_passenger 
   TABLE DATA           K   COPY public.main_passenger (id, first_name, last_name, gender) FROM stdin;
    public          ayush    false    228   ??       ?          0    20055 
   main_place 
   TABLE DATA           F   COPY public.main_place (id, city, airport, code, country) FROM stdin;
    public          ayush    false    230   ??       ?          0    20069    main_ticket 
   TABLE DATA           ?   COPY public.main_ticket (id, ref_no, flight_ddate, flight_adate, flight_fare, other_charges, coupon_used, coupon_discount, total_fare, seat_class, booking_date, mobile, email, status, flight_id, user_id) FROM stdin;
    public          ayush    false    234   ??       ?          0    20078    main_ticket_passengers 
   TABLE DATA           M   COPY public.main_ticket_passengers (id, ticket_id, passenger_id) FROM stdin;
    public          ayush    false    236   ??       ?          0    20016 	   main_user 
   TABLE DATA           ?   COPY public.main_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          ayush    false    220   ?       ?          0    20027    main_user_groups 
   TABLE DATA           A   COPY public.main_user_groups (id, user_id, group_id) FROM stdin;
    public          ayush    false    222   ??       ?          0    20034    main_user_user_permissions 
   TABLE DATA           P   COPY public.main_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          ayush    false    224   ??       ?          0    20062 	   main_week 
   TABLE DATA           5   COPY public.main_week (id, number, name) FROM stdin;
    public          ayush    false    232   ??       ?           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          ayush    false    215            ?           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          ayush    false    217            ?           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);
          public          ayush    false    213            ?           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          ayush    false    239            ?           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);
          public          ayush    false    211            ?           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);
          public          ayush    false    209            ?           0    0    main_flight_depart_day_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.main_flight_depart_day_id_seq', 14, true);
          public          ayush    false    237            ?           0    0    main_flight_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.main_flight_id_seq', 2, true);
          public          ayush    false    225            ?           0    0    main_passenger_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.main_passenger_id_seq', 1, false);
          public          ayush    false    227            ?           0    0    main_place_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_place_id_seq', 126, true);
          public          ayush    false    229            ?           0    0    main_ticket_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_ticket_id_seq', 1, false);
          public          ayush    false    233            ?           0    0    main_ticket_passengers_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.main_ticket_passengers_id_seq', 1, false);
          public          ayush    false    235            ?           0    0    main_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.main_user_groups_id_seq', 1, false);
          public          ayush    false    221            ?           0    0    main_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.main_user_id_seq', 1, true);
          public          ayush    false    219            ?           0    0 !   main_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.main_user_user_permissions_id_seq', 1, false);
          public          ayush    false    223            ?           0    0    main_week_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.main_week_id_seq', 7, true);
          public          ayush    false    231            ?           2606    20013    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            ayush    false    216            ?           2606    19999 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            ayush    false    218    218            ?           2606    19988 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            ayush    false    218            ?           2606    19979    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            ayush    false    216            ?           2606    19990 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            ayush    false    214    214            ?           2606    19972 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            ayush    false    214                       2606    20182 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            ayush    false    240            ?           2606    19965 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            ayush    false    212    212            ?           2606    19963 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            ayush    false    212            ?           2606    19956 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            ayush    false    210                       2606    20201 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            ayush    false    241            ?           2606    20158 M   main_flight_depart_day main_flight_depart_day_flight_id_week_id_0449e1e9_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_flight_depart_day
    ADD CONSTRAINT main_flight_depart_day_flight_id_week_id_0449e1e9_uniq UNIQUE (flight_id, week_id);
 w   ALTER TABLE ONLY public.main_flight_depart_day DROP CONSTRAINT main_flight_depart_day_flight_id_week_id_0449e1e9_uniq;
       public            ayush    false    238    238            ?           2606    20090 2   main_flight_depart_day main_flight_depart_day_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.main_flight_depart_day
    ADD CONSTRAINT main_flight_depart_day_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.main_flight_depart_day DROP CONSTRAINT main_flight_depart_day_pkey;
       public            ayush    false    238            ?           2606    20046    main_flight main_flight_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_flight
    ADD CONSTRAINT main_flight_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_flight DROP CONSTRAINT main_flight_pkey;
       public            ayush    false    226            ?           2606    20053 "   main_passenger main_passenger_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.main_passenger
    ADD CONSTRAINT main_passenger_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.main_passenger DROP CONSTRAINT main_passenger_pkey;
       public            ayush    false    228            ?           2606    20060    main_place main_place_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.main_place
    ADD CONSTRAINT main_place_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.main_place DROP CONSTRAINT main_place_pkey;
       public            ayush    false    230            ?           2606    20083 2   main_ticket_passengers main_ticket_passengers_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.main_ticket_passengers
    ADD CONSTRAINT main_ticket_passengers_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.main_ticket_passengers DROP CONSTRAINT main_ticket_passengers_pkey;
       public            ayush    false    236            ?           2606    20144 R   main_ticket_passengers main_ticket_passengers_ticket_id_passenger_id_2f54b5b2_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_ticket_passengers
    ADD CONSTRAINT main_ticket_passengers_ticket_id_passenger_id_2f54b5b2_uniq UNIQUE (ticket_id, passenger_id);
 |   ALTER TABLE ONLY public.main_ticket_passengers DROP CONSTRAINT main_ticket_passengers_ticket_id_passenger_id_2f54b5b2_uniq;
       public            ayush    false    236    236            ?           2606    20074    main_ticket main_ticket_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_ticket
    ADD CONSTRAINT main_ticket_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_ticket DROP CONSTRAINT main_ticket_pkey;
       public            ayush    false    234            ?           2606    20076 "   main_ticket main_ticket_ref_no_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.main_ticket
    ADD CONSTRAINT main_ticket_ref_no_key UNIQUE (ref_no);
 L   ALTER TABLE ONLY public.main_ticket DROP CONSTRAINT main_ticket_ref_no_key;
       public            ayush    false    234            ?           2606    20032 &   main_user_groups main_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.main_user_groups
    ADD CONSTRAINT main_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.main_user_groups DROP CONSTRAINT main_user_groups_pkey;
       public            ayush    false    222            ?           2606    20103 @   main_user_groups main_user_groups_user_id_group_id_ae195797_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_user_groups
    ADD CONSTRAINT main_user_groups_user_id_group_id_ae195797_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.main_user_groups DROP CONSTRAINT main_user_groups_user_id_group_id_ae195797_uniq;
       public            ayush    false    222    222            ?           2606    20023    main_user main_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.main_user
    ADD CONSTRAINT main_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.main_user DROP CONSTRAINT main_user_pkey;
       public            ayush    false    220            ?           2606    20039 :   main_user_user_permissions main_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.main_user_user_permissions
    ADD CONSTRAINT main_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.main_user_user_permissions DROP CONSTRAINT main_user_user_permissions_pkey;
       public            ayush    false    224            ?           2606    20117 Y   main_user_user_permissions main_user_user_permissions_user_id_permission_id_96b9fadf_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_user_user_permissions
    ADD CONSTRAINT main_user_user_permissions_user_id_permission_id_96b9fadf_uniq UNIQUE (user_id, permission_id);
 ?   ALTER TABLE ONLY public.main_user_user_permissions DROP CONSTRAINT main_user_user_permissions_user_id_permission_id_96b9fadf_uniq;
       public            ayush    false    224    224            ?           2606    20025     main_user main_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.main_user
    ADD CONSTRAINT main_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.main_user DROP CONSTRAINT main_user_username_key;
       public            ayush    false    220            ?           2606    20067    main_week main_week_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.main_week
    ADD CONSTRAINT main_week_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.main_week DROP CONSTRAINT main_week_pkey;
       public            ayush    false    232            ?           1259    20014    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            ayush    false    216            ?           1259    20010 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            ayush    false    218            ?           1259    20011 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            ayush    false    218            ?           1259    19996 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            ayush    false    214                       1259    20193 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            ayush    false    240                       1259    20194 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            ayush    false    240                       1259    20203 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            ayush    false    241                       1259    20202 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            ayush    false    241            ?           1259    20169 )   main_flight_depart_day_flight_id_bf739ed6    INDEX     q   CREATE INDEX main_flight_depart_day_flight_id_bf739ed6 ON public.main_flight_depart_day USING btree (flight_id);
 =   DROP INDEX public.main_flight_depart_day_flight_id_bf739ed6;
       public            ayush    false    238                        1259    20170 '   main_flight_depart_day_week_id_58ac2b8f    INDEX     m   CREATE INDEX main_flight_depart_day_week_id_58ac2b8f ON public.main_flight_depart_day USING btree (week_id);
 ;   DROP INDEX public.main_flight_depart_day_week_id_58ac2b8f;
       public            ayush    false    238            ?           1259    20171 #   main_flight_destination_id_3c116b98    INDEX     e   CREATE INDEX main_flight_destination_id_3c116b98 ON public.main_flight USING btree (destination_id);
 7   DROP INDEX public.main_flight_destination_id_3c116b98;
       public            ayush    false    226            ?           1259    20172    main_flight_origin_id_a9cd93c5    INDEX     [   CREATE INDEX main_flight_origin_id_a9cd93c5 ON public.main_flight USING btree (origin_id);
 2   DROP INDEX public.main_flight_origin_id_a9cd93c5;
       public            ayush    false    226            ?           1259    20141    main_ticket_flight_id_190b920d    INDEX     [   CREATE INDEX main_ticket_flight_id_190b920d ON public.main_ticket USING btree (flight_id);
 2   DROP INDEX public.main_ticket_flight_id_190b920d;
       public            ayush    false    234            ?           1259    20156 ,   main_ticket_passengers_passenger_id_fb7adf9d    INDEX     w   CREATE INDEX main_ticket_passengers_passenger_id_fb7adf9d ON public.main_ticket_passengers USING btree (passenger_id);
 @   DROP INDEX public.main_ticket_passengers_passenger_id_fb7adf9d;
       public            ayush    false    236            ?           1259    20155 )   main_ticket_passengers_ticket_id_17d99743    INDEX     q   CREATE INDEX main_ticket_passengers_ticket_id_17d99743 ON public.main_ticket_passengers USING btree (ticket_id);
 =   DROP INDEX public.main_ticket_passengers_ticket_id_17d99743;
       public            ayush    false    236            ?           1259    20140     main_ticket_ref_no_6e3c369a_like    INDEX     n   CREATE INDEX main_ticket_ref_no_6e3c369a_like ON public.main_ticket USING btree (ref_no varchar_pattern_ops);
 4   DROP INDEX public.main_ticket_ref_no_6e3c369a_like;
       public            ayush    false    234            ?           1259    20142    main_ticket_user_id_274dde50    INDEX     W   CREATE INDEX main_ticket_user_id_274dde50 ON public.main_ticket USING btree (user_id);
 0   DROP INDEX public.main_ticket_user_id_274dde50;
       public            ayush    false    234            ?           1259    20115 "   main_user_groups_group_id_a337ba62    INDEX     c   CREATE INDEX main_user_groups_group_id_a337ba62 ON public.main_user_groups USING btree (group_id);
 6   DROP INDEX public.main_user_groups_group_id_a337ba62;
       public            ayush    false    222            ?           1259    20114 !   main_user_groups_user_id_df502602    INDEX     a   CREATE INDEX main_user_groups_user_id_df502602 ON public.main_user_groups USING btree (user_id);
 5   DROP INDEX public.main_user_groups_user_id_df502602;
       public            ayush    false    222            ?           1259    20129 1   main_user_user_permissions_permission_id_cd2b56a3    INDEX     ?   CREATE INDEX main_user_user_permissions_permission_id_cd2b56a3 ON public.main_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.main_user_user_permissions_permission_id_cd2b56a3;
       public            ayush    false    224            ?           1259    20128 +   main_user_user_permissions_user_id_451ce57f    INDEX     u   CREATE INDEX main_user_user_permissions_user_id_451ce57f ON public.main_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.main_user_user_permissions_user_id_451ce57f;
       public            ayush    false    224            ?           1259    20101     main_user_username_6330637b_like    INDEX     n   CREATE INDEX main_user_username_6330637b_like ON public.main_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.main_user_username_6330637b_like;
       public            ayush    false    220                       2620    20206    main_ticket capacity_check    TRIGGER     u   CREATE TRIGGER capacity_check BEFORE INSERT ON public.main_ticket FOR EACH ROW EXECUTE FUNCTION public.seat_count();
 3   DROP TRIGGER capacity_check ON public.main_ticket;
       public          ayush    false    234    245                       2606    20005 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          ayush    false    214    3271    218            
           2606    20000 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          ayush    false    3276    216    218            	           2606    19991 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          ayush    false    212    214    3266                       2606    20183 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          ayush    false    212    240    3266                       2606    20188 B   django_admin_log django_admin_log_user_id_c564eba6_fk_main_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_main_user_id FOREIGN KEY (user_id) REFERENCES public.main_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_main_user_id;
       public          ayush    false    3284    240    220                       2606    20159 R   main_flight_depart_day main_flight_depart_day_flight_id_bf739ed6_fk_main_flight_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_flight_depart_day
    ADD CONSTRAINT main_flight_depart_day_flight_id_bf739ed6_fk_main_flight_id FOREIGN KEY (flight_id) REFERENCES public.main_flight(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.main_flight_depart_day DROP CONSTRAINT main_flight_depart_day_flight_id_bf739ed6_fk_main_flight_id;
       public          ayush    false    3303    238    226                       2606    20164 N   main_flight_depart_day main_flight_depart_day_week_id_58ac2b8f_fk_main_week_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_flight_depart_day
    ADD CONSTRAINT main_flight_depart_day_week_id_58ac2b8f_fk_main_week_id FOREIGN KEY (week_id) REFERENCES public.main_week(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.main_flight_depart_day DROP CONSTRAINT main_flight_depart_day_week_id_58ac2b8f_fk_main_week_id;
       public          ayush    false    3309    238    232                       2606    20091 @   main_flight main_flight_destination_id_3c116b98_fk_main_place_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_flight
    ADD CONSTRAINT main_flight_destination_id_3c116b98_fk_main_place_id FOREIGN KEY (destination_id) REFERENCES public.main_place(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.main_flight DROP CONSTRAINT main_flight_destination_id_3c116b98_fk_main_place_id;
       public          ayush    false    226    230    3307                       2606    20096 ;   main_flight main_flight_origin_id_a9cd93c5_fk_main_place_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_flight
    ADD CONSTRAINT main_flight_origin_id_a9cd93c5_fk_main_place_id FOREIGN KEY (origin_id) REFERENCES public.main_place(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.main_flight DROP CONSTRAINT main_flight_origin_id_a9cd93c5_fk_main_place_id;
       public          ayush    false    226    3307    230                       2606    20130 <   main_ticket main_ticket_flight_id_190b920d_fk_main_flight_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_ticket
    ADD CONSTRAINT main_ticket_flight_id_190b920d_fk_main_flight_id FOREIGN KEY (flight_id) REFERENCES public.main_flight(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.main_ticket DROP CONSTRAINT main_ticket_flight_id_190b920d_fk_main_flight_id;
       public          ayush    false    3303    226    234                       2606    20150 N   main_ticket_passengers main_ticket_passenge_passenger_id_fb7adf9d_fk_main_pass    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_ticket_passengers
    ADD CONSTRAINT main_ticket_passenge_passenger_id_fb7adf9d_fk_main_pass FOREIGN KEY (passenger_id) REFERENCES public.main_passenger(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.main_ticket_passengers DROP CONSTRAINT main_ticket_passenge_passenger_id_fb7adf9d_fk_main_pass;
       public          ayush    false    3305    236    228                       2606    20145 R   main_ticket_passengers main_ticket_passengers_ticket_id_17d99743_fk_main_ticket_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_ticket_passengers
    ADD CONSTRAINT main_ticket_passengers_ticket_id_17d99743_fk_main_ticket_id FOREIGN KEY (ticket_id) REFERENCES public.main_ticket(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.main_ticket_passengers DROP CONSTRAINT main_ticket_passengers_ticket_id_17d99743_fk_main_ticket_id;
       public          ayush    false    3312    236    234                       2606    20135 8   main_ticket main_ticket_user_id_274dde50_fk_main_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_ticket
    ADD CONSTRAINT main_ticket_user_id_274dde50_fk_main_user_id FOREIGN KEY (user_id) REFERENCES public.main_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.main_ticket DROP CONSTRAINT main_ticket_user_id_274dde50_fk_main_user_id;
       public          ayush    false    3284    220    234                       2606    20109 D   main_user_groups main_user_groups_group_id_a337ba62_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_user_groups
    ADD CONSTRAINT main_user_groups_group_id_a337ba62_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.main_user_groups DROP CONSTRAINT main_user_groups_group_id_a337ba62_fk_auth_group_id;
       public          ayush    false    222    216    3276                       2606    20104 B   main_user_groups main_user_groups_user_id_df502602_fk_main_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_user_groups
    ADD CONSTRAINT main_user_groups_user_id_df502602_fk_main_user_id FOREIGN KEY (user_id) REFERENCES public.main_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.main_user_groups DROP CONSTRAINT main_user_groups_user_id_df502602_fk_main_user_id;
       public          ayush    false    3284    222    220                       2606    20123 S   main_user_user_permissions main_user_user_permi_permission_id_cd2b56a3_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_user_user_permissions
    ADD CONSTRAINT main_user_user_permi_permission_id_cd2b56a3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.main_user_user_permissions DROP CONSTRAINT main_user_user_permi_permission_id_cd2b56a3_fk_auth_perm;
       public          ayush    false    3271    214    224                       2606    20118 V   main_user_user_permissions main_user_user_permissions_user_id_451ce57f_fk_main_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_user_user_permissions
    ADD CONSTRAINT main_user_user_permissions_user_id_451ce57f_fk_main_user_id FOREIGN KEY (user_id) REFERENCES public.main_user(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.main_user_user_permissions DROP CONSTRAINT main_user_user_permissions_user_id_451ce57f_fk_main_user_id;
       public          ayush    false    220    224    3284            ?      x?????? ? ?      ?      x?????? ? ?      ?   ?  x?]?[n?@E?gV?
???w?Q?B0%(?F?}??????}$?k?????j???,??r?m??VC?s@?[5??P?? ??}\-?-K ???4????̦8?v?ҍ??AM???Hv?=k?Ò?b/?hHpT?5Y????\??????xN^??????
`A?"???n?.[_St%?Pk??Pj?7???no<)?$?o4?????????T?pѲg®?Q0?c,???@`????K??	t????ДD0?'?P??1,ǡ$??????ΰ???'??3d?? r`H?:!????y??%nfw????&՚??Ԥ[?|p???k?M0I??WutW??߾0?9[!b2?? ?b? Z?X??????#???/LhyLH??2A??(UTy?q*)]??W?o??/MT!?L^?"?Th?"?>?????S      ?      x?????? ? ?      ?   |   x?M?K!D?]?1?߻?!?2d t???^"???W?C???D1{NZ7?6??p]?H?	????[??\Nګ???????	\h???	W\?~??'?mP?"?|??_#Z?0?A+?chp3+; o??<T      ?   ?  x????n? ???{_5b?2?YVB(?.6.??y?????ً/??<3?m??~JfJ?:??!?@??&?]??o?@?B??ȉ?G*$#?7b'??G1V???˨rC?wԤG?Pc??dE#?^??~???V??v?5?0???n?U??V?LC~jWcM#E[b??Q[?a?-o?B??֔?S?W?????tL????	?dI?T7+????|.6????Z׷??????/??E'?җ?2!??F?̓????/ ?&??k?[??4L????k?j??6?̯I=cTT??@-s^?Qs???MR??J?~Z?o?{??????r???oM]?Y?r?/?+e?0?5????????p???<?_????WG?rw???sZ??w?u????0}٣?R=?ESֿ?Q?{R;?s<d?p?      ?      x?????? ? ?      ?      x?}?=
1????)?23?L&??CXm#"K@"????4v/o?0H+?J*5??+?????uʞqj???i?n羵?3;8??A(M`?q?-???CJ_5?T????O?]??T?d?????r!<Z0)?      ?   D   x?̱?0C???L^?$?d?9"7?T?Bd?o?I?ɲ?mc7?ݼ?B???????g??<????      ?      x?????? ? ?      ?   ?
  x?}Y???????`??̶?RH=ZR빢????	$bD?H@ݫ?|??pb;p?؁?#???????C?8VQ?Q?zܪ?7	?H(S?ğ9???????????@??X
'[?LD?	??????I?????
?0?????R#=ƿpqȩӧ'?@??;??S????:?嗧e?๗?Ut?#???6?LƎ+,d?5o?h?>??i???I????"?\n[???? cF?@ɷ?#?u?v
K?2???F?̧???b@艊J??%?6ţ?,gOG??J?x? &?g?}???q???zGVT??T???Q?6+?#r??سJ?J?(?"?F%??t?}?O??;?Ȃ%Sp(??Tkd@Ð??po????.??????:i??-?????g-lGw?֍T??g???????????.1Qq?T?d'T?tX0??????G???!??"-2`a??D?p]XY???ۇ?t?چ{??x???Ø&ָ쏦FR
???b%?????Bƛ,??V?p'&?bb0i3Ǥ!?qgSH?J???W?2b?lq?7??????x?
?]???t???l???y*?\???$Ց<?@8??)?????????TӐ:3??z?b?d???9V??Qk?Q|?D?????e?~y{?&????????t<???bߜ??yB?QE?и?j??w??Vj-84C~?9u??Cȵ??6?,jm2î???H???TAk??nO????=????#Cg??\ޡq?ˑ?d?#???A@?ԗp????/?h?-?Y4???E??̩?bT?V/???????>d??kDN?r??vC?2??7toT??.?R&	+9g ???f???v?z^>F4y??2k?FO?գ??ÿ?A???Y??{y??k?l(?1n?6T??Up?f+???_9??ϓ?5o????U?z?%"?2zI;q?m?<??e?ށ??2R~`?/?p?K?iI?9???{?;2?4◧Mlr{??*Y?	?kN?xv vҖ:V?[?Ѩ??v?Hye???1?"??7?&?Q$?qf|ǔ??ç??wH0y?,????WjSv1?N<??F??Pa ?WN?9n?f??h?g߼<?g???V8?<??˵?ZF??Pw?)=r$?<T?9J?ިQ?e\?(?\i???bR???q)???K8?-*+?;??\7k`#k?]?7tk$r???M?"??٫?J?K?ֱ?$?*?Nm?()8??:???/??<L???t??\3????2ڬ??Q5Q?C??+???8+ ?????$C??7??K?ͽ?-?6?Q???4???={??pM?0??T9ZoIO?o<?4??'??Ƀ5c???թق+ ?p??쵁?+-PvlW3Z?G?A?J???A??o??rL~?	U?f? ????2?????=v?%y?Sgn???K牞P??")??`s?[w???>?)???u3~?!?!p?>O;*?c?????V???Ur?]??V???}??GY?yG????MJ???g?=d??]J???:???9????%??J x????0k?t?rp?2~v? ?@.??????>?(5X+???h$}??Wyw?<?[mӾh??+>{ؾ?խN	xgԄp?R?-Q?n?Ʃ??S???k???g????!)????D?4????E+S?_Ү??L????{?ɷK?Wi2?= ??l??jl??u?҆??yȔ??:?N????n???л??R?i?ˠ??Tw>ɰh? p???????Bڋ??x4?<ޙ??g??0Hy%???􁆕v?x???G%?x3V)e?5????dpu???tl????)?w@whu0!6?k??O??k??T?3?iy?OE?ڹ?q??i???<p6ߙ?SE???'?h????勢?ujY?9???t???]Pt?iݣ?1ҔE'v?o?Ϳ{?u?>td??????b???ގ?g?r?B ?0.???f?? xR??????ݗ?3????l?d????j?qFT~?E??<?it:?t	tcbx?/I?h?%/?mL?V??l???H?G????;X(4)??.5???-???7?٭?GD??f|Pp???q??t?)??|g??!??E?,?3w?6mv?$?N???Y?B??i??O???V?Aܝv??l????Ǔ?n????"%??['Y?E?fu[?^?D??hY^??,Cv???T"k??p?w{nq??<
9?????-??+$???'?]???5?I>m????.Z?t?R[k???0??J?r@?<??YN???G???dM?????x??E???\?W??HzҊFd?8~???l????ء?ӆG D3?4?O??e?	??: ??Ak[??$n1?U???y4??]?Kg?p۔ݝ?
??X!?ʩ?????r3%??t'??5s0??8#Jt??|Y?풙? ,???????D???m<?.?-??"ɣML-(Y+???U???=?`??ջyE{?????[??J#\̣??_??׉??? ????ByPexN?ˣ4?H?Q4&E?xR(R?H???y=?N8?6????T?H??N?????1oA?Z?M?B???ܘ*?)??k4??f3??)?l?A&????J?y?
@?~5?4P?|9??9.ZJ?Hm??pG??45??@Up?^}??????Q?/ϫ?gתF_?Z?L?Ώ?cf?ᕙ??u??f?a?8
?6r?:=4?(m\9}ȵ?;y.???H'?????¦@?g?K?0?٠??D?8??,i?\m]??Z .a???L???'??]??L?+??? vb      ?      x?????? ? ?      ?      x?????? ? ?      ?   ?   x?%?A?0????+:x??s???B$	?!??&??~}B??9??U[7x?@?1\?%???,??&?YB'm??d\oG9ONZmV?_???z?6?????>?????H?<????N?޶??e???r??ϙ;{Ñ1n?]??M)??A-?      ?      x?????? ? ?      ?      x?????? ? ?      ?   Q   x?3?4????KI??2?4?)M-??9?8?SS? <Ncΐ??"0ǔӄӭ(?4?4?N,)-q?9?8?K?&??qqq jA?     