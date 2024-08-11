--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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
-- Name: task_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_category (
                                      id BIGINT NOT NULL,
                                      name VARCHAR(255) NOT NULL,
                                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      CONSTRAINT task_category_pkey PRIMARY KEY (id)
);

--
-- Name: task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task (
                             id BIGINT NOT NULL,
                             name TEXT,
                             description TEXT,
                             category_id BIGINT,
                             tags VARCHAR(355) DEFAULT NULL,
                             price INT NOT NULL,
                             creator_id BIGINT,
                             creator_ip VARCHAR(255) DEFAULT NULL,
                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             updated_at_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             deleted_at TIMESTAMP DEFAULT NULL,
                             CONSTRAINT task_pkey PRIMARY KEY (id),
                             CONSTRAINT task_category_id_fkey FOREIGN KEY (category_id)
                                 REFERENCES public.task_category (id) ON DELETE CASCADE
);

-- Adding full-text search indexes for 'name' and 'description' columns
CREATE INDEX task_name_fulltext_idx ON public.task USING gin (to_tsvector('english', name));
CREATE INDEX task_description_fulltext_idx ON public.task USING gin (to_tsvector('english', description));

--
-- Name: task_response; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_response (
                                      id BIGINT NOT NULL,
                                      task_id BIGINT,
                                      user_id BIGINT,
                                      caption VARCHAR(455) NOT NULL,
                                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      CONSTRAINT task_response_pkey PRIMARY KEY (id),
                                      CONSTRAINT task_response_task_id_fkey FOREIGN KEY (task_id)
                                          REFERENCES public.task (id) ON DELETE CASCADE
);

--
-- Name: task_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: task_response_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: task_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_category ALTER COLUMN id SET DEFAULT nextval('public.task_category_id_seq'::regclass);

--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);

--
-- Name: task_response id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_response ALTER COLUMN id SET DEFAULT nextval('public.task_response_id_seq'::regclass);
