--
-- PostgreSQL database dump
--

\restrict uYYYnENM1YR8ZSEJI5YGb1QSNJJ9SGVQDdih6WkwnmyEBk6N0g5UTZtQPoyVjoA

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: enum_Licenses_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Licenses_status" AS ENUM (
    'active',
    'suspended',
    'expired'
);


ALTER TYPE public."enum_Licenses_status" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Companies" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    document character varying(255) NOT NULL,
    address character varying(255),
    logo character varying(255),
    active boolean DEFAULT true,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Companies" OWNER TO postgres;

--
-- Name: Companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Companies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Companies_id_seq" OWNER TO postgres;

--
-- Name: Companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Companies_id_seq" OWNED BY public."Companies".id;


--
-- Name: ContactCustomFields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactCustomFields" (
    id integer NOT NULL,
    name character varying(255),
    value character varying(255),
    "contactId" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ContactCustomFields" OWNER TO postgres;

--
-- Name: ContactCustomFields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactCustomFields_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ContactCustomFields_id_seq" OWNER TO postgres;

--
-- Name: ContactCustomFields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactCustomFields_id_seq" OWNED BY public."ContactCustomFields".id;


--
-- Name: Contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contacts" (
    id integer NOT NULL,
    name character varying(255),
    number character varying(255) NOT NULL,
    "companyId" integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    address character varying(255),
    document character varying(255),
    "zipCode" character varying(255),
    "addressComplement" character varying(255),
    "profilePicUrl" character varying(255),
    "isGroup" boolean DEFAULT false,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updateBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Contacts" OWNER TO postgres;

--
-- Name: Contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Contacts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Contacts_id_seq" OWNER TO postgres;

--
-- Name: Contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Contacts_id_seq" OWNED BY public."Contacts".id;


--
-- Name: Coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Coupons" (
    id integer NOT NULL,
    "couponCode" character varying(255) NOT NULL,
    percentage double precision NOT NULL,
    "startDate" timestamp with time zone NOT NULL,
    "endDate" timestamp with time zone NOT NULL,
    active boolean DEFAULT true,
    "companyId" integer NOT NULL,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Coupons" OWNER TO postgres;

--
-- Name: Coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Coupons_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Coupons_id_seq" OWNER TO postgres;

--
-- Name: Coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Coupons_id_seq" OWNED BY public."Coupons".id;


--
-- Name: Features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Features" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE public."Features" OWNER TO postgres;

--
-- Name: Features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Features_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Features_id_seq" OWNER TO postgres;

--
-- Name: Features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Features_id_seq" OWNED BY public."Features".id;


--
-- Name: LicenseFeatures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LicenseFeatures" (
    id integer NOT NULL,
    "licenseId" integer NOT NULL,
    "featureId" integer NOT NULL,
    active boolean DEFAULT true,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."LicenseFeatures" OWNER TO postgres;

--
-- Name: LicenseFeatures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LicenseFeatures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LicenseFeatures_id_seq" OWNER TO postgres;

--
-- Name: LicenseFeatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LicenseFeatures_id_seq" OWNED BY public."LicenseFeatures".id;


--
-- Name: LicenseLimits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LicenseLimits" (
    id integer NOT NULL,
    "licenseId" integer NOT NULL,
    resource character varying(255),
    "limit" integer,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."LicenseLimits" OWNER TO postgres;

--
-- Name: LicenseLimits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LicenseLimits_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LicenseLimits_id_seq" OWNER TO postgres;

--
-- Name: LicenseLimits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LicenseLimits_id_seq" OWNED BY public."LicenseLimits".id;


--
-- Name: Licenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Licenses" (
    id integer NOT NULL,
    "companyId" integer NOT NULL,
    type character varying(255),
    status public."enum_Licenses_status" DEFAULT 'active'::public."enum_Licenses_status",
    "startDate" timestamp with time zone NOT NULL,
    "isCurrent" boolean DEFAULT true,
    "endDate" timestamp with time zone NOT NULL,
    active boolean DEFAULT true,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Licenses" OWNER TO postgres;

