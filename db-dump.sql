--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: core_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_ads (
    id integer NOT NULL,
    status boolean NOT NULL,
    total_no_of_views integer,
    video character varying(100) NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    thumbnail character varying(100) NOT NULL
);


ALTER TABLE public.core_ads OWNER TO postgres;

--
-- Name: core_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_ads_id_seq OWNER TO postgres;

--
-- Name: core_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_ads_id_seq OWNED BY public.core_ads.id;


--
-- Name: core_badge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_badge (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    no_of_referal character varying(255) NOT NULL,
    image character varying(100)
);


ALTER TABLE public.core_badge OWNER TO postgres;

--
-- Name: core_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_badge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_badge_id_seq OWNER TO postgres;

--
-- Name: core_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_badge_id_seq OWNED BY public.core_badge.id;


--
-- Name: core_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_documents (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    user_id integer NOT NULL,
    bill_doc character varying(100) NOT NULL,
    id_doc character varying(100) NOT NULL
);


ALTER TABLE public.core_documents OWNER TO postgres;

--
-- Name: core_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_documents_id_seq OWNER TO postgres;

--
-- Name: core_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_documents_id_seq OWNED BY public.core_documents.id;


--
-- Name: core_income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_income (
    id integer NOT NULL,
    type1 character varying(255) NOT NULL,
    amount double precision NOT NULL,
    details character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_income OWNER TO postgres;

--
-- Name: core_income_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_income_id_seq OWNER TO postgres;

--
-- Name: core_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_income_id_seq OWNED BY public.core_income.id;


--
-- Name: core_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_membership (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    amount double precision NOT NULL,
    details character varying(255) NOT NULL
);


ALTER TABLE public.core_membership OWNER TO postgres;

--
-- Name: core_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_membership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_membership_id_seq OWNER TO postgres;

--
-- Name: core_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_membership_id_seq OWNED BY public.core_membership.id;


--
-- Name: core_officialdeposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_officialdeposit (
    id integer NOT NULL,
    amount double precision NOT NULL,
    status character varying(255) NOT NULL,
    user_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    screenshot character varying(100) NOT NULL
);


ALTER TABLE public.core_officialdeposit OWNER TO postgres;

--
-- Name: core_officialdeposit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_officialdeposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_officialdeposit_id_seq OWNER TO postgres;

--
-- Name: core_officialdeposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_officialdeposit_id_seq OWNED BY public.core_officialdeposit.id;


--
-- Name: core_officialwithdraw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_officialwithdraw (
    id integer NOT NULL,
    amount double precision NOT NULL,
    trc20_address character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    user_id integer NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.core_officialwithdraw OWNER TO postgres;

--
-- Name: core_officialwithdraw_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_officialwithdraw_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_officialwithdraw_id_seq OWNER TO postgres;

--
-- Name: core_officialwithdraw_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_officialwithdraw_id_seq OWNED BY public.core_officialwithdraw.id;


--
-- Name: core_pack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_pack (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    amount double precision NOT NULL,
    details character varying(255) NOT NULL,
    duration integer NOT NULL
);


ALTER TABLE public.core_pack OWNER TO postgres;

--
-- Name: core_pack_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_pack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_pack_id_seq OWNER TO postgres;

--
-- Name: core_pack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_pack_id_seq OWNED BY public.core_pack.id;


--
-- Name: core_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_rank (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    salary double precision NOT NULL,
    details character varying(255) NOT NULL,
    required_sales double precision NOT NULL,
    rewards double precision NOT NULL
);


ALTER TABLE public.core_rank OWNER TO postgres;

--
-- Name: core_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_rank_id_seq OWNER TO postgres;

--
-- Name: core_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_rank_id_seq OWNED BY public.core_rank.id;


--
-- Name: core_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_role (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.core_role OWNER TO postgres;

--
-- Name: core_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_role_id_seq OWNER TO postgres;

--
-- Name: core_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_role_id_seq OWNED BY public.core_role.id;


--
-- Name: core_sharebalancehistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_sharebalancehistory (
    id integer NOT NULL,
    amount double precision NOT NULL,
    date timestamp with time zone NOT NULL,
    recipient_id integer NOT NULL,
    sender_id integer NOT NULL
);


ALTER TABLE public.core_sharebalancehistory OWNER TO postgres;

--
-- Name: core_sharebalancehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_sharebalancehistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_sharebalancehistory_id_seq OWNER TO postgres;

--
-- Name: core_sharebalancehistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_sharebalancehistory_id_seq OWNED BY public.core_sharebalancehistory.id;


--
-- Name: core_teamearning; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_teamearning (
    id integer NOT NULL,
    referal_id bigint NOT NULL,
    type1 character varying(255) NOT NULL,
    amount double precision NOT NULL,
    details character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_teamearning OWNER TO postgres;

--
-- Name: core_teamearning_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_teamearning_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_teamearning_id_seq OWNER TO postgres;

--
-- Name: core_teamearning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_teamearning_id_seq OWNED BY public.core_teamearning.id;


--
-- Name: core_totalamounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_totalamounts (
    id integer NOT NULL,
    salary double precision,
    income double precision,
    team_earning double precision,
    master_pack double precision,
    user_id integer NOT NULL
);


ALTER TABLE public.core_totalamounts OWNER TO postgres;

--
-- Name: core_totalamounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_totalamounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_totalamounts_id_seq OWNER TO postgres;

--
-- Name: core_totalamounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_totalamounts_id_seq OWNED BY public.core_totalamounts.id;


--
-- Name: core_transactionhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_transactionhistory (
    id integer NOT NULL,
    type1 character varying(255) NOT NULL,
    credit_debit character varying(255) NOT NULL,
    amount double precision NOT NULL,
    old_balance double precision NOT NULL,
    new_balance double precision NOT NULL,
    details character varying(255) NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_transactionhistory OWNER TO postgres;

--
-- Name: core_transactionhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_transactionhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_transactionhistory_id_seq OWNER TO postgres;

--
-- Name: core_transactionhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_transactionhistory_id_seq OWNED BY public.core_transactionhistory.id;


--
-- Name: core_transferbalancehistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_transferbalancehistory (
    id integer NOT NULL,
    amount double precision NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_transferbalancehistory OWNER TO postgres;

--
-- Name: core_transferbalancehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_transferbalancehistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_transferbalancehistory_id_seq OWNER TO postgres;

--
-- Name: core_transferbalancehistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_transferbalancehistory_id_seq OWNED BY public.core_transferbalancehistory.id;


--
-- Name: core_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(255) NOT NULL,
    personal_id bigint,
    referal_id_id integer,
    full_name character varying(255) NOT NULL,
    email character varying(255),
    image character varying(100) NOT NULL,
    status integer NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    phone_number bigint,
    date_of_birth date,
    gender character varying(255) NOT NULL,
    "CNIC" character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    postal_code integer,
    state character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    facebook_link character varying(255) NOT NULL,
    twitter_link character varying(255) NOT NULL,
    skype_link character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    badge_id integer,
    rank_id integer,
    role_id integer,
    exchanger boolean NOT NULL,
    personal_pin character varying(255) NOT NULL
);


ALTER TABLE public.core_user OWNER TO postgres;

--
-- Name: core_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.core_user_groups OWNER TO postgres;

--
-- Name: core_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_user_groups_id_seq OWNER TO postgres;

--
-- Name: core_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_user_groups_id_seq OWNED BY public.core_user_groups.id;


--
-- Name: core_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_user_id_seq OWNER TO postgres;

--
-- Name: core_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_user_id_seq OWNED BY public.core_user.id;


--
-- Name: core_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.core_user_user_permissions OWNER TO postgres;

--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_user_user_permissions_id_seq OWNED BY public.core_user_user_permissions.id;


--
-- Name: core_useradsview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_useradsview (
    id integer NOT NULL,
    ads_id integer NOT NULL,
    user_id integer NOT NULL,
    viewed boolean NOT NULL
);


ALTER TABLE public.core_useradsview OWNER TO postgres;

--
-- Name: core_useradsview_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_useradsview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_useradsview_id_seq OWNER TO postgres;

--
-- Name: core_useradsview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_useradsview_id_seq OWNED BY public.core_useradsview.id;


--
-- Name: core_usermembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_usermembership (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    membership_id integer NOT NULL,
    user_id integer NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.core_usermembership OWNER TO postgres;

--
-- Name: core_usermembership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_usermembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_usermembership_id_seq OWNER TO postgres;

--
-- Name: core_usermembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_usermembership_id_seq OWNED BY public.core_usermembership.id;


--
-- Name: core_userpack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_userpack (
    id integer NOT NULL,
    quantity integer NOT NULL,
    details character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    status character varying(255) NOT NULL,
    pack_id integer NOT NULL,
    user_id integer NOT NULL,
    ended_at timestamp with time zone
);


ALTER TABLE public.core_userpack OWNER TO postgres;

--
-- Name: core_userpack_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_userpack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_userpack_id_seq OWNER TO postgres;

--
-- Name: core_userpack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_userpack_id_seq OWNED BY public.core_userpack.id;


--
-- Name: core_userpin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_userpin (
    id integer NOT NULL,
    pin character varying(30) NOT NULL,
    amount double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    refund_date timestamp with time zone,
    user_id integer NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.core_userpin OWNER TO postgres;

--
-- Name: core_userpin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_userpin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_userpin_id_seq OWNER TO postgres;

--
-- Name: core_userpin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_userpin_id_seq OWNED BY public.core_userpin.id;


--
-- Name: core_usersalesdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_usersalesdata (
    id integer NOT NULL,
    total_sales double precision NOT NULL,
    referral_id integer NOT NULL,
    user_id integer NOT NULL,
    current_target_achieved boolean NOT NULL
);


ALTER TABLE public.core_usersalesdata OWNER TO postgres;

--
-- Name: core_usersalesdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_usersalesdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_usersalesdata_id_seq OWNER TO postgres;

--
-- Name: core_usersalesdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_usersalesdata_id_seq OWNED BY public.core_usersalesdata.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: core_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_ads ALTER COLUMN id SET DEFAULT nextval('public.core_ads_id_seq'::regclass);


--
-- Name: core_badge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_badge ALTER COLUMN id SET DEFAULT nextval('public.core_badge_id_seq'::regclass);


--
-- Name: core_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_documents ALTER COLUMN id SET DEFAULT nextval('public.core_documents_id_seq'::regclass);


--
-- Name: core_income id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_income ALTER COLUMN id SET DEFAULT nextval('public.core_income_id_seq'::regclass);


--
-- Name: core_membership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_membership ALTER COLUMN id SET DEFAULT nextval('public.core_membership_id_seq'::regclass);


--
-- Name: core_officialdeposit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_officialdeposit ALTER COLUMN id SET DEFAULT nextval('public.core_officialdeposit_id_seq'::regclass);


--
-- Name: core_officialwithdraw id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_officialwithdraw ALTER COLUMN id SET DEFAULT nextval('public.core_officialwithdraw_id_seq'::regclass);


--
-- Name: core_pack id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_pack ALTER COLUMN id SET DEFAULT nextval('public.core_pack_id_seq'::regclass);


--
-- Name: core_rank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_rank ALTER COLUMN id SET DEFAULT nextval('public.core_rank_id_seq'::regclass);


--
-- Name: core_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_role ALTER COLUMN id SET DEFAULT nextval('public.core_role_id_seq'::regclass);


--
-- Name: core_sharebalancehistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_sharebalancehistory ALTER COLUMN id SET DEFAULT nextval('public.core_sharebalancehistory_id_seq'::regclass);


--
-- Name: core_teamearning id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_teamearning ALTER COLUMN id SET DEFAULT nextval('public.core_teamearning_id_seq'::regclass);


--
-- Name: core_totalamounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_totalamounts ALTER COLUMN id SET DEFAULT nextval('public.core_totalamounts_id_seq'::regclass);


--
-- Name: core_transactionhistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_transactionhistory ALTER COLUMN id SET DEFAULT nextval('public.core_transactionhistory_id_seq'::regclass);


--
-- Name: core_transferbalancehistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_transferbalancehistory ALTER COLUMN id SET DEFAULT nextval('public.core_transferbalancehistory_id_seq'::regclass);


--
-- Name: core_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user ALTER COLUMN id SET DEFAULT nextval('public.core_user_id_seq'::regclass);


--
-- Name: core_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_groups ALTER COLUMN id SET DEFAULT nextval('public.core_user_groups_id_seq'::regclass);


--
-- Name: core_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.core_user_user_permissions_id_seq'::regclass);


--
-- Name: core_useradsview id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_useradsview ALTER COLUMN id SET DEFAULT nextval('public.core_useradsview_id_seq'::regclass);


--
-- Name: core_usermembership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usermembership ALTER COLUMN id SET DEFAULT nextval('public.core_usermembership_id_seq'::regclass);


--
-- Name: core_userpack id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpack ALTER COLUMN id SET DEFAULT nextval('public.core_userpack_id_seq'::regclass);


--
-- Name: core_userpin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpin ALTER COLUMN id SET DEFAULT nextval('public.core_userpin_id_seq'::regclass);


--
-- Name: core_usersalesdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usersalesdata ALTER COLUMN id SET DEFAULT nextval('public.core_usersalesdata_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add ads	7	add_ads
26	Can change ads	7	change_ads
27	Can delete ads	7	delete_ads
28	Can view ads	7	view_ads
29	Can add badge	8	add_badge
30	Can change badge	8	change_badge
31	Can delete badge	8	delete_badge
32	Can view badge	8	view_badge
33	Can add member ship	9	add_membership
34	Can change member ship	9	change_membership
35	Can delete member ship	9	delete_membership
36	Can view member ship	9	view_membership
37	Can add pack	10	add_pack
38	Can change pack	10	change_pack
39	Can delete pack	10	delete_pack
40	Can view pack	10	view_pack
41	Can add rank	11	add_rank
42	Can change rank	11	change_rank
43	Can delete rank	11	delete_rank
44	Can view rank	11	view_rank
45	Can add role	12	add_role
46	Can change role	12	change_role
47	Can delete role	12	delete_role
48	Can view role	12	view_role
49	Can add user pin	13	add_userpin
50	Can change user pin	13	change_userpin
51	Can delete user pin	13	delete_userpin
52	Can view user pin	13	view_userpin
53	Can add user pack	14	add_userpack
54	Can change user pack	14	change_userpack
55	Can delete user pack	14	delete_userpack
56	Can view user pack	14	view_userpack
57	Can add user member ship	15	add_usermembership
58	Can change user member ship	15	change_usermembership
59	Can delete user member ship	15	delete_usermembership
60	Can view user member ship	15	view_usermembership
61	Can add user ads view	16	add_useradsview
62	Can change user ads view	16	change_useradsview
63	Can delete user ads view	16	delete_useradsview
64	Can view user ads view	16	view_useradsview
65	Can add transfer balance history	17	add_transferbalancehistory
66	Can change transfer balance history	17	change_transferbalancehistory
67	Can delete transfer balance history	17	delete_transferbalancehistory
68	Can view transfer balance history	17	view_transferbalancehistory
69	Can add transaction history	18	add_transactionhistory
70	Can change transaction history	18	change_transactionhistory
71	Can delete transaction history	18	delete_transactionhistory
72	Can view transaction history	18	view_transactionhistory
73	Can add total amounts	19	add_totalamounts
74	Can change total amounts	19	change_totalamounts
75	Can delete total amounts	19	delete_totalamounts
76	Can view total amounts	19	view_totalamounts
77	Can add team earning	20	add_teamearning
78	Can change team earning	20	change_teamearning
79	Can delete team earning	20	delete_teamearning
80	Can view team earning	20	view_teamearning
81	Can add share balance history	21	add_sharebalancehistory
82	Can change share balance history	21	change_sharebalancehistory
83	Can delete share balance history	21	delete_sharebalancehistory
84	Can view share balance history	21	view_sharebalancehistory
85	Can add income	22	add_income
86	Can change income	22	change_income
87	Can delete income	22	delete_income
88	Can view income	22	view_income
89	Can add documents	23	add_documents
90	Can change documents	23	change_documents
91	Can delete documents	23	delete_documents
92	Can view documents	23	view_documents
93	Can add official withdraw	24	add_officialwithdraw
94	Can change official withdraw	24	change_officialwithdraw
95	Can delete official withdraw	24	delete_officialwithdraw
96	Can view official withdraw	24	view_officialwithdraw
97	Can add official deposit	25	add_officialdeposit
98	Can change official deposit	25	change_officialdeposit
99	Can delete official deposit	25	delete_officialdeposit
100	Can view official deposit	25	view_officialdeposit
101	Can add user sales data	26	add_usersalesdata
102	Can change user sales data	26	change_usersalesdata
103	Can delete user sales data	26	delete_usersalesdata
104	Can view user sales data	26	view_usersalesdata
\.


--
-- Data for Name: core_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_ads (id, status, total_no_of_views, video, title, created_at, thumbnail) FROM stdin;
\.


--
-- Data for Name: core_badge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_badge (id, title, no_of_referal, image) FROM stdin;
1	Doge	30	uploads/badge/473c4479-8cee-4e66-9120-6924af50a6d8.jpg
\.


--
-- Data for Name: core_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_documents (id, type, status, user_id, bill_doc, id_doc) FROM stdin;
3	all	0	1		
4	all	0	1		uploads/document/60e5236d-901a-4a53-bea7-8038fc7b667d.pdf
5	all	1	7		uploads/document/c5b2e522-f540-4778-88bd-2cfd91a1cb99.pdf
8	all	verified	5		uploads/document/20885de7-bcf3-4055-afb2-417b2cae219e.pdf
9	all	verified	20		uploads/document/9118176b-2a04-4c81-8a07-e522367e1363.pdf
\.


--
-- Data for Name: core_income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_income (id, type1, amount, details, user_id) FROM stdin;
\.


--
-- Data for Name: core_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_membership (id, name, amount, details) FROM stdin;
2	Elite	30	Elite Membership
\.


--
-- Data for Name: core_officialdeposit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_officialdeposit (id, amount, status, user_id, date, screenshot) FROM stdin;
1	17800	Pending	5	2021-04-04 21:56:26.333144+05	
2	10000	Pending	5	2021-04-05 03:32:17.316627+05	
\.


--
-- Data for Name: core_officialwithdraw; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_officialwithdraw (id, amount, trc20_address, status, user_id, date) FROM stdin;
1	100	abcbxbx	Pending	5	2021-04-04 21:53:53.350404+05
2	120	abcbxbx	Pending	5	2021-04-04 21:53:53.350404+05
3	12	abcbxbx	Pending	5	2021-04-04 21:57:08.688474+05
4	13	abcbasjs	Pending	5	2021-04-05 02:11:45.308122+05
5	14	abcbasjs	Pending	5	2021-04-05 02:14:41.574694+05
6	10	abc	Pending	5	2021-04-14 02:09:17.781623+05
7	10	abncc	Pending	5	2021-04-14 02:11:35.90856+05
\.


--
-- Data for Name: core_pack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_pack (id, name, amount, details, duration) FROM stdin;
1	Pack 1	50	Test Pack	12
\.


--
-- Data for Name: core_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_rank (id, title, salary, details, required_sales, rewards) FROM stdin;
1	Officer	1500	Officer Rank	550000	18000
3	Manager	18000	Manager Rank	8800000	650000
4	SR Manager	35000	SR Manager Rank	35200000	1500000
5	Director	100000	Director Rank	148000000	10000000
2	SR Officer	3500	SR Officer Rank	2200000	100000
\.


--
-- Data for Name: core_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_role (id, name) FROM stdin;
1	User
2	Manager
\.


--
-- Data for Name: core_sharebalancehistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_sharebalancehistory (id, amount, date, recipient_id, sender_id) FROM stdin;
1	12	2021-03-28 17:30:54.503834+05	6	5
2	500	2021-04-17 18:22:11.510541+05	5	20
3	10	2021-04-17 18:23:13.581403+05	8	20
\.


--
-- Data for Name: core_teamearning; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_teamearning (id, referal_id, type1, amount, details, user_id) FROM stdin;
\.


--
-- Data for Name: core_totalamounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_totalamounts (id, salary, income, team_earning, master_pack, user_id) FROM stdin;
2	400	12350	120	100	7
25	0	0	0	0	21
26	0	0	0	0	22
32	0	0	0	0	28
29	0	77694.25	50	66	25
16	0	0	0	0	10
18	0	0	0	0	12
34	0	8997.5	40	20	30
33	0	8997.5	0	20	29
31	0	17995	52	40	27
14	0	10	0	0	8
19	14510	1200	636.8290979391769	100	2
24	100	12000	128	10	2
35	0	198	0	16	31
22	200	50000	3329.55	60	19
3	28500	-111681.3688	7909.9495952179095	15000	1
1	14688	100997.9938	692.4179438456811	120	5
20	105	9949.875	1298.06490081125	121	17
17	100	1239.875	126.00630007875	21	11
15	600	1000	293.56677578235406	100	9
23	400	11376.25	200	82	20
21	300	20200	995.06000075	50	18
30	0	96491.25	0	70	26
\.


--
-- Data for Name: core_transactionhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_transactionhistory (id, type1, credit_debit, amount, old_balance, new_balance, details, date, user_id) FROM stdin;
1	team_earning	Credit	122	300	422	Transfer Amount 122 From team_earning to Income	2021-03-28 07:45:40.640113+05	5
2	salary	Credit	120	422	542	Transfer Amount 120 From salary to Income	2021-03-28 07:55:09.09022+05	5
3	team_earning	Credit	100	542	642	Transfer Amount 100 From team_earning to Income	2021-03-28 16:03:19.479191+05	5
4	salary	Credit	120	642	762	Transfer Amount 120 From salary to Income	2021-03-28 16:04:33.522929+05	5
5	team_earning	Credit	123	762	885	Transfer Amount 123 From team_earning to Income	2021-03-28 17:25:29.406872+05	5
6	team_earning	Credit	120	885	1005	Transfer Amount 120.0 From team_earning to Income	2021-03-28 18:31:48.650958+05	5
8	Pack Purchase Commission	Credit	28.94279560113912	578.8559120227824	607.7987076239215	Retrieved Commission amount 28.94279560113912 through Direct Referral talhasolokingpro	2021-04-02 03:33:13.729282+05	2
9	Create Pin	Debit	10.025	528	517.975	Pin was created of amount 10.0 From Income. Tax: 0.025   	2021-04-13 01:51:02.412375+05	5
10	Create Pin	Debit	50.125	1290	1239.875	Pin was created of amount 50.0 From Income. Tax: 0.125   	2021-04-17 17:08:45.104896+05	11
11	Pack Purchase Commission	Credit	13.978321874999999	279.56643749999995	293.54475937499996	Retrieved Commission amount 13.978321874999999 through Direct Referral sadiq	2021-04-17 17:12:35.123251+05	9
12	Pack Purchase Commission	Credit	0.006134835089627049	245.39340358508196	245.39953842017158	Retrieved Commission amount through 0.006134835089627049 Indirect Referral sadiq	2021-04-17 17:14:40.538909+05	5
13	Pack Purchase Commission	Credit	0.015194967690598037	607.7987076239215	607.8139025916121	Retrieved Commission amount through 0.015194967690598037 Indirect Referral sadiq	2021-04-17 17:15:03.754303+05	2
14	Create Pin	Debit	50.125	10000	9949.875	Pin was created of amount 50.0 From Income. Tax: 0.125   	2021-04-17 17:21:44.681042+05	17
15	Pack Purchase Commission	Credit	6	120	126	Retrieved Commission amount 6.0 through Direct Referral shahmeer	2021-04-17 17:22:06.289183+05	11
16	Pack Purchase Commission	Credit	0.007338618984374999	293.54475937499996	293.5520979939843	Retrieved Commission amount through 0.007338618984374999 Indirect Referral shahmeer	2021-04-17 17:22:06.300175+05	9
17	Pack Purchase Commission	Credit	0.00613498846050429	245.39953842017158	245.40567340863208	Retrieved Commission amount through 0.00613498846050429 Indirect Referral shahmeer	2021-04-17 17:22:06.310168+05	5
18	Pack Purchase Commission	Credit	0.015195347564790303	607.8139025916121	607.8290979391769	Retrieved Commission amount through 0.015195347564790303 Indirect Referral shahmeer	2021-04-17 17:22:06.320165+05	2
19	Create Pin	Debit	50.125	12300	12249.875	Pin was created of amount 50.0 From Income. Tax: 0.125   	2021-04-17 17:38:52.366807+05	20
20	Pack Purchase Commission	Credit	151	3020	3171	Retrieved Commission amount 151.0 through Direct Referral mahid	2021-04-17 17:40:44.713824+05	19
21	Pack Purchase Commission	Credit	0.030000000000000002	1200	1200.03	Retrieved Commission amount through 0.030000000000000002 Indirect Referral mahid	2021-04-17 17:41:42.572781+05	18
22	Pack Purchase Commission	Credit	0.03245	1298	1298.03245	Retrieved Commission amount through 0.03245 Indirect Referral mahid	2021-04-17 17:42:03.614906+05	17
23	Pack Purchase Commission	Credit	0.00315	126	126.00315	Retrieved Commission amount through 0.00315 Indirect Referral mahid	2021-04-17 17:42:05.260718+05	11
24	Pack Purchase Commission	Credit	0.007338802449849608	293.5520979939843	293.55943679643417	Retrieved Commission amount through 0.007338802449849608 Indirect Referral mahid	2021-04-17 17:42:05.284697+05	9
25	Pack Purchase Commission	Credit	0.006135141835215802	245.40567340863208	245.4118085504673	Retrieved Commission amount through 0.006135141835215802 Indirect Referral mahid	2021-04-17 17:42:05.305464+05	5
26	Create Pin	Debit	300.75	12249.875	11949.125	Pin was created of amount 300.0 From Income. Tax: 0.75   	2021-04-17 18:21:43.226632+05	20
27	Share Balance	Debit	500	11949.125	11436.625	Share Amount 500.0 From Income to talhasolokingpro	2021-04-17 18:22:11.574558+05	20
28	Share Balance	Debit	10	11436.625	11426.375	Share Amount 10.0 From Income to asdkhan	2021-04-17 18:23:13.6141+05	20
29	Create Pin	Debit	50.125	11426.375	11376.25	Pin was created of amount 50.0 From Income. Tax: 0.125   	2021-04-17 19:25:44.599917+05	20
30	Pack Purchase Commission	Credit	158.55	3171	3329.55	Retrieved Commission amount 158.55 through Direct Referral mahid	2021-04-17 19:26:20.105915+05	19
31	Pack Purchase Commission	Credit	0.03000075	1200.03	1200.06000075	Retrieved Commission amount through 0.03000075 Indirect Referral mahid	2021-04-17 19:26:20.118907+05	18
32	Pack Purchase Commission	Credit	0.03245081125	1298.03245	1298.06490081125	Retrieved Commission amount through 0.03245081125 Indirect Referral mahid	2021-04-17 19:26:20.132882+05	17
33	Pack Purchase Commission	Credit	0.00315007875	126.00315	126.00630007875	Retrieved Commission amount through 0.00315007875 Indirect Referral mahid	2021-04-17 19:26:20.143876+05	11
34	Pack Purchase Commission	Credit	0.007338985919910854	293.55943679643417	293.56677578235406	Retrieved Commission amount through 0.007338985919910854 Indirect Referral mahid	2021-04-17 19:26:20.154879+05	9
35	Pack Purchase Commission	Credit	0.006135295213761683	245.4118085504673	245.41794384568107	Retrieved Commission amount through 0.006135295213761683 Indirect Referral mahid	2021-04-17 19:26:20.166873+05	5
36	team_earning	Credit	100	20000	20100	Transfer Amount 100.0 From team_earning to Income	2021-04-17 20:55:59.964543+05	18
37	team_earning	Credit	100	20100	20200	Transfer Amount 100.0 From team_earning to Income	2021-04-17 21:45:46.259883+05	18
38	Income	Credit	0.004699999999999999	997.975	997.9797	Ad Commission of 0.004699999999999999 added to Income	2021-04-18 01:35:55.185093+05	5
39	Ad Commission	Credit	0.004699999999999999	997.9797	997.9843999999999	Ad Commission of 0.004699999999999999 added to Income	2021-04-18 01:49:40.94512+05	5
40	Ad Commission	Credit	0.004699999999999999	997.9843999999999	997.9890999999999	Ad Commission of 0.004699999999999999 added to Income	2021-04-18 01:54:44.035651+05	5
41	Ad Commission	Credit	0.004699999999999999	997.9890999999999	997.9937999999999	Ad Commission of 0.004699999999999999 added to Income	2021-04-18 05:33:14.565283+05	5
42	Salary	Credit	1500	1010	2510	Got Salary 1500.0 to Income	2021-04-21 02:51:12.910972+05	2
43	Salary	Credit	1500	1188	2688	Got Salary 1500.0 to Income	2021-04-21 02:51:35.580064+05	5
44	Salary	Credit	1500	15000	16500	Got Salary 1500.0 to Income	2021-04-21 02:51:42.59003+05	1
45	Salary	Credit	1500	2510	4010	Got Salary 1500.0 to Income	2021-04-21 05:08:32.073279+05	2
46	Salary	Credit	1500	2688	4188	Got Salary 1500.0 to Income	2021-04-21 05:08:53.672834+05	5
47	Salary	Credit	1500	16500	18000	Got Salary 1500.0 to Income	2021-04-21 05:08:53.704816+05	1
48	Salary	Credit	1500	4010	5510	Got Salary 1500.0	2021-04-21 05:42:02.474566+05	2
49	Salary	Credit	1500	4188	5688	Got Salary 1500.0	2021-04-21 05:42:02.507042+05	5
50	Salary	Credit	1500	18000	19500	Got Salary 1500.0	2021-04-21 05:42:02.535612+05	1
51	Salary	Credit	1500	5510	7010	Got Salary 1500.0	2021-04-21 05:44:28.683509+05	2
52	Salary	Credit	1500	5688	7188	Got Salary 1500.0	2021-04-21 05:44:28.773588+05	5
53	Salary	Credit	1500	19500	21000	Got Salary 1500.0	2021-04-21 05:44:28.81348+05	1
54	Salary	Credit	1500	7010	8510	Got Salary 1500.0	2021-04-21 05:46:29.16698+05	2
55	Salary	Credit	1500	7188	8688	Got Salary 1500.0	2021-04-21 05:46:29.200958+05	5
56	Salary	Credit	1500	21000	22500	Got Salary 1500.0	2021-04-21 05:46:29.224941+05	1
57	Salary	Credit	1500	8510	10010	Got Salary 1500.0	2021-04-21 23:27:31.014333+05	2
58	Salary	Credit	1500	8688	10188	Got Salary 1500.0	2021-04-21 23:27:31.05585+05	5
59	Salary	Credit	1500	22500	24000	Got Salary 1500.0	2021-04-21 23:27:31.090144+05	1
60	Create Pin	Debit	1002.5	1000	-2.5	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-21 23:29:18.11909+05	25
61	Salary	Credit	1500	10010	11510	Got Salary 1500.0	2021-04-21 23:29:31.803371+05	2
62	Salary	Credit	1500	10188	11688	Got Salary 1500.0	2021-04-21 23:29:31.819369+05	5
63	Salary	Credit	1500	24000	25500	Got Salary 1500.0	2021-04-21 23:29:31.835359+05	1
64	Salary	Credit	1500	11510	13010	Got Salary 1500.0	2021-04-21 23:31:32.75125+05	2
65	Salary	Credit	1500	11688	13188	Got Salary 1500.0	2021-04-21 23:31:32.766875+05	5
66	Salary	Credit	1500	25500	27000	Got Salary 1500.0	2021-04-21 23:31:32.7825+05	1
67	Salary	Credit	1500	13010	14510	Got Salary 1500.0	2021-04-21 23:33:32.846425+05	2
68	Salary	Credit	1500	13188	14688	Got Salary 1500.0	2021-04-21 23:33:32.862032+05	5
69	Salary	Credit	1500	27000	28500	Got Salary 1500.0	2021-04-21 23:33:32.877656+05	1
70	Pack Purchase Commission	Credit	50	245.41794384568107	295.41794384568107	Retrieved Commission amount 50.0 through Direct Referral in team_earning safdar	2021-04-21 23:40:54.143869+05	5
71	Pack Purchase Commission	Credit	2.5	607.8290979391769	610.3290979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning safdar	2021-04-21 23:40:54.169853+05	2
72	Create Pin	Debit	1002.5	80000	78997.5	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-21 23:43:31.599115+05	25
73	Create Pin	Debit	501.25	78997.5	78496.25	Pin was created of amount 500.0 From Income. Tax: 1.25   	2021-04-21 23:43:38.67412+05	25
74	Create Pin	Debit	802	78496.25	77694.25	Pin was created of amount 800.0 From Income. Tax: 2.0   	2021-04-21 23:44:18.845173+05	25
75	Pack Purchase Commission	Credit	40	295.41794384568107	335.41794384568107	Retrieved Commission amount 40.0 through Direct Referral in team_earning safdar	2021-04-21 23:44:34.109187+05	5
76	Pack Purchase Commission	Credit	2	610.3290979391769	612.3290979391769	Retrieved Commission amount 2.0 through Indirect Referral in team_earning safdar	2021-04-21 23:44:34.120179+05	2
77	Pack Purchase Commission	Credit	50	335.41794384568107	385.41794384568107	Retrieved Commission amount 50.0 through Direct Referral in team_earning safdar	2021-04-21 23:45:11.818456+05	5
78	Pack Purchase Commission	Credit	2.5	612.3290979391769	614.8290979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning safdar	2021-04-21 23:45:11.829448+05	2
79	Pack Purchase Commission	Credit	25	385.41794384568107	410.41794384568107	Retrieved Commission amount 25.0 through Direct Referral in team_earning safdar	2021-04-21 23:47:34.909403+05	5
80	Pack Purchase Commission	Credit	1.25	614.8290979391769	616.0790979391769	Retrieved Commission amount 1.25 through Indirect Referral in team_earning safdar	2021-04-21 23:47:34.919914+05	2
81	Create Pin	Debit	501.25	10000	9498.75	Pin was created of amount 500.0 From Income. Tax: 1.25   	2021-04-21 23:57:15.955415+05	29
82	Pack Purchase Commission	Credit	25	0	25	Retrieved Commission amount 25.0 through Direct Referral in team_earning umer	2021-04-21 23:57:35.041007+05	25
83	Pack Purchase Commission	Credit	1.25	410.41794384568107	411.66794384568107	Retrieved Commission amount 1.25 through Indirect Referral in team_earning umer	2021-04-21 23:57:35.053+05	5
84	Pack Purchase Commission	Credit	1.25	616.0790979391769	617.3290979391769	Retrieved Commission amount 1.25 through Indirect Referral in team_earning umer	2021-04-21 23:57:35.061993+05	2
85	Create Pin	Debit	501.25	9498.75	8997.5	Pin was created of amount 500.0 From Income. Tax: 1.25   	2021-04-22 00:14:46.625296+05	29
86	Pack Purchase Commission	Credit	25	25	50	Retrieved Commission amount 25.0 through Direct Referral in team_earning umer	2021-04-22 00:14:58.210944+05	25
87	Pack Purchase Commission	Credit	1.25	411.66794384568107	412.91794384568107	Retrieved Commission amount 1.25 through Indirect Referral in team_earning umer	2021-04-22 00:14:58.220113+05	5
88	Pack Purchase Commission	Credit	1.25	617.3290979391769	618.5790979391769	Retrieved Commission amount 1.25 through Indirect Referral in team_earning umer	2021-04-22 00:14:58.229905+05	2
89	Create Pin	Debit	1002.5	100000	98997.5	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-22 00:16:54.204921+05	26
90	Pack Purchase Commission	Credit	50	412.91794384568107	462.91794384568107	Retrieved Commission amount 50.0 through Direct Referral in team_earning azam	2021-04-22 00:17:10.052536+05	5
91	Pack Purchase Commission	Credit	2.5	618.5790979391769	621.0790979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning azam	2021-04-22 00:17:10.064087+05	2
92	Create Pin	Debit	1002.5	98997.5	97995	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-22 00:17:53.892171+05	26
93	Pack Purchase Commission	Credit	50	462.91794384568107	512.9179438456811	Retrieved Commission amount 50.0 through Direct Referral in team_earning azam	2021-04-22 00:18:02.698221+05	5
94	Pack Purchase Commission	Credit	2.5	621.0790979391769	623.5790979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning azam	2021-04-22 00:18:03.025164+05	2
95	Create Pin	Debit	1002.5	97995	96992.5	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-22 00:18:08.984051+05	26
96	Pack Purchase Commission	Credit	50	512.9179438456811	562.9179438456811	Retrieved Commission amount 50.0 through Direct Referral in team_earning azam	2021-04-22 00:18:17.51887+05	5
97	Pack Purchase Commission	Credit	2.5	623.5790979391769	626.0790979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning azam	2021-04-22 00:18:17.528862+05	2
98	Create Pin	Debit	501.25	96992.5	96491.25	Pin was created of amount 500.0 From Income. Tax: 1.25   	2021-04-22 00:18:25.917199+05	26
99	Pack Purchase Commission	Credit	25	562.9179438456811	587.9179438456811	Retrieved Commission amount 25.0 through Direct Referral in team_earning azam	2021-04-22 00:18:41.717826+05	5
100	Pack Purchase Commission	Credit	1.25	626.0790979391769	627.3290979391769	Retrieved Commission amount 1.25 through Indirect Referral in team_earning azam	2021-04-22 00:18:41.729817+05	2
101	Create Pin	Debit	1002.5	20000	18997.5	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-22 00:20:20.179899+05	27
102	Pack Purchase Commission	Credit	50	587.9179438456811	637.9179438456811	Retrieved Commission amount 50.0 through Direct Referral in team_earning danish	2021-04-22 00:20:32.504002+05	5
103	Pack Purchase Commission	Credit	2.5	627.3290979391769	629.8290979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning danish	2021-04-22 00:20:32.514994+05	2
104	Create Pin	Debit	1002.5	18997.5	17995	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-22 00:20:40.167563+05	27
105	Pack Purchase Commission	Credit	50	637.9179438456811	687.9179438456811	Retrieved Commission amount 50.0 through Direct Referral in team_earning danish	2021-04-22 00:20:49.139005+05	5
106	Pack Purchase Commission	Credit	2.5	629.8290979391769	632.3290979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning danish	2021-04-22 00:20:49.149947+05	2
107	Create Pin	Debit	1002.5	10000	8997.5	Pin was created of amount 1000.0 From Income. Tax: 2.5   	2021-04-22 00:22:55.965593+05	30
108	Pack Purchase Commission	Credit	50	0	50	Retrieved Commission amount 50.0 through Direct Referral in team_earning arshad	2021-04-22 00:23:06.267931+05	27
109	Pack Purchase Commission	Credit	2.5	687.9179438456811	690.4179438456811	Retrieved Commission amount 2.5 through Indirect Referral in team_earning arshad	2021-04-22 00:23:06.277366+05	5
110	Pack Purchase Commission	Credit	2.5	632.3290979391769	634.8290979391769	Retrieved Commission amount 2.5 through Indirect Referral in team_earning arshad	2021-04-22 00:23:06.285935+05	2
111	Create Pin	Debit	802	1000	198	Pin was created of amount 800.0 From Income. Tax: 2.0   	2021-04-22 00:25:06.439821+05	31
112	Pack Purchase Commission	Credit	40	0	40	Retrieved Commission amount 40.0 through Direct Referral in team_earning azeem	2021-04-22 00:25:18.641047+05	30
113	Pack Purchase Commission	Credit	2	50	52	Retrieved Commission amount 2.0 through Indirect Referral in team_earning azeem	2021-04-22 00:25:18.652815+05	27
114	Pack Purchase Commission	Credit	2	690.4179438456811	692.4179438456811	Retrieved Commission amount 2.0 through Indirect Referral in team_earning azeem	2021-04-22 00:25:18.660074+05	5
115	Pack Purchase Commission	Credit	2	634.8290979391769	636.8290979391769	Retrieved Commission amount 2.0 through Indirect Referral in team_earning azeem	2021-04-22 00:25:18.669068+05	2
116	Rewards	Credit	100000	997.9937999999999	100997.9938	Achieved rewards 100000.0 for getting on the rank of 'SR Officer', to Income	2021-04-22 00:25:22.888708+05	5
\.


--
-- Data for Name: core_transferbalancehistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_transferbalancehistory (id, amount, date, user_id) FROM stdin;
1	122	2021-03-28 07:45:21.280691+05	5
2	120	2021-03-28 07:55:07.806391+05	5
3	100	2021-03-28 16:03:19.472196+05	5
4	120	2021-03-28 16:04:33.518215+05	5
5	123	2021-03-28 17:25:29.406872+05	5
6	120	2021-03-28 18:31:27.749943+05	5
7	100	2021-04-17 20:55:59.909988+05	18
8	100	2021-04-17 21:45:46.246809+05	18
\.


--
-- Data for Name: core_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_user (id, password, last_login, is_superuser, username, personal_id, referal_id_id, full_name, email, image, status, is_active, is_staff, phone_number, date_of_birth, gender, "CNIC", address, postal_code, state, country, facebook_link, twitter_link, skype_link, created_at, updated_at, badge_id, rank_id, role_id, exchanger, personal_pin) FROM stdin;
6	Gamer_ps4	2021-03-14 00:10:17.715696+05	f	ahmadali	108551839	2	Ahmad Ali	ahmad@gmail.com		1	t	f	3333949494	2016-01-03	male		House no 6, street 8/A, Gulshan e shahbaz park, collage road baghbanpura	54000	Punjab	Pakistan				2021-03-12 02:27:46.658575+05	2021-03-15 02:53:08.863743+05	\N	\N	1	f	abc
21	pbkdf2_sha256$216000$HBkj3AyZm8f2$hCLb1Q7JUUMPPFjYsDBFV3cI2NkTFOdwZmevnYjlcqM=	\N	f	talha	63037147	11	Talha Sahi	teamdeathmatch888@gmail.com		1	t	f	3420293819	2018-10-25	male		abc	54000	Punjab	Pakistan				2021-04-19 00:35:33.577319+05	2021-04-19 00:35:41.687804+05	\N	\N	1	f	Gamer_ps4
9	pbkdf2_sha256$216000$Zhv1RwlGSGCK$q6I7/jESohzT2V9D2RxixBHDKBkQ1GkHei4iZyFn/Dw=	\N	f	moiz	984737782	5	Moiz Ahmad	moiz@gmail.com		1	t	f	33340404030	2013-07-21	male		abc	54340	Punjab	Pakistan				2021-03-31 01:00:55.039375+05	2021-03-31 01:00:55.087132+05	\N	\N	1	f	abc
8	pbkdf2_sha256$216000$M3TyLavGtc4H$Ym210Z60GtfzWDaUxRKmqxsJjPNzMhxBprEVZWpafYg=	2021-03-31 01:01:04.186787+05	f	asdkhan	987641266	5	Asad Khan	asd@gmail.com		1	t	f	3334029201	2019-12-29	male		abc	54000	Punjab	Pakistan				2021-03-31 00:58:52.416001+05	2021-03-31 00:58:54.009949+05	\N	\N	1	f	abc
11	pbkdf2_sha256$216000$bgPf25xDjy9Y$DT/c0RHjMZejyLAeoTG58f46QgpUtgzVQAxldrWdosc=	2021-04-17 17:03:38.590179+05	f	sadiq	432643359	9	Sadiq Azam	sadiq@gmail.com		1	t	f	3334040403	2014-04-23	male		abc	54000	Punjab	Country				2021-04-01 13:59:36.923384+05	2021-04-15 04:59:45.546255+05	\N	\N	1	f	jamshaid
10	pbkdf2_sha256$216000$3tN5IN7Gd4mC$3myYQYSNfHrRBvX6069MR4bORUZVyCfh1vdvC3hz3m4=	\N	f	sammad101	579922374	8	Abdul Sammad	sammad@gmail.com		1	t	f	3334040404	2011-03-20	male		abc	54000	Punjab	Pakistan				2021-03-31 03:13:04.542264+05	2021-03-31 03:13:04.66318+05	\N	\N	1	f	abc
7	pbkdf2_sha256$216000$tzMEQtJfJdAC$UYZxai1i7zpybqZ7vxkMFcPtN5MmDVDUPezteW7iccw=	2021-03-28 07:12:15.26706+05	t	haider136	\N	\N		\N		1	t	t	\N	\N				\N						2021-03-27 00:13:15.978595+05	2021-03-28 07:18:40.44688+05	\N	\N	\N	f	abc
22	pbkdf2_sha256$216000$gLWTc34acyrD$fWkDTgD+VMzXQf9nDE94dT7rQpKUtIfE9qAYyX3jXxo=	\N	f	danial	541274815	5	Danial Hassan	danial@gmail.com		1	t	f	3334030392	2018-10-28	male		abc	54000	Punjab	Pakistan				2021-04-20 02:31:32.007684+05	2021-04-20 02:31:36.510891+05	\N	\N	1	f	Gamer_ps4
29	pbkdf2_sha256$216000$DO8T4fnTZaFe$i/BAGOagr9+0+BYY+le1W0b5dETauDa6kYT13xwNiQ8=	2021-04-22 00:14:37.726664+05	f	umer	320719929	25	Umer Abid	umer@gmail.com		1	t	f	3334596079	2020-02-25	male		abc	54000	Punjab	Pakistan				2021-04-21 23:56:06.89156+05	2021-04-21 23:56:11.381744+05	\N	\N	1	f	Gamer_ps4
2	pbkdf2_sha256$216000$xzpUkUfXTy1w$fM2+uN1WZEuaN5Lyex3ZpDqa+riRJ2lHKqb3DljhjIc=	2021-04-17 19:19:55.390618+05	f	ali101	10203040	1	Ali Raza	ali@gmail.com		1	t	f	3332939292	\N				\N						2021-03-12 01:50:18.556753+05	2021-04-17 17:31:03.828192+05	1	1	1	f	abc
17	pbkdf2_sha256$216000$a2CjAdQwePaz$xzCxss1l29r9WWVms+3ydKRuqYQwbpbZokF8e4X/XoA=	2021-04-17 17:21:32.345565+05	f	shahmeer	368999235	11	Shahmeer Khan	shahmeer@gmail.com		1	t	f	292938819	2008-10-20	male		abc	54000	KPK	Pakistan				2021-04-17 17:18:25.635775+05	2021-04-17 17:18:29.537602+05	\N	\N	1	f	Gamer_ps4
12	pbkdf2_sha256$216000$FPrgFBx5sagB$1sfmx1TmfPJb/pgyJXlK/4E58X9hxieTaNVos0fcVPQ=	\N	f	jamshaid102	677828243	9	Jamshaid Farooq	jamshaid@gmail.com		1	t	f	32300029382	1987-06-09	male		abc	54000	Punjab	Pakistan				2021-04-01 14:01:06.648499+05	2021-04-01 14:01:06.670676+05	\N	\N	1	f	abc
20	pbkdf2_sha256$216000$Kof9gsTj2q9q$ezuLHV65/D2iLR4vHkj/LOO1Xz69IL3qwuuml5KRDEM=	2021-04-17 19:25:28.090066+05	f	mahid	31402970	19	Mahid Azeem	mahid@gmail.com		1	t	f	324098271	1999-10-27	male		abc	54402	Punjab	Pakistan				2021-04-17 17:36:03.257761+05	2021-04-17 17:36:06.189732+05	\N	\N	1	f	Gamer_ps4
28	pbkdf2_sha256$216000$dK5amTXW6kzO$6AF3fwAtSB/y0VulJt6JeIAdT5aDSNun99/dEa0Y4Sk=	\N	f	moazzam	877943388	5	Moazzam	moazzam@gmail.com		1	t	f	3440293021	1988-04-26	male		abc	54000	Punjab	Pakistan				2021-04-20 23:46:17.756785+05	2021-04-20 23:46:27.85464+05	\N	\N	1	f	Gamer_ps4
25	pbkdf2_sha256$216000$Z6SroeVrMyDi$5+nqC3yJQolWPJR8bNg2U5x/i1K22Wn/MmFbiTxBl2U=	2021-04-22 00:15:16.023987+05	f	safdar	363242530	5	Safdar Ali	safdar@gmail.com		1	t	f	3449090291	2002-04-18	male		abc	54400	Punjab	Pakistan				2021-04-20 23:37:10.539625+05	2021-04-20 23:37:48.986078+05	\N	\N	1	f	Gamer_ps4
18	pbkdf2_sha256$216000$YT1xthSnvfw8$jIJswIOa18xeAp6LLmm0iEZgpmxufXPfIQddJbL05I8=	2021-04-17 19:31:21.563357+05	f	salman	770617127	17	Salman Ali	salman@gmail.com		1	t	f	3459876546	1994-10-25	male		abc	54678	Punjab	Pakistan				2021-04-17 17:27:39.324053+05	2021-04-17 17:27:42.674723+05	\N	\N	1	f	Gamer_ps4
19	pbkdf2_sha256$216000$9YfLVF5OLUvg$1AayMPkoy18omUgIILqqpUR61oXoPvpHtC2UtUTUdAo=	\N	f	sajid	134668852	18	Sajid Farooq	sajid@gmail.com		1	t	f	3212039281	1962-03-25	male		abc	54400	Punjab	Pakistan				2021-04-17 17:33:53.344946+05	2021-04-17 17:33:56.493674+05	\N	\N	1	f	Gamer_ps4
1	pbkdf2_sha256$216000$sUyxyvrlGMGo$jllQ6PZFp7rhklkEyIUojFhvQzxskYrsjMAqC6oLzmA=	2021-04-18 23:27:00.752269+05	t	haider	12345678	\N	Haider Ali	haiderali136a@gmail.com		1	t	t	3334029282	\N				\N						2021-03-10 00:03:18.66556+05	2021-03-28 07:15:29.835692+05	1	1	1	f	abc
30	pbkdf2_sha256$216000$T5hcN7Ob0nKA$NK1K4nihpyB4PXMewk2rgnfGmV07VQnm912BkrjGf6I=	2021-04-22 00:22:22.946482+05	f	arshad	157691306	27	Arshad Khan	arshad@gmail.com		1	t	f	3224059483	2018-11-24	male		abc	54000	Punjab	Pakistan				2021-04-22 00:22:15.565047+05	2021-04-22 00:22:18.676648+05	\N	\N	1	f	Gamer_ps4
26	pbkdf2_sha256$216000$cKqQughzYagA$ycETb6q4kw2vXkEHOrBBc5g872HOk9bC1SEpE8xL1Ps=	2021-04-22 00:16:16.888157+05	f	azam	897344872	5	Azam Khan	azam@gmail.com		1	t	f	3420394092	2001-04-12	male		abc	54000	Punjab	Pakistan				2021-04-20 23:43:59.42744+05	2021-04-20 23:44:29.159187+05	\N	\N	1	f	Gamer_ps4
5	pbkdf2_sha256$216000$uvTKeJiXAcHX$zKcIcOpx6Lo1RXTIfp7zMBwfRla3JTqkLLh8W3LmOB8=	2021-04-22 00:15:27+05	f	talhasolokingpro	69095981	2	Talha Ahmad Sahi	talha@soloking.pro	uploads/user/24257b5c-3ee5-4121-a520-c1a91a1970ba.jpg	1	t	f	33320202021	2017-01-02	male		House no 6, street 8/A, Gulshan e shahbaz park, collage road baghbanpura	54001	Punjab	Pakistan				2021-03-12 02:25:56.008856+05	2021-04-22 00:29:12.732092+05	1	1	1	f	abcamdnc123478asd
31	pbkdf2_sha256$216000$zbSdBfgHklPs$r7t/XWtBzM5QlaczUBpqqCru1h32FKi9cYjH0fVhW2U=	2021-04-22 00:24:41.227537+05	f	azeem	814375942	30	Azeem Ahmad	azeem@gmail.com		1	t	f	3224059584	2005-05-02	male		abc	54000	Punjab	Pakistan				2021-04-22 00:24:34.450185+05	2021-04-22 00:24:37.369181+05	\N	\N	1	f	Gamer_ps4
27	pbkdf2_sha256$216000$L66N6lVksPmE$eoSrkpbTy3iUXQwdIZM55H3pVNTEeoHaGZ88j6/nBi0=	2021-04-22 00:19:48.760359+05	f	danish	198269017	5	Danish Ali	danish@gmail.com		1	t	f	3459605940	1987-01-08	male		abc	54000	Punjab	Pakistan				2021-04-20 23:45:17.334027+05	2021-04-20 23:45:30.638534+05	\N	\N	1	f	Gamer_ps4
\.


--
-- Data for Name: core_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: core_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_useradsview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_useradsview (id, ads_id, user_id, viewed) FROM stdin;
\.


--
-- Data for Name: core_usermembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_usermembership (id, created_at, membership_id, user_id, updated_at) FROM stdin;
3	2021-03-27 00:22:47.459668+05	2	7	\N
4	2021-04-05 03:14:49.986856+05	2	5	\N
5	2021-04-17 18:21:55.009795+05	2	20	\N
\.


--
-- Data for Name: core_userpack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_userpack (id, quantity, details, created_at, status, pack_id, user_id, ended_at) FROM stdin;
1	1		2021-04-01 16:44:38.740682+05	Expire	1	11	2022-04-01 05:00:00+05
2	1		2021-04-01 16:47:13.821869+05	Expire	1	11	2022-04-01 05:00:00+05
3	1		2021-04-01 16:50:23.822582+05	Expire	1	11	2022-04-01 05:00:00+05
4	1		2021-04-02 00:41:28.174703+05	Expire	1	5	2022-04-02 05:00:00+05
5	1		2021-04-02 01:07:42.118787+05	Expire	1	5	2022-04-02 05:00:00+05
6	1		2021-04-02 03:28:25.030393+05	Expire	1	5	2022-04-02 05:00:00+05
7	1		2021-04-02 03:33:16.024269+05	Expire	1	5	2022-04-02 05:00:00+05
8	1		2021-04-17 17:15:03.767296+05	Expire	1	11	2022-04-17 05:00:00+05
9	1		2021-04-17 17:22:06.32516+05	Expire	1	17	2022-04-17 05:00:00+05
10	1		2021-04-17 17:42:12.903312+05	Expire	1	20	2022-04-17 05:00:00+05
11	1		2021-04-17 19:26:20.17287+05	Expire	1	20	2022-04-17 05:00:00+05
12	20		2021-04-21 23:40:54.17485+05	Expire	1	25	2022-04-21 05:00:00+05
13	16		2021-04-21 23:44:34.124474+05	Expire	1	25	2022-04-21 05:00:00+05
14	20		2021-04-21 23:45:11.833445+05	Expire	1	25	2022-04-21 05:00:00+05
15	10		2021-04-21 23:47:34.925287+05	Expire	1	25	2022-04-21 05:00:00+05
16	10		2021-04-21 23:57:35.066991+05	Expire	1	29	2022-04-21 05:00:00+05
17	10		2021-04-22 00:14:58.233849+05	Expire	1	29	2022-04-22 05:00:00+05
18	20		2021-04-22 00:17:10.067814+05	Expire	1	26	2022-04-22 05:00:00+05
19	20		2021-04-22 00:18:03.112308+05	Expire	1	26	2022-04-22 05:00:00+05
20	20		2021-04-22 00:18:17.533861+05	Expire	1	26	2022-04-22 05:00:00+05
21	10		2021-04-22 00:18:41.733816+05	Expire	1	26	2022-04-22 05:00:00+05
22	20		2021-04-22 00:20:32.519992+05	Expire	1	27	2022-04-22 05:00:00+05
23	20		2021-04-22 00:20:49.154944+05	Expire	1	27	2022-04-22 05:00:00+05
24	20		2021-04-22 00:23:06.289945+05	Expire	1	30	2022-04-22 05:00:00+05
25	16		2021-04-22 00:25:18.673065+05	Expire	1	31	2022-04-22 05:00:00+05
\.


--
-- Data for Name: core_userpin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_userpin (id, pin, amount, created_at, refund_date, user_id, status) FROM stdin;
1	1221	100	2021-03-11 23:37:10.650566+05	\N	1	not used
3	CNCUND5UYTE46GZAGSNLH58NCGDQBI	128	2021-03-11 23:43:21.485348+05	\N	1	not used
4	TVEF6KH8HQO7RJNPI9VOY2E4AM7YSS	100	2021-03-27 00:15:39.114978+05	\N	7	not used
28	3EGZV6BLAE6P7FXVTVXD0U8B1E2FPR	1000	2021-04-22 00:22:55.954582+05	\N	30	used
6	84BMUGABTLH3JP3WPIPQV879HEGT5R	300	2021-04-01 16:39:28.151238+05	\N	11	not used
7	AYQEQHJ9Z0L5H4VK0YLIM8V7BS3ZY9	30	2021-04-02 01:09:24.330617+05	\N	5	not used
5	B71O1D0TH1QCVU37B9U45FP8VBWUU2	300	2021-03-27 00:22:23.695756+05	\N	5	used
8	IQD5FVORTCMS31NCZ08C4FPPRRND5J	120	2021-04-04 22:19:58.112127+05	\N	5	not used
29	5PQHD89XR5QKYOJ0X9CTRRQNNCRGQV	800	2021-04-22 00:25:06.428022+05	\N	31	used
9	E2RVJ7PIUUVKATBXR9C0S0O0WW0JMU	300	2021-04-05 03:14:28.526546+05	\N	5	used
10	YS88O49JUW02WWQ70D7AYZZ0ICBIPM	10	2021-04-13 01:51:02.309522+05	\N	5	not used
11	4RUBE1TSV605J9RHM2JVW14H84EMRG	50	2021-04-17 17:08:45.053605+05	\N	11	used
12	KO625496L6FQHKFSWGVZBMXC39LBYM	50	2021-04-17 17:21:44.67005+05	\N	17	used
13	JFGWKIU4KZYB7WOKQC4HHMHL44P9XB	50	2021-04-17 17:38:52.340824+05	\N	20	used
14	J72MJ625IA78QPU80QXZ10RHPENTL4	300	2021-04-17 18:21:43.214639+05	\N	20	used
15	N3LNY49SNT35MPHISRM9NJ9ER36K0N	50	2021-04-17 19:25:44.584176+05	\N	20	used
16	UUF0QL7E6WC2A7GM40DQ0CBF4Z11GF	1000	2021-04-21 23:29:18.075731+05	\N	25	used
19	F69KGSE9TV2G5GAGB4IKI9ZK09BYRE	800	2021-04-21 23:44:18.833183+05	\N	25	used
17	QLLL35XZBQZD0REYKHQP6INJB4ZQMV	1000	2021-04-21 23:43:31.587146+05	\N	25	used
18	MTPOQWAGYMOBZUTQQBNXN0R47CD0UI	500	2021-04-21 23:43:38.660803+05	\N	25	used
20	M5I0F6PEJRFXHJ1T0AI0ROUAEL4Z3S	500	2021-04-21 23:57:15.941423+05	\N	29	used
21	CFH9VNA39VUH2XY48DBN2O08KBI84V	500	2021-04-22 00:14:46.613095+05	\N	29	used
22	A7CY2QFSE6SH3M83LKNAFVLD3EEMS0	1000	2021-04-22 00:16:54.194301+05	\N	26	used
23	UH2PH0FLCBG5SJ3EKEJU6T8AGBXYKE	1000	2021-04-22 00:17:53.880179+05	\N	26	used
24	87ZI4J31QXSWZG2CM0SHSX8A5WM2Y8	1000	2021-04-22 00:18:08.971047+05	\N	26	used
25	0JF6GQVBHSLTJPBZNU6G77IT1GFM9V	500	2021-04-22 00:18:25.90621+05	\N	26	used
26	Z1LMMPQE2WRKO55PL7087SNH342YRM	1000	2021-04-22 00:20:20.167331+05	\N	27	used
27	9RYNA8JN481FOAMPMGDFLWUUEPW302	1000	2021-04-22 00:20:40.155572+05	\N	27	used
\.


--
-- Data for Name: core_usersalesdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_usersalesdata (id, total_sales, referral_id, user_id, current_target_achieved) FROM stdin;
2	430000	25	5	f
3	350000	26	5	f
4	380000	27	5	f
5	100000	29	25	f
6	180000	30	27	f
7	80000	31	30	f
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-03-11 22:41:35.665967+05	1	MemberShip object (1)	1	[{"added": {}}]	9	1
2	2021-03-11 23:37:11.994731+05	1	UserPin object (1)	1	[{"added": {}}]	13	1
3	2021-03-12 00:00:42.993917+05	1	MemberShip object (1)	3		9	1
4	2021-03-12 01:47:40.799488+05	1	Role object (1)	1	[{"added": {}}]	12	1
5	2021-03-12 01:49:49.17134+05	1	Badge object (1)	1	[{"added": {}}]	8	1
6	2021-03-12 01:50:15.263799+05	1	Rank object (1)	1	[{"added": {}}]	11	1
7	2021-03-12 01:50:18.648696+05	2	ali101	1	[{"added": {}}]	6	1
8	2021-03-12 01:51:35.578701+05	2	ali101	2	[{"changed": {"fields": ["Phone number", "Personal id", "Referal id"]}}]	6	1
9	2021-03-12 02:20:42.966212+05	2	Role object (2)	1	[{"added": {}}]	12	1
10	2021-03-16 02:41:12.058294+05	1	Documents object (1)	2	[{"changed": {"fields": ["Status"]}}]	23	1
11	2021-03-27 00:18:20.755581+05	2	Elite	1	[{"added": {}}]	9	7
12	2021-03-27 00:25:25.844957+05	5	Documents object (5)	2	[{"changed": {"fields": ["Status"]}}]	23	7
13	2021-03-28 07:11:14.883956+05	1	haider	2	[{"changed": {"fields": ["Email", "Phone number", "Full name", "Personal id", "Role", "Badge", "Rank"]}}]	6	7
14	2021-03-28 07:15:29.839537+05	1	haider	2	[{"changed": {"fields": ["password"]}}]	6	7
15	2021-03-28 07:17:41.950846+05	1	TotalAmounts object (1)	1	[{"added": {}}]	19	1
16	2021-03-28 07:18:11.387913+05	2	TotalAmounts object (2)	1	[{"added": {}}]	19	1
17	2021-03-28 07:18:40.450926+05	7	haider136	2	[{"changed": {"fields": ["password"]}}]	6	1
18	2021-03-28 07:19:17.831293+05	5	talhasolokingpro	2	[{"changed": {"fields": ["password"]}}]	6	1
19	2021-03-28 07:33:41.501164+05	3	TotalAmounts object (3)	1	[{"added": {}}]	19	1
20	2021-03-28 18:32:59.210012+05	13	TotalAmounts object (13)	3		19	1
21	2021-03-28 18:32:59.275366+05	12	TotalAmounts object (12)	3		19	1
22	2021-03-28 18:32:59.286365+05	11	TotalAmounts object (11)	3		19	1
23	2021-03-28 18:32:59.296359+05	10	TotalAmounts object (10)	3		19	1
24	2021-03-28 18:32:59.306366+05	9	TotalAmounts object (9)	3		19	1
25	2021-03-28 18:32:59.317359+05	8	TotalAmounts object (8)	3		19	1
26	2021-03-28 18:32:59.327334+05	7	TotalAmounts object (7)	3		19	1
27	2021-04-01 02:36:11.28812+05	5	talhasolokingpro	2	[{"changed": {"fields": ["password"]}}]	6	1
28	2021-04-01 15:53:49.479149+05	1	Pack 1 (amount 50 tokens)	1	[{"added": {}}]	10	1
29	2021-04-01 15:54:50.715978+05	5	UserPin object (5)	2	[{"changed": {"fields": ["User"]}}]	13	1
30	2021-04-01 16:38:35.031335+05	19	TotalAmounts object (19)	1	[{"added": {}}]	19	1
31	2021-04-01 16:40:41.581004+05	15	TotalAmounts object (15)	2	[{"changed": {"fields": ["Salary", "Income", "Team earning", "Master pack"]}}]	19	1
32	2021-04-02 03:31:45.933805+05	7	TransactionHistory object (7)	3		18	1
33	2021-04-02 03:32:44.336957+05	5	UserPin object (5)	2	[{"changed": {"fields": ["Status"]}}]	13	1
34	2021-04-02 05:08:22.80198+05	13		3		6	1
35	2021-04-02 15:13:36.195195+05	15		3		6	1
36	2021-04-02 15:21:59.86429+05	5	talhasolokingpro	2	[{"changed": {"fields": ["password"]}}]	6	1
37	2021-04-05 02:09:05.296307+05	7	Documents object (7)	2	[{"changed": {"fields": ["Status"]}}]	23	1
38	2021-04-05 04:06:09.40945+05	1	Ads object (1)	1	[{"added": {}}]	7	1
39	2021-04-05 04:16:05.674309+05	7	Documents object (7)	2	[{"changed": {"fields": ["Status"]}}]	23	1
40	2021-04-08 03:22:29.107414+05	2	Ads object (2)	1	[{"added": {}}]	7	1
41	2021-04-08 22:42:55.631199+05	4	Ads object (4)	1	[{"added": {}}]	7	1
42	2021-04-08 22:44:02.316763+05	4	Ads object (4)	3		7	1
43	2021-04-08 22:44:02.32352+05	2	Ads object (2)	3		7	1
44	2021-04-08 22:44:02.326519+05	1	Ads object (1)	3		7	1
45	2021-04-08 23:18:17.54334+05	13	Ads object (13)	1	[{"added": {}}]	7	1
46	2021-04-08 23:23:15.714247+05	13	Ads object (13)	3		7	1
47	2021-04-08 23:23:42.741134+05	14	Ads object (14)	1	[{"added": {}}]	7	1
48	2021-04-08 23:35:33.4389+05	15	Ads object (15)	1	[{"added": {}}]	7	1
49	2021-04-09 01:12:20.521526+05	15	Ads object (15)	2	[{"changed": {"fields": ["Thumbnail url"]}}]	7	1
50	2021-04-09 01:13:45.318136+05	15	Ads object (15)	2	[{"changed": {"fields": ["Thumbnail url"]}}]	7	1
51	2021-04-09 01:21:46.3671+05	15	Ads object (15)	2	[{"changed": {"fields": ["Thumbnail url"]}}]	7	1
52	2021-04-09 02:11:36.21935+05	15	Ads object (15)	3		7	1
53	2021-04-09 02:11:36.226348+05	14	Ads object (14)	3		7	1
54	2021-04-09 02:13:58.876519+05	18	Ads object (18)	1	[{"added": {}}]	7	1
55	2021-04-09 02:23:02.831659+05	18	Ads object (18)	3		7	1
56	2021-04-09 02:25:43.877739+05	22	Ads object (22)	1	[{"added": {}}]	7	1
57	2021-04-09 02:51:30.889438+05	22	Ads object (22)	3		7	1
58	2021-04-09 02:52:44.475337+05	23	Ads object (23)	1	[{"added": {}}]	7	1
59	2021-04-09 03:09:06.147753+05	23	Ads object (23)	3		7	1
60	2021-04-09 03:09:33.037934+05	24	Ads object (24)	1	[{"added": {}}]	7	1
61	2021-04-09 03:13:11.41775+05	24	Ads object (24)	3		7	1
62	2021-04-09 03:21:47.901192+05	31	Ads object (31)	1	[{"added": {}}]	7	1
63	2021-04-10 06:18:48.733526+05	32	Ads object (32)	1	[{"added": {}}]	7	1
64	2021-04-13 02:06:30.9752+05	1	Pack 1 (amount 50 tokens)	2	[{"changed": {"fields": ["Amount"]}}]	10	1
65	2021-04-14 02:09:04.265099+05	8	Documents object (8)	2	[{"changed": {"fields": ["Status"]}}]	23	1
66	2021-04-15 11:18:39.432143+05	5	talhasolokingpro	2	[{"changed": {"fields": ["Image", "Badge", "Rank"]}}]	6	1
67	2021-04-17 17:08:31.487304+05	17	TotalAmounts object (17)	2	[{"changed": {"fields": ["Salary", "Income", "Team earning", "Master pack"]}}]	19	1
68	2021-04-17 17:19:16.456795+05	20	TotalAmounts object (20)	2	[{"changed": {"fields": ["Salary", "Income", "Team earning", "Master pack"]}}]	19	1
69	2021-04-17 17:29:14.391118+05	21	TotalAmounts object (21)	2	[{"changed": {"fields": ["Salary", "Income", "Team earning", "Master pack"]}}]	19	1
70	2021-04-17 17:31:03.832189+05	2	ali101	2	[{"changed": {"fields": ["password"]}}]	6	1
71	2021-04-17 17:34:45.33847+05	22	TotalAmounts object (22)	2	[{"changed": {"fields": ["Salary", "Income", "Team earning", "Master pack"]}}]	19	1
72	2021-04-17 17:37:19.564625+05	23	TotalAmounts object (23)	2	[{"changed": {"fields": ["Salary", "Income", "Team earning", "Master pack"]}}]	19	1
73	2021-04-17 18:21:17.642866+05	9	Documents object (9)	2	[{"changed": {"fields": ["Status"]}}]	23	1
74	2021-04-17 19:24:55.521885+05	24	TotalAmounts object (24)	1	[{"added": {}}]	19	1
75	2021-04-18 01:26:33.722868+05	5	UserAdsView object (5)	3		16	1
76	2021-04-18 01:30:23.907736+05	6	UserAdsView object (6)	3		16	1
77	2021-04-18 01:41:11.1794+05	31	Ads object (31)	3		7	1
78	2021-04-18 01:44:09.275966+05	33	Ads object (33)	1	[{"added": {}}]	7	1
79	2021-04-18 01:51:04.35187+05	10	UserAdsView object (10)	3		16	1
80	2021-04-18 01:51:04.357865+05	9	UserAdsView object (9)	3		16	1
81	2021-04-18 16:54:59.644236+05	33	Ads object (33)	3		7	1
82	2021-04-18 16:54:59.72122+05	32	Ads object (32)	3		7	1
83	2021-04-18 23:27:36.707477+05	2	Elite	2	[{"changed": {"fields": ["Amount"]}}]	9	1
84	2021-04-20 01:22:43.386852+05	1	Rank object (1)	2	[{"changed": {"fields": ["Salary"]}}]	11	1
85	2021-04-20 01:58:59.157764+05	1	Rank object (1)	3		11	1
86	2021-04-20 02:24:30.847218+05	2	Rank object (2)	1	[{"added": {}}]	11	1
87	2021-04-20 02:25:13.582259+05	3	Rank object (3)	1	[{"added": {}}]	11	1
88	2021-04-20 02:25:48.499418+05	4	Rank object (4)	1	[{"added": {}}]	11	1
89	2021-04-20 02:26:35.056598+05	5	Rank object (5)	1	[{"added": {}}]	11	1
90	2021-04-20 23:22:49.10317+05	2	Rank object (2)	2	[{"changed": {"fields": ["Rewards", "Required sales"]}}]	11	1
91	2021-04-20 23:24:13.87155+05	3	Rank object (3)	2	[{"changed": {"fields": ["Rewards", "Required sales"]}}]	11	1
92	2021-04-20 23:24:38.042687+05	4	Rank object (4)	2	[{"changed": {"fields": ["Rewards", "Required sales"]}}]	11	1
93	2021-04-20 23:25:09.988102+05	5	Rank object (5)	2	[{"changed": {"fields": ["Rewards", "Required sales"]}}]	11	1
94	2021-04-20 23:34:15.112375+05	23	safdar	3		6	1
95	2021-04-20 23:36:22.162955+05	24	safdar	3		6	1
96	2021-04-21 23:28:49.461166+05	29	TotalAmounts object (29)	2	[{"changed": {"fields": ["Income"]}}]	19	1
97	2021-04-21 23:40:02.75773+05	29	TotalAmounts object (29)	2	[{"changed": {"fields": ["Income"]}}]	19	1
98	2021-04-21 23:41:57.643557+05	29	TotalAmounts object (29)	2	[{"changed": {"fields": ["Income"]}}]	19	1
99	2021-04-21 23:54:11.130243+05	2	Rank object (2)	2	[{"changed": {"fields": ["Required sales"]}}]	11	1
100	2021-04-21 23:56:40.574376+05	33	TotalAmounts object (33)	2	[{"changed": {"fields": ["Income"]}}]	19	1
101	2021-04-22 00:16:37.401802+05	30	TotalAmounts object (30)	2	[{"changed": {"fields": ["Income"]}}]	19	1
102	2021-04-22 00:20:10.550081+05	31	TotalAmounts object (31)	2	[{"changed": {"fields": ["Income"]}}]	19	1
103	2021-04-22 00:22:46.370734+05	34	TotalAmounts object (34)	2	[{"changed": {"fields": ["Income"]}}]	19	1
104	2021-04-22 00:24:54.802016+05	35	TotalAmounts object (35)	2	[{"changed": {"fields": ["Income"]}}]	19	1
105	2021-04-22 00:28:49.71005+05	2	Rank object (2)	2	[{"changed": {"fields": ["Required sales"]}}]	11	1
106	2021-04-22 00:29:12.735091+05	5	talhasolokingpro	2	[{"changed": {"fields": ["Rank"]}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	user
7	core	ads
8	core	badge
9	core	membership
10	core	pack
11	core	rank
12	core	role
13	core	userpin
14	core	userpack
15	core	usermembership
16	core	useradsview
17	core	transferbalancehistory
18	core	transactionhistory
19	core	totalamounts
20	core	teamearning
21	core	sharebalancehistory
22	core	income
23	core	documents
24	core	officialwithdraw
25	core	officialdeposit
26	core	usersalesdata
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-09 23:33:43.718238+05
2	contenttypes	0002_remove_content_type_name	2021-03-09 23:33:43.788193+05
3	auth	0001_initial	2021-03-09 23:33:44.117699+05
4	auth	0002_alter_permission_name_max_length	2021-03-09 23:33:44.461325+05
5	auth	0003_alter_user_email_max_length	2021-03-09 23:33:44.494305+05
6	auth	0004_alter_user_username_opts	2021-03-09 23:33:44.520307+05
7	auth	0005_alter_user_last_login_null	2021-03-09 23:33:44.550213+05
8	auth	0006_require_contenttypes_0002	2021-03-09 23:33:44.559209+05
9	auth	0007_alter_validators_add_error_messages	2021-03-09 23:33:44.586205+05
10	auth	0008_alter_user_username_max_length	2021-03-09 23:33:44.614488+05
11	auth	0009_alter_user_last_name_max_length	2021-03-09 23:33:44.652459+05
12	auth	0010_alter_group_name_max_length	2021-03-09 23:33:44.700424+05
13	auth	0011_update_proxy_permissions	2021-03-09 23:33:44.719412+05
14	auth	0012_alter_user_first_name_max_length	2021-03-09 23:33:44.7404+05
15	core	0001_initial	2021-03-09 23:33:47.163166+05
16	admin	0001_initial	2021-03-09 23:33:49.005591+05
17	admin	0002_logentry_remove_auto_add	2021-03-09 23:33:49.213085+05
18	admin	0003_logentry_add_action_flag_choices	2021-03-09 23:33:49.329355+05
19	sessions	0001_initial	2021-03-09 23:33:49.460378+05
20	core	0002_auto_20210310_0012	2021-03-10 00:12:43.624301+05
21	core	0003_user_userid	2021-03-10 00:24:50.345964+05
22	core	0004_auto_20210310_0134	2021-03-10 01:35:51.580905+05
23	core	0005_auto_20210311_0103	2021-03-11 01:04:24.343779+05
24	core	0006_remove_user_userid	2021-03-11 23:30:14.118745+05
25	core	0007_auto_20210316_0135	2021-03-16 01:35:13.913236+05
26	core	0008_auto_20210316_0138	2021-03-16 01:38:28.692634+05
27	core	0009_auto_20210322_0032	2021-03-22 00:32:53.789198+05
28	core	0010_auto_20210328_0741	2021-03-28 07:41:55.180528+05
29	core	0011_user_exchanger	2021-03-28 16:02:43.940914+05
30	core	0012_auto_20210402_0031	2021-04-02 00:32:20.4373+05
31	core	0013_officialdeposit_officialwithdraw	2021-04-03 01:48:06.696758+05
32	core	0014_user_personal_pin	2021-04-03 01:57:14.326751+05
33	core	0015_auto_20210404_2110	2021-04-04 21:53:53.361396+05
34	core	0016_auto_20210405_0138	2021-04-05 01:38:40.550227+05
35	core	0017_auto_20210405_0404	2021-04-05 04:04:43.34131+05
36	core	0018_auto_20210405_0405	2021-04-05 04:05:43.992191+05
37	core	0019_auto_20210405_0414	2021-04-05 04:14:48.493609+05
38	core	0020_remove_ads_user	2021-04-08 02:25:16.626135+05
39	core	0021_ads_title	2021-04-08 02:56:19.406525+05
40	core	0022_ads_created_at	2021-04-08 03:04:01.021504+05
41	core	0023_ads_thumbnail	2021-04-08 03:17:19.039044+05
42	core	0024_auto_20210408_2244	2021-04-08 22:44:47.617635+05
43	core	0025_auto_20210408_2251	2021-04-08 22:51:21.465155+05
44	core	0026_auto_20210408_2322	2021-04-08 23:22:51.970249+05
45	core	0027_auto_20210408_2328	2021-04-08 23:28:25.294669+05
46	core	0028_auto_20210409_0307	2021-04-09 03:07:30.387787+05
47	core	0029_auto_20210413_0007	2021-04-13 00:08:18.123769+05
48	core	0030_auto_20210413_0011	2021-04-13 00:11:20.634099+05
49	core	0031_officialdeposit_screenshot	2021-04-15 12:16:28.63655+05
50	core	0003_rank_reward	2021-04-20 02:17:52.322515+05
51	core	0004_rank_required_sales	2021-04-20 02:18:55.013166+05
52	core	0005_usersalesdata	2021-04-20 02:58:35.711472+05
53	core	0006_auto_20210420_2315	2021-04-20 23:18:51.119564+05
54	core	0007_auto_20210420_2319	2021-04-20 23:19:39.883979+05
55	core	0008_usersalesdata_current_target_achieved	2021-04-21 01:02:01.502829+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xae0k7yng7il4l15j3fyvwpyav22lriu	.eJxVjEsOAiEQBe_C2hCQT4NL956BNNDIqIFkmFkZ725IZqHbV1XvzQLuWw37oDUsmV2YZKffLWJ6UpsgP7DdO0-9besS-VT4QQe_9Uyv6-H-HVQcddYIksDbpHU20gk0ToACm73xWlNBQoJ4to6ST0WmWIQhKJmEgagUsc8X5Yo4eQ:1lYC8K:4FOJfR7EmS9UQA4LZhx7WylxygaSmRwmW6IxdpRA4Ps	2021-05-02 23:27:00.755234+05
4msfu5wx7p2v4gfxt0m9jixj0o53wzhg	.eJxVjEsOAiEQBe_C2hCQT4NL956BNNDIqIFkmFkZ725IZqHbV1XvzQLuWw37oDUsmV2YZKffLWJ6UpsgP7DdO0-9besS-VT4QQe_9Uyv6-H-HVQcddYIksDbpHU20gk0ToACm73xWlNBQoJ4to6ST0WmWIQhKJmEgagUsc8X5Yo4eQ:1lSGwB:QgVd1rJF-TLAarnh-RRuLwAX9jEzqu1h4Bge6RQLdps	2021-04-16 15:21:59.886011+05
fd89xr3ec2i2jcx4lpdvr1v94ulceozp	.eJxVjEEOwiAQAP_C2RC2Xdji0XvfQBbY2qopSWlPxr8bkh70OjOZtwp87HM4qmxhyeqqQF1-WeT0lLWJ_OD1XnQq674tUbdEn7bqsWR53c72bzBzndtWsiXyvZWJMgo6NtCJAyIccJggdsbbTjywN4ltIjQsPaCzgjQhqc8Xxi027w:1lK57d:-n8GyEflwGB61Tg5nLmRsrYnRPRMEarBg_Wml2QpIzU	2021-03-25 01:07:57.582708+05
5tdnwk2y21tis0e0vzupu130oau92g1w	.eJxVjEEOwiAQRe_C2hBghhZcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWVpx-t0jpkdsO-E7tNss0t3WZotwVedAurzPn5-Vw_w4q9fqtR0wOsRTtwAOT0kaTS-iNM4SeLRIweJ0Go0q2OXL0oyqDsgg-KQfi_QHJXDcY:1lYvJn:9GEXvrx5S4xj3F2zGovM4WkT-A2lBW0fOQpDJbBYQg4	2021-05-04 23:41:51.103654+05
aquacdxpzygxals7vdt66ss25h28f530	.eJxVjEsOAiEQBe_C2hCQT4NL956BNNDIqIFkmFkZ725IZqHbV1XvzQLuWw37oDUsmV2YZKffLWJ6UpsgP7DdO0-9besS-VT4QQe_9Uyv6-H-HVQcddYIksDbpHU20gk0ToACm73xWlNBQoJ4to6ST0WmWIQhKJmEgagUsc8X5Yo4eQ:1lV26w:6niPaOaHSkAeH8b6yKYtIZqdXlA6jFhqA6T1Kf7ef-E	2021-04-24 06:08:30.758021+05
nsmaac1a8xd212gujyvhqc1xjdbg9gyy	.eJxVjEEOwiAQRe_C2hBghhZcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWVpx-t0jpkdsO-E7tNss0t3WZotwVedAurzPn5-Vw_w4q9fqtR0wOsRTtwAOT0kaTS-iNM4SeLRIweJ0Go0q2OXL0oyqDsgg-KQfi_QHJXDcY:1lV9FW:AkG75aqOujaa8VydRtPc1p7Gjzcarn4Ukd7J-gDY-Vk	2021-04-24 13:45:50.728655+05
3dy9ch3vkizn8bh0imgs9v8cu9thufnr	.eJxVjEsOAiEQBe_C2hCQT4NL956BNNDIqIFkmFkZ725IZqHbV1XvzQLuWw37oDUsmV2YZKffLWJ6UpsgP7DdO0-9besS-VT4QQe_9Uyv6-H-HVQcddYIksDbpHU20gk0ToACm73xWlNBQoJ4to6ST0WmWIQhKJmEgagUsc8X5Yo4eQ:1lVMtf:M6HDM1XvG4PFs591ipc6EJn--STPfp2Kz2sdjpEmK6I	2021-04-25 04:20:11.581461+05
2uebz1i81aci33zn3rps7q0hfebyfzsi	.eJxVjDEOwyAUQ-_CXKFAgEDH7jkD-vA_JW0FUkimqncvkTK08mDJz_abedi37PdGq1-QXZkQ7PIbBohPKgfBB5R75bGWbV0CPyr8pI3PFel1O7t_Bxla7muwUoGRCUYUGhKGwSpyI0ykuys0UzLOaGtJjRIHG4JOLpouiAoI2OcLFCo40w:1lVQAl:7B6OXz9_rHJaUgYOIoUA87HWSsVJrzfvhHHvmYxRytM	2021-04-25 07:50:03.199446+05
hqunaid5ms0r9gwge96vdjhv9f7lkqi9	.eJxVjEEOwiAQRe_C2hBghhZcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWVpx-t0jpkdsO-E7tNss0t3WZotwVedAurzPn5-Vw_w4q9fqtR0wOsRTtwAOT0kaTS-iNM4SeLRIweJ0Go0q2OXL0oyqDsgg-KQfi_QHJXDcY:1lZIJr:Zx3R0TMDf-6qJJRBL_aOrvdQjb9SygiImzsHEzewfLU	2021-05-06 00:15:27.745488+05
8j5wulmqqvkrduanmutua71x66314ovj	.eJxVjMsOwiAURP-FtSFUKA-X7v0Gch9UqgaS0q6M_25JutDlzDkzbxFhW3PcWlrizOIi9CBOvyUCPVPphB9Q7lVSLesyo-yKPGiTt8rpdT3cv4MMLfe1mZQfRkAVNARLE3t3Zhu8dUb5ZIxiazUFIG8cJ6TEe9QcdoQjsvh8AQTEOH0:1lZISn:RTDPkhj_dPMLaJwqWvRYEEqvAgwmZvQu_2yoRlEOpvI	2021-05-06 00:24:41.230536+05
lf81g8j1c4mzngao9309jbli70zfeogh	.eJxVjEsOAiEQBe_C2hCQT4NL956BNNDIqIFkmFkZ725IZqHbV1XvzQLuWw37oDUsmV2YZKffLWJ6UpsgP7DdO0-9besS-VT4QQe_9Uyv6-H-HVQcddYIksDbpHU20gk0ToACm73xWlNBQoJ4to6ST0WmWIQhKJmEgagUsc8X5Yo4eQ:1lXk6J:1ca8H-51PK0icFkDVj0MVuaw6_ZvhiDtzww_TuogkY8	2021-05-01 17:31:03.844255+05
g7xlhpl7z3ipvu4fpnxoe7gv1jtumff0	.eJxVjEsOAiEQBe_C2hCQT4NL956BNNDIqIFkmFkZ725IZqHbV1XvzQLuWw37oDUsmV2YZKffLWJ6UpsgP7DdO0-9besS-VT4QQe_9Uyv6-H-HVQcddYIksDbpHU20gk0ToACm73xWlNBQoJ4to6ST0WmWIQhKJmEgagUsc8X5Yo4eQ:1lS3aZ:srHEQ5yIkzkPDhMPlr3PLgZVjDt561S0r5x6d8-c6wg	2021-04-16 01:06:47.130353+05
327f9mcexvxwb111hebxka904w8rg75a	.eJxVjEEOwiAQRe_C2hBghhZcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWVpx-t0jpkdsO-E7tNss0t3WZotwVedAurzPn5-Vw_w4q9fqtR0wOsRTtwAOT0kaTS-iNM4SeLRIweJ0Go0q2OXL0oyqDsgg-KQfi_QHJXDcY:1lXrJk:bWDWI5X7wQmfbYxDxO7Zq6FWItdu6J8s8MnqM7_aBh8	2021-05-02 01:13:24.809962+05
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 104, true);


--
-- Name: core_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_ads_id_seq', 33, true);


--
-- Name: core_badge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_badge_id_seq', 1, true);


--
-- Name: core_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_documents_id_seq', 9, true);


--
-- Name: core_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_income_id_seq', 1, false);


--
-- Name: core_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_membership_id_seq', 2, true);


--
-- Name: core_officialdeposit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_officialdeposit_id_seq', 2, true);


--
-- Name: core_officialwithdraw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_officialwithdraw_id_seq', 7, true);


--
-- Name: core_pack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_pack_id_seq', 1, true);


--
-- Name: core_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_rank_id_seq', 5, true);


--
-- Name: core_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_role_id_seq', 2, true);


--
-- Name: core_sharebalancehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_sharebalancehistory_id_seq', 3, true);


--
-- Name: core_teamearning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_teamearning_id_seq', 1, false);


--
-- Name: core_totalamounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_totalamounts_id_seq', 35, true);


--
-- Name: core_transactionhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_transactionhistory_id_seq', 116, true);


--
-- Name: core_transferbalancehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_transferbalancehistory_id_seq', 8, true);


--
-- Name: core_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_user_groups_id_seq', 1, false);


--
-- Name: core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_user_id_seq', 31, true);


--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_user_user_permissions_id_seq', 1, false);


--
-- Name: core_useradsview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_useradsview_id_seq', 14, true);


--
-- Name: core_usermembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_usermembership_id_seq', 5, true);


--
-- Name: core_userpack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_userpack_id_seq', 25, true);


--
-- Name: core_userpin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_userpin_id_seq', 29, true);


--
-- Name: core_usersalesdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_usersalesdata_id_seq', 7, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 106, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 55, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_ads core_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_ads
    ADD CONSTRAINT core_ads_pkey PRIMARY KEY (id);


--
-- Name: core_badge core_badge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_badge
    ADD CONSTRAINT core_badge_pkey PRIMARY KEY (id);


--
-- Name: core_badge core_badge_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_badge
    ADD CONSTRAINT core_badge_title_key UNIQUE (title);


--
-- Name: core_documents core_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_documents
    ADD CONSTRAINT core_documents_pkey PRIMARY KEY (id);


--
-- Name: core_income core_income_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_income
    ADD CONSTRAINT core_income_pkey PRIMARY KEY (id);


--
-- Name: core_membership core_membership_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_membership
    ADD CONSTRAINT core_membership_name_key UNIQUE (name);


--
-- Name: core_membership core_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_membership
    ADD CONSTRAINT core_membership_pkey PRIMARY KEY (id);


--
-- Name: core_officialdeposit core_officialdeposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_officialdeposit
    ADD CONSTRAINT core_officialdeposit_pkey PRIMARY KEY (id);


--
-- Name: core_officialwithdraw core_officialwithdraw_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_officialwithdraw
    ADD CONSTRAINT core_officialwithdraw_pkey PRIMARY KEY (id);


--
-- Name: core_pack core_pack_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_pack
    ADD CONSTRAINT core_pack_name_key UNIQUE (name);


--
-- Name: core_pack core_pack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_pack
    ADD CONSTRAINT core_pack_pkey PRIMARY KEY (id);


--
-- Name: core_rank core_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_rank
    ADD CONSTRAINT core_rank_pkey PRIMARY KEY (id);


--
-- Name: core_rank core_rank_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_rank
    ADD CONSTRAINT core_rank_title_key UNIQUE (title);


--
-- Name: core_role core_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_role
    ADD CONSTRAINT core_role_name_key UNIQUE (name);


--
-- Name: core_role core_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_role
    ADD CONSTRAINT core_role_pkey PRIMARY KEY (id);


--
-- Name: core_sharebalancehistory core_sharebalancehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_sharebalancehistory
    ADD CONSTRAINT core_sharebalancehistory_pkey PRIMARY KEY (id);


--
-- Name: core_teamearning core_teamearning_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_teamearning
    ADD CONSTRAINT core_teamearning_pkey PRIMARY KEY (id);


--
-- Name: core_totalamounts core_totalamounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_totalamounts
    ADD CONSTRAINT core_totalamounts_pkey PRIMARY KEY (id);


--
-- Name: core_transactionhistory core_transactionhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_transactionhistory
    ADD CONSTRAINT core_transactionhistory_pkey PRIMARY KEY (id);


--
-- Name: core_transferbalancehistory core_transferbalancehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_transferbalancehistory
    ADD CONSTRAINT core_transferbalancehistory_pkey PRIMARY KEY (id);


--
-- Name: core_user core_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_email_key UNIQUE (email);


--
-- Name: core_user_groups core_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_pkey PRIMARY KEY (id);


--
-- Name: core_user_groups core_user_groups_user_id_group_id_c82fcad1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_group_id_c82fcad1_uniq UNIQUE (user_id, group_id);


--
-- Name: core_user core_user_personal_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_personal_id_key UNIQUE (personal_id);


--
-- Name: core_user core_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_pkey PRIMARY KEY (id);


--
-- Name: core_user_user_permissions core_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: core_user_user_permissions core_user_user_permissions_user_id_permission_id_73ea0daa_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_permission_id_73ea0daa_uniq UNIQUE (user_id, permission_id);


--
-- Name: core_user core_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_username_key UNIQUE (username);


--
-- Name: core_useradsview core_useradsview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_useradsview
    ADD CONSTRAINT core_useradsview_pkey PRIMARY KEY (id);


--
-- Name: core_usermembership core_usermembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usermembership
    ADD CONSTRAINT core_usermembership_pkey PRIMARY KEY (id);


--
-- Name: core_userpack core_userpack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpack
    ADD CONSTRAINT core_userpack_pkey PRIMARY KEY (id);


--
-- Name: core_userpin core_userpin_pin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpin
    ADD CONSTRAINT core_userpin_pin_key UNIQUE (pin);


--
-- Name: core_userpin core_userpin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpin
    ADD CONSTRAINT core_userpin_pkey PRIMARY KEY (id);


--
-- Name: core_usersalesdata core_usersalesdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usersalesdata
    ADD CONSTRAINT core_usersalesdata_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_badge_title_cac36096_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_badge_title_cac36096_like ON public.core_badge USING btree (title varchar_pattern_ops);


--
-- Name: core_documents_user_id_98645383; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_documents_user_id_98645383 ON public.core_documents USING btree (user_id);


--
-- Name: core_income_user_id_2d320cc9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_income_user_id_2d320cc9 ON public.core_income USING btree (user_id);


--
-- Name: core_membership_name_089cc404_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_membership_name_089cc404_like ON public.core_membership USING btree (name varchar_pattern_ops);


--
-- Name: core_officialdeposit_user_id_a8606b97; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_officialdeposit_user_id_a8606b97 ON public.core_officialdeposit USING btree (user_id);


--
-- Name: core_officialwithdraw_user_id_3f274eb5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_officialwithdraw_user_id_3f274eb5 ON public.core_officialwithdraw USING btree (user_id);


--
-- Name: core_pack_name_9cfd0858_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_pack_name_9cfd0858_like ON public.core_pack USING btree (name varchar_pattern_ops);


--
-- Name: core_rank_title_5e5bb01a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_rank_title_5e5bb01a_like ON public.core_rank USING btree (title varchar_pattern_ops);


--
-- Name: core_role_name_ca4cd9c7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_role_name_ca4cd9c7_like ON public.core_role USING btree (name varchar_pattern_ops);


--
-- Name: core_sharebalancehistory_recipient_id_0581066f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_sharebalancehistory_recipient_id_0581066f ON public.core_sharebalancehistory USING btree (recipient_id);


--
-- Name: core_sharebalancehistory_sender_id_18baf70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_sharebalancehistory_sender_id_18baf70c ON public.core_sharebalancehistory USING btree (sender_id);


--
-- Name: core_teamearning_user_id_a9ed9de3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_teamearning_user_id_a9ed9de3 ON public.core_teamearning USING btree (user_id);


--
-- Name: core_totalamounts_user_id_e292d77c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_totalamounts_user_id_e292d77c ON public.core_totalamounts USING btree (user_id);


--
-- Name: core_transactionhistory_user_id_bed142c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_transactionhistory_user_id_bed142c7 ON public.core_transactionhistory USING btree (user_id);


--
-- Name: core_transferbalancehistory_user_id_dca0862e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_transferbalancehistory_user_id_dca0862e ON public.core_transferbalancehistory USING btree (user_id);


--
-- Name: core_user_badge_id_c9325ecb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_badge_id_c9325ecb ON public.core_user USING btree (badge_id);


--
-- Name: core_user_email_92a71487_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_email_92a71487_like ON public.core_user USING btree (email varchar_pattern_ops);


--
-- Name: core_user_groups_group_id_fe8c697f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_groups_group_id_fe8c697f ON public.core_user_groups USING btree (group_id);


--
-- Name: core_user_groups_user_id_70b4d9b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_groups_user_id_70b4d9b8 ON public.core_user_groups USING btree (user_id);


--
-- Name: core_user_rank_id_b6360556; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_rank_id_b6360556 ON public.core_user USING btree (rank_id);


--
-- Name: core_user_referal_id_id_11fcf738; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_referal_id_id_11fcf738 ON public.core_user USING btree (referal_id_id);


--
-- Name: core_user_role_id_8de62872; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_role_id_8de62872 ON public.core_user USING btree (role_id);


--
-- Name: core_user_user_permissions_permission_id_35ccf601; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_user_permissions_permission_id_35ccf601 ON public.core_user_user_permissions USING btree (permission_id);


--
-- Name: core_user_user_permissions_user_id_085123d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_user_permissions_user_id_085123d3 ON public.core_user_user_permissions USING btree (user_id);


--
-- Name: core_user_username_36e4f7f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_user_username_36e4f7f7_like ON public.core_user USING btree (username varchar_pattern_ops);


--
-- Name: core_useradsview_ads_id_471abc14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_useradsview_ads_id_471abc14 ON public.core_useradsview USING btree (ads_id);


--
-- Name: core_useradsview_user_id_7126e401; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_useradsview_user_id_7126e401 ON public.core_useradsview USING btree (user_id);


--
-- Name: core_usermembership_membership_id_a65dac9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_usermembership_membership_id_a65dac9f ON public.core_usermembership USING btree (membership_id);


--
-- Name: core_usermembership_user_id_dfa7c16b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_usermembership_user_id_dfa7c16b ON public.core_usermembership USING btree (user_id);


--
-- Name: core_userpack_pack_id_f4b266c6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_userpack_pack_id_f4b266c6 ON public.core_userpack USING btree (pack_id);


--
-- Name: core_userpack_user_id_c37cc111; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_userpack_user_id_c37cc111 ON public.core_userpack USING btree (user_id);


--
-- Name: core_userpin_user_id_1cccec1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_userpin_user_id_1cccec1f ON public.core_userpin USING btree (user_id);


--
-- Name: core_usersalesdata_referral_id_cfe5ab69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_usersalesdata_referral_id_cfe5ab69 ON public.core_usersalesdata USING btree (referral_id);


--
-- Name: core_usersalesdata_user_id_bea8c111; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_usersalesdata_user_id_bea8c111 ON public.core_usersalesdata USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_documents core_documents_user_id_98645383_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_documents
    ADD CONSTRAINT core_documents_user_id_98645383_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_income core_income_user_id_2d320cc9_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_income
    ADD CONSTRAINT core_income_user_id_2d320cc9_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_officialdeposit core_officialdeposit_user_id_a8606b97_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_officialdeposit
    ADD CONSTRAINT core_officialdeposit_user_id_a8606b97_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_officialwithdraw core_officialwithdraw_user_id_3f274eb5_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_officialwithdraw
    ADD CONSTRAINT core_officialwithdraw_user_id_3f274eb5_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sharebalancehistory core_sharebalancehistory_recipient_id_0581066f_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_sharebalancehistory
    ADD CONSTRAINT core_sharebalancehistory_recipient_id_0581066f_fk_core_user_id FOREIGN KEY (recipient_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sharebalancehistory core_sharebalancehistory_sender_id_18baf70c_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_sharebalancehistory
    ADD CONSTRAINT core_sharebalancehistory_sender_id_18baf70c_fk_core_user_id FOREIGN KEY (sender_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_teamearning core_teamearning_user_id_a9ed9de3_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_teamearning
    ADD CONSTRAINT core_teamearning_user_id_a9ed9de3_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_totalamounts core_totalamounts_user_id_e292d77c_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_totalamounts
    ADD CONSTRAINT core_totalamounts_user_id_e292d77c_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_transactionhistory core_transactionhistory_user_id_bed142c7_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_transactionhistory
    ADD CONSTRAINT core_transactionhistory_user_id_bed142c7_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_transferbalancehistory core_transferbalancehistory_user_id_dca0862e_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_transferbalancehistory
    ADD CONSTRAINT core_transferbalancehistory_user_id_dca0862e_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user core_user_badge_id_c9325ecb_fk_core_badge_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_badge_id_c9325ecb_fk_core_badge_id FOREIGN KEY (badge_id) REFERENCES public.core_badge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_groups core_user_groups_group_id_fe8c697f_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_group_id_fe8c697f_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_groups core_user_groups_user_id_70b4d9b8_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_70b4d9b8_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user core_user_rank_id_b6360556_fk_core_rank_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_rank_id_b6360556_fk_core_rank_id FOREIGN KEY (rank_id) REFERENCES public.core_rank(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user core_user_referal_id_id_11fcf738_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_referal_id_id_11fcf738_fk_core_user_id FOREIGN KEY (referal_id_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user core_user_role_id_8de62872_fk_core_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_role_id_8de62872_fk_core_role_id FOREIGN KEY (role_id) REFERENCES public.core_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_user_permissions core_user_user_permi_permission_id_35ccf601_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permi_permission_id_35ccf601_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_user_permissions core_user_user_permissions_user_id_085123d3_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_085123d3_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_useradsview core_useradsview_ads_id_471abc14_fk_core_ads_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_useradsview
    ADD CONSTRAINT core_useradsview_ads_id_471abc14_fk_core_ads_id FOREIGN KEY (ads_id) REFERENCES public.core_ads(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_useradsview core_useradsview_user_id_7126e401_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_useradsview
    ADD CONSTRAINT core_useradsview_user_id_7126e401_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_usermembership core_usermembership_membership_id_a65dac9f_fk_core_memb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usermembership
    ADD CONSTRAINT core_usermembership_membership_id_a65dac9f_fk_core_memb FOREIGN KEY (membership_id) REFERENCES public.core_membership(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_usermembership core_usermembership_user_id_dfa7c16b_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usermembership
    ADD CONSTRAINT core_usermembership_user_id_dfa7c16b_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_userpack core_userpack_pack_id_f4b266c6_fk_core_pack_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpack
    ADD CONSTRAINT core_userpack_pack_id_f4b266c6_fk_core_pack_id FOREIGN KEY (pack_id) REFERENCES public.core_pack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_userpack core_userpack_user_id_c37cc111_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpack
    ADD CONSTRAINT core_userpack_user_id_c37cc111_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_userpin core_userpin_user_id_1cccec1f_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_userpin
    ADD CONSTRAINT core_userpin_user_id_1cccec1f_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_usersalesdata core_usersalesdata_referral_id_cfe5ab69_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usersalesdata
    ADD CONSTRAINT core_usersalesdata_referral_id_cfe5ab69_fk_core_user_id FOREIGN KEY (referral_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_usersalesdata core_usersalesdata_user_id_bea8c111_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_usersalesdata
    ADD CONSTRAINT core_usersalesdata_user_id_bea8c111_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