--
-- Name: Licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Licenses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Licenses_id_seq" OWNER TO postgres;

--
-- Name: Licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Licenses_id_seq" OWNED BY public."Licenses".id;


--
-- Name: Messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Messages" (
    id character varying(255) NOT NULL,
    ack integer DEFAULT 0,
    read boolean DEFAULT false,
    "fromMe" boolean DEFAULT false,
    body text,
    "mediaUrl" character varying(255),
    "mediaType" character varying(255),
    "isDeleted" boolean DEFAULT false,
    "quotedMsgId" character varying(255),
    "ticketId" integer NOT NULL,
    "contactId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Messages" OWNER TO postgres;

--
-- Name: OperationTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OperationTypes" (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."OperationTypes" OWNER TO postgres;

--
-- Name: OperationTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OperationTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OperationTypes_id_seq" OWNER TO postgres;

--
-- Name: OperationTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OperationTypes_id_seq" OWNED BY public."OperationTypes".id;


--
-- Name: OrderProductTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderProductTypes" (
    id integer NOT NULL,
    "orderId" integer NOT NULL,
    "productTypeId" integer NOT NULL,
    quantity integer,
    value double precision,
    "companyId" integer NOT NULL,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."OrderProductTypes" OWNER TO postgres;

--
-- Name: OrderProductTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderProductTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderProductTypes_id_seq" OWNER TO postgres;

--
-- Name: OrderProductTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderProductTypes_id_seq" OWNED BY public."OrderProductTypes".id;


--
-- Name: OrderProducts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderProducts" (
    id integer NOT NULL,
    "productId" integer NOT NULL,
    "orderId" integer NOT NULL,
    "orderProductTypeId" integer NOT NULL,
    status character varying(255),
    "companyId" integer NOT NULL,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."OrderProducts" OWNER TO postgres;

--
-- Name: OrderProducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderProducts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderProducts_id_seq" OWNER TO postgres;

--
-- Name: OrderProducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderProducts_id_seq" OWNED BY public."OrderProducts".id;


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    id integer NOT NULL,
    "contactId" integer NOT NULL,
    "orderStatus" character varying(255),
    "totalValue" double precision,
    "finalAttachment" text,
    "sellerId" integer NOT NULL,
    "paymentType" character varying(255),
    "deliveryDate" timestamp with time zone,
    "couponId" integer,
    "operationTypeId" integer NOT NULL,
    "requestDate" timestamp with time zone,
    "rentalStartDate" timestamp with time zone,
    "rentalExpectedReturnDate" timestamp with time zone,
    "rentalEndDate" timestamp with time zone,
    active boolean DEFAULT true,
    "companyId" integer NOT NULL,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- Name: Orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orders_id_seq" OWNER TO postgres;

--
-- Name: Orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_id_seq" OWNED BY public."Orders".id;


--
-- Name: Permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    active boolean DEFAULT true,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Permissions" OWNER TO postgres;

--
-- Name: Permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Permissions_id_seq" OWNER TO postgres;

--
-- Name: Permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;


--
-- Name: ProductTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "saleValue" double precision DEFAULT '0'::double precision NOT NULL,
    "rentValue" double precision DEFAULT '0'::double precision NOT NULL,
    active boolean DEFAULT true,
    "companyId" integer NOT NULL,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ProductTypes" OWNER TO postgres;

--
-- Name: ProductTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ProductTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProductTypes_id_seq" OWNER TO postgres;

--
-- Name: ProductTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ProductTypes_id_seq" OWNED BY public."ProductTypes".id;


--
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    identification character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    "productTypeId" integer NOT NULL,
    "companyId" integer NOT NULL,
    active boolean DEFAULT true,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Products_id_seq" OWNER TO postgres;

--
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- Name: Queues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Queues" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(255) NOT NULL,
    "greetingMessage" text,
    "companyId" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Queues" OWNER TO postgres;

--
-- Name: Queues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Queues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Queues_id_seq" OWNER TO postgres;

--
-- Name: Queues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Queues_id_seq" OWNED BY public."Queues".id;


--
-- Name: QuickAnswers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."QuickAnswers" (
    id integer NOT NULL,
    shortcut text,
    message text,
    "companyId" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."QuickAnswers" OWNER TO postgres;

--
-- Name: QuickAnswers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."QuickAnswers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."QuickAnswers_id_seq" OWNER TO postgres;

--
-- Name: QuickAnswers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."QuickAnswers_id_seq" OWNED BY public."QuickAnswers".id;


--
-- Name: RolePermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolePermissions" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    "permissionId" integer NOT NULL,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RolePermissions" OWNER TO postgres;

--
-- Name: RolePermissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RolePermissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RolePermissions_id_seq" OWNER TO postgres;

--
-- Name: RolePermissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RolePermissions_id_seq" OWNED BY public."RolePermissions".id;


--
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true,
    "companyId" integer NOT NULL,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Roles_id_seq" OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: Settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Settings" (
    key character varying(255) NOT NULL,
    value character varying(255),
    "companyId" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Settings" OWNER TO postgres;

--
-- Name: StockMovementTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StockMovementTypes" (
    id integer NOT NULL,
    name character varying(255),
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."StockMovementTypes" OWNER TO postgres;

--
-- Name: StockMovementTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StockMovementTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StockMovementTypes_id_seq" OWNER TO postgres;

--
-- Name: StockMovementTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StockMovementTypes_id_seq" OWNED BY public."StockMovementTypes".id;


--
-- Name: StockMovements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StockMovements" (
    id integer NOT NULL,
    "productId" integer NOT NULL,
    "orderId" integer,
    "movementTypeId" integer NOT NULL,
    "companyId" integer NOT NULL,
    quantity integer,
    "createdBy" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."StockMovements" OWNER TO postgres;

--
-- Name: StockMovements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StockMovements_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StockMovements_id_seq" OWNER TO postgres;

--
-- Name: StockMovements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StockMovements_id_seq" OWNED BY public."StockMovements".id;


--
-- Name: Tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tickets" (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying,
    "unreadMessages" integer,
    "lastMessage" character varying(255),
    "isGroup" boolean DEFAULT false,
    "userId" integer,
    "contactId" integer,
    "whatsappId" integer,
    "queueId" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Tickets" OWNER TO postgres;

--
-- Name: Tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tickets_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tickets_id_seq" OWNER TO postgres;

--
-- Name: Tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tickets_id_seq" OWNED BY public."Tickets".id;


--
-- Name: UserQueues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserQueues" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "queueId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."UserQueues" OWNER TO postgres;

--
-- Name: UserQueues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserQueues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UserQueues_id_seq" OWNER TO postgres;

--
-- Name: UserQueues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserQueues_id_seq" OWNED BY public."UserQueues".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255) NOT NULL,
    "passwordHash" character varying(255) NOT NULL,
    "tokenVersion" integer DEFAULT 0,
    "roleId" integer NOT NULL,
    "companyId" integer NOT NULL,
    "whatsappId" integer NOT NULL,
    "createdBy" character varying(255),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedBy" character varying(255),
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: WhatsappQueues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WhatsappQueues" (
    id integer NOT NULL,
    "whatsappId" integer NOT NULL,
    "queueId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."WhatsappQueues" OWNER TO postgres;

--
-- Name: WhatsappQueues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WhatsappQueues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."WhatsappQueues_id_seq" OWNER TO postgres;

--
-- Name: WhatsappQueues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WhatsappQueues_id_seq" OWNED BY public."WhatsappQueues".id;


--
-- Name: Whatsapps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Whatsapps" (
    id integer NOT NULL,
    name text,
    session text,
    qrcode text,
    status character varying(255),
    battery character varying(255),
    plugged boolean,
    retries integer,
    "greetingMessage" text,
    "farewellMessage" text,
    "isDefault" boolean DEFAULT false,
    "companyId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Whatsapps" OWNER TO postgres;

--
-- Name: Whatsapps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Whatsapps_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Whatsapps_id_seq" OWNER TO postgres;

--
-- Name: Whatsapps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Whatsapps_id_seq" OWNED BY public."Whatsapps".id;


--
-- Name: Companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Companies" ALTER COLUMN id SET DEFAULT nextval('public."Companies_id_seq"'::regclass);


--
-- Name: ContactCustomFields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactCustomFields" ALTER COLUMN id SET DEFAULT nextval('public."ContactCustomFields_id_seq"'::regclass);


--
-- Name: Contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contacts" ALTER COLUMN id SET DEFAULT nextval('public."Contacts_id_seq"'::regclass);


--
-- Name: Coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Coupons" ALTER COLUMN id SET DEFAULT nextval('public."Coupons_id_seq"'::regclass);


--
-- Name: Features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Features" ALTER COLUMN id SET DEFAULT nextval('public."Features_id_seq"'::regclass);


--
-- Name: LicenseFeatures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LicenseFeatures" ALTER COLUMN id SET DEFAULT nextval('public."LicenseFeatures_id_seq"'::regclass);


--
-- Name: LicenseLimits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LicenseLimits" ALTER COLUMN id SET DEFAULT nextval('public."LicenseLimits_id_seq"'::regclass);


--
-- Name: Licenses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Licenses" ALTER COLUMN id SET DEFAULT nextval('public."Licenses_id_seq"'::regclass);


--
-- Name: OperationTypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OperationTypes" ALTER COLUMN id SET DEFAULT nextval('public."OperationTypes_id_seq"'::regclass);


--
-- Name: OrderProductTypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProductTypes" ALTER COLUMN id SET DEFAULT nextval('public."OrderProductTypes_id_seq"'::regclass);


--
-- Name: OrderProducts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProducts" ALTER COLUMN id SET DEFAULT nextval('public."OrderProducts_id_seq"'::regclass);


--
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN id SET DEFAULT nextval('public."Orders_id_seq"'::regclass);


--
-- Name: Permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);


--
-- Name: ProductTypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductTypes" ALTER COLUMN id SET DEFAULT nextval('public."ProductTypes_id_seq"'::regclass);


--
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- Name: Queues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Queues" ALTER COLUMN id SET DEFAULT nextval('public."Queues_id_seq"'::regclass);


--
-- Name: QuickAnswers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."QuickAnswers" ALTER COLUMN id SET DEFAULT nextval('public."QuickAnswers_id_seq"'::regclass);


--
-- Name: RolePermissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions" ALTER COLUMN id SET DEFAULT nextval('public."RolePermissions_id_seq"'::regclass);


--
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- Name: StockMovementTypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovementTypes" ALTER COLUMN id SET DEFAULT nextval('public."StockMovementTypes_id_seq"'::regclass);


--
-- Name: StockMovements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovements" ALTER COLUMN id SET DEFAULT nextval('public."StockMovements_id_seq"'::regclass);


--
-- Name: Tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets" ALTER COLUMN id SET DEFAULT nextval('public."Tickets_id_seq"'::regclass);


--
-- Name: UserQueues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserQueues" ALTER COLUMN id SET DEFAULT nextval('public."UserQueues_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: WhatsappQueues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WhatsappQueues" ALTER COLUMN id SET DEFAULT nextval('public."WhatsappQueues_id_seq"'::regclass);


--
-- Name: Whatsapps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Whatsapps" ALTER COLUMN id SET DEFAULT nextval('public."Whatsapps_id_seq"'::regclass);


--
-- Name: Companies Companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Companies"
    ADD CONSTRAINT "Companies_pkey" PRIMARY KEY (id);


--
-- Name: ContactCustomFields ContactCustomFields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactCustomFields"
    ADD CONSTRAINT "ContactCustomFields_pkey" PRIMARY KEY (id);


--
-- Name: Contacts Contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT "Contacts_pkey" PRIMARY KEY (id);


--
-- Name: Coupons Coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Coupons"
    ADD CONSTRAINT "Coupons_pkey" PRIMARY KEY (id);


--
-- Name: Features Features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Features"
    ADD CONSTRAINT "Features_pkey" PRIMARY KEY (id);


--
-- Name: LicenseFeatures LicenseFeatures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LicenseFeatures"
    ADD CONSTRAINT "LicenseFeatures_pkey" PRIMARY KEY (id);


--
-- Name: LicenseLimits LicenseLimits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LicenseLimits"
    ADD CONSTRAINT "LicenseLimits_pkey" PRIMARY KEY (id);


--
-- Name: Licenses Licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Licenses"
    ADD CONSTRAINT "Licenses_pkey" PRIMARY KEY (id);


--
-- Name: Messages Messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_pkey" PRIMARY KEY (id);


--
-- Name: OperationTypes OperationTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OperationTypes"
    ADD CONSTRAINT "OperationTypes_pkey" PRIMARY KEY (id);


--
-- Name: OrderProductTypes OrderProductTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProductTypes"
    ADD CONSTRAINT "OrderProductTypes_pkey" PRIMARY KEY (id);


--
-- Name: OrderProducts OrderProducts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProducts"
    ADD CONSTRAINT "OrderProducts_pkey" PRIMARY KEY (id);


--
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);


--
-- Name: Permissions Permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);


--
-- Name: ProductTypes ProductTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductTypes"
    ADD CONSTRAINT "ProductTypes_pkey" PRIMARY KEY (id);


--
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- Name: Queues Queues_color_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_color_key" UNIQUE (color);


--
-- Name: Queues Queues_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_name_key" UNIQUE (name);


--
-- Name: Queues Queues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_pkey" PRIMARY KEY (id);


--
-- Name: QuickAnswers QuickAnswers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."QuickAnswers"
    ADD CONSTRAINT "QuickAnswers_pkey" PRIMARY KEY (id);


--
-- Name: RolePermissions RolePermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "RolePermissions_pkey" PRIMARY KEY (id);


--
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Settings Settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settings"
    ADD CONSTRAINT "Settings_pkey" PRIMARY KEY (key);


--
-- Name: StockMovementTypes StockMovementTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovementTypes"
    ADD CONSTRAINT "StockMovementTypes_pkey" PRIMARY KEY (id);


--
-- Name: StockMovements StockMovements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovements"
    ADD CONSTRAINT "StockMovements_pkey" PRIMARY KEY (id);


--
-- Name: Tickets Tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_pkey" PRIMARY KEY (id);


--
-- Name: UserQueues UserQueues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserQueues"
    ADD CONSTRAINT "UserQueues_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: WhatsappQueues WhatsappQueues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WhatsappQueues"
    ADD CONSTRAINT "WhatsappQueues_pkey" PRIMARY KEY (id);


--
-- Name: Whatsapps Whatsapps_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_name_key" UNIQUE (name);


--
-- Name: Whatsapps Whatsapps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_pkey" PRIMARY KEY (id);


--
-- Name: contact_custom_fields_contact_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contact_custom_fields_contact_id ON public."ContactCustomFields" USING btree ("contactId");


--
-- Name: contacts_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_company_id ON public."Contacts" USING btree ("companyId");


--
-- Name: contacts_company_number_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX contacts_company_number_unique ON public."Contacts" USING btree ("companyId", number);


--
-- Name: contacts_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_number ON public."Contacts" USING btree (number);


--
-- Name: coupons_company_code_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX coupons_company_code_unique ON public."Coupons" USING btree ("companyId", "couponCode");


--
-- Name: coupons_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX coupons_company_id ON public."Coupons" USING btree ("companyId");


--
-- Name: coupons_coupon_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX coupons_coupon_code ON public."Coupons" USING btree ("couponCode");


--
-- Name: license_features_feature_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX license_features_feature_id ON public."LicenseFeatures" USING btree ("featureId");


--
-- Name: license_features_license_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX license_features_license_id ON public."LicenseFeatures" USING btree ("licenseId");


--
-- Name: license_limits_license_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX license_limits_license_id ON public."LicenseLimits" USING btree ("licenseId");


--
-- Name: license_limits_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX license_limits_resource ON public."LicenseLimits" USING btree (resource);


--
-- Name: licensefeatures_license_feature_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX licensefeatures_license_feature_unique ON public."LicenseFeatures" USING btree ("licenseId", "featureId");


--
-- Name: licenses_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX licenses_company_id ON public."Licenses" USING btree ("companyId");


--
-- Name: messages_contact_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_contact_id ON public."Messages" USING btree ("contactId");


--
-- Name: messages_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_created_at ON public."Messages" USING btree ("createdAt");


--
-- Name: messages_quoted_msg_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_quoted_msg_id ON public."Messages" USING btree ("quotedMsgId");


--
-- Name: messages_ticket_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_ticket_id ON public."Messages" USING btree ("ticketId");


--
-- Name: order_product_types_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_product_types_company_id ON public."OrderProductTypes" USING btree ("companyId");


--
-- Name: order_product_types_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_product_types_order_id ON public."OrderProductTypes" USING btree ("orderId");


--
-- Name: order_product_types_product_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_product_types_product_type_id ON public."OrderProductTypes" USING btree ("productTypeId");


--
-- Name: order_products_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_products_company_id ON public."OrderProducts" USING btree ("companyId");


--
-- Name: order_products_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_products_order_id ON public."OrderProducts" USING btree ("orderId");


--
-- Name: order_products_order_product_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_products_order_product_type_id ON public."OrderProducts" USING btree ("orderProductTypeId");


--
-- Name: order_products_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_products_product_id ON public."OrderProducts" USING btree ("productId");


--
-- Name: orderproducts_order_product_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX orderproducts_order_product_unique ON public."OrderProducts" USING btree ("orderId", "productId");


--
-- Name: orderproducttypes_order_producttype_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX orderproducttypes_order_producttype_unique ON public."OrderProductTypes" USING btree ("orderId", "productTypeId");


--
-- Name: orders_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_company_id ON public."Orders" USING btree ("companyId");


--
-- Name: orders_contact_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_contact_id ON public."Orders" USING btree ("contactId");


--
-- Name: orders_coupon_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_coupon_id ON public."Orders" USING btree ("couponId");


--
-- Name: orders_operation_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_operation_type_id ON public."Orders" USING btree ("operationTypeId");


--
-- Name: orders_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_seller_id ON public."Orders" USING btree ("sellerId");


--
-- Name: product_types_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_types_company_id ON public."ProductTypes" USING btree ("companyId");


--
-- Name: products_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_company_id ON public."Products" USING btree ("companyId");


--
-- Name: products_company_identification_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX products_company_identification_unique ON public."Products" USING btree ("companyId", identification);


--
-- Name: products_product_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_type_id ON public."Products" USING btree ("productTypeId");


--
-- Name: products_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_status ON public."Products" USING btree (status);


--
-- Name: producttypes_company_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX producttypes_company_name_unique ON public."ProductTypes" USING btree ("companyId", name);


--
-- Name: queues_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX queues_company_id ON public."Queues" USING btree ("companyId");


--
-- Name: queues_company_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX queues_company_name_unique ON public."Queues" USING btree ("companyId", name);


--
-- Name: quick_answers_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quick_answers_company_id ON public."QuickAnswers" USING btree ("companyId");


--
-- Name: quick_answers_shortcut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quick_answers_shortcut ON public."QuickAnswers" USING btree (shortcut);


--
-- Name: role_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX role_permissions_permission_id ON public."RolePermissions" USING btree ("permissionId");


--
-- Name: role_permissions_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX role_permissions_role_id ON public."RolePermissions" USING btree ("roleId");


--
-- Name: rolepermissions_role_permission_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX rolepermissions_role_permission_unique ON public."RolePermissions" USING btree ("roleId", "permissionId");


--
-- Name: roles_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_company_id ON public."Roles" USING btree ("companyId");


--
-- Name: roles_company_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_company_name_unique ON public."Roles" USING btree ("companyId", name);


--
-- Name: settings_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX settings_company_id ON public."Settings" USING btree ("companyId");


--
-- Name: settings_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX settings_key ON public."Settings" USING btree (key);


--
-- Name: stock_movements_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_movements_company_id ON public."StockMovements" USING btree ("companyId");


--
-- Name: stock_movements_movement_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_movements_movement_type_id ON public."StockMovements" USING btree ("movementTypeId");


--
-- Name: stock_movements_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_movements_order_id ON public."StockMovements" USING btree ("orderId");


--
-- Name: stock_movements_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_movements_product_id ON public."StockMovements" USING btree ("productId");


--
-- Name: tickets_contact_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tickets_contact_id ON public."Tickets" USING btree ("contactId");


--
-- Name: tickets_is_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tickets_is_group ON public."Tickets" USING btree ("isGroup");


--
-- Name: tickets_queue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tickets_queue_id ON public."Tickets" USING btree ("queueId");


--
-- Name: tickets_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tickets_status ON public."Tickets" USING btree (status);


--
-- Name: tickets_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tickets_user_id ON public."Tickets" USING btree ("userId");


--
-- Name: tickets_whatsapp_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tickets_whatsapp_id ON public."Tickets" USING btree ("whatsappId");


--
-- Name: user_queues_queue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_queues_queue_id ON public."UserQueues" USING btree ("queueId");


--
-- Name: user_queues_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_queues_user_id ON public."UserQueues" USING btree ("userId");


--
-- Name: userqueues_user_queue_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX userqueues_user_queue_unique ON public."UserQueues" USING btree ("userId", "queueId");


--
-- Name: users_company_email_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_company_email_unique ON public."Users" USING btree ("companyId", email);


--
-- Name: users_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_company_id ON public."Users" USING btree ("companyId");


--
-- Name: users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_email ON public."Users" USING btree (email);


--
-- Name: users_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_role_id ON public."Users" USING btree ("roleId");


--
-- Name: users_whatsapp_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_whatsapp_id ON public."Users" USING btree ("whatsappId");


--
-- Name: whatsapp_queues_queue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX whatsapp_queues_queue_id ON public."WhatsappQueues" USING btree ("queueId");


--
-- Name: whatsapp_queues_whatsapp_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX whatsapp_queues_whatsapp_id ON public."WhatsappQueues" USING btree ("whatsappId");


--
-- Name: whatsappqueues_whatsapp_queue_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX whatsappqueues_whatsapp_queue_unique ON public."WhatsappQueues" USING btree ("whatsappId", "queueId");


--
-- Name: whatsapps_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX whatsapps_company_id ON public."Whatsapps" USING btree ("companyId");


--
-- Name: whatsapps_company_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX whatsapps_company_name_unique ON public."Whatsapps" USING btree ("companyId", name);


--
-- Name: whatsapps_is_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX whatsapps_is_default ON public."Whatsapps" USING btree ("isDefault");


--
-- Name: whatsapps_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX whatsapps_status ON public."Whatsapps" USING btree (status);


--
-- Name: ContactCustomFields ContactCustomFields_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactCustomFields"
    ADD CONSTRAINT "ContactCustomFields_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contacts Contacts_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT "Contacts_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Coupons Coupons_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Coupons"
    ADD CONSTRAINT "Coupons_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: LicenseFeatures LicenseFeatures_featureId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LicenseFeatures"
    ADD CONSTRAINT "LicenseFeatures_featureId_fkey" FOREIGN KEY ("featureId") REFERENCES public."Features"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: LicenseFeatures LicenseFeatures_licenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LicenseFeatures"
    ADD CONSTRAINT "LicenseFeatures_licenseId_fkey" FOREIGN KEY ("licenseId") REFERENCES public."Licenses"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: LicenseLimits LicenseLimits_licenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LicenseLimits"
    ADD CONSTRAINT "LicenseLimits_licenseId_fkey" FOREIGN KEY ("licenseId") REFERENCES public."Licenses"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Licenses Licenses_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Licenses"
    ADD CONSTRAINT "Licenses_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Messages Messages_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Messages Messages_quotedMsgId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_quotedMsgId_fkey" FOREIGN KEY ("quotedMsgId") REFERENCES public."Messages"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Messages Messages_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Tickets"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderProductTypes OrderProductTypes_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProductTypes"
    ADD CONSTRAINT "OrderProductTypes_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderProductTypes OrderProductTypes_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProductTypes"
    ADD CONSTRAINT "OrderProductTypes_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Orders"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderProductTypes OrderProductTypes_productTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProductTypes"
    ADD CONSTRAINT "OrderProductTypes_productTypeId_fkey" FOREIGN KEY ("productTypeId") REFERENCES public."ProductTypes"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderProducts OrderProducts_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProducts"
    ADD CONSTRAINT "OrderProducts_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderProducts OrderProducts_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProducts"
    ADD CONSTRAINT "OrderProducts_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Orders"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderProducts OrderProducts_orderProductTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProducts"
    ADD CONSTRAINT "OrderProducts_orderProductTypeId_fkey" FOREIGN KEY ("orderProductTypeId") REFERENCES public."OrderProductTypes"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderProducts OrderProducts_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderProducts"
    ADD CONSTRAINT "OrderProducts_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Products"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Orders Orders_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Orders Orders_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Orders Orders_couponId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_couponId_fkey" FOREIGN KEY ("couponId") REFERENCES public."Coupons"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_operationTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_operationTypeId_fkey" FOREIGN KEY ("operationTypeId") REFERENCES public."OperationTypes"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Orders Orders_sellerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductTypes ProductTypes_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductTypes"
    ADD CONSTRAINT "ProductTypes_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Products Products_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Products Products_productTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_productTypeId_fkey" FOREIGN KEY ("productTypeId") REFERENCES public."ProductTypes"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Queues Queues_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: QuickAnswers QuickAnswers_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."QuickAnswers"
    ADD CONSTRAINT "QuickAnswers_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RolePermissions RolePermissions_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "RolePermissions_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permissions"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RolePermissions RolePermissions_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "RolePermissions_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Roles Roles_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Settings Settings_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settings"
    ADD CONSTRAINT "Settings_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: StockMovements StockMovements_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovements"
    ADD CONSTRAINT "StockMovements_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: StockMovements StockMovements_movementTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovements"
    ADD CONSTRAINT "StockMovements_movementTypeId_fkey" FOREIGN KEY ("movementTypeId") REFERENCES public."StockMovementTypes"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: StockMovements StockMovements_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovements"
    ADD CONSTRAINT "StockMovements_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: StockMovements StockMovements_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockMovements"
    ADD CONSTRAINT "StockMovements_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Products"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tickets Tickets_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tickets Tickets_queueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES public."Queues"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tickets Tickets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tickets Tickets_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserQueues UserQueues_queueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserQueues"
    ADD CONSTRAINT "UserQueues_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES public."Queues"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserQueues UserQueues_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserQueues"
    ADD CONSTRAINT "UserQueues_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WhatsappQueues WhatsappQueues_queueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WhatsappQueues"
    ADD CONSTRAINT "WhatsappQueues_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES public."Queues"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WhatsappQueues WhatsappQueues_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WhatsappQueues"
    ADD CONSTRAINT "WhatsappQueues_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Whatsapps Whatsapps_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict uYYYnENM1YR8ZSEJI5YGb1QSNJJ9SGVQDdih6WkwnmyEBk6N0g5UTZtQPoyVjoA

