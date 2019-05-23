--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_admin_comments (
    id integer NOT NULL,
    namespace character varying(255),
    body text,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: adminships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.adminships (
    id integer NOT NULL,
    school_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: adminships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.adminships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: adminships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.adminships_id_seq OWNED BY public.adminships.id;


--
-- Name: announcement_interactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.announcement_interactions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    announcement_id integer NOT NULL,
    read boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: announcement_interactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcement_interactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcement_interactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcement_interactions_id_seq OWNED BY public.announcement_interactions.id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.announcements (
    id integer NOT NULL,
    subject text NOT NULL,
    message text NOT NULL,
    snippet text NOT NULL,
    creator_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    target_role integer DEFAULT 0
);


--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- Name: api_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.api_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    api_key character varying NOT NULL
);


--
-- Name: api_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.api_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: api_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.api_users_id_seq OWNED BY public.api_users.id;


--
-- Name: assessment_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_answers (
    id integer NOT NULL,
    diagnostic_participation_id integer NOT NULL,
    question_id integer NOT NULL,
    selected_choice_id integer NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: assessment_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_answers_id_seq OWNED BY public.assessment_answers.id;


--
-- Name: assessment_choices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_choices (
    id integer NOT NULL,
    question_id integer NOT NULL,
    content text NOT NULL,
    correct boolean DEFAULT false,
    fixed_to_bottom boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: assessment_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_choices_id_seq OWNED BY public.assessment_choices.id;


--
-- Name: assessment_diagnostic_participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_diagnostic_participations (
    id integer NOT NULL,
    diagnostic_id integer NOT NULL,
    user_id integer NOT NULL,
    progress integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    completed_at timestamp without time zone,
    current_passage_id integer
);


--
-- Name: assessment_diagnostic_participations_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_diagnostic_participations_assignments (
    id integer NOT NULL,
    assignment_id integer NOT NULL,
    diagnostic_participation_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: assessment_diagnostic_participations_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_diagnostic_participations_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_diagnostic_participations_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_diagnostic_participations_assignments_id_seq OWNED BY public.assessment_diagnostic_participations_assignments.id;


--
-- Name: assessment_diagnostic_participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_diagnostic_participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_diagnostic_participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_diagnostic_participations_id_seq OWNED BY public.assessment_diagnostic_participations.id;


--
-- Name: assessment_diagnostics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_diagnostics (
    id integer NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    published boolean DEFAULT false,
    assignable boolean DEFAULT false,
    exam_type integer DEFAULT 0 NOT NULL
);


--
-- Name: assessment_diagnostics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_diagnostics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_diagnostics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_diagnostics_id_seq OWNED BY public.assessment_diagnostics.id;


--
-- Name: assessment_ordered_passages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_ordered_passages (
    id integer NOT NULL,
    section_id integer NOT NULL,
    passage_id integer NOT NULL,
    "position" integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: assessment_ordered_passages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_ordered_passages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_ordered_passages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_ordered_passages_id_seq OWNED BY public.assessment_ordered_passages.id;


--
-- Name: assessment_passages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_passages (
    id integer NOT NULL,
    title character varying NOT NULL,
    author character varying NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    difficulty_level_id integer DEFAULT 3 NOT NULL,
    blurb text
);


--
-- Name: assessment_passages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_passages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_passages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_passages_id_seq OWNED BY public.assessment_passages.id;


--
-- Name: assessment_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_questions (
    id integer NOT NULL,
    content text NOT NULL,
    passage_id integer NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    difficulty_level_id integer DEFAULT 3 NOT NULL,
    skill_id integer
);


--
-- Name: assessment_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_questions_id_seq OWNED BY public.assessment_questions.id;


--
-- Name: assessment_section_transitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_section_transitions (
    id integer NOT NULL,
    diagnostic_id integer NOT NULL,
    source_section_id integer NOT NULL,
    range_start_condition character varying NOT NULL,
    range_start_value integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    range_end_condition character varying NOT NULL,
    range_end_value integer NOT NULL,
    destination_id integer,
    destination_type character varying
);


--
-- Name: assessment_section_transitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_section_transitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_section_transitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_section_transitions_id_seq OWNED BY public.assessment_section_transitions.id;


--
-- Name: assessment_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_sections (
    id integer NOT NULL,
    title character varying NOT NULL,
    diagnostic_id integer NOT NULL,
    level_start_id integer NOT NULL,
    level_end_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    root boolean DEFAULT false
);


--
-- Name: assessment_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assessment_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assessment_sections_id_seq OWNED BY public.assessment_sections.id;


--
-- Name: assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assignments (
    id integer NOT NULL,
    message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    creator_id integer,
    assignee_id integer,
    assignee_type character varying(255),
    assigned_object_id integer,
    mandatory_set_id integer,
    undertaking_type character varying DEFAULT 'Homework'::character varying,
    vocab_game_mode integer DEFAULT 0,
    untimed boolean DEFAULT false,
    same_settings_for_all boolean DEFAULT true,
    type character varying,
    progress integer DEFAULT 0
);


--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- Name: assignments_reader_quiz_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assignments_reader_quiz_attempts (
    id integer NOT NULL,
    quiz_assignment_id integer,
    quiz_attempt_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: assignments_reader_quiz_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assignments_reader_quiz_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assignments_reader_quiz_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assignments_reader_quiz_attempts_id_seq OWNED BY public.assignments_reader_quiz_attempts.id;


--
-- Name: assignments_vocab_set_participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assignments_vocab_set_participations (
    id integer NOT NULL,
    assignment_id integer,
    set_participation_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: assignments_vocab_set_participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assignments_vocab_set_participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assignments_vocab_set_participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assignments_vocab_set_participations_id_seq OWNED BY public.assignments_vocab_set_participations.id;


--
-- Name: audits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audits (
    id integer NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes json,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp without time zone
);


--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: category_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    "position" integer
);


--
-- Name: category_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_types_id_seq OWNED BY public.category_types.id;


--
-- Name: clever_district_imports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clever_district_imports (
    id integer NOT NULL,
    district_id integer,
    job_id character varying,
    status smallint DEFAULT 0,
    completed_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    note character varying,
    event_id_prior_import character varying
);


--
-- Name: clever_district_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clever_district_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clever_district_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clever_district_imports_id_seq OWNED BY public.clever_district_imports.id;


--
-- Name: clever_district_syncs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clever_district_syncs (
    id integer NOT NULL,
    district_id integer,
    latest_event_id character varying,
    running boolean DEFAULT false,
    started_at timestamp without time zone,
    succeeded_at timestamp without time zone,
    failed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    paused_at timestamp without time zone DEFAULT '2018-06-25 05:30:00'::timestamp without time zone,
    district_import_id integer
);


--
-- Name: clever_district_syncs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clever_district_syncs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clever_district_syncs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clever_district_syncs_id_seq OWNED BY public.clever_district_syncs.id;


--
-- Name: clever_entities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clever_entities (
    id integer NOT NULL,
    clazz character varying,
    data json,
    done boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: clever_entities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clever_entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clever_entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clever_entities_id_seq OWNED BY public.clever_entities.id;


--
-- Name: clever_imports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clever_imports (
    id integer NOT NULL,
    user_id integer,
    entity_id integer,
    entity_type character varying
);


--
-- Name: clever_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clever_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clever_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clever_imports_id_seq OWNED BY public.clever_imports.id;


--
-- Name: clever_schools_imports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clever_schools_imports (
    id integer NOT NULL,
    district_id integer,
    status smallint DEFAULT 0,
    completed_at timestamp without time zone,
    note character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: clever_schools_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clever_schools_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clever_schools_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clever_schools_imports_id_seq OWNED BY public.clever_schools_imports.id;


--
-- Name: clever_student_imports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clever_student_imports (
    id integer NOT NULL,
    district_id integer,
    status smallint DEFAULT 0,
    completed_at timestamp without time zone,
    note character varying,
    student_source_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: clever_student_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clever_student_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clever_student_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clever_student_imports_id_seq OWNED BY public.clever_student_imports.id;


--
-- Name: clever_teacher_imports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clever_teacher_imports (
    id integer NOT NULL,
    district_id integer,
    status smallint DEFAULT 0,
    job_id character varying,
    completed_at timestamp without time zone,
    note character varying,
    teacher_source_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: clever_teacher_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clever_teacher_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clever_teacher_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clever_teacher_imports_id_seq OWNED BY public.clever_teacher_imports.id;


--
-- Name: content_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    category_type_id integer DEFAULT 0 NOT NULL,
    url_slug character varying NOT NULL,
    "position" integer
);


--
-- Name: content_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.content_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.content_categories_id_seq OWNED BY public.content_categories.id;


--
-- Name: content_categories_reader_quizzes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_categories_reader_quizzes (
    id integer NOT NULL,
    content_category_id integer,
    quiz_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: content_categories_reader_quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.content_categories_reader_quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_categories_reader_quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.content_categories_reader_quizzes_id_seq OWNED BY public.content_categories_reader_quizzes.id;


--
-- Name: content_categories_vocab_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_categories_vocab_sets (
    content_category_id integer NOT NULL,
    set_id integer NOT NULL
);


--
-- Name: crg_choices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_choices (
    id integer NOT NULL,
    choice_text character varying,
    correct boolean,
    multiple_choice_question_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_choices_id_seq OWNED BY public.crg_choices.id;


--
-- Name: crg_drag_and_drop_phrases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_drag_and_drop_phrases (
    id integer NOT NULL,
    correct_attempts_expected integer,
    incorrect_attempts_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    interaction_info text
);


--
-- Name: crg_drag_and_drop_phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_drag_and_drop_phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_drag_and_drop_phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_drag_and_drop_phrases_id_seq OWNED BY public.crg_drag_and_drop_phrases.id;


--
-- Name: crg_drag_drop_phrase_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_drag_drop_phrase_attempts (
    id integer NOT NULL,
    passage_response_id integer NOT NULL,
    drag_and_drop_phrase_id integer NOT NULL,
    dropped_on_word integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_drag_drop_phrase_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_drag_drop_phrase_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_drag_drop_phrase_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_drag_drop_phrase_attempts_id_seq OWNED BY public.crg_drag_drop_phrase_attempts.id;


--
-- Name: crg_find_phrases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_find_phrases (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    correct_attempts_expected integer,
    incorrect_attempts_allowed integer,
    interaction_info text
);


--
-- Name: crg_find_phrases_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_find_phrases_answers (
    id integer NOT NULL,
    find_phrases_id integer,
    phrase_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_word_number integer,
    end_word_number integer,
    sub_phrases json DEFAULT '[]'::json
);


--
-- Name: crg_find_phrases_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_find_phrases_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_find_phrases_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_find_phrases_answers_id_seq OWNED BY public.crg_find_phrases_answers.id;


--
-- Name: crg_find_phrases_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_find_phrases_attempts (
    id integer NOT NULL,
    passage_response_id integer NOT NULL,
    find_phrases_id integer NOT NULL,
    start_word_number integer,
    end_word_number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_find_phrases_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_find_phrases_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_find_phrases_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_find_phrases_attempts_id_seq OWNED BY public.crg_find_phrases_attempts.id;


--
-- Name: crg_find_phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_find_phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_find_phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_find_phrases_id_seq OWNED BY public.crg_find_phrases.id;


--
-- Name: crg_focus_phrases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_focus_phrases (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_word_number integer,
    end_word_number integer,
    focus_type integer DEFAULT 0
);


--
-- Name: crg_focus_phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_focus_phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_focus_phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_focus_phrases_id_seq OWNED BY public.crg_focus_phrases.id;


--
-- Name: crg_lesson_participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_lesson_participations (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    user_id integer NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    current_passage_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_lesson_participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_lesson_participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_lesson_participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_lesson_participations_id_seq OWNED BY public.crg_lesson_participations.id;


--
-- Name: crg_lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_lessons (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying NOT NULL
);


--
-- Name: crg_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_lessons_id_seq OWNED BY public.crg_lessons.id;


--
-- Name: crg_multiple_choice_question_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_multiple_choice_question_attempts (
    id integer NOT NULL,
    passage_response_id integer NOT NULL,
    multiple_choice_question_id integer NOT NULL,
    selected_choice_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_multiple_choice_question_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_multiple_choice_question_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_multiple_choice_question_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_multiple_choice_question_attempts_id_seq OWNED BY public.crg_multiple_choice_question_attempts.id;


--
-- Name: crg_multiple_choice_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_multiple_choice_questions (
    id integer NOT NULL,
    question_text character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    attempts_allowed integer DEFAULT 1,
    interaction_info text
);


--
-- Name: crg_multiple_choice_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_multiple_choice_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_multiple_choice_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_multiple_choice_questions_id_seq OWNED BY public.crg_multiple_choice_questions.id;


--
-- Name: crg_narrator_skill_videos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_narrator_skill_videos (
    id integer NOT NULL,
    video_id integer,
    narrator_id integer,
    skill_id integer,
    skill_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_narrator_skill_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_narrator_skill_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_narrator_skill_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_narrator_skill_videos_id_seq OWNED BY public.crg_narrator_skill_videos.id;


--
-- Name: crg_narrators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_narrators (
    id integer NOT NULL,
    name character varying NOT NULL,
    image character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_narrators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_narrators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_narrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_narrators_id_seq OWNED BY public.crg_narrators.id;


--
-- Name: crg_ordered_passages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_ordered_passages (
    id integer NOT NULL,
    passage_id integer NOT NULL,
    lesson_id integer NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_ordered_passages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_ordered_passages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_ordered_passages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_ordered_passages_id_seq OWNED BY public.crg_ordered_passages.id;


--
-- Name: crg_ordered_scene_elements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_ordered_scene_elements (
    id integer NOT NULL,
    scene_element_id integer,
    scene_element_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0,
    scene_element_sequence_id integer,
    scene_element_sequence_type character varying,
    scene_element_sequence_name character varying,
    scene_id integer
);


--
-- Name: crg_ordered_scene_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_ordered_scene_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_ordered_scene_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_ordered_scene_elements_id_seq OWNED BY public.crg_ordered_scene_elements.id;


--
-- Name: crg_passage_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_passage_responses (
    id integer NOT NULL,
    passage_id integer NOT NULL,
    user_id integer NOT NULL,
    progress integer DEFAULT 0 NOT NULL,
    completed_at timestamp without time zone,
    current_scene_id integer,
    lesson_participation_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_passage_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_passage_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_passage_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_passage_responses_id_seq OWNED BY public.crg_passage_responses.id;


--
-- Name: crg_passages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_passages (
    id integer NOT NULL,
    title character varying NOT NULL,
    author character varying,
    source character varying,
    image character varying,
    difficulty_level_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    excerpt text NOT NULL,
    full_text text NOT NULL,
    passage_type integer DEFAULT 0,
    narrator_id integer,
    show_from boolean DEFAULT true NOT NULL,
    credit character varying,
    school_levels character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    published_at timestamp without time zone
);


--
-- Name: crg_passages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_passages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_passages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_passages_id_seq OWNED BY public.crg_passages.id;


--
-- Name: crg_phrases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_phrases (
    id integer NOT NULL,
    start_word_number integer NOT NULL,
    end_word_number integer NOT NULL,
    phrase_type character varying NOT NULL,
    drag_and_drop_phrase_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_phrases_id_seq OWNED BY public.crg_phrases.id;


--
-- Name: crg_poll_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_poll_answers (
    id integer NOT NULL,
    poll_id integer,
    answer character varying,
    percentage integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    answer_synonyms character varying
);


--
-- Name: crg_poll_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_poll_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_poll_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_poll_answers_id_seq OWNED BY public.crg_poll_answers.id;


--
-- Name: crg_poll_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_poll_responses (
    id integer NOT NULL,
    poll_id integer NOT NULL,
    passage_response_id integer NOT NULL,
    text text NOT NULL,
    correct boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_poll_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_poll_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_poll_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_poll_responses_id_seq OWNED BY public.crg_poll_responses.id;


--
-- Name: crg_polls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_polls (
    id integer NOT NULL,
    number_of_entries integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    question_text character varying,
    interaction_info text
);


--
-- Name: crg_polls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_polls_id_seq OWNED BY public.crg_polls.id;


--
-- Name: crg_previous_response_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_previous_response_options (
    id integer NOT NULL,
    reference_scene_element_id integer NOT NULL,
    reference_scene_element_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_previous_response_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_previous_response_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_previous_response_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_previous_response_options_id_seq OWNED BY public.crg_previous_response_options.id;


--
-- Name: crg_quotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_quotes (
    id integer NOT NULL,
    text character varying NOT NULL,
    "user" character varying NOT NULL,
    show_quote_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


--
-- Name: crg_quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_quotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_quotes_id_seq OWNED BY public.crg_quotes.id;


--
-- Name: crg_scenes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_scenes (
    id integer NOT NULL,
    title character varying NOT NULL,
    skill_exercise_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    zinc_primary_skill_id integer,
    passage_id integer NOT NULL,
    zinc_sub_skill_id integer,
    "position" integer DEFAULT 0 NOT NULL
);


--
-- Name: crg_scenes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_scenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_scenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_scenes_id_seq OWNED BY public.crg_scenes.id;


--
-- Name: crg_show_quotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_show_quotes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_show_quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_show_quotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_show_quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_show_quotes_id_seq OWNED BY public.crg_show_quotes.id;


--
-- Name: crg_text_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_text_entries (
    id integer NOT NULL,
    minimum_words_required integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    button_text character varying,
    interaction_info text
);


--
-- Name: crg_text_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_text_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_text_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_text_entries_id_seq OWNED BY public.crg_text_entries.id;


--
-- Name: crg_text_entry_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_text_entry_responses (
    id integer NOT NULL,
    text_entry_id integer NOT NULL,
    passage_response_id integer NOT NULL,
    text text,
    button_clicked boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_text_entry_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_text_entry_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_text_entry_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_text_entry_responses_id_seq OWNED BY public.crg_text_entry_responses.id;


--
-- Name: crg_text_prompts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_text_prompts (
    id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    interaction_info text
);


--
-- Name: crg_text_prompts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_text_prompts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_text_prompts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_text_prompts_id_seq OWNED BY public.crg_text_prompts.id;


--
-- Name: crg_video_prompts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_video_prompts (
    id integer NOT NULL,
    video_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_format integer DEFAULT 0 NOT NULL,
    wait_time integer DEFAULT 0 NOT NULL,
    auto_next boolean DEFAULT true,
    button_label character varying DEFAULT 'Proceed'::character varying NOT NULL,
    label character varying,
    skippable boolean DEFAULT false NOT NULL
);


--
-- Name: crg_video_prompts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_video_prompts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_video_prompts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_video_prompts_id_seq OWNED BY public.crg_video_prompts.id;


--
-- Name: crg_videos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_videos (
    id integer NOT NULL,
    title character varying NOT NULL,
    description text,
    video character varying NOT NULL,
    poster character varying,
    transcript text,
    user_id integer,
    uploaded_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crg_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_videos_id_seq OWNED BY public.crg_videos.id;


--
-- Name: crg_zinc_primary_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_zinc_primary_skills (
    id integer NOT NULL,
    name character varying(255),
    "position" integer,
    skill_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    video character varying,
    image character varying,
    color character varying NOT NULL
);


--
-- Name: crg_zinc_primary_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_zinc_primary_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_zinc_primary_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_zinc_primary_skills_id_seq OWNED BY public.crg_zinc_primary_skills.id;


--
-- Name: crg_zinc_sub_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crg_zinc_sub_skills (
    id integer NOT NULL,
    name character varying,
    "position" integer NOT NULL,
    zinc_primary_skill_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: crg_zinc_sub_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crg_zinc_sub_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crg_zinc_sub_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crg_zinc_sub_skills_id_seq OWNED BY public.crg_zinc_sub_skills.id;


--
-- Name: district_adminships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.district_adminships (
    id integer NOT NULL,
    user_id integer,
    district_id integer
);


--
-- Name: district_adminships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.district_adminships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: district_adminships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.district_adminships_id_seq OWNED BY public.district_adminships.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    name character varying NOT NULL,
    source_id character varying,
    hide_common_core boolean DEFAULT false,
    parent_id integer,
    source_provider character varying DEFAULT 'direct'::character varying,
    access_token character varying,
    type character varying DEFAULT 'District'::character varying
);


--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- Name: feature_flags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feature_flags (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    actor_id integer NOT NULL,
    actor_type character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: feature_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feature_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feature_flags_id_seq OWNED BY public.feature_flags.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.features (
    id integer NOT NULL,
    name character varying NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    force_default boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- Name: google_classroom_registrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.google_classroom_registrations (
    id integer NOT NULL,
    source_id character varying NOT NULL,
    klass_id integer NOT NULL,
    user_id integer NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: google_classroom_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.google_classroom_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: google_classroom_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.google_classroom_registrations_id_seq OWNED BY public.google_classroom_registrations.id;


--
-- Name: klasses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.klasses (
    id integer NOT NULL,
    name character varying(255),
    school_id integer,
    teacher_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    student_code character varying(255),
    source_id character varying,
    archived boolean DEFAULT false,
    start_date date,
    end_date date,
    district_id integer,
    source_provider character varying DEFAULT 'direct'::character varying,
    type character varying DEFAULT 'Klass'::character varying
);


--
-- Name: klasses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.klasses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: klasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.klasses_id_seq OWNED BY public.klasses.id;


--
-- Name: login_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_keys (
    id integer NOT NULL,
    token character varying(60) NOT NULL,
    user_id integer,
    valid_upto integer NOT NULL,
    usage integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: login_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.login_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: login_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.login_keys_id_seq OWNED BY public.login_keys.id;


--
-- Name: master_zinc_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master_zinc_skills (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: master_zinc_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.master_zinc_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: master_zinc_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.master_zinc_skills_id_seq OWNED BY public.master_zinc_skills.id;


--
-- Name: membership_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.membership_transactions (
    id integer NOT NULL,
    transaction_type integer,
    number_of_licenses integer,
    amount numeric,
    membership_expires_on date,
    subscriber_id integer,
    subscriber_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    premium_source_id integer,
    premium_source_type character varying(255)
);


--
-- Name: membership_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.membership_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: membership_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.membership_transactions_id_seq OWNED BY public.membership_transactions.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id integer,
    application_id integer,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_applications (
    id integer NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    owner_id integer,
    owner_type character varying
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: oauth_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_credentials (
    id integer NOT NULL,
    user_id integer,
    provider character varying,
    token character varying,
    refresh_token character varying,
    expires boolean,
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying
);


--
-- Name: oauth_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_credentials_id_seq OWNED BY public.oauth_credentials.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizations (
    id integer NOT NULL,
    name character varying,
    membership_level integer,
    licenses_purchased integer,
    membership_expires_on date,
    premium_source_id integer,
    premium_source_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- Name: reader_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_answers (
    id integer NOT NULL,
    question_id integer,
    content text,
    explanation text,
    "position" integer,
    correct boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    fixed_to_bottom boolean,
    legacy_id integer
);


--
-- Name: reader_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_answers_id_seq OWNED BY public.reader_answers.id;


--
-- Name: reader_channels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_channels (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer,
    color character varying(255)
);


--
-- Name: reader_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_channels_id_seq OWNED BY public.reader_channels.id;


--
-- Name: reader_channels_quizzes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_channels_quizzes (
    id integer NOT NULL,
    quiz_id integer,
    channel_id integer
);


--
-- Name: reader_channels_quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_channels_quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_channels_quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_channels_quizzes_id_seq OWNED BY public.reader_channels_quizzes.id;


--
-- Name: reader_comparison_quiz_simple_quizzes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_comparison_quiz_simple_quizzes (
    id integer NOT NULL,
    simple_quiz_id integer NOT NULL,
    comparison_quiz_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: reader_comparison_quiz_simple_quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_comparison_quiz_simple_quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_comparison_quiz_simple_quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_comparison_quiz_simple_quizzes_id_seq OWNED BY public.reader_comparison_quiz_simple_quizzes.id;


--
-- Name: reader_difficulty_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_difficulty_levels (
    id integer NOT NULL,
    name character varying(255),
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    grade_level character varying,
    lexile_level character varying,
    summary character varying,
    explanation text,
    color character varying,
    quiz_points_multiplier numeric DEFAULT 1.0
);


--
-- Name: reader_difficulty_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_difficulty_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_difficulty_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_difficulty_levels_id_seq OWNED BY public.reader_difficulty_levels.id;


--
-- Name: reader_question_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_question_attempts (
    id integer NOT NULL,
    prediction text,
    user_id integer,
    question_id integer,
    quiz_attempt_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    answer_id integer,
    points_scored numeric DEFAULT 0.0,
    max_points_when_answered numeric DEFAULT 0.0
);


--
-- Name: reader_question_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_question_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_question_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_question_attempts_id_seq OWNED BY public.reader_question_attempts.id;


--
-- Name: reader_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_questions (
    id integer NOT NULL,
    content text,
    quiz_id integer,
    number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    zinc_skill_id integer,
    legacy_id integer,
    difficulty_level character varying(255) DEFAULT 'none'::character varying
);


--
-- Name: reader_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_questions_id_seq OWNED BY public.reader_questions.id;


--
-- Name: reader_questions_zinc_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_questions_zinc_skills (
    id integer NOT NULL,
    question_id integer NOT NULL,
    zinc_skill_id integer NOT NULL
);


--
-- Name: reader_questions_zinc_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_questions_zinc_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_questions_zinc_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_questions_zinc_skills_id_seq OWNED BY public.reader_questions_zinc_skills.id;


--
-- Name: reader_quiz_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_quiz_attempts (
    id integer NOT NULL,
    user_id integer,
    quiz_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    points_scored numeric DEFAULT 0.0,
    completed_at timestamp without time zone,
    assignment_id integer,
    mandatory_set_id integer,
    progress integer DEFAULT 0
);


--
-- Name: reader_quiz_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_quiz_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_quiz_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_quiz_attempts_id_seq OWNED BY public.reader_quiz_attempts.id;


--
-- Name: reader_quiz_meta_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_quiz_meta_infos (
    id integer NOT NULL,
    name character varying(255),
    points_per_question integer,
    word_count_bonus_rule_set_id integer,
    bonus_mode_multiplier integer DEFAULT 1,
    bonus_mode_duration_from_last_success_in_hours numeric DEFAULT 0.0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: reader_quiz_meta_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_quiz_meta_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_quiz_meta_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_quiz_meta_infos_id_seq OWNED BY public.reader_quiz_meta_infos.id;


--
-- Name: reader_quizzes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_quizzes (
    id integer NOT NULL,
    title character varying(255),
    article_author character varying(255),
    image character varying(255),
    article_source character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    summary_text text,
    full_text text,
    writing_prompt text,
    article_link character varying(255),
    difficulty_level_id integer,
    primary_channel_id integer,
    contains_video boolean,
    chose_this_for character varying(255),
    legacy_id integer,
    word_count integer,
    published boolean DEFAULT false NOT NULL,
    vocab_word_count integer,
    quiz_meta_info_id integer,
    published_at timestamp without time zone,
    questions_count integer DEFAULT 0,
    base_points integer DEFAULT 0,
    completed_student_attempts_count integer DEFAULT 0,
    internal boolean DEFAULT false,
    type character varying DEFAULT 'Reader::SimpleQuiz'::character varying,
    teacher_description text,
    student_description text,
    custom_instructions text
);


--
-- Name: reader_quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_quizzes_id_seq OWNED BY public.reader_quizzes.id;


--
-- Name: reader_quizzes_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_quizzes_tags (
    id integer NOT NULL,
    quiz_id integer,
    tag_id integer
);


--
-- Name: reader_quizzes_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_quizzes_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_quizzes_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_quizzes_tags_id_seq OWNED BY public.reader_quizzes_tags.id;


--
-- Name: reader_quizzes_zinc_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_quizzes_zinc_skills (
    id integer NOT NULL,
    quiz_id integer,
    zinc_skill_id integer
);


--
-- Name: reader_quizzes_zinc_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_quizzes_zinc_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_quizzes_zinc_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_quizzes_zinc_skills_id_seq OWNED BY public.reader_quizzes_zinc_skills.id;


--
-- Name: reader_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_tags (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: reader_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_tags_id_seq OWNED BY public.reader_tags.id;


--
-- Name: reader_word_count_bonus_rule_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_word_count_bonus_rule_sets (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: reader_word_count_bonus_rule_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_word_count_bonus_rule_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_word_count_bonus_rule_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_word_count_bonus_rule_sets_id_seq OWNED BY public.reader_word_count_bonus_rule_sets.id;


--
-- Name: reader_word_count_bonus_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_word_count_bonus_rules (
    id integer NOT NULL,
    range_start_value integer DEFAULT 0,
    range_end_value integer DEFAULT 1000000,
    bonus_multiplier numeric DEFAULT 1.0,
    word_count_bonus_rule_set_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: reader_word_count_bonus_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_word_count_bonus_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_word_count_bonus_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_word_count_bonus_rules_id_seq OWNED BY public.reader_word_count_bonus_rules.id;


--
-- Name: reader_zinc_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reader_zinc_skills (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer,
    skill_id integer
);


--
-- Name: reader_zinc_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reader_zinc_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reader_zinc_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reader_zinc_skills_id_seq OWNED BY public.reader_zinc_skills.id;


--
-- Name: reading_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reading_levels (
    id integer NOT NULL,
    level smallint DEFAULT 0,
    source_id integer,
    source_type character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    notified boolean DEFAULT false NOT NULL
);


--
-- Name: reading_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reading_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reading_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reading_levels_id_seq OWNED BY public.reading_levels.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: schools; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schools (
    id integer NOT NULL,
    name character varying(255),
    teacher_code character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    creator_id integer,
    membership_level integer DEFAULT 0,
    licenses_purchased integer DEFAULT 0,
    membership_expires_on date,
    premium_source_id integer,
    premium_source_type character varying(255),
    source_id character varying,
    district_id integer,
    organization_id integer,
    yearly_archive_date date,
    source_provider character varying DEFAULT 'direct'::character varying,
    type character varying DEFAULT 'School'::character varying
);


--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.schools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.schools_id_seq OWNED BY public.schools.id;


--
-- Name: schools_standard_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schools_standard_types (
    id integer NOT NULL,
    school_id integer,
    standard_type_id integer
);


--
-- Name: schools_standard_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.schools_standard_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schools_standard_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.schools_standard_types_id_seq OWNED BY public.schools_standard_types.id;


--
-- Name: schools_whitelisted_teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schools_whitelisted_teachers (
    school_id integer NOT NULL,
    whitelisted_teacher_id integer NOT NULL
);


--
-- Name: seed_migration_data_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seed_migration_data_migrations (
    id integer NOT NULL,
    version character varying(255),
    runtime integer,
    migrated_on timestamp without time zone
);


--
-- Name: seed_migration_data_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seed_migration_data_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seed_migration_data_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seed_migration_data_migrations_id_seq OWNED BY public.seed_migration_data_migrations.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    var character varying NOT NULL,
    value text,
    thing_id integer,
    thing_type character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: sponsorships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sponsorships (
    id integer NOT NULL,
    subscription_id integer NOT NULL,
    student_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status smallint DEFAULT 0 NOT NULL
);


--
-- Name: sponsorships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sponsorships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sponsorships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sponsorships_id_seq OWNED BY public.sponsorships.id;


--
-- Name: standard_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.standard_types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: standard_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.standard_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: standard_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.standard_types_id_seq OWNED BY public.standard_types.id;


--
-- Name: standards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.standards (
    id integer NOT NULL,
    name character varying,
    code character varying,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    standard_type_id integer
);


--
-- Name: standards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.standards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: standards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.standards_id_seq OWNED BY public.standards.id;


--
-- Name: stats_class_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_class_aggregates (
    id integer NOT NULL,
    klass_id integer,
    activity_date date,
    total_points numeric DEFAULT 0.0,
    reader_points numeric DEFAULT 0.0,
    vocab_points numeric DEFAULT 0.0,
    words_learned integer,
    quizzes_completed integer,
    total_questions integer,
    questions_correct integer,
    total_difficulty integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_class_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_class_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_class_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_class_aggregates_id_seq OWNED BY public.stats_class_aggregates.id;


--
-- Name: stats_class_cc_skill_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_class_cc_skill_aggregates (
    id integer NOT NULL,
    cc_skill_id integer,
    klass_id integer,
    activity_date date,
    total_questions integer,
    questions_correct integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_class_cc_skill_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_class_cc_skill_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_class_cc_skill_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_class_cc_skill_aggregates_id_seq OWNED BY public.stats_class_cc_skill_aggregates.id;


--
-- Name: stats_class_zinc_skill_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_class_zinc_skill_aggregates (
    id integer NOT NULL,
    zinc_skill_id integer,
    klass_id integer,
    activity_date date,
    total_questions integer,
    questions_correct integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_class_zinc_skill_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_class_zinc_skill_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_class_zinc_skill_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_class_zinc_skill_aggregates_id_seq OWNED BY public.stats_class_zinc_skill_aggregates.id;


--
-- Name: stats_completed_quiz_attempt_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_completed_quiz_attempt_aggregates (
    id integer NOT NULL,
    quiz_attempt_id integer,
    user_id integer,
    activity_date date,
    difficulty_level integer,
    questions_correct integer,
    total_questions integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    points_scored numeric DEFAULT 0.0,
    quiz_type character varying
);


--
-- Name: stats_completed_quiz_attempt_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_completed_quiz_attempt_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_completed_quiz_attempt_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_completed_quiz_attempt_aggregates_id_seq OWNED BY public.stats_completed_quiz_attempt_aggregates.id;


--
-- Name: stats_deck_attempt_facts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_deck_attempt_facts (
    id integer NOT NULL,
    activity_date date,
    user_id integer,
    deck_attempt_id integer,
    points numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_deck_attempt_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_deck_attempt_facts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_deck_attempt_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_deck_attempt_facts_id_seq OWNED BY public.stats_deck_attempt_facts.id;


--
-- Name: stats_learned_deck_participation_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_learned_deck_participation_aggregates (
    id integer NOT NULL,
    activity_date date,
    user_id integer,
    deck_participation_id integer,
    number_of_words_learned integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_learned_deck_participation_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_learned_deck_participation_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_learned_deck_participation_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_learned_deck_participation_aggregates_id_seq OWNED BY public.stats_learned_deck_participation_aggregates.id;


--
-- Name: stats_user_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_user_aggregates (
    id integer NOT NULL,
    activity_date date,
    user_id integer,
    total_points numeric DEFAULT 0.0,
    quizzes_completed integer,
    total_questions integer,
    questions_correct integer,
    reader_points numeric DEFAULT 0.0,
    total_difficulty integer,
    vocab_points numeric DEFAULT 0.0,
    words_learned integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_user_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_user_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_user_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_user_aggregates_id_seq OWNED BY public.stats_user_aggregates.id;


--
-- Name: stats_user_cc_skill_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_user_cc_skill_aggregates (
    id integer NOT NULL,
    cc_skill_id integer,
    user_id integer,
    activity_date date,
    total_questions integer,
    questions_correct integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_user_cc_skill_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_user_cc_skill_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_user_cc_skill_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_user_cc_skill_aggregates_id_seq OWNED BY public.stats_user_cc_skill_aggregates.id;


--
-- Name: stats_user_zinc_skill_aggregates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_user_zinc_skill_aggregates (
    id integer NOT NULL,
    zinc_skill_id integer,
    user_id integer,
    activity_date date,
    total_questions integer,
    questions_correct integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stats_user_zinc_skill_aggregates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_user_zinc_skill_aggregates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_user_zinc_skill_aggregates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_user_zinc_skill_aggregates_id_seq OWNED BY public.stats_user_zinc_skill_aggregates.id;


--
-- Name: stats_zinc_skill_facts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_zinc_skill_facts (
    id integer NOT NULL,
    zinc_skill_id integer NOT NULL,
    quiz_attempt_id integer NOT NULL,
    user_id integer NOT NULL,
    questions integer[] DEFAULT '{}'::integer[],
    questions_correct integer[] DEFAULT '{}'::integer[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    quiz_type character varying DEFAULT 'Reader::SimpleQuiz'::character varying
);


--
-- Name: stats_zinc_skill_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_zinc_skill_facts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_zinc_skill_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_zinc_skill_facts_id_seq OWNED BY public.stats_zinc_skill_facts.id;


--
-- Name: student_klass_invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student_klass_invitations (
    id integer NOT NULL,
    email public.citext,
    klass_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    last_sent_on timestamp without time zone,
    code character varying
);


--
-- Name: student_klass_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.student_klass_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_klass_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.student_klass_invitations_id_seq OWNED BY public.student_klass_invitations.id;


--
-- Name: student_klass_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student_klass_memberships (
    id integer NOT NULL,
    user_id integer,
    klass_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: student_klass_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.student_klass_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_klass_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.student_klass_memberships_id_seq OWNED BY public.student_klass_memberships.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    customer_type character varying NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    free_trial boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stopped_at timestamp without time zone,
    number_of_licenses integer DEFAULT 0 NOT NULL,
    amount numeric DEFAULT 0 NOT NULL,
    unlimited_licenses boolean DEFAULT false
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: teacher_klass_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teacher_klass_memberships (
    id integer NOT NULL,
    user_id integer,
    klass_id integer,
    is_primary boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: teacher_klass_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teacher_klass_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teacher_klass_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teacher_klass_memberships_id_seq OWNED BY public.teacher_klass_memberships.id;


--
-- Name: teachership_invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachership_invitations (
    id integer NOT NULL,
    email public.citext,
    school_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    last_sent_on timestamp without time zone,
    code character varying
);


--
-- Name: teachership_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachership_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teachership_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachership_invitations_id_seq OWNED BY public.teachership_invitations.id;


--
-- Name: teacherships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teacherships (
    id integer NOT NULL,
    school_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    membership_level integer DEFAULT 0,
    licenses_purchased integer DEFAULT 0,
    membership_expires_on date,
    premium_source_id integer,
    premium_source_type character varying(255)
);


--
-- Name: teacherships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teacherships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teacherships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teacherships_id_seq OWNED BY public.teacherships.id;


--
-- Name: user_unsubscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_unsubscriptions (
    id integer NOT NULL,
    user_id integer,
    reason character varying NOT NULL,
    created_at timestamp without time zone
);


--
-- Name: user_unsubscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_unsubscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_unsubscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_unsubscriptions_id_seq OWNED BY public.user_unsubscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email public.citext,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    role integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    first_name character varying(255),
    last_name character varying(255),
    nick_name character varying(255),
    visited_vocab boolean DEFAULT false,
    points integer DEFAULT 0,
    receive_notifications boolean DEFAULT true,
    image character varying(255),
    can_cheat boolean DEFAULT false,
    reader_points integer DEFAULT 0,
    vocab_points integer DEFAULT 0,
    last_completed_quiz_at timestamp without time zone,
    number_of_words_learned integer DEFAULT 0,
    number_of_quizzes_completed integer DEFAULT 0,
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255),
    last_active_on timestamp without time zone,
    show_dashboard_help boolean DEFAULT true,
    membership_level integer DEFAULT 0,
    licenses_purchased integer DEFAULT 0,
    membership_expires_on date,
    premium_source_id integer,
    premium_source_type character varying(255),
    referral_source character varying(255),
    source_id character varying,
    import_status character varying,
    organization_id integer,
    source_domain character varying,
    source_app_context_path character varying,
    source_email_address character varying,
    access_request_details public.hstore,
    assignment_points numeric DEFAULT 0.0,
    provider character varying,
    uid character varying,
    comparison_quiz_notified boolean DEFAULT false,
    unsubscribe_token character varying(60),
    ytd_points integer DEFAULT 0 NOT NULL,
    requires_reset_password boolean DEFAULT false,
    crg_notified boolean DEFAULT false,
    policy_acceptance_date date,
    discarded_at timestamp without time zone,
    source_provider character varying DEFAULT 'direct'::character varying,
    grade smallint,
    district_id integer,
    type character varying DEFAULT 'User'::character varying,
    username public.citext
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vocab_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer,
    only_for_site_admin boolean DEFAULT false
);


--
-- Name: vocab_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_categories_id_seq OWNED BY public.vocab_categories.id;


--
-- Name: vocab_categories_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_categories_sets (
    id integer NOT NULL,
    set_id integer,
    category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_categories_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_categories_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_categories_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_categories_sets_id_seq OWNED BY public.vocab_categories_sets.id;


--
-- Name: vocab_deck_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_deck_attempts (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    points numeric,
    game_id integer
);


--
-- Name: vocab_deck_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_deck_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_deck_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_deck_attempts_id_seq OWNED BY public.vocab_deck_attempts.id;


--
-- Name: vocab_deck_participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_deck_participations (
    id integer NOT NULL,
    set_participation_id integer,
    deck_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status integer,
    enable_at timestamp without time zone,
    end_bonus_at timestamp without time zone,
    last_bonus_started_at timestamp without time zone,
    progress integer,
    learned_at timestamp without time zone,
    word_bank_intro_complete boolean,
    last_played_on timestamp without time zone,
    bonus_multiplier integer,
    word_count integer
);


--
-- Name: vocab_deck_participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_deck_participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_deck_participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_deck_participations_id_seq OWNED BY public.vocab_deck_participations.id;


--
-- Name: vocab_decks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_decks (
    id integer NOT NULL,
    number integer,
    set_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_decks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_decks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_decks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_decks_id_seq OWNED BY public.vocab_decks.id;


--
-- Name: vocab_decks_words; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_decks_words (
    id integer NOT NULL,
    deck_id integer,
    word_id integer
);


--
-- Name: vocab_decks_words_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_decks_words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_decks_words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_decks_words_id_seq OWNED BY public.vocab_decks_words.id;


--
-- Name: vocab_derived_words; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_derived_words (
    id integer NOT NULL,
    word character varying(255),
    base_word_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_derived_words_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_derived_words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_derived_words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_derived_words_id_seq OWNED BY public.vocab_derived_words.id;


--
-- Name: vocab_exposure_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_exposure_plans (
    id integer NOT NULL,
    number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    master_plan_id integer,
    restart_on_error boolean DEFAULT true,
    require_correct_answer_streak boolean DEFAULT false,
    replay_wrong_answers boolean DEFAULT false
);


--
-- Name: vocab_exposure_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_exposure_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_exposure_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_exposure_plans_id_seq OWNED BY public.vocab_exposure_plans.id;


--
-- Name: vocab_exposure_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_exposure_stages (
    id integer NOT NULL,
    "position" integer,
    disable_next_stage_for integer,
    bonus_multiplier integer,
    game_plan_id integer,
    exposure_plan_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_exposure_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_exposure_stages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_exposure_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_exposure_stages_id_seq OWNED BY public.vocab_exposure_stages.id;


--
-- Name: vocab_exposures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_exposures (
    id integer NOT NULL,
    deck_participation_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    exposure_plan_id integer,
    status integer
);


--
-- Name: vocab_exposures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_exposures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_exposures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_exposures_id_seq OWNED BY public.vocab_exposures.id;


--
-- Name: vocab_game_modes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_game_modes (
    id integer NOT NULL,
    name character varying(255),
    display_name character varying(255),
    points_per_word integer,
    time_limit_in_seconds integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_game_modes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_game_modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_game_modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_game_modes_id_seq OWNED BY public.vocab_game_modes.id;


--
-- Name: vocab_game_modes_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_game_modes_plans (
    id integer NOT NULL,
    game_mode_id integer,
    game_plan_id integer
);


--
-- Name: vocab_game_modes_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_game_modes_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_game_modes_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_game_modes_plans_id_seq OWNED BY public.vocab_game_modes_plans.id;


--
-- Name: vocab_game_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_game_plans (
    id integer NOT NULL,
    name character varying(255),
    display_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_game_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_game_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_game_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_game_plans_id_seq OWNED BY public.vocab_game_plans.id;


--
-- Name: vocab_games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_games (
    id integer NOT NULL,
    exposure_id integer,
    exposure_stage_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    locked boolean,
    bonus_expired boolean,
    completed boolean DEFAULT false NOT NULL
);


--
-- Name: vocab_games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_games_id_seq OWNED BY public.vocab_games.id;


--
-- Name: vocab_grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_grades (
    id integer NOT NULL,
    name character varying(255),
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    level integer
);


--
-- Name: vocab_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_grades_id_seq OWNED BY public.vocab_grades.id;


--
-- Name: vocab_grades_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_grades_sets (
    id integer NOT NULL,
    set_id integer,
    grade_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_grades_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_grades_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_grades_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_grades_sets_id_seq OWNED BY public.vocab_grades_sets.id;


--
-- Name: vocab_master_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_master_plans (
    id integer NOT NULL,
    name character varying(255),
    use_points boolean,
    visible_in_dashboard boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_master_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_master_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_master_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_master_plans_id_seq OWNED BY public.vocab_master_plans.id;


--
-- Name: vocab_part_of_speech_words; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_part_of_speech_words (
    id integer NOT NULL,
    word_id integer,
    part_of_speech_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_part_of_speech_words_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_part_of_speech_words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_part_of_speech_words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_part_of_speech_words_id_seq OWNED BY public.vocab_part_of_speech_words.id;


--
-- Name: vocab_parts_of_speech; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_parts_of_speech (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_parts_of_speech_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_parts_of_speech_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_parts_of_speech_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_parts_of_speech_id_seq OWNED BY public.vocab_parts_of_speech.id;


--
-- Name: vocab_parts_of_speech_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_parts_of_speech_translations (
    id integer NOT NULL,
    vocab_parts_of_speech_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


--
-- Name: vocab_parts_of_speech_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_parts_of_speech_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_parts_of_speech_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_parts_of_speech_translations_id_seq OWNED BY public.vocab_parts_of_speech_translations.id;


--
-- Name: vocab_set_participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_set_participations (
    id integer NOT NULL,
    set_id integer,
    user_id integer,
    assignment_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    orientation_complete boolean,
    progress integer DEFAULT 0,
    number_of_exposures_completed integer DEFAULT 0,
    learned_at timestamp without time zone,
    completed_at timestamp without time zone,
    points numeric DEFAULT 0.0,
    vocab_game_mode integer DEFAULT 0 NOT NULL,
    timer_enabled boolean DEFAULT true,
    locale character varying(2) DEFAULT 'en'::character varying NOT NULL
);


--
-- Name: vocab_set_participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_set_participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_set_participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_set_participations_id_seq OWNED BY public.vocab_set_participations.id;


--
-- Name: vocab_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_sets (
    id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    image character varying(255),
    type_option integer DEFAULT 0,
    quiz_id integer,
    teachers_description text,
    locale character varying(2) DEFAULT 'en'::character varying NOT NULL
);


--
-- Name: vocab_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_sets_id_seq OWNED BY public.vocab_sets.id;


--
-- Name: vocab_sets_words; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_sets_words (
    id integer NOT NULL,
    set_id integer,
    word_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_sets_words_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_sets_words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_sets_words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_sets_words_id_seq OWNED BY public.vocab_sets_words.id;


--
-- Name: vocab_synonyms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_synonyms (
    id integer NOT NULL,
    name character varying(255),
    word_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    locale character varying(2) DEFAULT 'en'::character varying NOT NULL
);


--
-- Name: vocab_synonyms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_synonyms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_synonyms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_synonyms_id_seq OWNED BY public.vocab_synonyms.id;


--
-- Name: vocab_word_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_word_attempts (
    id integer NOT NULL,
    word_id integer,
    deck_attempt_id integer,
    correct boolean,
    time_taken integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    word_bank_used boolean,
    points numeric,
    game_mode_id integer
);


--
-- Name: vocab_word_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_word_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_word_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_word_attempts_id_seq OWNED BY public.vocab_word_attempts.id;


--
-- Name: vocab_word_synonym_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_word_synonym_options (
    id integer NOT NULL,
    word_id integer,
    correct boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    locale character varying(2) DEFAULT 'en'::character varying NOT NULL
);


--
-- Name: vocab_word_synonym_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_word_synonym_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_word_synonym_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_word_synonym_options_id_seq OWNED BY public.vocab_word_synonym_options.id;


--
-- Name: vocab_word_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_word_translations (
    id integer NOT NULL,
    vocab_word_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    meaning character varying,
    example_sentence text,
    sentence_form character varying
);


--
-- Name: vocab_word_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_word_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_word_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_word_translations_id_seq OWNED BY public.vocab_word_translations.id;


--
-- Name: vocab_words; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_words (
    id integer NOT NULL,
    word character varying(255),
    hints text,
    image character varying(255),
    part_of_speech character varying(255),
    pronunciation character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stem character varying(255),
    priority integer,
    pronunciation_audio character varying(255),
    watch_word boolean,
    difficulty_level integer,
    main_part_of_speech_id integer,
    valid_forms character varying,
    word_element_type character varying DEFAULT 'none'::character varying
);


--
-- Name: vocab_words_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_words_id_seq OWNED BY public.vocab_words.id;


--
-- Name: vocab_wrong_image_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vocab_wrong_image_options (
    id integer NOT NULL,
    word_id integer,
    option_word_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vocab_wrong_image_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vocab_wrong_image_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocab_wrong_image_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vocab_wrong_image_options_id_seq OWNED BY public.vocab_wrong_image_options.id;


--
-- Name: whitelisted_teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.whitelisted_teachers (
    id integer NOT NULL,
    email character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: whitelisted_teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.whitelisted_teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: whitelisted_teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.whitelisted_teachers_id_seq OWNED BY public.whitelisted_teachers.id;


--
-- Name: wupee_notification_type_configurations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wupee_notification_type_configurations (
    id integer NOT NULL,
    notification_type_id integer,
    receiver_id integer,
    receiver_type character varying,
    value integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: wupee_notification_type_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wupee_notification_type_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wupee_notification_type_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wupee_notification_type_configurations_id_seq OWNED BY public.wupee_notification_type_configurations.id;


--
-- Name: wupee_notification_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wupee_notification_types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: wupee_notification_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wupee_notification_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wupee_notification_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wupee_notification_types_id_seq OWNED BY public.wupee_notification_types.id;


--
-- Name: wupee_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wupee_notifications (
    id integer NOT NULL,
    receiver_id integer,
    receiver_type character varying,
    attached_object_id integer,
    attached_object_type character varying,
    notification_type_id integer,
    is_read boolean DEFAULT false,
    is_sent boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_hidden boolean DEFAULT false
);


--
-- Name: wupee_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wupee_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wupee_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wupee_notifications_id_seq OWNED BY public.wupee_notifications.id;


--
-- Name: zinc_skill_standards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zinc_skill_standards (
    id integer NOT NULL,
    zinc_skill_id integer,
    standard_id integer
);


--
-- Name: zinc_skill_standards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zinc_skill_standards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zinc_skill_standards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zinc_skill_standards_id_seq OWNED BY public.zinc_skill_standards.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: adminships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.adminships ALTER COLUMN id SET DEFAULT nextval('public.adminships_id_seq'::regclass);


--
-- Name: announcement_interactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcement_interactions ALTER COLUMN id SET DEFAULT nextval('public.announcement_interactions_id_seq'::regclass);


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: api_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.api_users ALTER COLUMN id SET DEFAULT nextval('public.api_users_id_seq'::regclass);


--
-- Name: assessment_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_answers ALTER COLUMN id SET DEFAULT nextval('public.assessment_answers_id_seq'::regclass);


--
-- Name: assessment_choices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_choices ALTER COLUMN id SET DEFAULT nextval('public.assessment_choices_id_seq'::regclass);


--
-- Name: assessment_diagnostic_participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_diagnostic_participations ALTER COLUMN id SET DEFAULT nextval('public.assessment_diagnostic_participations_id_seq'::regclass);


--
-- Name: assessment_diagnostic_participations_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_diagnostic_participations_assignments ALTER COLUMN id SET DEFAULT nextval('public.assessment_diagnostic_participations_assignments_id_seq'::regclass);


--
-- Name: assessment_diagnostics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_diagnostics ALTER COLUMN id SET DEFAULT nextval('public.assessment_diagnostics_id_seq'::regclass);


--
-- Name: assessment_ordered_passages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_ordered_passages ALTER COLUMN id SET DEFAULT nextval('public.assessment_ordered_passages_id_seq'::regclass);


--
-- Name: assessment_passages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_passages ALTER COLUMN id SET DEFAULT nextval('public.assessment_passages_id_seq'::regclass);


--
-- Name: assessment_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_questions ALTER COLUMN id SET DEFAULT nextval('public.assessment_questions_id_seq'::regclass);


--
-- Name: assessment_section_transitions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_section_transitions ALTER COLUMN id SET DEFAULT nextval('public.assessment_section_transitions_id_seq'::regclass);


--
-- Name: assessment_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_sections ALTER COLUMN id SET DEFAULT nextval('public.assessment_sections_id_seq'::regclass);


--
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- Name: assignments_reader_quiz_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments_reader_quiz_attempts ALTER COLUMN id SET DEFAULT nextval('public.assignments_reader_quiz_attempts_id_seq'::regclass);


--
-- Name: assignments_vocab_set_participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments_vocab_set_participations ALTER COLUMN id SET DEFAULT nextval('public.assignments_vocab_set_participations_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: category_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_types ALTER COLUMN id SET DEFAULT nextval('public.category_types_id_seq'::regclass);


--
-- Name: clever_district_imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_district_imports ALTER COLUMN id SET DEFAULT nextval('public.clever_district_imports_id_seq'::regclass);


--
-- Name: clever_district_syncs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_district_syncs ALTER COLUMN id SET DEFAULT nextval('public.clever_district_syncs_id_seq'::regclass);


--
-- Name: clever_entities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_entities ALTER COLUMN id SET DEFAULT nextval('public.clever_entities_id_seq'::regclass);


--
-- Name: clever_imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_imports ALTER COLUMN id SET DEFAULT nextval('public.clever_imports_id_seq'::regclass);


--
-- Name: clever_schools_imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_schools_imports ALTER COLUMN id SET DEFAULT nextval('public.clever_schools_imports_id_seq'::regclass);


--
-- Name: clever_student_imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_student_imports ALTER COLUMN id SET DEFAULT nextval('public.clever_student_imports_id_seq'::regclass);


--
-- Name: clever_teacher_imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_teacher_imports ALTER COLUMN id SET DEFAULT nextval('public.clever_teacher_imports_id_seq'::regclass);


--
-- Name: content_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_categories ALTER COLUMN id SET DEFAULT nextval('public.content_categories_id_seq'::regclass);


--
-- Name: content_categories_reader_quizzes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_categories_reader_quizzes ALTER COLUMN id SET DEFAULT nextval('public.content_categories_reader_quizzes_id_seq'::regclass);


--
-- Name: crg_choices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_choices ALTER COLUMN id SET DEFAULT nextval('public.crg_choices_id_seq'::regclass);


--
-- Name: crg_drag_and_drop_phrases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_drag_and_drop_phrases ALTER COLUMN id SET DEFAULT nextval('public.crg_drag_and_drop_phrases_id_seq'::regclass);


--
-- Name: crg_drag_drop_phrase_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_drag_drop_phrase_attempts ALTER COLUMN id SET DEFAULT nextval('public.crg_drag_drop_phrase_attempts_id_seq'::regclass);


--
-- Name: crg_find_phrases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_find_phrases ALTER COLUMN id SET DEFAULT nextval('public.crg_find_phrases_id_seq'::regclass);


--
-- Name: crg_find_phrases_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_find_phrases_answers ALTER COLUMN id SET DEFAULT nextval('public.crg_find_phrases_answers_id_seq'::regclass);


--
-- Name: crg_find_phrases_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_find_phrases_attempts ALTER COLUMN id SET DEFAULT nextval('public.crg_find_phrases_attempts_id_seq'::regclass);


--
-- Name: crg_focus_phrases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_focus_phrases ALTER COLUMN id SET DEFAULT nextval('public.crg_focus_phrases_id_seq'::regclass);


--
-- Name: crg_lesson_participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_lesson_participations ALTER COLUMN id SET DEFAULT nextval('public.crg_lesson_participations_id_seq'::regclass);


--
-- Name: crg_lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_lessons ALTER COLUMN id SET DEFAULT nextval('public.crg_lessons_id_seq'::regclass);


--
-- Name: crg_multiple_choice_question_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_multiple_choice_question_attempts ALTER COLUMN id SET DEFAULT nextval('public.crg_multiple_choice_question_attempts_id_seq'::regclass);


--
-- Name: crg_multiple_choice_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_multiple_choice_questions ALTER COLUMN id SET DEFAULT nextval('public.crg_multiple_choice_questions_id_seq'::regclass);


--
-- Name: crg_narrator_skill_videos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_narrator_skill_videos ALTER COLUMN id SET DEFAULT nextval('public.crg_narrator_skill_videos_id_seq'::regclass);


--
-- Name: crg_narrators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_narrators ALTER COLUMN id SET DEFAULT nextval('public.crg_narrators_id_seq'::regclass);


--
-- Name: crg_ordered_passages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_ordered_passages ALTER COLUMN id SET DEFAULT nextval('public.crg_ordered_passages_id_seq'::regclass);


--
-- Name: crg_ordered_scene_elements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_ordered_scene_elements ALTER COLUMN id SET DEFAULT nextval('public.crg_ordered_scene_elements_id_seq'::regclass);


--
-- Name: crg_passage_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_passage_responses ALTER COLUMN id SET DEFAULT nextval('public.crg_passage_responses_id_seq'::regclass);


--
-- Name: crg_passages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_passages ALTER COLUMN id SET DEFAULT nextval('public.crg_passages_id_seq'::regclass);


--
-- Name: crg_phrases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_phrases ALTER COLUMN id SET DEFAULT nextval('public.crg_phrases_id_seq'::regclass);


--
-- Name: crg_poll_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_poll_answers ALTER COLUMN id SET DEFAULT nextval('public.crg_poll_answers_id_seq'::regclass);


--
-- Name: crg_poll_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_poll_responses ALTER COLUMN id SET DEFAULT nextval('public.crg_poll_responses_id_seq'::regclass);


--
-- Name: crg_polls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_polls ALTER COLUMN id SET DEFAULT nextval('public.crg_polls_id_seq'::regclass);


--
-- Name: crg_previous_response_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_previous_response_options ALTER COLUMN id SET DEFAULT nextval('public.crg_previous_response_options_id_seq'::regclass);


--
-- Name: crg_quotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_quotes ALTER COLUMN id SET DEFAULT nextval('public.crg_quotes_id_seq'::regclass);


--
-- Name: crg_scenes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_scenes ALTER COLUMN id SET DEFAULT nextval('public.crg_scenes_id_seq'::regclass);


--
-- Name: crg_show_quotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_show_quotes ALTER COLUMN id SET DEFAULT nextval('public.crg_show_quotes_id_seq'::regclass);


--
-- Name: crg_text_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_text_entries ALTER COLUMN id SET DEFAULT nextval('public.crg_text_entries_id_seq'::regclass);


--
-- Name: crg_text_entry_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_text_entry_responses ALTER COLUMN id SET DEFAULT nextval('public.crg_text_entry_responses_id_seq'::regclass);


--
-- Name: crg_text_prompts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_text_prompts ALTER COLUMN id SET DEFAULT nextval('public.crg_text_prompts_id_seq'::regclass);


--
-- Name: crg_video_prompts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_video_prompts ALTER COLUMN id SET DEFAULT nextval('public.crg_video_prompts_id_seq'::regclass);


--
-- Name: crg_videos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_videos ALTER COLUMN id SET DEFAULT nextval('public.crg_videos_id_seq'::regclass);


--
-- Name: crg_zinc_primary_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_zinc_primary_skills ALTER COLUMN id SET DEFAULT nextval('public.crg_zinc_primary_skills_id_seq'::regclass);


--
-- Name: crg_zinc_sub_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_zinc_sub_skills ALTER COLUMN id SET DEFAULT nextval('public.crg_zinc_sub_skills_id_seq'::regclass);


--
-- Name: district_adminships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.district_adminships ALTER COLUMN id SET DEFAULT nextval('public.district_adminships_id_seq'::regclass);


--
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- Name: feature_flags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_flags ALTER COLUMN id SET DEFAULT nextval('public.feature_flags_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: google_classroom_registrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.google_classroom_registrations ALTER COLUMN id SET DEFAULT nextval('public.google_classroom_registrations_id_seq'::regclass);


--
-- Name: klasses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klasses ALTER COLUMN id SET DEFAULT nextval('public.klasses_id_seq'::regclass);


--
-- Name: login_keys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_keys ALTER COLUMN id SET DEFAULT nextval('public.login_keys_id_seq'::regclass);


--
-- Name: master_zinc_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_zinc_skills ALTER COLUMN id SET DEFAULT nextval('public.master_zinc_skills_id_seq'::regclass);


--
-- Name: membership_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.membership_transactions ALTER COLUMN id SET DEFAULT nextval('public.membership_transactions_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: oauth_credentials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_credentials ALTER COLUMN id SET DEFAULT nextval('public.oauth_credentials_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- Name: reader_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_answers ALTER COLUMN id SET DEFAULT nextval('public.reader_answers_id_seq'::regclass);


--
-- Name: reader_channels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_channels ALTER COLUMN id SET DEFAULT nextval('public.reader_channels_id_seq'::regclass);


--
-- Name: reader_channels_quizzes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_channels_quizzes ALTER COLUMN id SET DEFAULT nextval('public.reader_channels_quizzes_id_seq'::regclass);


--
-- Name: reader_comparison_quiz_simple_quizzes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_comparison_quiz_simple_quizzes ALTER COLUMN id SET DEFAULT nextval('public.reader_comparison_quiz_simple_quizzes_id_seq'::regclass);


--
-- Name: reader_difficulty_levels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_difficulty_levels ALTER COLUMN id SET DEFAULT nextval('public.reader_difficulty_levels_id_seq'::regclass);


--
-- Name: reader_question_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_question_attempts ALTER COLUMN id SET DEFAULT nextval('public.reader_question_attempts_id_seq'::regclass);


--
-- Name: reader_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_questions ALTER COLUMN id SET DEFAULT nextval('public.reader_questions_id_seq'::regclass);


--
-- Name: reader_questions_zinc_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_questions_zinc_skills ALTER COLUMN id SET DEFAULT nextval('public.reader_questions_zinc_skills_id_seq'::regclass);


--
-- Name: reader_quiz_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quiz_attempts ALTER COLUMN id SET DEFAULT nextval('public.reader_quiz_attempts_id_seq'::regclass);


--
-- Name: reader_quiz_meta_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quiz_meta_infos ALTER COLUMN id SET DEFAULT nextval('public.reader_quiz_meta_infos_id_seq'::regclass);


--
-- Name: reader_quizzes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quizzes ALTER COLUMN id SET DEFAULT nextval('public.reader_quizzes_id_seq'::regclass);


--
-- Name: reader_quizzes_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quizzes_tags ALTER COLUMN id SET DEFAULT nextval('public.reader_quizzes_tags_id_seq'::regclass);


--
-- Name: reader_quizzes_zinc_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quizzes_zinc_skills ALTER COLUMN id SET DEFAULT nextval('public.reader_quizzes_zinc_skills_id_seq'::regclass);


--
-- Name: reader_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_tags ALTER COLUMN id SET DEFAULT nextval('public.reader_tags_id_seq'::regclass);


--
-- Name: reader_word_count_bonus_rule_sets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_word_count_bonus_rule_sets ALTER COLUMN id SET DEFAULT nextval('public.reader_word_count_bonus_rule_sets_id_seq'::regclass);


--
-- Name: reader_word_count_bonus_rules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_word_count_bonus_rules ALTER COLUMN id SET DEFAULT nextval('public.reader_word_count_bonus_rules_id_seq'::regclass);


--
-- Name: reader_zinc_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_zinc_skills ALTER COLUMN id SET DEFAULT nextval('public.reader_zinc_skills_id_seq'::regclass);


--
-- Name: reading_levels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reading_levels ALTER COLUMN id SET DEFAULT nextval('public.reading_levels_id_seq'::regclass);


--
-- Name: schools id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schools ALTER COLUMN id SET DEFAULT nextval('public.schools_id_seq'::regclass);


--
-- Name: schools_standard_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schools_standard_types ALTER COLUMN id SET DEFAULT nextval('public.schools_standard_types_id_seq'::regclass);


--
-- Name: seed_migration_data_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seed_migration_data_migrations ALTER COLUMN id SET DEFAULT nextval('public.seed_migration_data_migrations_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: sponsorships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sponsorships ALTER COLUMN id SET DEFAULT nextval('public.sponsorships_id_seq'::regclass);


--
-- Name: standard_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.standard_types ALTER COLUMN id SET DEFAULT nextval('public.standard_types_id_seq'::regclass);


--
-- Name: standards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.standards ALTER COLUMN id SET DEFAULT nextval('public.standards_id_seq'::regclass);


--
-- Name: stats_class_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_class_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_class_aggregates_id_seq'::regclass);


--
-- Name: stats_class_cc_skill_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_class_cc_skill_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_class_cc_skill_aggregates_id_seq'::regclass);


--
-- Name: stats_class_zinc_skill_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_class_zinc_skill_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_class_zinc_skill_aggregates_id_seq'::regclass);


--
-- Name: stats_completed_quiz_attempt_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_completed_quiz_attempt_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_completed_quiz_attempt_aggregates_id_seq'::regclass);


--
-- Name: stats_deck_attempt_facts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_deck_attempt_facts ALTER COLUMN id SET DEFAULT nextval('public.stats_deck_attempt_facts_id_seq'::regclass);


--
-- Name: stats_learned_deck_participation_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_learned_deck_participation_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_learned_deck_participation_aggregates_id_seq'::regclass);


--
-- Name: stats_user_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_user_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_user_aggregates_id_seq'::regclass);


--
-- Name: stats_user_cc_skill_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_user_cc_skill_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_user_cc_skill_aggregates_id_seq'::regclass);


--
-- Name: stats_user_zinc_skill_aggregates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_user_zinc_skill_aggregates ALTER COLUMN id SET DEFAULT nextval('public.stats_user_zinc_skill_aggregates_id_seq'::regclass);


--
-- Name: stats_zinc_skill_facts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_zinc_skill_facts ALTER COLUMN id SET DEFAULT nextval('public.stats_zinc_skill_facts_id_seq'::regclass);


--
-- Name: student_klass_invitations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_klass_invitations ALTER COLUMN id SET DEFAULT nextval('public.student_klass_invitations_id_seq'::regclass);


--
-- Name: student_klass_memberships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_klass_memberships ALTER COLUMN id SET DEFAULT nextval('public.student_klass_memberships_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: teacher_klass_memberships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_klass_memberships ALTER COLUMN id SET DEFAULT nextval('public.teacher_klass_memberships_id_seq'::regclass);


--
-- Name: teachership_invitations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachership_invitations ALTER COLUMN id SET DEFAULT nextval('public.teachership_invitations_id_seq'::regclass);


--
-- Name: teacherships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacherships ALTER COLUMN id SET DEFAULT nextval('public.teacherships_id_seq'::regclass);


--
-- Name: user_unsubscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_unsubscriptions ALTER COLUMN id SET DEFAULT nextval('public.user_unsubscriptions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vocab_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_categories ALTER COLUMN id SET DEFAULT nextval('public.vocab_categories_id_seq'::regclass);


--
-- Name: vocab_categories_sets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_categories_sets ALTER COLUMN id SET DEFAULT nextval('public.vocab_categories_sets_id_seq'::regclass);


--
-- Name: vocab_deck_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_deck_attempts ALTER COLUMN id SET DEFAULT nextval('public.vocab_deck_attempts_id_seq'::regclass);


--
-- Name: vocab_deck_participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_deck_participations ALTER COLUMN id SET DEFAULT nextval('public.vocab_deck_participations_id_seq'::regclass);


--
-- Name: vocab_decks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_decks ALTER COLUMN id SET DEFAULT nextval('public.vocab_decks_id_seq'::regclass);


--
-- Name: vocab_decks_words id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_decks_words ALTER COLUMN id SET DEFAULT nextval('public.vocab_decks_words_id_seq'::regclass);


--
-- Name: vocab_derived_words id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_derived_words ALTER COLUMN id SET DEFAULT nextval('public.vocab_derived_words_id_seq'::regclass);


--
-- Name: vocab_exposure_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_exposure_plans ALTER COLUMN id SET DEFAULT nextval('public.vocab_exposure_plans_id_seq'::regclass);


--
-- Name: vocab_exposure_stages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_exposure_stages ALTER COLUMN id SET DEFAULT nextval('public.vocab_exposure_stages_id_seq'::regclass);


--
-- Name: vocab_exposures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_exposures ALTER COLUMN id SET DEFAULT nextval('public.vocab_exposures_id_seq'::regclass);


--
-- Name: vocab_game_modes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_game_modes ALTER COLUMN id SET DEFAULT nextval('public.vocab_game_modes_id_seq'::regclass);


--
-- Name: vocab_game_modes_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_game_modes_plans ALTER COLUMN id SET DEFAULT nextval('public.vocab_game_modes_plans_id_seq'::regclass);


--
-- Name: vocab_game_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_game_plans ALTER COLUMN id SET DEFAULT nextval('public.vocab_game_plans_id_seq'::regclass);


--
-- Name: vocab_games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_games ALTER COLUMN id SET DEFAULT nextval('public.vocab_games_id_seq'::regclass);


--
-- Name: vocab_grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_grades ALTER COLUMN id SET DEFAULT nextval('public.vocab_grades_id_seq'::regclass);


--
-- Name: vocab_grades_sets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_grades_sets ALTER COLUMN id SET DEFAULT nextval('public.vocab_grades_sets_id_seq'::regclass);


--
-- Name: vocab_master_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_master_plans ALTER COLUMN id SET DEFAULT nextval('public.vocab_master_plans_id_seq'::regclass);


--
-- Name: vocab_part_of_speech_words id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_part_of_speech_words ALTER COLUMN id SET DEFAULT nextval('public.vocab_part_of_speech_words_id_seq'::regclass);


--
-- Name: vocab_parts_of_speech id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_parts_of_speech ALTER COLUMN id SET DEFAULT nextval('public.vocab_parts_of_speech_id_seq'::regclass);


--
-- Name: vocab_parts_of_speech_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_parts_of_speech_translations ALTER COLUMN id SET DEFAULT nextval('public.vocab_parts_of_speech_translations_id_seq'::regclass);


--
-- Name: vocab_set_participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_set_participations ALTER COLUMN id SET DEFAULT nextval('public.vocab_set_participations_id_seq'::regclass);


--
-- Name: vocab_sets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_sets ALTER COLUMN id SET DEFAULT nextval('public.vocab_sets_id_seq'::regclass);


--
-- Name: vocab_sets_words id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_sets_words ALTER COLUMN id SET DEFAULT nextval('public.vocab_sets_words_id_seq'::regclass);


--
-- Name: vocab_synonyms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_synonyms ALTER COLUMN id SET DEFAULT nextval('public.vocab_synonyms_id_seq'::regclass);


--
-- Name: vocab_word_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_word_attempts ALTER COLUMN id SET DEFAULT nextval('public.vocab_word_attempts_id_seq'::regclass);


--
-- Name: vocab_word_synonym_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_word_synonym_options ALTER COLUMN id SET DEFAULT nextval('public.vocab_word_synonym_options_id_seq'::regclass);


--
-- Name: vocab_word_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_word_translations ALTER COLUMN id SET DEFAULT nextval('public.vocab_word_translations_id_seq'::regclass);


--
-- Name: vocab_words id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_words ALTER COLUMN id SET DEFAULT nextval('public.vocab_words_id_seq'::regclass);


--
-- Name: vocab_wrong_image_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_wrong_image_options ALTER COLUMN id SET DEFAULT nextval('public.vocab_wrong_image_options_id_seq'::regclass);


--
-- Name: whitelisted_teachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.whitelisted_teachers ALTER COLUMN id SET DEFAULT nextval('public.whitelisted_teachers_id_seq'::regclass);


--
-- Name: wupee_notification_type_configurations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notification_type_configurations ALTER COLUMN id SET DEFAULT nextval('public.wupee_notification_type_configurations_id_seq'::regclass);


--
-- Name: wupee_notification_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notification_types ALTER COLUMN id SET DEFAULT nextval('public.wupee_notification_types_id_seq'::regclass);


--
-- Name: wupee_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notifications ALTER COLUMN id SET DEFAULT nextval('public.wupee_notifications_id_seq'::regclass);


--
-- Name: zinc_skill_standards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zinc_skill_standards ALTER COLUMN id SET DEFAULT nextval('public.zinc_skill_standards_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_admin_comments (id, namespace, body, resource_id, resource_type, author_id, author_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Data for Name: adminships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.adminships (id, school_id, user_id, created_at, updated_at) FROM stdin;
1	1	3	2018-04-13 08:56:29.378032	2018-04-13 08:56:29.378032
\.


--
-- Name: adminships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.adminships_id_seq', 1, true);


--
-- Data for Name: announcement_interactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcement_interactions (id, user_id, announcement_id, read, hidden, created_at, updated_at) FROM stdin;
\.


--
-- Name: announcement_interactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.announcement_interactions_id_seq', 1, false);


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcements (id, subject, message, snippet, creator_id, created_at, updated_at, target_role) FROM stdin;
\.


--
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.announcements_id_seq', 1, false);


--
-- Data for Name: api_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.api_users (id, user_id, api_key) FROM stdin;
\.


--
-- Name: api_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.api_users_id_seq', 1, false);


--
-- Data for Name: assessment_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_answers (id, diagnostic_participation_id, question_id, selected_choice_id, locked, created_at, updated_at) FROM stdin;
\.


--
-- Name: assessment_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_answers_id_seq', 1, false);


--
-- Data for Name: assessment_choices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_choices (id, question_id, content, correct, fixed_to_bottom, created_at, updated_at) FROM stdin;
\.


--
-- Name: assessment_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_choices_id_seq', 1, false);


--
-- Data for Name: assessment_diagnostic_participations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_diagnostic_participations (id, diagnostic_id, user_id, progress, created_at, updated_at, completed_at, current_passage_id) FROM stdin;
\.


--
-- Data for Name: assessment_diagnostic_participations_assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_diagnostic_participations_assignments (id, assignment_id, diagnostic_participation_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: assessment_diagnostic_participations_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_diagnostic_participations_assignments_id_seq', 1, false);


--
-- Name: assessment_diagnostic_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_diagnostic_participations_id_seq', 1, false);


--
-- Data for Name: assessment_diagnostics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_diagnostics (id, title, created_at, updated_at, published, assignable, exam_type) FROM stdin;
\.


--
-- Name: assessment_diagnostics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_diagnostics_id_seq', 1, false);


--
-- Data for Name: assessment_ordered_passages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_ordered_passages (id, section_id, passage_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Name: assessment_ordered_passages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_ordered_passages_id_seq', 1, false);


--
-- Data for Name: assessment_passages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_passages (id, title, author, text, created_at, updated_at, difficulty_level_id, blurb) FROM stdin;
\.


--
-- Name: assessment_passages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_passages_id_seq', 1, false);


--
-- Data for Name: assessment_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_questions (id, content, passage_id, "position", created_at, updated_at, difficulty_level_id, skill_id) FROM stdin;
\.


--
-- Name: assessment_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_questions_id_seq', 1, false);


--
-- Data for Name: assessment_section_transitions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_section_transitions (id, diagnostic_id, source_section_id, range_start_condition, range_start_value, created_at, updated_at, range_end_condition, range_end_value, destination_id, destination_type) FROM stdin;
\.


--
-- Name: assessment_section_transitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_section_transitions_id_seq', 1, false);


--
-- Data for Name: assessment_sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assessment_sections (id, title, diagnostic_id, level_start_id, level_end_id, created_at, updated_at, root) FROM stdin;
\.


--
-- Name: assessment_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assessment_sections_id_seq', 1, false);


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assignments (id, message, created_at, updated_at, creator_id, assignee_id, assignee_type, assigned_object_id, mandatory_set_id, undertaking_type, vocab_game_mode, untimed, same_settings_for_all, type, progress) FROM stdin;
\.


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assignments_id_seq', 1, false);


--
-- Data for Name: assignments_reader_quiz_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assignments_reader_quiz_attempts (id, quiz_assignment_id, quiz_attempt_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: assignments_reader_quiz_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assignments_reader_quiz_attempts_id_seq', 1, false);


--
-- Data for Name: assignments_vocab_set_participations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assignments_vocab_set_participations (id, assignment_id, set_participation_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: assignments_vocab_set_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assignments_vocab_set_participations_id_seq', 1, false);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.audits_id_seq', 1, false);


--
-- Data for Name: category_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category_types (id, name, "position") FROM stdin;
\.


--
-- Name: category_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_types_id_seq', 1, false);


--
-- Data for Name: clever_district_imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clever_district_imports (id, district_id, job_id, status, completed_at, created_at, updated_at, note, event_id_prior_import) FROM stdin;
\.


--
-- Name: clever_district_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clever_district_imports_id_seq', 1, false);


--
-- Data for Name: clever_district_syncs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clever_district_syncs (id, district_id, latest_event_id, running, started_at, succeeded_at, failed_at, created_at, updated_at, paused_at, district_import_id) FROM stdin;
\.


--
-- Name: clever_district_syncs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clever_district_syncs_id_seq', 1, false);


--
-- Data for Name: clever_entities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clever_entities (id, clazz, data, done, created_at, updated_at) FROM stdin;
\.


--
-- Name: clever_entities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clever_entities_id_seq', 1, false);


--
-- Data for Name: clever_imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clever_imports (id, user_id, entity_id, entity_type) FROM stdin;
\.


--
-- Name: clever_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clever_imports_id_seq', 1, false);


--
-- Data for Name: clever_schools_imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clever_schools_imports (id, district_id, status, completed_at, note, created_at, updated_at) FROM stdin;
\.


--
-- Name: clever_schools_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clever_schools_imports_id_seq', 1, false);


--
-- Data for Name: clever_student_imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clever_student_imports (id, district_id, status, completed_at, note, student_source_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: clever_student_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clever_student_imports_id_seq', 1, false);


--
-- Data for Name: clever_teacher_imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clever_teacher_imports (id, district_id, status, job_id, completed_at, note, teacher_source_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: clever_teacher_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clever_teacher_imports_id_seq', 1, false);


--
-- Data for Name: content_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.content_categories (id, name, created_at, updated_at, category_type_id, url_slug, "position") FROM stdin;
\.


--
-- Name: content_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.content_categories_id_seq', 1, false);


--
-- Data for Name: content_categories_reader_quizzes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.content_categories_reader_quizzes (id, content_category_id, quiz_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: content_categories_reader_quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.content_categories_reader_quizzes_id_seq', 1, false);


--
-- Data for Name: content_categories_vocab_sets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.content_categories_vocab_sets (content_category_id, set_id) FROM stdin;
\.


--
-- Data for Name: crg_choices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_choices (id, choice_text, correct, multiple_choice_question_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_choices_id_seq', 1, false);


--
-- Data for Name: crg_drag_and_drop_phrases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_drag_and_drop_phrases (id, correct_attempts_expected, incorrect_attempts_allowed, created_at, updated_at, interaction_info) FROM stdin;
\.


--
-- Name: crg_drag_and_drop_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_drag_and_drop_phrases_id_seq', 1, false);


--
-- Data for Name: crg_drag_drop_phrase_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_drag_drop_phrase_attempts (id, passage_response_id, drag_and_drop_phrase_id, dropped_on_word, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_drag_drop_phrase_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_drag_drop_phrase_attempts_id_seq', 1, false);


--
-- Data for Name: crg_find_phrases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_find_phrases (id, created_at, updated_at, correct_attempts_expected, incorrect_attempts_allowed, interaction_info) FROM stdin;
\.


--
-- Data for Name: crg_find_phrases_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_find_phrases_answers (id, find_phrases_id, phrase_type, created_at, updated_at, start_word_number, end_word_number, sub_phrases) FROM stdin;
\.


--
-- Name: crg_find_phrases_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_find_phrases_answers_id_seq', 1, false);


--
-- Data for Name: crg_find_phrases_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_find_phrases_attempts (id, passage_response_id, find_phrases_id, start_word_number, end_word_number, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_find_phrases_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_find_phrases_attempts_id_seq', 1, false);


--
-- Name: crg_find_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_find_phrases_id_seq', 1, false);


--
-- Data for Name: crg_focus_phrases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_focus_phrases (id, created_at, updated_at, start_word_number, end_word_number, focus_type) FROM stdin;
\.


--
-- Name: crg_focus_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_focus_phrases_id_seq', 1, false);


--
-- Data for Name: crg_lesson_participations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_lesson_participations (id, lesson_id, user_id, completed, current_passage_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_lesson_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_lesson_participations_id_seq', 1, false);


--
-- Data for Name: crg_lessons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_lessons (id, created_at, updated_at, title) FROM stdin;
\.


--
-- Name: crg_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_lessons_id_seq', 1, false);


--
-- Data for Name: crg_multiple_choice_question_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_multiple_choice_question_attempts (id, passage_response_id, multiple_choice_question_id, selected_choice_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_multiple_choice_question_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_multiple_choice_question_attempts_id_seq', 1, false);


--
-- Data for Name: crg_multiple_choice_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_multiple_choice_questions (id, question_text, created_at, updated_at, attempts_allowed, interaction_info) FROM stdin;
\.


--
-- Name: crg_multiple_choice_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_multiple_choice_questions_id_seq', 1, false);


--
-- Data for Name: crg_narrator_skill_videos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_narrator_skill_videos (id, video_id, narrator_id, skill_id, skill_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_narrator_skill_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_narrator_skill_videos_id_seq', 1, false);


--
-- Data for Name: crg_narrators; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_narrators (id, name, image, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_narrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_narrators_id_seq', 1, false);


--
-- Data for Name: crg_ordered_passages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_ordered_passages (id, passage_id, lesson_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_ordered_passages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_ordered_passages_id_seq', 1, false);


--
-- Data for Name: crg_ordered_scene_elements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_ordered_scene_elements (id, scene_element_id, scene_element_type, created_at, updated_at, "position", scene_element_sequence_id, scene_element_sequence_type, scene_element_sequence_name, scene_id) FROM stdin;
\.


--
-- Name: crg_ordered_scene_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_ordered_scene_elements_id_seq', 1, false);


--
-- Data for Name: crg_passage_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_passage_responses (id, passage_id, user_id, progress, completed_at, current_scene_id, lesson_participation_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_passage_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_passage_responses_id_seq', 1, false);


--
-- Data for Name: crg_passages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_passages (id, title, author, source, image, difficulty_level_id, created_at, updated_at, excerpt, full_text, passage_type, narrator_id, show_from, credit, school_levels, published_at) FROM stdin;
\.


--
-- Name: crg_passages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_passages_id_seq', 1, false);


--
-- Data for Name: crg_phrases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_phrases (id, start_word_number, end_word_number, phrase_type, drag_and_drop_phrase_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_phrases_id_seq', 1, false);


--
-- Data for Name: crg_poll_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_poll_answers (id, poll_id, answer, percentage, created_at, updated_at, answer_synonyms) FROM stdin;
\.


--
-- Name: crg_poll_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_poll_answers_id_seq', 1, false);


--
-- Data for Name: crg_poll_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_poll_responses (id, poll_id, passage_response_id, text, correct, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_poll_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_poll_responses_id_seq', 1, false);


--
-- Data for Name: crg_polls; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_polls (id, number_of_entries, created_at, updated_at, question_text, interaction_info) FROM stdin;
\.


--
-- Name: crg_polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_polls_id_seq', 1, false);


--
-- Data for Name: crg_previous_response_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_previous_response_options (id, reference_scene_element_id, reference_scene_element_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_previous_response_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_previous_response_options_id_seq', 1, false);


--
-- Data for Name: crg_quotes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_quotes (id, text, "user", show_quote_id, created_at, updated_at, "position") FROM stdin;
\.


--
-- Name: crg_quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_quotes_id_seq', 1, false);


--
-- Data for Name: crg_scenes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_scenes (id, title, skill_exercise_id, created_at, updated_at, zinc_primary_skill_id, passage_id, zinc_sub_skill_id, "position") FROM stdin;
\.


--
-- Name: crg_scenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_scenes_id_seq', 1, false);


--
-- Data for Name: crg_show_quotes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_show_quotes (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_show_quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_show_quotes_id_seq', 1, false);


--
-- Data for Name: crg_text_entries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_text_entries (id, minimum_words_required, created_at, updated_at, button_text, interaction_info) FROM stdin;
\.


--
-- Name: crg_text_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_text_entries_id_seq', 1, false);


--
-- Data for Name: crg_text_entry_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_text_entry_responses (id, text_entry_id, passage_response_id, text, button_clicked, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_text_entry_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_text_entry_responses_id_seq', 1, false);


--
-- Data for Name: crg_text_prompts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_text_prompts (id, text, created_at, updated_at, interaction_info) FROM stdin;
\.


--
-- Name: crg_text_prompts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_text_prompts_id_seq', 1, false);


--
-- Data for Name: crg_video_prompts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_video_prompts (id, video_id, created_at, updated_at, display_format, wait_time, auto_next, button_label, label, skippable) FROM stdin;
\.


--
-- Name: crg_video_prompts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_video_prompts_id_seq', 1, false);


--
-- Data for Name: crg_videos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_videos (id, title, description, video, poster, transcript, user_id, uploaded_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_videos_id_seq', 1, false);


--
-- Data for Name: crg_zinc_primary_skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_zinc_primary_skills (id, name, "position", skill_id, created_at, updated_at, video, image, color) FROM stdin;
\.


--
-- Name: crg_zinc_primary_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_zinc_primary_skills_id_seq', 1, false);


--
-- Data for Name: crg_zinc_sub_skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crg_zinc_sub_skills (id, name, "position", zinc_primary_skill_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: crg_zinc_sub_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.crg_zinc_sub_skills_id_seq', 1, false);


--
-- Data for Name: district_adminships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.district_adminships (id, user_id, district_id) FROM stdin;
\.


--
-- Name: district_adminships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.district_adminships_id_seq', 1, false);


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.districts (id, name, source_id, hide_common_core, parent_id, source_provider, access_token, type) FROM stdin;
\.


--
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.districts_id_seq', 1, false);


--
-- Data for Name: feature_flags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.feature_flags (id, feature_id, actor_id, actor_type, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: feature_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.feature_flags_id_seq', 1, false);


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.features (id, name, "default", force_default, created_at, updated_at) FROM stdin;
1	enable_crg	t	t	2018-04-16 02:51:00.526893	2018-04-16 02:51:00.526893
\.


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.features_id_seq', 1, true);


--
-- Data for Name: google_classroom_registrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.google_classroom_registrations (id, source_id, klass_id, user_id, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: google_classroom_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.google_classroom_registrations_id_seq', 1, false);


--
-- Data for Name: klasses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.klasses (id, name, school_id, teacher_id, created_at, updated_at, student_code, source_id, archived, start_date, end_date, district_id, source_provider, type) FROM stdin;
1	English Class	1	\N	2018-04-13 08:25:07.765387	2018-04-13 08:25:07.765387	Rvtdd	\N	f	2018-04-13	\N	\N	direct	Klass
\.


--
-- Name: klasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.klasses_id_seq', 1, true);


--
-- Data for Name: login_keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.login_keys (id, token, user_id, valid_upto, usage, created_at, updated_at) FROM stdin;
\.


--
-- Name: login_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_keys_id_seq', 1, false);


--
-- Data for Name: master_zinc_skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.master_zinc_skills (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: master_zinc_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.master_zinc_skills_id_seq', 1, false);


--
-- Data for Name: membership_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.membership_transactions (id, transaction_type, number_of_licenses, amount, membership_expires_on, subscriber_id, subscriber_type, created_at, updated_at, premium_source_id, premium_source_type) FROM stdin;
1	3	100	5000.0	\N	1	Teachership	2018-04-13 08:43:42.112412	2018-04-13 08:43:42.112412	\N	\N
2	0	50	5000.0	2020-04-14	1	Teachership	2018-04-13 08:47:35.742033	2018-04-13 08:47:35.742033	\N	\N
3	0	200	10000.0	2030-04-14	1	School	2018-04-13 08:57:41.681135	2018-04-13 08:57:41.681135	\N	\N
4	6	-150	0.0	\N	1	Teachership	2018-04-13 08:57:41.708244	2018-04-13 08:57:41.708244	\N	\N
5	5	\N	0.0	2030-04-14	1	Teachership	2018-04-13 08:57:41.726475	2018-04-13 08:57:41.726475	1	School
6	5	\N	0.0	2030-04-14	4	User	2018-04-13 09:00:42.420812	2018-04-13 09:00:42.420812	1	School
\.


--
-- Name: membership_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.membership_transactions_id_seq', 6, true);


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
\.


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 1, false);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes) FROM stdin;
\.


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 1, false);


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_applications (id, name, uid, secret, redirect_uri, scopes, created_at, updated_at, owner_id, owner_type) FROM stdin;
\.


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, false);


--
-- Data for Name: oauth_credentials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_credentials (id, user_id, provider, token, refresh_token, expires, expires_at, created_at, updated_at, email) FROM stdin;
\.


--
-- Name: oauth_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_credentials_id_seq', 1, false);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organizations (id, name, membership_level, licenses_purchased, membership_expires_on, premium_source_id, premium_source_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.organizations_id_seq', 1, false);


--
-- Data for Name: reader_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_answers (id, question_id, content, explanation, "position", correct, created_at, updated_at, fixed_to_bottom, legacy_id) FROM stdin;
\.


--
-- Name: reader_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_answers_id_seq', 1, false);


--
-- Data for Name: reader_channels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_channels (id, name, created_at, updated_at, "position", color) FROM stdin;
\.


--
-- Name: reader_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_channels_id_seq', 1, false);


--
-- Data for Name: reader_channels_quizzes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_channels_quizzes (id, quiz_id, channel_id) FROM stdin;
\.


--
-- Name: reader_channels_quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_channels_quizzes_id_seq', 1, false);


--
-- Data for Name: reader_comparison_quiz_simple_quizzes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_comparison_quiz_simple_quizzes (id, simple_quiz_id, comparison_quiz_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reader_comparison_quiz_simple_quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_comparison_quiz_simple_quizzes_id_seq', 1, false);


--
-- Data for Name: reader_difficulty_levels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_difficulty_levels (id, name, "position", created_at, updated_at, grade_level, lexile_level, summary, explanation, color, quiz_points_multiplier) FROM stdin;
\.


--
-- Name: reader_difficulty_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_difficulty_levels_id_seq', 1, false);


--
-- Data for Name: reader_question_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_question_attempts (id, prediction, user_id, question_id, quiz_attempt_id, created_at, updated_at, answer_id, points_scored, max_points_when_answered) FROM stdin;
\.


--
-- Name: reader_question_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_question_attempts_id_seq', 1, false);


--
-- Data for Name: reader_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_questions (id, content, quiz_id, number, created_at, updated_at, zinc_skill_id, legacy_id, difficulty_level) FROM stdin;
\.


--
-- Name: reader_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_questions_id_seq', 1, false);


--
-- Data for Name: reader_questions_zinc_skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_questions_zinc_skills (id, question_id, zinc_skill_id) FROM stdin;
\.


--
-- Name: reader_questions_zinc_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_questions_zinc_skills_id_seq', 1, false);


--
-- Data for Name: reader_quiz_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_quiz_attempts (id, user_id, quiz_id, created_at, updated_at, points_scored, completed_at, assignment_id, mandatory_set_id, progress) FROM stdin;
\.


--
-- Name: reader_quiz_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_quiz_attempts_id_seq', 1, false);


--
-- Data for Name: reader_quiz_meta_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_quiz_meta_infos (id, name, points_per_question, word_count_bonus_rule_set_id, bonus_mode_multiplier, bonus_mode_duration_from_last_success_in_hours, created_at, updated_at) FROM stdin;
\.


--
-- Name: reader_quiz_meta_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_quiz_meta_infos_id_seq', 1, false);


--
-- Data for Name: reader_quizzes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_quizzes (id, title, article_author, image, article_source, created_at, updated_at, summary_text, full_text, writing_prompt, article_link, difficulty_level_id, primary_channel_id, contains_video, chose_this_for, legacy_id, word_count, published, vocab_word_count, quiz_meta_info_id, published_at, questions_count, base_points, completed_student_attempts_count, internal, type, teacher_description, student_description, custom_instructions) FROM stdin;
\.


--
-- Name: reader_quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_quizzes_id_seq', 1, false);


--
-- Data for Name: reader_quizzes_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_quizzes_tags (id, quiz_id, tag_id) FROM stdin;
\.


--
-- Name: reader_quizzes_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_quizzes_tags_id_seq', 1, false);


--
-- Data for Name: reader_quizzes_zinc_skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_quizzes_zinc_skills (id, quiz_id, zinc_skill_id) FROM stdin;
\.


--
-- Name: reader_quizzes_zinc_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_quizzes_zinc_skills_id_seq', 1, false);


--
-- Data for Name: reader_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_tags (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: reader_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_tags_id_seq', 1, false);


--
-- Data for Name: reader_word_count_bonus_rule_sets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_word_count_bonus_rule_sets (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: reader_word_count_bonus_rule_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_word_count_bonus_rule_sets_id_seq', 1, false);


--
-- Data for Name: reader_word_count_bonus_rules; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_word_count_bonus_rules (id, range_start_value, range_end_value, bonus_multiplier, word_count_bonus_rule_set_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reader_word_count_bonus_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_word_count_bonus_rules_id_seq', 1, false);


--
-- Data for Name: reader_zinc_skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reader_zinc_skills (id, name, created_at, updated_at, "position", skill_id) FROM stdin;
\.


--
-- Name: reader_zinc_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reader_zinc_skills_id_seq', 1, false);


--
-- Data for Name: reading_levels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reading_levels (id, level, source_id, source_type, user_id, created_at, updated_at, notified) FROM stdin;
\.


--
-- Name: reading_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reading_levels_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20180328073832
20170912054739
20160415170651
20150728053805
20150721144503
20171222163707
20160830121742
20171018065526
20150409223735
20171023211348
20150516005329
20150724065007
20150428185451
20150316151628
20171116070039
20161017080059
20161209175034
20160614023034
20141222022658
20170607024136
20150320023040
20171022220647
20160720152058
20170502073038
20141103070305
20141021131944
20161103055535
20150903185234
20160327150641
20141215032922
20170222054832
20151219154648
20171116015040
20161103043527
20150721144535
20151112101507
20150222075349
20150316152157
20151230150451
20170320071318
20160720172154
20141223114826
20161130105806
20171207020856
20171018061623
20150901120626
20171207081328
20170925022308
20170213031036
20141021200341
20151114022942
20150316151701
20161115093926
20150901000329
20150904091902
20160322113121
20170828080105
20171022213542
20160822112558
20161031091910
20150728112654
20171127080325
20171114114529
20150729214701
20171022120746
20151027095547
20170718061246
20140901055555
20161214131614
20141102032922
20150903063756
20151229091939
20141020190335
20161126110449
20171022105024
20161020112811
20150415215640
20170822053505
20150314224934
20150728124814
20160327111255
20150515062640
20150914103740
20170614083625
20140813094020
20150110090541
20141023150141
20160330021825
20170406111356
20150108034841
20150614161358
20161108165119
20160331143042
20161121201558
20170831041409
20141103070240
20150823112855
20141228083538
20151229070821
20170411063028
20150223104943
20150728124335
20161208034702
20150424060610
20171127052024
20160407094555
20160310162832
20161025055734
20151109152537
20150307172616
20161103143456
20150904091352
20161025052622
20150416021606
20150420021059
20170619120308
20150310135627
20170912142812
20150320030020
20150320160517
20150328135335
20171129140042
20151116111945
20171207062423
20141021040722
20140829200343
20150728053916
20171225115729
20141021144843
20170428074342
20150105072800
20150415203712
20150416053508
20170325010531
20170613093142
20170814020817
20150903033711
20141214015818
20141226025601
20150903070207
20171023040504
20150903053507
20150728054503
20150303085933
20150903070241
20150515062530
20171222092703
20150222094817
20150823112857
20161122052445
20170722084707
20171124100849
20171019083620
20150103024908
20141021101644
20150729203157
20170901073844
20171019062127
20170829065110
20140823170711
20150903032426
20170825080631
20150314232244
20170905090104
20140909093305
20161103043526
20170131111816
20150331010154
20150502053542
20150903053447
20170908073551
20170220084636
20161104102305
20150310135309
20150501100014
20150320034157
20171127035409
20150721141510
20161026135230
20150114180359
20150728070022
20141021200959
20171208062829
20161123061451
20150221173124
20161103130916
20171127203009
20150724054257
20170720072926
20171207034357
20160913055545
20151012090355
20160320135559
20150222080504
20171022213137
20150806035956
20150904081823
20151027082357
20171117085235
20151218130318
20150910061150
20171031103355
20160731115422
20151007033859
20170210014911
20161110110804
20150729221559
20160309094648
20161202131832
20140812161545
20150307105229
20170825040436
20141030060923
20150823112861
20161114084122
20170718060107
20160113130918
20141229082302
20140823043748
20160907074532
20150310095350
20180101091417
20170331091056
20150223155659
20150416083903
20150412003906
20160902082605
20160801050932
20170112093259
20170119090626
20151218080429
20150904084043
20141229074704
20150409152412
20160822121856
20141229053028
20171018080556
20150316093700
20171212064829
20150416090855
20161026134222
20160829014255
20160831183138
20161212080435
20171110085717
20150914173648
20180327025200
20170214134121
20171116122549
20161215142910
20170809032546
20170210020300
20170609072248
20150903061513
20150619162451
20150609142823
20140815200100
20171204095709
20160722002130
20171121004611
20150112104955
20171013130712
20150823112863
20170420122021
20141104071809
20150320022815
20150109023352
20170516102208
20150614163145
20161026130207
20170818043912
20160107072345
20150728125039
20150823112866
20161010112526
20160328140301
20170510103694
20150104161807
20160922125835
20171116081854
20150108033759
20170825083839
20160914132408
20150823112858
20160822182501
20150507115542
20160408090529
20161030163403
20150903063818
20161101041552
20170913025618
20171207021000
20161114092436
20161125195354
20150223155719
20150103025408
20171022204153
20151201135448
20170217095508
20160722030625
20150728050313
20150415225819
20150823112864
20150415205008
20171229065803
20140825170617
20150316105937
20141228073649
20150307031922
20171020065016
20150914110501
20141217093946
20170217092313
20171201061400
20150823112853
20170511110558
20150310135050
20170609091821
20160327131547
20171020204629
20160404105856
20151229071153
20161026133117
20171123130311
20150728121304
20150311054830
20160410143456
20150728113542
20141022161051
20171109110900
20150721144601
20160726110330
20160323210644
20150914104125
20141224142250
20141020184722
20160615065544
20171018065037
20161130070553
20150121145730
20140814084021
20160901060812
20150904083955
20150310095225
20150823112854
20150316091855
20171213093557
20171110074408
20150103023939
20161128053436
20160329193500
20141023062142
20161026135131
20161102074730
20150120032003
20150904091440
20140908144431
20161111101727
20150728124546
20150314231149
20150823112865
20150904091330
20171022203414
20150320035730
20170801105252
20151116033759
20170201102757
20170609063949
20151120032519
20171019070441
20141020200427
20150308001534
20150103033514
20151116160738
20150316091813
20151113063540
20161109081052
20150411221610
20150823112860
20161026132718
20141211125254
20151125145154
20170511055605
20141201081505
20170214114514
20170918041001
20141226125927
20161025073519
20180101085829
20150904083842
20160916110515
20160208185123
20171208114858
20170508180537
20171022224456
20171012013211
20160720141048
20150114085151
20170313103544
20171115160558
20150119023746
20171212074716
20170720055744
20150428074146
20141215061100
20160328122058
20160720131955
20161122060316
20170213025013
20161026130448
20151127052043
20150331010256
20160113104744
20150310142027
20161215052218
20170831034657
20150730133736
20150119133858
20150823112862
20161206093454
20150415204415
20171019061243
20160309113052
20170320065506
20150823112859
20171103041118
20140821100612
20150222080625
20141223101313
20150103031043
20141104074246
20141222120716
20171207035058
20150108030728
20150904091750
20150728113758
20150109153133
20161207065500
20151003222804
20170614080339
20150903033524
20141229053452
20150728123136
20160919043427
20150320115529
20150904083236
20160801070850
20170406113834
20161109100202
20171020194608
20170119112234
20161130110317
20170904013712
20141030111613
20150310114054
20140908141700
20150806050834
20171116004306
20150426133845
20180214050507
20150903061433
20170912142858
20170829085649
20161026135030
20170901172250
20141021145230
20141227022537
20161021075528
20150330082306
20150508140913
20150904090509
20160608034303
20160327140805
20150915131637
20160822181821
20150323032759
20161020111413
20151109153209
20150904091721
20150823102936
20150903064638
20171018062340
20150111120418
20150728113000
20150917145901
20161103043525
20150728053839
20170929045722
20150204115244
20170704090044
20170801063736
20150320115559
20140823164313
20171116012551
20141015070118
20160612053223
20171116122750
20171218050510
20141215100617
20150424170252
20141227025746
20170425084848
20140815030657
20141030090610
20170425113415
20141226190218
20150903033259
20150103172612
20150223004109
20180215055736
20150108025841
20170831043014
20141020093352
20141020205644
20150721110150
20150904091419
20150314225744
20150903062506
20170511060441
20180215065936
20150222095021
20171020075033
20151230033918
20171101024407
20171204122631
20150904091821
20180116071957
20171208115905
20150617192823
20140821073531
20161026134116
20150614165215
20150904081047
20141229045840
20171122131603
20151118095635
20150903062439
20150409225454
20160921101128
20171122112607
20150903064616
20141014190118
20141214020707
20141102033024
20171110023113
20150223144258
20170915083007
20141201082430
20171019023040
20160831062103
20141205211826
20180202025958
20170818063939
20141201133042
20160524102810
20140813133852
20171204054656
20150904081339
20171123152450
20170214114326
20160828090405
20171219160841
20171022223921
20140826051216
20170411061928
20150823112856
20150319235334
20150516010846
20151116105755
20150331005952
20150903071136
20170331061239
20161113145533
20171211103119
20170608102210
20150517115744
20170922083147
20171117075044
20180316064942
20170828080123
20150316093954
20150109041324
20140826051311
20171121081549
20150811105118
20141213100439
20160401094758
20170210015454
20141223095404
20161125153012
20171127190702
20171115161622
20150321000633
20180416055936
20180618045049
20180416085036
20180418113701
20180419101320
20180424044555
20180501073410
20180501074014
20180503081452
20180507115021
20180508105145
20180509093811
20180509094759
20180511120542
20180516095617
20180516165156
20180521150053
20180524051946
20180529125317
20180530061344
20180530102222
20180607143554
20180608153703
20180608154137
20180608160610
20180608160839
20180613081758
20180615054936
20180615071239
20180618123110
20180625132356
20180625132949
20180703091523
20180703091733
20180713050831
20180719134214
20180724021528
20180725013154
20180731101950
20180801015345
20180803030134
20180803030258
20180803051718
20180808030355
20180808032805
20180808034548
20180809010813
20180810043018
20180813092642
20180813104210
20180813104847
20180817100513
20180824050418
20180827065851
20180906223244
20180908043459
20180924100322
20181002070039
20181024054918
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schools (id, name, teacher_code, created_at, updated_at, creator_id, membership_level, licenses_purchased, membership_expires_on, premium_source_id, premium_source_type, source_id, district_id, organization_id, yearly_archive_date, source_provider, type) FROM stdin;
1	Test School	Uf5rz	2018-04-13 08:24:15.789359	2018-04-13 08:57:41.699201	1	2	200	2030-04-14	\N	\N	\N	\N	\N	2017-07-15	direct	School
\.


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.schools_id_seq', 1, true);


--
-- Data for Name: schools_standard_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schools_standard_types (id, school_id, standard_type_id) FROM stdin;
1	1	5
\.


--
-- Name: schools_standard_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.schools_standard_types_id_seq', 1, true);


--
-- Data for Name: schools_whitelisted_teachers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schools_whitelisted_teachers (school_id, whitelisted_teacher_id) FROM stdin;
\.


--
-- Data for Name: seed_migration_data_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.seed_migration_data_migrations (id, version, runtime, migrated_on) FROM stdin;
\.


--
-- Name: seed_migration_data_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.seed_migration_data_migrations_id_seq', 1, false);


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.settings (id, var, value, thing_id, thing_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Data for Name: sponsorships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sponsorships (id, subscription_id, student_id, created_at, updated_at, status) FROM stdin;
\.


--
-- Name: sponsorships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sponsorships_id_seq', 1, false);


--
-- Data for Name: standard_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.standard_types (id, name, created_at, updated_at) FROM stdin;
1	Language Arts Florida Standards (LAFS)	2018-04-13 08:22:39.203811	2018-04-13 08:22:39.203811
2	Language Arts Florida Standards (LAFS)	2018-04-13 08:22:39.210263	2018-04-13 08:22:39.210263
3	KB Test Standard Type	2018-04-13 08:22:39.213729	2018-04-13 08:22:39.213729
4	ACT	2018-04-13 08:22:39.217445	2018-04-13 08:22:39.217445
5	Common Core State Standards (CCSS) 	2018-04-13 08:22:39.221015	2018-04-13 08:22:39.221015
6	Texas Essential Knowledge and Skills (TEKS)	2018-04-13 08:22:39.224478	2018-04-13 08:22:39.224478
\.


--
-- Name: standard_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.standard_types_id_seq', 6, true);


--
-- Data for Name: standards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.standards (id, name, code, "position", created_at, updated_at, standard_type_id) FROM stdin;
\.


--
-- Name: standards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.standards_id_seq', 1, false);


--
-- Data for Name: stats_class_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_class_aggregates (id, klass_id, activity_date, total_points, reader_points, vocab_points, words_learned, quizzes_completed, total_questions, questions_correct, total_difficulty, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_class_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_class_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_class_cc_skill_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_class_cc_skill_aggregates (id, cc_skill_id, klass_id, activity_date, total_questions, questions_correct, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_class_cc_skill_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_class_cc_skill_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_class_zinc_skill_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_class_zinc_skill_aggregates (id, zinc_skill_id, klass_id, activity_date, total_questions, questions_correct, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_class_zinc_skill_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_class_zinc_skill_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_completed_quiz_attempt_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_completed_quiz_attempt_aggregates (id, quiz_attempt_id, user_id, activity_date, difficulty_level, questions_correct, total_questions, created_at, updated_at, points_scored, quiz_type) FROM stdin;
\.


--
-- Name: stats_completed_quiz_attempt_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_completed_quiz_attempt_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_deck_attempt_facts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_deck_attempt_facts (id, activity_date, user_id, deck_attempt_id, points, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_deck_attempt_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_deck_attempt_facts_id_seq', 1, false);


--
-- Data for Name: stats_learned_deck_participation_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_learned_deck_participation_aggregates (id, activity_date, user_id, deck_participation_id, number_of_words_learned, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_learned_deck_participation_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_learned_deck_participation_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_user_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_user_aggregates (id, activity_date, user_id, total_points, quizzes_completed, total_questions, questions_correct, reader_points, total_difficulty, vocab_points, words_learned, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_user_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_user_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_user_cc_skill_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_user_cc_skill_aggregates (id, cc_skill_id, user_id, activity_date, total_questions, questions_correct, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_user_cc_skill_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_user_cc_skill_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_user_zinc_skill_aggregates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_user_zinc_skill_aggregates (id, zinc_skill_id, user_id, activity_date, total_questions, questions_correct, created_at, updated_at) FROM stdin;
\.


--
-- Name: stats_user_zinc_skill_aggregates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_user_zinc_skill_aggregates_id_seq', 1, false);


--
-- Data for Name: stats_zinc_skill_facts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_zinc_skill_facts (id, zinc_skill_id, quiz_attempt_id, user_id, questions, questions_correct, created_at, updated_at, quiz_type) FROM stdin;
\.


--
-- Name: stats_zinc_skill_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_zinc_skill_facts_id_seq', 1, false);


--
-- Data for Name: student_klass_invitations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.student_klass_invitations (id, email, klass_id, created_at, updated_at, last_sent_on, code) FROM stdin;
\.


--
-- Name: student_klass_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.student_klass_invitations_id_seq', 1, true);


--
-- Data for Name: student_klass_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.student_klass_memberships (id, user_id, klass_id, created_at, updated_at) FROM stdin;
1	4	1	2018-04-13 09:00:42.385192	2018-04-13 09:00:42.385192
\.


--
-- Name: student_klass_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.student_klass_memberships_id_seq', 1, true);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscriptions (id, customer_id, customer_type, start_date, end_date, free_trial, created_at, updated_at, stopped_at, number_of_licenses, amount, unlimited_licenses) FROM stdin;
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- Data for Name: teacher_klass_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teacher_klass_memberships (id, user_id, klass_id, is_primary, created_at, updated_at) FROM stdin;
\.


--
-- Name: teacher_klass_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teacher_klass_memberships_id_seq', 1, false);


--
-- Data for Name: teachership_invitations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teachership_invitations (id, email, school_id, created_at, updated_at, last_sent_on, code) FROM stdin;
\.


--
-- Name: teachership_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachership_invitations_id_seq', 1, true);


--
-- Data for Name: teacherships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teacherships (id, school_id, user_id, created_at, updated_at, membership_level, licenses_purchased, membership_expires_on, premium_source_id, premium_source_type) FROM stdin;
1	1	2	2018-04-13 08:41:37.186801	2018-04-13 08:57:41.737503	3	0	2030-04-14	1	School
\.


--
-- Name: teacherships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teacherships_id_seq', 1, true);


--
-- Data for Name: user_unsubscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_unsubscriptions (id, user_id, reason, created_at) FROM stdin;
\.


--
-- Name: user_unsubscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_unsubscriptions_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, role, created_at, updated_at, first_name, last_name, nick_name, visited_vocab, points, receive_notifications, image, can_cheat, reader_points, vocab_points, last_completed_quiz_at, number_of_words_learned, number_of_quizzes_completed, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, last_active_on, show_dashboard_help, membership_level, licenses_purchased, membership_expires_on, premium_source_id, premium_source_type, referral_source, source_id, import_status, organization_id, source_domain, source_app_context_path, source_email_address, access_request_details, assignment_points, provider, uid, comparison_quiz_notified, unsubscribe_token, ytd_points, requires_reset_password, crg_notified, policy_acceptance_date, discarded_at, source_provider, grade, district_id, type, username) FROM stdin;
3	fagun+admin@zinclearninglabs.com	$2a$10$9eFC9fSKiD65uov0Vqky7ufH/j81lM/kq6TmM9ACJp1wDxuvdaIdC	\N	\N	\N	4	2018-04-16 02:49:15.053853	2018-04-13 08:59:10.111327	127.0.0.1	127.0.0.1	2	2018-04-13 08:56:29.375076	2018-11-01 04:26:35.967552	FagunAdmin	Bhavsar	Admin User	f	0	t	\N	f	0	0	\N	0	0	pNpGaVyzByTXjKBAL-C2	2018-04-13 08:56:37.211172	2018-04-13 08:56:29.375363	\N	\N	t	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.0	\N	\N	f	KyP5BVNEP9gZ9_0E86TZ9lKeP9Ig1dW18-TK44NMlGBJKz4aNialfkGjY65F	0	f	f	\N	\N	direct	\N	\N	User	\N
2	bfagun@yahoo.co.in	$2a$10$6BrDTeIZO0eyyK6EtceUGOV99X54Rj2lPh225fB30xoWerAMuYH3y	\N	\N	\N	2	2018-04-16 02:49:48.003582	2018-04-13 08:48:05.484627	127.0.0.1	127.0.0.1	1	2018-04-13 08:41:37.132564	2018-11-01 04:26:36.0402	Fagun	Bhavsar	Teacher User	f	0	t	\N	f	0	0	\N	0	0	\N	2018-04-13 08:41:37.129491	\N	\N	\N	t	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.0	\N	\N	f	T1t3D16KZDbzwukDP6ZzXW3Ld4tK9KKTUhlzT5HRw6tUPwt_7Wiwa9WVIp_0	0	f	f	2018-04-13	\N	direct	\N	\N	User	\N
4	fagun.bhavsar@gmail.com	$2a$10$X/GDjcMKLfmJTFUeX.JPuOtlK3ruvdDpcIUsiAw7ChL.niFiL/3Iu	\N	\N	\N	3	2018-04-16 09:57:14.575747	2018-04-16 02:48:12.02835	127.0.0.1	127.0.0.1	0	2018-04-13 09:00:42.349849	2018-11-01 04:26:36.175634	FagunStudent	Bhavsar	Student User	f	0	t	\N	f	0	0	\N	0	0	\N	2018-04-13 09:00:42.347727	\N	\N	\N	t	3	0	2030-04-14	1	School	\N	\N	\N	\N	\N	\N	\N	\N	0.0	\N	\N	f	Wjyp8Bp1GGnigR0myAR2lainmTIKRF6c-KSiKj5S74lgWQgGXj-qvv_Mzys8	0	f	f	2018-04-13	\N	direct	\N	\N	User	\N
1	fagun@zinclearninglabs.com	$2a$10$cJmperL5f5AtTsbAjNIpGus/BCLDnV0y0Kk7htsOSZf3LMcznY96e	\N	\N	\N	7	2018-11-01 05:29:38.182814	2018-11-01 05:26:03.668576	127.0.0.1	127.0.0.1	3	2018-04-13 08:12:33.672605	2018-11-01 05:29:38.184419	Fagun	Bhavsar	fbhavsar	f	0	t	\N	f	0	0	\N	0	0	vMTpZ2UZ77dEGmRDojjP	2018-04-13 08:13:12.644028	2018-04-13 08:12:33.673009	\N	\N	t	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.0	\N	\N	f	PGy-RpBYpbmY9hvIhgN4tFGp3PHtkz0gPma6fHT5V0BB9v6V0hNQz1qylxdV	0	f	f	\N	\N	direct	\N	\N	User	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Data for Name: vocab_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_categories (id, name, created_at, updated_at, "position", only_for_site_admin) FROM stdin;
\.


--
-- Name: vocab_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_categories_id_seq', 1, false);


--
-- Data for Name: vocab_categories_sets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_categories_sets (id, set_id, category_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_categories_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_categories_sets_id_seq', 1, false);


--
-- Data for Name: vocab_deck_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_deck_attempts (id, created_at, updated_at, points, game_id) FROM stdin;
\.


--
-- Name: vocab_deck_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_deck_attempts_id_seq', 1, false);


--
-- Data for Name: vocab_deck_participations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_deck_participations (id, set_participation_id, deck_id, created_at, updated_at, status, enable_at, end_bonus_at, last_bonus_started_at, progress, learned_at, word_bank_intro_complete, last_played_on, bonus_multiplier, word_count) FROM stdin;
\.


--
-- Name: vocab_deck_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_deck_participations_id_seq', 1, false);


--
-- Data for Name: vocab_decks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_decks (id, number, set_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_decks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_decks_id_seq', 1, false);


--
-- Data for Name: vocab_decks_words; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_decks_words (id, deck_id, word_id) FROM stdin;
\.


--
-- Name: vocab_decks_words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_decks_words_id_seq', 1, false);


--
-- Data for Name: vocab_derived_words; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_derived_words (id, word, base_word_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_derived_words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_derived_words_id_seq', 1, false);


--
-- Data for Name: vocab_exposure_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_exposure_plans (id, number, created_at, updated_at, master_plan_id, restart_on_error, require_correct_answer_streak, replay_wrong_answers) FROM stdin;
\.


--
-- Name: vocab_exposure_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_exposure_plans_id_seq', 1, false);


--
-- Data for Name: vocab_exposure_stages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_exposure_stages (id, "position", disable_next_stage_for, bonus_multiplier, game_plan_id, exposure_plan_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_exposure_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_exposure_stages_id_seq', 1, false);


--
-- Data for Name: vocab_exposures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_exposures (id, deck_participation_id, created_at, updated_at, exposure_plan_id, status) FROM stdin;
\.


--
-- Name: vocab_exposures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_exposures_id_seq', 1, false);


--
-- Data for Name: vocab_game_modes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_game_modes (id, name, display_name, points_per_word, time_limit_in_seconds, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_game_modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_game_modes_id_seq', 1, false);


--
-- Data for Name: vocab_game_modes_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_game_modes_plans (id, game_mode_id, game_plan_id) FROM stdin;
\.


--
-- Name: vocab_game_modes_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_game_modes_plans_id_seq', 1, false);


--
-- Data for Name: vocab_game_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_game_plans (id, name, display_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_game_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_game_plans_id_seq', 1, false);


--
-- Data for Name: vocab_games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_games (id, exposure_id, exposure_stage_id, created_at, updated_at, locked, bonus_expired, completed) FROM stdin;
\.


--
-- Name: vocab_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_games_id_seq', 1, false);


--
-- Data for Name: vocab_grades; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_grades (id, name, "position", created_at, updated_at, level) FROM stdin;
\.


--
-- Name: vocab_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_grades_id_seq', 1, false);


--
-- Data for Name: vocab_grades_sets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_grades_sets (id, set_id, grade_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_grades_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_grades_sets_id_seq', 1, false);


--
-- Data for Name: vocab_master_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_master_plans (id, name, use_points, visible_in_dashboard, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_master_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_master_plans_id_seq', 1, false);


--
-- Data for Name: vocab_part_of_speech_words; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_part_of_speech_words (id, word_id, part_of_speech_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_part_of_speech_words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_part_of_speech_words_id_seq', 1, false);


--
-- Data for Name: vocab_parts_of_speech; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_parts_of_speech (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_parts_of_speech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_parts_of_speech_id_seq', 1, false);


--
-- Data for Name: vocab_parts_of_speech_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_parts_of_speech_translations (id, vocab_parts_of_speech_id, locale, created_at, updated_at, name) FROM stdin;
\.


--
-- Name: vocab_parts_of_speech_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_parts_of_speech_translations_id_seq', 1, false);


--
-- Data for Name: vocab_set_participations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_set_participations (id, set_id, user_id, assignment_id, created_at, updated_at, orientation_complete, progress, number_of_exposures_completed, learned_at, completed_at, points, vocab_game_mode, timer_enabled, locale) FROM stdin;
\.


--
-- Name: vocab_set_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_set_participations_id_seq', 1, false);


--
-- Data for Name: vocab_sets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_sets (id, title, description, created_at, updated_at, user_id, image, type_option, quiz_id, teachers_description, locale) FROM stdin;
\.


--
-- Name: vocab_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_sets_id_seq', 1, false);


--
-- Data for Name: vocab_sets_words; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_sets_words (id, set_id, word_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_sets_words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_sets_words_id_seq', 1, false);


--
-- Data for Name: vocab_synonyms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_synonyms (id, name, word_id, created_at, updated_at, locale) FROM stdin;
\.


--
-- Name: vocab_synonyms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_synonyms_id_seq', 1, false);


--
-- Data for Name: vocab_word_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_word_attempts (id, word_id, deck_attempt_id, correct, time_taken, created_at, updated_at, word_bank_used, points, game_mode_id) FROM stdin;
\.


--
-- Name: vocab_word_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_word_attempts_id_seq', 1, false);


--
-- Data for Name: vocab_word_synonym_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_word_synonym_options (id, word_id, correct, created_at, updated_at, name, locale) FROM stdin;
\.


--
-- Name: vocab_word_synonym_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_word_synonym_options_id_seq', 1, false);


--
-- Data for Name: vocab_word_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_word_translations (id, vocab_word_id, locale, created_at, updated_at, meaning, example_sentence, sentence_form) FROM stdin;
\.


--
-- Name: vocab_word_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_word_translations_id_seq', 1, false);


--
-- Data for Name: vocab_words; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_words (id, word, hints, image, part_of_speech, pronunciation, created_at, updated_at, stem, priority, pronunciation_audio, watch_word, difficulty_level, main_part_of_speech_id, valid_forms, word_element_type) FROM stdin;
\.


--
-- Name: vocab_words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_words_id_seq', 1, false);


--
-- Data for Name: vocab_wrong_image_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vocab_wrong_image_options (id, word_id, option_word_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vocab_wrong_image_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vocab_wrong_image_options_id_seq', 1, false);


--
-- Data for Name: whitelisted_teachers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.whitelisted_teachers (id, email, created_at, updated_at) FROM stdin;
\.


--
-- Name: whitelisted_teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.whitelisted_teachers_id_seq', 1, false);


--
-- Data for Name: wupee_notification_type_configurations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wupee_notification_type_configurations (id, notification_type_id, receiver_id, receiver_type, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: wupee_notification_type_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wupee_notification_type_configurations_id_seq', 1, false);


--
-- Data for Name: wupee_notification_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wupee_notification_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: wupee_notification_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wupee_notification_types_id_seq', 1, false);


--
-- Data for Name: wupee_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wupee_notifications (id, receiver_id, receiver_type, attached_object_id, attached_object_type, notification_type_id, is_read, is_sent, created_at, updated_at, is_hidden) FROM stdin;
\.


--
-- Name: wupee_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wupee_notifications_id_seq', 1, false);


--
-- Data for Name: zinc_skill_standards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.zinc_skill_standards (id, zinc_skill_id, standard_id) FROM stdin;
\.


--
-- Name: zinc_skill_standards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zinc_skill_standards_id_seq', 1, false);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: adminships adminships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.adminships
    ADD CONSTRAINT adminships_pkey PRIMARY KEY (id);


--
-- Name: announcement_interactions announcement_interactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcement_interactions
    ADD CONSTRAINT announcement_interactions_pkey PRIMARY KEY (id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: api_users api_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.api_users
    ADD CONSTRAINT api_users_pkey PRIMARY KEY (id);


--
-- Name: assessment_answers assessment_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_answers
    ADD CONSTRAINT assessment_answers_pkey PRIMARY KEY (id);


--
-- Name: assessment_choices assessment_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_choices
    ADD CONSTRAINT assessment_choices_pkey PRIMARY KEY (id);


--
-- Name: assessment_diagnostic_participations_assignments assessment_diagnostic_participations_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_diagnostic_participations_assignments
    ADD CONSTRAINT assessment_diagnostic_participations_assignments_pkey PRIMARY KEY (id);


--
-- Name: assessment_diagnostic_participations assessment_diagnostic_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_diagnostic_participations
    ADD CONSTRAINT assessment_diagnostic_participations_pkey PRIMARY KEY (id);


--
-- Name: assessment_diagnostics assessment_diagnostics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_diagnostics
    ADD CONSTRAINT assessment_diagnostics_pkey PRIMARY KEY (id);


--
-- Name: assessment_ordered_passages assessment_ordered_passages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_ordered_passages
    ADD CONSTRAINT assessment_ordered_passages_pkey PRIMARY KEY (id);


--
-- Name: assessment_passages assessment_passages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_passages
    ADD CONSTRAINT assessment_passages_pkey PRIMARY KEY (id);


--
-- Name: assessment_questions assessment_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_questions
    ADD CONSTRAINT assessment_questions_pkey PRIMARY KEY (id);


--
-- Name: assessment_section_transitions assessment_section_transitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_section_transitions
    ADD CONSTRAINT assessment_section_transitions_pkey PRIMARY KEY (id);


--
-- Name: assessment_sections assessment_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_sections
    ADD CONSTRAINT assessment_sections_pkey PRIMARY KEY (id);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: assignments_reader_quiz_attempts assignments_reader_quiz_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments_reader_quiz_attempts
    ADD CONSTRAINT assignments_reader_quiz_attempts_pkey PRIMARY KEY (id);


--
-- Name: assignments_vocab_set_participations assignments_vocab_set_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments_vocab_set_participations
    ADD CONSTRAINT assignments_vocab_set_participations_pkey PRIMARY KEY (id);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: category_types category_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_types
    ADD CONSTRAINT category_types_pkey PRIMARY KEY (id);


--
-- Name: clever_district_imports clever_district_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_district_imports
    ADD CONSTRAINT clever_district_imports_pkey PRIMARY KEY (id);


--
-- Name: clever_district_syncs clever_district_syncs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_district_syncs
    ADD CONSTRAINT clever_district_syncs_pkey PRIMARY KEY (id);


--
-- Name: clever_entities clever_entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_entities
    ADD CONSTRAINT clever_entities_pkey PRIMARY KEY (id);


--
-- Name: clever_imports clever_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_imports
    ADD CONSTRAINT clever_imports_pkey PRIMARY KEY (id);


--
-- Name: clever_schools_imports clever_schools_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_schools_imports
    ADD CONSTRAINT clever_schools_imports_pkey PRIMARY KEY (id);


--
-- Name: clever_student_imports clever_student_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_student_imports
    ADD CONSTRAINT clever_student_imports_pkey PRIMARY KEY (id);


--
-- Name: clever_teacher_imports clever_teacher_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clever_teacher_imports
    ADD CONSTRAINT clever_teacher_imports_pkey PRIMARY KEY (id);


--
-- Name: content_categories content_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_categories
    ADD CONSTRAINT content_categories_pkey PRIMARY KEY (id);


--
-- Name: content_categories_reader_quizzes content_categories_reader_quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_categories_reader_quizzes
    ADD CONSTRAINT content_categories_reader_quizzes_pkey PRIMARY KEY (id);


--
-- Name: crg_choices crg_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_choices
    ADD CONSTRAINT crg_choices_pkey PRIMARY KEY (id);


--
-- Name: crg_drag_and_drop_phrases crg_drag_and_drop_phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_drag_and_drop_phrases
    ADD CONSTRAINT crg_drag_and_drop_phrases_pkey PRIMARY KEY (id);


--
-- Name: crg_drag_drop_phrase_attempts crg_drag_drop_phrase_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_drag_drop_phrase_attempts
    ADD CONSTRAINT crg_drag_drop_phrase_attempts_pkey PRIMARY KEY (id);


--
-- Name: crg_find_phrases_answers crg_find_phrases_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_find_phrases_answers
    ADD CONSTRAINT crg_find_phrases_answers_pkey PRIMARY KEY (id);


--
-- Name: crg_find_phrases_attempts crg_find_phrases_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_find_phrases_attempts
    ADD CONSTRAINT crg_find_phrases_attempts_pkey PRIMARY KEY (id);


--
-- Name: crg_find_phrases crg_find_phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_find_phrases
    ADD CONSTRAINT crg_find_phrases_pkey PRIMARY KEY (id);


--
-- Name: crg_focus_phrases crg_focus_phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_focus_phrases
    ADD CONSTRAINT crg_focus_phrases_pkey PRIMARY KEY (id);


--
-- Name: crg_lesson_participations crg_lesson_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_lesson_participations
    ADD CONSTRAINT crg_lesson_participations_pkey PRIMARY KEY (id);


--
-- Name: crg_lessons crg_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_lessons
    ADD CONSTRAINT crg_lessons_pkey PRIMARY KEY (id);


--
-- Name: crg_multiple_choice_question_attempts crg_multiple_choice_question_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_multiple_choice_question_attempts
    ADD CONSTRAINT crg_multiple_choice_question_attempts_pkey PRIMARY KEY (id);


--
-- Name: crg_multiple_choice_questions crg_multiple_choice_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_multiple_choice_questions
    ADD CONSTRAINT crg_multiple_choice_questions_pkey PRIMARY KEY (id);


--
-- Name: crg_narrator_skill_videos crg_narrator_skill_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_narrator_skill_videos
    ADD CONSTRAINT crg_narrator_skill_videos_pkey PRIMARY KEY (id);


--
-- Name: crg_narrators crg_narrators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_narrators
    ADD CONSTRAINT crg_narrators_pkey PRIMARY KEY (id);


--
-- Name: crg_ordered_passages crg_ordered_passages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_ordered_passages
    ADD CONSTRAINT crg_ordered_passages_pkey PRIMARY KEY (id);


--
-- Name: crg_ordered_scene_elements crg_ordered_scene_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_ordered_scene_elements
    ADD CONSTRAINT crg_ordered_scene_elements_pkey PRIMARY KEY (id);


--
-- Name: crg_passage_responses crg_passage_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_passage_responses
    ADD CONSTRAINT crg_passage_responses_pkey PRIMARY KEY (id);


--
-- Name: crg_passages crg_passages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_passages
    ADD CONSTRAINT crg_passages_pkey PRIMARY KEY (id);


--
-- Name: crg_phrases crg_phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_phrases
    ADD CONSTRAINT crg_phrases_pkey PRIMARY KEY (id);


--
-- Name: crg_poll_answers crg_poll_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_poll_answers
    ADD CONSTRAINT crg_poll_answers_pkey PRIMARY KEY (id);


--
-- Name: crg_poll_responses crg_poll_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_poll_responses
    ADD CONSTRAINT crg_poll_responses_pkey PRIMARY KEY (id);


--
-- Name: crg_polls crg_polls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_polls
    ADD CONSTRAINT crg_polls_pkey PRIMARY KEY (id);


--
-- Name: crg_previous_response_options crg_previous_response_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_previous_response_options
    ADD CONSTRAINT crg_previous_response_options_pkey PRIMARY KEY (id);


--
-- Name: crg_quotes crg_quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_quotes
    ADD CONSTRAINT crg_quotes_pkey PRIMARY KEY (id);


--
-- Name: crg_scenes crg_scenes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_scenes
    ADD CONSTRAINT crg_scenes_pkey PRIMARY KEY (id);


--
-- Name: crg_show_quotes crg_show_quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_show_quotes
    ADD CONSTRAINT crg_show_quotes_pkey PRIMARY KEY (id);


--
-- Name: crg_text_entries crg_text_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_text_entries
    ADD CONSTRAINT crg_text_entries_pkey PRIMARY KEY (id);


--
-- Name: crg_text_entry_responses crg_text_entry_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_text_entry_responses
    ADD CONSTRAINT crg_text_entry_responses_pkey PRIMARY KEY (id);


--
-- Name: crg_text_prompts crg_text_prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_text_prompts
    ADD CONSTRAINT crg_text_prompts_pkey PRIMARY KEY (id);


--
-- Name: crg_video_prompts crg_video_prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_video_prompts
    ADD CONSTRAINT crg_video_prompts_pkey PRIMARY KEY (id);


--
-- Name: crg_videos crg_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_videos
    ADD CONSTRAINT crg_videos_pkey PRIMARY KEY (id);


--
-- Name: crg_zinc_primary_skills crg_zinc_primary_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_zinc_primary_skills
    ADD CONSTRAINT crg_zinc_primary_skills_pkey PRIMARY KEY (id);


--
-- Name: crg_zinc_sub_skills crg_zinc_sub_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crg_zinc_sub_skills
    ADD CONSTRAINT crg_zinc_sub_skills_pkey PRIMARY KEY (id);


--
-- Name: district_adminships district_adminships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.district_adminships
    ADD CONSTRAINT district_adminships_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: feature_flags feature_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_flags
    ADD CONSTRAINT feature_flags_pkey PRIMARY KEY (id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: google_classroom_registrations google_classroom_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.google_classroom_registrations
    ADD CONSTRAINT google_classroom_registrations_pkey PRIMARY KEY (id);


--
-- Name: klasses klasses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klasses
    ADD CONSTRAINT klasses_pkey PRIMARY KEY (id);


--
-- Name: login_keys login_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_keys
    ADD CONSTRAINT login_keys_pkey PRIMARY KEY (id);


--
-- Name: master_zinc_skills master_zinc_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_zinc_skills
    ADD CONSTRAINT master_zinc_skills_pkey PRIMARY KEY (id);


--
-- Name: membership_transactions membership_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.membership_transactions
    ADD CONSTRAINT membership_transactions_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: oauth_credentials oauth_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_credentials
    ADD CONSTRAINT oauth_credentials_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: reader_answers reader_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_answers
    ADD CONSTRAINT reader_answers_pkey PRIMARY KEY (id);


--
-- Name: reader_channels reader_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_channels
    ADD CONSTRAINT reader_channels_pkey PRIMARY KEY (id);


--
-- Name: reader_channels_quizzes reader_channels_quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_channels_quizzes
    ADD CONSTRAINT reader_channels_quizzes_pkey PRIMARY KEY (id);


--
-- Name: reader_comparison_quiz_simple_quizzes reader_comparison_quiz_simple_quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_comparison_quiz_simple_quizzes
    ADD CONSTRAINT reader_comparison_quiz_simple_quizzes_pkey PRIMARY KEY (id);


--
-- Name: reader_difficulty_levels reader_difficulty_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_difficulty_levels
    ADD CONSTRAINT reader_difficulty_levels_pkey PRIMARY KEY (id);


--
-- Name: reader_question_attempts reader_question_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_question_attempts
    ADD CONSTRAINT reader_question_attempts_pkey PRIMARY KEY (id);


--
-- Name: reader_questions reader_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_questions
    ADD CONSTRAINT reader_questions_pkey PRIMARY KEY (id);


--
-- Name: reader_questions_zinc_skills reader_questions_zinc_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_questions_zinc_skills
    ADD CONSTRAINT reader_questions_zinc_skills_pkey PRIMARY KEY (id);


--
-- Name: reader_quiz_attempts reader_quiz_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quiz_attempts
    ADD CONSTRAINT reader_quiz_attempts_pkey PRIMARY KEY (id);


--
-- Name: reader_quiz_meta_infos reader_quiz_meta_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quiz_meta_infos
    ADD CONSTRAINT reader_quiz_meta_infos_pkey PRIMARY KEY (id);


--
-- Name: reader_quizzes reader_quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quizzes
    ADD CONSTRAINT reader_quizzes_pkey PRIMARY KEY (id);


--
-- Name: reader_quizzes_tags reader_quizzes_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quizzes_tags
    ADD CONSTRAINT reader_quizzes_tags_pkey PRIMARY KEY (id);


--
-- Name: reader_quizzes_zinc_skills reader_quizzes_zinc_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_quizzes_zinc_skills
    ADD CONSTRAINT reader_quizzes_zinc_skills_pkey PRIMARY KEY (id);


--
-- Name: reader_tags reader_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_tags
    ADD CONSTRAINT reader_tags_pkey PRIMARY KEY (id);


--
-- Name: reader_word_count_bonus_rule_sets reader_word_count_bonus_rule_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_word_count_bonus_rule_sets
    ADD CONSTRAINT reader_word_count_bonus_rule_sets_pkey PRIMARY KEY (id);


--
-- Name: reader_word_count_bonus_rules reader_word_count_bonus_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_word_count_bonus_rules
    ADD CONSTRAINT reader_word_count_bonus_rules_pkey PRIMARY KEY (id);


--
-- Name: reader_zinc_skills reader_zinc_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reader_zinc_skills
    ADD CONSTRAINT reader_zinc_skills_pkey PRIMARY KEY (id);


--
-- Name: reading_levels reading_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reading_levels
    ADD CONSTRAINT reading_levels_pkey PRIMARY KEY (id);


--
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- Name: schools_standard_types schools_standard_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schools_standard_types
    ADD CONSTRAINT schools_standard_types_pkey PRIMARY KEY (id);


--
-- Name: seed_migration_data_migrations seed_migration_data_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seed_migration_data_migrations
    ADD CONSTRAINT seed_migration_data_migrations_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: sponsorships sponsorships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sponsorships
    ADD CONSTRAINT sponsorships_pkey PRIMARY KEY (id);


--
-- Name: standard_types standard_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.standard_types
    ADD CONSTRAINT standard_types_pkey PRIMARY KEY (id);


--
-- Name: standards standards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.standards
    ADD CONSTRAINT standards_pkey PRIMARY KEY (id);


--
-- Name: stats_class_aggregates stats_class_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_class_aggregates
    ADD CONSTRAINT stats_class_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_class_cc_skill_aggregates stats_class_cc_skill_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_class_cc_skill_aggregates
    ADD CONSTRAINT stats_class_cc_skill_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_class_zinc_skill_aggregates stats_class_zinc_skill_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_class_zinc_skill_aggregates
    ADD CONSTRAINT stats_class_zinc_skill_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_completed_quiz_attempt_aggregates stats_completed_quiz_attempt_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_completed_quiz_attempt_aggregates
    ADD CONSTRAINT stats_completed_quiz_attempt_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_deck_attempt_facts stats_deck_attempt_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_deck_attempt_facts
    ADD CONSTRAINT stats_deck_attempt_facts_pkey PRIMARY KEY (id);


--
-- Name: stats_learned_deck_participation_aggregates stats_learned_deck_participation_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_learned_deck_participation_aggregates
    ADD CONSTRAINT stats_learned_deck_participation_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_user_aggregates stats_user_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_user_aggregates
    ADD CONSTRAINT stats_user_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_user_cc_skill_aggregates stats_user_cc_skill_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_user_cc_skill_aggregates
    ADD CONSTRAINT stats_user_cc_skill_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_user_zinc_skill_aggregates stats_user_zinc_skill_aggregates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_user_zinc_skill_aggregates
    ADD CONSTRAINT stats_user_zinc_skill_aggregates_pkey PRIMARY KEY (id);


--
-- Name: stats_zinc_skill_facts stats_zinc_skill_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_zinc_skill_facts
    ADD CONSTRAINT stats_zinc_skill_facts_pkey PRIMARY KEY (id);


--
-- Name: student_klass_invitations student_klass_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_klass_invitations
    ADD CONSTRAINT student_klass_invitations_pkey PRIMARY KEY (id);


--
-- Name: student_klass_memberships student_klass_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_klass_memberships
    ADD CONSTRAINT student_klass_memberships_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: teacher_klass_memberships teacher_klass_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_klass_memberships
    ADD CONSTRAINT teacher_klass_memberships_pkey PRIMARY KEY (id);


--
-- Name: teachership_invitations teachership_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachership_invitations
    ADD CONSTRAINT teachership_invitations_pkey PRIMARY KEY (id);


--
-- Name: teacherships teacherships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacherships
    ADD CONSTRAINT teacherships_pkey PRIMARY KEY (id);


--
-- Name: user_unsubscriptions user_unsubscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_unsubscriptions
    ADD CONSTRAINT user_unsubscriptions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vocab_categories vocab_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_categories
    ADD CONSTRAINT vocab_categories_pkey PRIMARY KEY (id);


--
-- Name: vocab_categories_sets vocab_categories_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_categories_sets
    ADD CONSTRAINT vocab_categories_sets_pkey PRIMARY KEY (id);


--
-- Name: vocab_deck_attempts vocab_deck_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_deck_attempts
    ADD CONSTRAINT vocab_deck_attempts_pkey PRIMARY KEY (id);


--
-- Name: vocab_deck_participations vocab_deck_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_deck_participations
    ADD CONSTRAINT vocab_deck_participations_pkey PRIMARY KEY (id);


--
-- Name: vocab_decks vocab_decks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_decks
    ADD CONSTRAINT vocab_decks_pkey PRIMARY KEY (id);


--
-- Name: vocab_decks_words vocab_decks_words_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_decks_words
    ADD CONSTRAINT vocab_decks_words_pkey PRIMARY KEY (id);


--
-- Name: vocab_derived_words vocab_derived_words_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_derived_words
    ADD CONSTRAINT vocab_derived_words_pkey PRIMARY KEY (id);


--
-- Name: vocab_exposure_plans vocab_exposure_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_exposure_plans
    ADD CONSTRAINT vocab_exposure_plans_pkey PRIMARY KEY (id);


--
-- Name: vocab_exposure_stages vocab_exposure_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_exposure_stages
    ADD CONSTRAINT vocab_exposure_stages_pkey PRIMARY KEY (id);


--
-- Name: vocab_exposures vocab_exposures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_exposures
    ADD CONSTRAINT vocab_exposures_pkey PRIMARY KEY (id);


--
-- Name: vocab_game_modes vocab_game_modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_game_modes
    ADD CONSTRAINT vocab_game_modes_pkey PRIMARY KEY (id);


--
-- Name: vocab_game_modes_plans vocab_game_modes_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_game_modes_plans
    ADD CONSTRAINT vocab_game_modes_plans_pkey PRIMARY KEY (id);


--
-- Name: vocab_game_plans vocab_game_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_game_plans
    ADD CONSTRAINT vocab_game_plans_pkey PRIMARY KEY (id);


--
-- Name: vocab_games vocab_games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_games
    ADD CONSTRAINT vocab_games_pkey PRIMARY KEY (id);


--
-- Name: vocab_grades vocab_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_grades
    ADD CONSTRAINT vocab_grades_pkey PRIMARY KEY (id);


--
-- Name: vocab_grades_sets vocab_grades_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_grades_sets
    ADD CONSTRAINT vocab_grades_sets_pkey PRIMARY KEY (id);


--
-- Name: vocab_master_plans vocab_master_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_master_plans
    ADD CONSTRAINT vocab_master_plans_pkey PRIMARY KEY (id);


--
-- Name: vocab_part_of_speech_words vocab_part_of_speech_words_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_part_of_speech_words
    ADD CONSTRAINT vocab_part_of_speech_words_pkey PRIMARY KEY (id);


--
-- Name: vocab_parts_of_speech vocab_parts_of_speech_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_parts_of_speech
    ADD CONSTRAINT vocab_parts_of_speech_pkey PRIMARY KEY (id);


--
-- Name: vocab_parts_of_speech_translations vocab_parts_of_speech_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_parts_of_speech_translations
    ADD CONSTRAINT vocab_parts_of_speech_translations_pkey PRIMARY KEY (id);


--
-- Name: vocab_set_participations vocab_set_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_set_participations
    ADD CONSTRAINT vocab_set_participations_pkey PRIMARY KEY (id);


--
-- Name: vocab_sets vocab_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_sets
    ADD CONSTRAINT vocab_sets_pkey PRIMARY KEY (id);


--
-- Name: vocab_sets_words vocab_sets_words_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_sets_words
    ADD CONSTRAINT vocab_sets_words_pkey PRIMARY KEY (id);


--
-- Name: vocab_synonyms vocab_synonyms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_synonyms
    ADD CONSTRAINT vocab_synonyms_pkey PRIMARY KEY (id);


--
-- Name: vocab_word_attempts vocab_word_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_word_attempts
    ADD CONSTRAINT vocab_word_attempts_pkey PRIMARY KEY (id);


--
-- Name: vocab_word_synonym_options vocab_word_synonym_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_word_synonym_options
    ADD CONSTRAINT vocab_word_synonym_options_pkey PRIMARY KEY (id);


--
-- Name: vocab_word_translations vocab_word_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_word_translations
    ADD CONSTRAINT vocab_word_translations_pkey PRIMARY KEY (id);


--
-- Name: vocab_words vocab_words_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_words
    ADD CONSTRAINT vocab_words_pkey PRIMARY KEY (id);


--
-- Name: vocab_wrong_image_options vocab_wrong_image_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vocab_wrong_image_options
    ADD CONSTRAINT vocab_wrong_image_options_pkey PRIMARY KEY (id);


--
-- Name: whitelisted_teachers whitelisted_teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.whitelisted_teachers
    ADD CONSTRAINT whitelisted_teachers_pkey PRIMARY KEY (id);


--
-- Name: wupee_notification_type_configurations wupee_notification_type_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notification_type_configurations
    ADD CONSTRAINT wupee_notification_type_configurations_pkey PRIMARY KEY (id);


--
-- Name: wupee_notification_types wupee_notification_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notification_types
    ADD CONSTRAINT wupee_notification_types_pkey PRIMARY KEY (id);


--
-- Name: wupee_notifications wupee_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notifications
    ADD CONSTRAINT wupee_notifications_pkey PRIMARY KEY (id);


--
-- Name: zinc_skill_standards zinc_skill_standards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zinc_skill_standards
    ADD CONSTRAINT zinc_skill_standards_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX associated_index ON public.audits USING btree (associated_id, associated_type);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auditable_index ON public.audits USING btree (auditable_id, auditable_type);


--
-- Name: comparison_quiz_id_simple_quiz_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX comparison_quiz_id_simple_quiz_id_index ON public.reader_comparison_quiz_simple_quizzes USING btree (simple_quiz_id, comparison_quiz_id);


--
-- Name: idx_answers_on_diagnosis_question; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_answers_on_diagnosis_question ON public.assessment_answers USING btree (diagnostic_participation_id, question_id);


--
-- Name: idx_crg_dnd_attempt_dnd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crg_dnd_attempt_dnd ON public.crg_drag_drop_phrase_attempts USING btree (drag_and_drop_phrase_id);


--
-- Name: idx_crg_dnd_attempt_on_passage_response; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crg_dnd_attempt_on_passage_response ON public.crg_drag_drop_phrase_attempts USING btree (passage_response_id);


--
-- Name: idx_crg_mcq_attempt_mcq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crg_mcq_attempt_mcq ON public.crg_multiple_choice_question_attempts USING btree (multiple_choice_question_id);


--
-- Name: idx_crg_mcq_attempt_on_passage_response; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crg_mcq_attempt_on_passage_response ON public.crg_multiple_choice_question_attempts USING btree (passage_response_id);


--
-- Name: idx_crg_mcq_attempt_selected_choice; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crg_mcq_attempt_selected_choice ON public.crg_multiple_choice_question_attempts USING btree (selected_choice_id);


--
-- Name: idx_highlight_interaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_highlight_interaction_id ON public.crg_find_phrases_answers USING btree (find_phrases_id);


--
-- Name: idx_passage_response_on_user_and_passage; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_passage_response_on_user_and_passage ON public.crg_passage_responses USING btree (user_id, passage_id);


--
-- Name: idx_transitions_on_destination; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_transitions_on_destination ON public.assessment_section_transitions USING btree (destination_type, destination_id);


--
-- Name: idx_unique_user_and_diagnostic; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_user_and_diagnostic ON public.assessment_diagnostic_participations USING btree (user_id, diagnostic_id);


--
-- Name: idx_wupee_notif_typ_config_on_receiver_type_and_receiver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wupee_notif_typ_config_on_receiver_type_and_receiver_id ON public.wupee_notification_type_configurations USING btree (receiver_type, receiver_id);


--
-- Name: idx_wupee_notif_type_config_on_notification_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wupee_notif_type_config_on_notification_type_id ON public.wupee_notification_type_configurations USING btree (notification_type_id);


--
-- Name: index_78274eb4a52047861c4ec9acb9986aec52cdd98c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_78274eb4a52047861c4ec9acb9986aec52cdd98c ON public.vocab_parts_of_speech_translations USING btree (vocab_parts_of_speech_id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_adminships_on_school_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_adminships_on_school_id ON public.adminships USING btree (school_id);


--
-- Name: index_adminships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_adminships_on_user_id ON public.adminships USING btree (user_id);


--
-- Name: index_adminships_on_user_id_and_school_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_adminships_on_user_id_and_school_id ON public.adminships USING btree (user_id, school_id);


--
-- Name: index_announcement_interactions_on_announcement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcement_interactions_on_announcement_id ON public.announcement_interactions USING btree (announcement_id);


--
-- Name: index_announcement_interactions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcement_interactions_on_user_id ON public.announcement_interactions USING btree (user_id);


--
-- Name: index_announcement_interactions_on_user_id_and_announcement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_announcement_interactions_on_user_id_and_announcement_id ON public.announcement_interactions USING btree (user_id, announcement_id);


--
-- Name: index_api_users_on_api_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_api_users_on_api_key ON public.api_users USING btree (api_key);


--
-- Name: index_api_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_api_users_on_user_id ON public.api_users USING btree (user_id);


--
-- Name: index_assessment_answers_on_diagnostic_participation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_answers_on_diagnostic_participation_id ON public.assessment_answers USING btree (diagnostic_participation_id);


--
-- Name: index_assessment_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_answers_on_question_id ON public.assessment_answers USING btree (question_id);


--
-- Name: index_assessment_choices_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_choices_on_question_id ON public.assessment_choices USING btree (question_id);


--
-- Name: index_assessment_diagnostic_participations_on_diagnostic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_diagnostic_participations_on_diagnostic_id ON public.assessment_diagnostic_participations USING btree (diagnostic_id);


--
-- Name: index_assessment_diagnostic_participations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_diagnostic_participations_on_user_id ON public.assessment_diagnostic_participations USING btree (user_id);


--
-- Name: index_assessment_ordered_passages_on_passage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_ordered_passages_on_passage_id ON public.assessment_ordered_passages USING btree (passage_id);


--
-- Name: index_assessment_ordered_passages_on_passage_id_and_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_assessment_ordered_passages_on_passage_id_and_section_id ON public.assessment_ordered_passages USING btree (passage_id, section_id);


--
-- Name: index_assessment_ordered_passages_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_ordered_passages_on_section_id ON public.assessment_ordered_passages USING btree (section_id);


--
-- Name: index_assessment_passages_on_difficulty_level_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_passages_on_difficulty_level_id ON public.assessment_passages USING btree (difficulty_level_id);


--
-- Name: index_assessment_questions_on_passage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_questions_on_passage_id ON public.assessment_questions USING btree (passage_id);


--
-- Name: index_assessment_section_transitions_on_diagnostic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_section_transitions_on_diagnostic_id ON public.assessment_section_transitions USING btree (diagnostic_id);


--
-- Name: index_assessment_section_transitions_on_source_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_section_transitions_on_source_section_id ON public.assessment_section_transitions USING btree (source_section_id);


--
-- Name: index_assessment_sections_on_diagnostic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assessment_sections_on_diagnostic_id ON public.assessment_sections USING btree (diagnostic_id);


--
-- Name: index_assignment_diagnostic_particpns_diag_particpn_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignment_diagnostic_particpns_diag_particpn_id ON public.assessment_diagnostic_participations_assignments USING btree (diagnostic_participation_id);


--
-- Name: index_assignment_diagnostics_on_assignment_and_particpns; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_assignment_diagnostics_on_assignment_and_particpns ON public.assessment_diagnostic_participations_assignments USING btree (assignment_id, diagnostic_participation_id);


--
-- Name: index_assignment_quiz_attempts_on_assignment; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignment_quiz_attempts_on_assignment ON public.assignments_reader_quiz_attempts USING btree (quiz_assignment_id);


--
-- Name: index_assignment_quiz_attempts_on_assignment_and_quiz_attempt; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_assignment_quiz_attempts_on_assignment_and_quiz_attempt ON public.assignments_reader_quiz_attempts USING btree (quiz_assignment_id, quiz_attempt_id);


--
-- Name: index_assignment_quiz_attempts_on_attempt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignment_quiz_attempts_on_attempt ON public.assignments_reader_quiz_attempts USING btree (quiz_attempt_id);


--
-- Name: index_assignment_set_particpns_on_assignment; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignment_set_particpns_on_assignment ON public.assignments_vocab_set_participations USING btree (assignment_id);


--
-- Name: index_assignment_set_particpns_on_assignment_and_particpns; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_assignment_set_particpns_on_assignment_and_particpns ON public.assignments_vocab_set_participations USING btree (assignment_id, set_participation_id);


--
-- Name: index_assignment_set_particpns_on_participation; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignment_set_particpns_on_participation ON public.assignments_vocab_set_participations USING btree (set_participation_id);


--
-- Name: index_assignments_on_assigned_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_assigned_object_id ON public.assignments USING btree (assigned_object_id);


--
-- Name: index_assignments_on_assignee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_assignee_id ON public.assignments USING btree (assignee_id);


--
-- Name: index_assignments_on_assignee_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_assignee_type ON public.assignments USING btree (assignee_type);


--
-- Name: index_assignments_on_creator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_creator_id ON public.assignments USING btree (creator_id);


--
-- Name: index_assignments_on_mandatory_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_mandatory_set_id ON public.assignments USING btree (mandatory_set_id);


--
-- Name: index_audits_on_comment; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_comment ON public.audits USING btree (comment);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_created_at ON public.audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_request_uuid ON public.audits USING btree (request_uuid);


--
-- Name: index_category_types_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_category_types_on_position ON public.category_types USING btree ("position");


--
-- Name: index_clever_district_imports_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_district_imports_on_district_id ON public.clever_district_imports USING btree (district_id);


--
-- Name: index_clever_district_imports_on_job_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_district_imports_on_job_id ON public.clever_district_imports USING btree (job_id);


--
-- Name: index_clever_district_imports_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_district_imports_on_status ON public.clever_district_imports USING btree (status);


--
-- Name: index_clever_district_syncs_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_district_syncs_on_district_id ON public.clever_district_syncs USING btree (district_id);


--
-- Name: index_clever_entities_on_done; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_entities_on_done ON public.clever_entities USING btree (done);


--
-- Name: index_clever_imports_on_entity_type_and_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_imports_on_entity_type_and_entity_id ON public.clever_imports USING btree (entity_type, entity_id);


--
-- Name: index_clever_schools_imports_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_schools_imports_on_district_id ON public.clever_schools_imports USING btree (district_id);


--
-- Name: index_clever_student_imports_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_student_imports_on_district_id ON public.clever_student_imports USING btree (district_id);


--
-- Name: index_clever_teacher_imports_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_teacher_imports_on_district_id ON public.clever_teacher_imports USING btree (district_id);


--
-- Name: index_clever_teacher_imports_on_job_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clever_teacher_imports_on_job_id ON public.clever_teacher_imports USING btree (job_id);


--
-- Name: index_completed_quiz_attempt_aggregates_on_quiz_attempt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_completed_quiz_attempt_aggregates_on_quiz_attempt_id ON public.stats_completed_quiz_attempt_aggregates USING btree (quiz_attempt_id);


--
-- Name: index_content_categories_on_url_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_content_categories_on_url_slug ON public.content_categories USING btree (url_slug);


--
-- Name: index_content_categories_reader_quizzes_on_content_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_content_categories_reader_quizzes_on_content_category_id ON public.content_categories_reader_quizzes USING btree (content_category_id);


--
-- Name: index_content_categories_reader_quizzes_on_quiz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_content_categories_reader_quizzes_on_quiz_id ON public.content_categories_reader_quizzes USING btree (quiz_id);


--
-- Name: index_content_categories_sets_on_content_category_id_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_content_categories_sets_on_content_category_id_set_id ON public.content_categories_vocab_sets USING btree (content_category_id, set_id);


--
-- Name: index_crg_find_phrases_attempts_on_find_phrases_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_find_phrases_attempts_on_find_phrases_id ON public.crg_find_phrases_attempts USING btree (find_phrases_id);


--
-- Name: index_crg_find_phrases_attempts_on_passage_response_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_find_phrases_attempts_on_passage_response_id ON public.crg_find_phrases_attempts USING btree (passage_response_id);


--
-- Name: index_crg_lesson_participations_on_current_passage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_lesson_participations_on_current_passage_id ON public.crg_lesson_participations USING btree (current_passage_id);


--
-- Name: index_crg_lesson_participations_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_lesson_participations_on_lesson_id ON public.crg_lesson_participations USING btree (lesson_id);


--
-- Name: index_crg_lesson_participations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_lesson_participations_on_user_id ON public.crg_lesson_participations USING btree (user_id);


--
-- Name: index_crg_narrator_skill_videos_on_narrator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_narrator_skill_videos_on_narrator_id ON public.crg_narrator_skill_videos USING btree (narrator_id);


--
-- Name: index_crg_narrator_skill_videos_on_skill_type_and_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_narrator_skill_videos_on_skill_type_and_id ON public.crg_narrator_skill_videos USING btree (skill_type, skill_id);


--
-- Name: index_crg_ordered_passages_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_ordered_passages_on_lesson_id ON public.crg_ordered_passages USING btree (lesson_id);


--
-- Name: index_crg_ordered_passages_on_passage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_ordered_passages_on_passage_id ON public.crg_ordered_passages USING btree (passage_id);


--
-- Name: index_crg_ordered_scene_elements_on_scene_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_ordered_scene_elements_on_scene_id ON public.crg_ordered_scene_elements USING btree (scene_id);


--
-- Name: index_crg_passage_responses_on_lesson_participation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_passage_responses_on_lesson_participation_id ON public.crg_passage_responses USING btree (lesson_participation_id);


--
-- Name: index_crg_passages_on_difficulty_level_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_passages_on_difficulty_level_id ON public.crg_passages USING btree (difficulty_level_id);


--
-- Name: index_crg_passages_on_narrator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_passages_on_narrator_id ON public.crg_passages USING btree (narrator_id);


--
-- Name: index_crg_passages_on_passage_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_passages_on_passage_type ON public.crg_passages USING btree (passage_type);


--
-- Name: index_crg_passages_on_school_levels; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_passages_on_school_levels ON public.crg_passages USING gin (school_levels);


--
-- Name: index_crg_phrases_on_drag_and_drop_phrase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_phrases_on_drag_and_drop_phrase_id ON public.crg_phrases USING btree (drag_and_drop_phrase_id);


--
-- Name: index_crg_poll_answers_on_answer; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_poll_answers_on_answer ON public.crg_poll_answers USING btree (answer);


--
-- Name: index_crg_poll_answers_on_answer_synonyms; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_poll_answers_on_answer_synonyms ON public.crg_poll_answers USING btree (answer_synonyms);


--
-- Name: index_crg_poll_answers_on_poll_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_poll_answers_on_poll_id ON public.crg_poll_answers USING btree (poll_id);


--
-- Name: index_crg_poll_responses_on_correct; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_poll_responses_on_correct ON public.crg_poll_responses USING btree (correct);


--
-- Name: index_crg_poll_responses_on_passage_response_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_poll_responses_on_passage_response_id ON public.crg_poll_responses USING btree (passage_response_id);


--
-- Name: index_crg_poll_responses_on_poll_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_poll_responses_on_poll_id ON public.crg_poll_responses USING btree (poll_id);


--
-- Name: index_crg_prv_response_option_reference_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_prv_response_option_reference_id_index ON public.crg_previous_response_options USING btree (reference_scene_element_id);


--
-- Name: index_crg_prv_response_option_reference_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_prv_response_option_reference_type_index ON public.crg_previous_response_options USING btree (reference_scene_element_type);


--
-- Name: index_crg_quotes_on_show_quote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_quotes_on_show_quote_id ON public.crg_quotes USING btree (show_quote_id);


--
-- Name: index_crg_scenes_on_passage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_scenes_on_passage_id ON public.crg_scenes USING btree (passage_id);


--
-- Name: index_crg_scenes_on_position_and_passage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_scenes_on_position_and_passage_id ON public.crg_scenes USING btree ("position", passage_id);


--
-- Name: index_crg_scenes_on_skill_exercise_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_scenes_on_skill_exercise_id ON public.crg_scenes USING btree (skill_exercise_id);


--
-- Name: index_crg_scenes_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_scenes_on_title ON public.crg_scenes USING btree (title);


--
-- Name: index_crg_scenes_on_zinc_primary_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_scenes_on_zinc_primary_skill_id ON public.crg_scenes USING btree (zinc_primary_skill_id);


--
-- Name: index_crg_text_entry_responses_on_passage_response_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_text_entry_responses_on_passage_response_id ON public.crg_text_entry_responses USING btree (passage_response_id);


--
-- Name: index_crg_text_entry_responses_on_text_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_text_entry_responses_on_text_entry_id ON public.crg_text_entry_responses USING btree (text_entry_id);


--
-- Name: index_crg_video_prompts_on_video_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_video_prompts_on_video_id ON public.crg_video_prompts USING btree (video_id);


--
-- Name: index_crg_videos_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_videos_on_title ON public.crg_videos USING btree (title);


--
-- Name: index_crg_videos_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_videos_on_user_id ON public.crg_videos USING btree (user_id);


--
-- Name: index_crg_zinc_primary_skills_on_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_zinc_primary_skills_on_skill_id ON public.crg_zinc_primary_skills USING btree (skill_id);


--
-- Name: index_crg_zinc_sub_skills_on_zinc_primary_skill_id_and_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_crg_zinc_sub_skills_on_zinc_primary_skill_id_and_position ON public.crg_zinc_sub_skills USING btree (zinc_primary_skill_id, "position");


--
-- Name: index_district_adminships_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_district_adminships_on_district_id ON public.district_adminships USING btree (district_id);


--
-- Name: index_district_adminships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_district_adminships_on_user_id ON public.district_adminships USING btree (user_id);


--
-- Name: index_district_adminships_on_user_id_and_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_district_adminships_on_user_id_and_district_id ON public.district_adminships USING btree (user_id, district_id);


--
-- Name: index_districts_on_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_districts_on_source_id ON public.districts USING btree (source_id);


--
-- Name: index_districts_on_source_provider_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_districts_on_source_provider_and_source_id ON public.districts USING btree (source_provider, source_id);


--
-- Name: index_google_classroom_registrations_on_expires_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_google_classroom_registrations_on_expires_at ON public.google_classroom_registrations USING btree (expires_at);


--
-- Name: index_google_classroom_registrations_on_klass_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_google_classroom_registrations_on_klass_id_and_user_id ON public.google_classroom_registrations USING btree (klass_id, user_id);


--
-- Name: index_klasses_on_archived; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_klasses_on_archived ON public.klasses USING btree (archived);


--
-- Name: index_klasses_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_klasses_on_district_id ON public.klasses USING btree (district_id);


--
-- Name: index_klasses_on_end_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_klasses_on_end_date ON public.klasses USING btree (end_date);


--
-- Name: index_klasses_on_school_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_klasses_on_school_id ON public.klasses USING btree (school_id);


--
-- Name: index_klasses_on_source_provider_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_klasses_on_source_provider_and_source_id ON public.klasses USING btree (source_provider, source_id);


--
-- Name: index_klasses_on_student_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_klasses_on_student_code ON public.klasses USING btree (student_code);


--
-- Name: index_klasses_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_klasses_on_teacher_id ON public.klasses USING btree (teacher_id);


--
-- Name: index_learned_deck_participation_agg_on_deck_participation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_learned_deck_participation_agg_on_deck_participation_id ON public.stats_learned_deck_participation_aggregates USING btree (deck_participation_id);


--
-- Name: index_learned_deck_participation_aggregates_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_learned_deck_participation_aggregates_on_activity_date ON public.stats_learned_deck_participation_aggregates USING btree (activity_date);


--
-- Name: index_login_keys_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_login_keys_on_token ON public.login_keys USING btree (token);


--
-- Name: index_login_keys_on_valid_upto; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_login_keys_on_valid_upto ON public.login_keys USING btree (valid_upto);


--
-- Name: index_membership_transactions_on_subscriber_id_and_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_membership_transactions_on_subscriber_id_and_type ON public.membership_transactions USING btree (subscriber_id, subscriber_type);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_applications_on_owner_id_and_owner_type ON public.oauth_applications USING btree (owner_id, owner_type);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_oauth_credentials_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_credentials_on_email ON public.oauth_credentials USING btree (email);


--
-- Name: index_oauth_credentials_on_provider_and_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_credentials_on_provider_and_token ON public.oauth_credentials USING btree (provider, token);


--
-- Name: index_oauth_credentials_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_credentials_on_user_id ON public.oauth_credentials USING btree (user_id);


--
-- Name: index_organizations_on_membership_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_organizations_on_membership_level ON public.organizations USING btree (membership_level);


--
-- Name: index_question_attempts_on_users_question_answer; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_question_attempts_on_users_question_answer ON public.reader_question_attempts USING btree (answer_id, user_id, question_id);


--
-- Name: index_reader_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_answers_on_question_id ON public.reader_answers USING btree (question_id);


--
-- Name: index_reader_question_attempts_on_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_question_attempts_on_answer_id ON public.reader_question_attempts USING btree (answer_id);


--
-- Name: index_reader_question_attempts_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_question_attempts_on_question_id ON public.reader_question_attempts USING btree (question_id);


--
-- Name: index_reader_question_attempts_on_quiz_attempt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_question_attempts_on_quiz_attempt_id ON public.reader_question_attempts USING btree (quiz_attempt_id);


--
-- Name: index_reader_question_attempts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_question_attempts_on_user_id ON public.reader_question_attempts USING btree (user_id);


--
-- Name: index_reader_question_zinc_skills_on_question_id_zinc_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reader_question_zinc_skills_on_question_id_zinc_skill_id ON public.reader_questions_zinc_skills USING btree (question_id, zinc_skill_id);


--
-- Name: index_reader_questions_on_quiz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_questions_on_quiz_id ON public.reader_questions USING btree (quiz_id);


--
-- Name: index_reader_questions_on_zinc_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_questions_on_zinc_skill_id ON public.reader_questions USING btree (zinc_skill_id);


--
-- Name: index_reader_quiz_attempts_on_assignment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quiz_attempts_on_assignment_id ON public.reader_quiz_attempts USING btree (assignment_id);


--
-- Name: index_reader_quiz_attempts_on_mandatory_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quiz_attempts_on_mandatory_set_id ON public.reader_quiz_attempts USING btree (mandatory_set_id);


--
-- Name: index_reader_quiz_attempts_on_quiz_id_and_progress; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quiz_attempts_on_quiz_id_and_progress ON public.reader_quiz_attempts USING btree (quiz_id, progress);


--
-- Name: index_reader_quiz_attempts_on_quiz_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reader_quiz_attempts_on_quiz_id_and_user_id ON public.reader_quiz_attempts USING btree (quiz_id, user_id);


--
-- Name: index_reader_quiz_attempts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quiz_attempts_on_user_id ON public.reader_quiz_attempts USING btree (user_id);


--
-- Name: index_reader_quiz_meta_infos_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reader_quiz_meta_infos_on_name ON public.reader_quiz_meta_infos USING btree (name);


--
-- Name: index_reader_quiz_meta_infos_on_word_count_bonus_rule_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quiz_meta_infos_on_word_count_bonus_rule_set_id ON public.reader_quiz_meta_infos USING btree (word_count_bonus_rule_set_id);


--
-- Name: index_reader_quizzes_on_difficulty_level_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quizzes_on_difficulty_level_id ON public.reader_quizzes USING btree (difficulty_level_id);


--
-- Name: index_reader_quizzes_on_primary_channel_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quizzes_on_primary_channel_id ON public.reader_quizzes USING btree (primary_channel_id);


--
-- Name: index_reader_quizzes_on_quiz_meta_info_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_quizzes_on_quiz_meta_info_id ON public.reader_quizzes USING btree (quiz_meta_info_id);


--
-- Name: index_reader_word_count_bonus_rule_sets_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reader_word_count_bonus_rule_sets_on_name ON public.reader_word_count_bonus_rule_sets USING btree (name);


--
-- Name: index_reader_zinc_skills_on_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reader_zinc_skills_on_skill_id ON public.reader_zinc_skills USING btree (skill_id);


--
-- Name: index_reading_levels_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reading_levels_on_user_id ON public.reading_levels USING btree (user_id);


--
-- Name: index_schools_on_creator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_on_creator_id ON public.schools USING btree (creator_id);


--
-- Name: index_schools_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_on_district_id ON public.schools USING btree (district_id);


--
-- Name: index_schools_on_membership_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_on_membership_level ON public.schools USING btree (membership_level);


--
-- Name: index_schools_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_on_name ON public.schools USING btree (name);


--
-- Name: index_schools_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_on_organization_id ON public.schools USING btree (organization_id);


--
-- Name: index_schools_on_premium_source_type_and_premium_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_on_premium_source_type_and_premium_source_id ON public.schools USING btree (premium_source_type, premium_source_id);


--
-- Name: index_schools_on_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_schools_on_source_id ON public.schools USING btree (source_id);


--
-- Name: index_schools_on_source_provider_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_schools_on_source_provider_and_source_id ON public.schools USING btree (source_provider, source_id);


--
-- Name: index_schools_on_teacher_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_schools_on_teacher_code ON public.schools USING btree (teacher_code);


--
-- Name: index_schools_standard_types_on_school_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_standard_types_on_school_id ON public.schools_standard_types USING btree (school_id);


--
-- Name: index_schools_standard_types_on_standard_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_standard_types_on_standard_type_id ON public.schools_standard_types USING btree (standard_type_id);


--
-- Name: index_schools_whitelisted_teachers_on_whitelisted_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schools_whitelisted_teachers_on_whitelisted_teacher_id ON public.schools_whitelisted_teachers USING btree (whitelisted_teacher_id);


--
-- Name: index_settings_on_thing_type_and_thing_id_and_var; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_settings_on_thing_type_and_thing_id_and_var ON public.settings USING btree (thing_type, thing_id, var);


--
-- Name: index_sponsorships_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sponsorships_on_status ON public.sponsorships USING btree (status);


--
-- Name: index_sponsorships_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sponsorships_on_student_id ON public.sponsorships USING btree (student_id);


--
-- Name: index_sponsorships_on_subscription_id_and_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sponsorships_on_subscription_id_and_student_id ON public.sponsorships USING btree (subscription_id, student_id);


--
-- Name: index_standards_on_standard_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_standards_on_standard_type_id ON public.standards USING btree (standard_type_id);


--
-- Name: index_stats_class_aggregates_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_aggregates_on_activity_date ON public.stats_class_aggregates USING btree (activity_date);


--
-- Name: index_stats_class_aggregates_on_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_aggregates_on_klass_id ON public.stats_class_aggregates USING btree (klass_id);


--
-- Name: index_stats_class_cc_skill_aggregates_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_cc_skill_aggregates_on_activity_date ON public.stats_class_cc_skill_aggregates USING btree (activity_date);


--
-- Name: index_stats_class_cc_skill_aggregates_on_cc_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_cc_skill_aggregates_on_cc_skill_id ON public.stats_class_cc_skill_aggregates USING btree (cc_skill_id);


--
-- Name: index_stats_class_cc_skill_aggregates_on_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_cc_skill_aggregates_on_klass_id ON public.stats_class_cc_skill_aggregates USING btree (klass_id);


--
-- Name: index_stats_class_zinc_skill_aggregates_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_zinc_skill_aggregates_on_activity_date ON public.stats_class_zinc_skill_aggregates USING btree (activity_date);


--
-- Name: index_stats_class_zinc_skill_aggregates_on_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_zinc_skill_aggregates_on_klass_id ON public.stats_class_zinc_skill_aggregates USING btree (klass_id);


--
-- Name: index_stats_class_zinc_skill_aggregates_on_zinc_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_class_zinc_skill_aggregates_on_zinc_skill_id ON public.stats_class_zinc_skill_aggregates USING btree (zinc_skill_id);


--
-- Name: index_stats_completed_quiz_attempt_aggregates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_completed_quiz_attempt_aggregates_on_user_id ON public.stats_completed_quiz_attempt_aggregates USING btree (user_id);


--
-- Name: index_stats_deck_attempt_facts_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_deck_attempt_facts_on_activity_date ON public.stats_deck_attempt_facts USING btree (activity_date);


--
-- Name: index_stats_deck_attempt_facts_on_deck_attempt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_deck_attempt_facts_on_deck_attempt_id ON public.stats_deck_attempt_facts USING btree (deck_attempt_id);


--
-- Name: index_stats_deck_attempt_facts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_deck_attempt_facts_on_user_id ON public.stats_deck_attempt_facts USING btree (user_id);


--
-- Name: index_stats_learned_deck_participation_aggregates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_learned_deck_participation_aggregates_on_user_id ON public.stats_learned_deck_participation_aggregates USING btree (user_id);


--
-- Name: index_stats_user_aggregates_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_aggregates_on_activity_date ON public.stats_user_aggregates USING btree (activity_date);


--
-- Name: index_stats_user_aggregates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_aggregates_on_user_id ON public.stats_user_aggregates USING btree (user_id);


--
-- Name: index_stats_user_cc_skill_aggregates_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_cc_skill_aggregates_on_activity_date ON public.stats_user_cc_skill_aggregates USING btree (activity_date);


--
-- Name: index_stats_user_cc_skill_aggregates_on_cc_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_cc_skill_aggregates_on_cc_skill_id ON public.stats_user_cc_skill_aggregates USING btree (cc_skill_id);


--
-- Name: index_stats_user_cc_skill_aggregates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_cc_skill_aggregates_on_user_id ON public.stats_user_cc_skill_aggregates USING btree (user_id);


--
-- Name: index_stats_user_zinc_skill_aggregates_on_activity_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_zinc_skill_aggregates_on_activity_date ON public.stats_user_zinc_skill_aggregates USING btree (activity_date);


--
-- Name: index_stats_user_zinc_skill_aggregates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_zinc_skill_aggregates_on_user_id ON public.stats_user_zinc_skill_aggregates USING btree (user_id);


--
-- Name: index_stats_user_zinc_skill_aggregates_on_zinc_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_user_zinc_skill_aggregates_on_zinc_skill_id ON public.stats_user_zinc_skill_aggregates USING btree (zinc_skill_id);


--
-- Name: index_stats_zinc_skill_facts_on_user_id_and_quiz_attempt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stats_zinc_skill_facts_on_user_id_and_quiz_attempt_id ON public.stats_zinc_skill_facts USING btree (user_id, quiz_attempt_id);


--
-- Name: index_stats_zinc_skill_facts_unique_constraint; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_stats_zinc_skill_facts_unique_constraint ON public.stats_zinc_skill_facts USING btree (user_id, quiz_attempt_id, zinc_skill_id, quiz_type);


--
-- Name: index_student_klass_invitations_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_student_klass_invitations_on_code ON public.student_klass_invitations USING btree (code);


--
-- Name: index_student_klass_invitations_on_email_and_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_student_klass_invitations_on_email_and_klass_id ON public.student_klass_invitations USING btree (email, klass_id);


--
-- Name: index_student_klass_invitations_on_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_student_klass_invitations_on_klass_id ON public.student_klass_invitations USING btree (klass_id);


--
-- Name: index_student_klass_memberships_on_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_student_klass_memberships_on_klass_id ON public.student_klass_memberships USING btree (klass_id);


--
-- Name: index_student_klass_memberships_on_user_id_and_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_student_klass_memberships_on_user_id_and_klass_id ON public.student_klass_memberships USING btree (user_id, klass_id);


--
-- Name: index_subscriptions_on_customer_type_and_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_customer_type_and_customer_id ON public.subscriptions USING btree (customer_type, customer_id);


--
-- Name: index_teacher_klass_memberships_on_is_primary_and_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_teacher_klass_memberships_on_is_primary_and_klass_id ON public.teacher_klass_memberships USING btree (is_primary, klass_id) WHERE (is_primary = true);


--
-- Name: index_teacher_klass_memberships_on_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacher_klass_memberships_on_klass_id ON public.teacher_klass_memberships USING btree (klass_id);


--
-- Name: index_teacher_klass_memberships_on_user_id_and_klass_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_teacher_klass_memberships_on_user_id_and_klass_id ON public.teacher_klass_memberships USING btree (user_id, klass_id);


--
-- Name: index_teachership_invitations_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_teachership_invitations_on_code ON public.teachership_invitations USING btree (code);


--
-- Name: index_teachership_invitations_on_school_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teachership_invitations_on_school_id ON public.teachership_invitations USING btree (school_id);


--
-- Name: index_teacherships_on_membership_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacherships_on_membership_level ON public.teacherships USING btree (membership_level);


--
-- Name: index_teacherships_on_premium_source_type_and_premium_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacherships_on_premium_source_type_and_premium_source_id ON public.teacherships USING btree (premium_source_type, premium_source_id);


--
-- Name: index_teacherships_on_school_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacherships_on_school_id ON public.teacherships USING btree (school_id);


--
-- Name: index_teacherships_on_user_id_and_school_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_teacherships_on_user_id_and_school_id ON public.teacherships USING btree (user_id, school_id);


--
-- Name: index_user_unsubscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_unsubscriptions_on_user_id ON public.user_unsubscriptions USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_discarded_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_discarded_at ON public.users USING btree (discarded_at);


--
-- Name: index_users_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_district_id ON public.users USING btree (district_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_email_source_id_blank; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email_source_id_blank ON public.users USING btree (email) WHERE (source_id IS NULL);


--
-- Name: index_users_on_membership_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_membership_level ON public.users USING btree (membership_level);


--
-- Name: index_users_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_organization_id ON public.users USING btree (organization_id);


--
-- Name: index_users_on_points; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_points ON public.users USING btree (points);


--
-- Name: index_users_on_policy_acceptance_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_policy_acceptance_date ON public.users USING btree (policy_acceptance_date);


--
-- Name: index_users_on_premium_source_type_and_premium_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_premium_source_type_and_premium_source_id ON public.users USING btree (premium_source_type, premium_source_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_role ON public.users USING btree (role);


--
-- Name: index_users_on_source_provider_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_source_provider_and_source_id ON public.users USING btree (source_provider, source_id);


--
-- Name: index_users_on_unconfirmed_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_unconfirmed_email ON public.users USING btree (unconfirmed_email);


--
-- Name: index_users_on_unsubscribe_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unsubscribe_token ON public.users USING btree (unsubscribe_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- Name: index_vocab_categories_sets_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_categories_sets_on_category_id ON public.vocab_categories_sets USING btree (category_id);


--
-- Name: index_vocab_categories_sets_on_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_categories_sets_on_set_id ON public.vocab_categories_sets USING btree (set_id);


--
-- Name: index_vocab_deck_attempts_on_game_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_deck_attempts_on_game_id ON public.vocab_deck_attempts USING btree (game_id);


--
-- Name: index_vocab_deck_participations_on_deck_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_deck_participations_on_deck_id ON public.vocab_deck_participations USING btree (deck_id);


--
-- Name: index_vocab_deck_participations_on_progress; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_deck_participations_on_progress ON public.vocab_deck_participations USING btree (progress);


--
-- Name: index_vocab_deck_participations_on_set_participation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_deck_participations_on_set_participation_id ON public.vocab_deck_participations USING btree (set_participation_id);


--
-- Name: index_vocab_deck_participations_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_deck_participations_on_status ON public.vocab_deck_participations USING btree (status);


--
-- Name: index_vocab_decks_on_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_decks_on_set_id ON public.vocab_decks USING btree (set_id);


--
-- Name: index_vocab_decks_words_on_deck_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_decks_words_on_deck_id ON public.vocab_decks_words USING btree (deck_id);


--
-- Name: index_vocab_decks_words_on_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_decks_words_on_word_id ON public.vocab_decks_words USING btree (word_id);


--
-- Name: index_vocab_derived_words_on_base_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_derived_words_on_base_word_id ON public.vocab_derived_words USING btree (base_word_id);


--
-- Name: index_vocab_exposure_plans_on_master_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_exposure_plans_on_master_plan_id ON public.vocab_exposure_plans USING btree (master_plan_id);


--
-- Name: index_vocab_exposure_stages_on_exposure_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_exposure_stages_on_exposure_plan_id ON public.vocab_exposure_stages USING btree (exposure_plan_id);


--
-- Name: index_vocab_exposure_stages_on_game_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_exposure_stages_on_game_plan_id ON public.vocab_exposure_stages USING btree (game_plan_id);


--
-- Name: index_vocab_exposures_on_deck_participation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_exposures_on_deck_participation_id ON public.vocab_exposures USING btree (deck_participation_id);


--
-- Name: index_vocab_exposures_on_exposure_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_exposures_on_exposure_plan_id ON public.vocab_exposures USING btree (exposure_plan_id);


--
-- Name: index_vocab_game_modes_plans_on_game_mode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_game_modes_plans_on_game_mode_id ON public.vocab_game_modes_plans USING btree (game_mode_id);


--
-- Name: index_vocab_game_modes_plans_on_game_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_game_modes_plans_on_game_plan_id ON public.vocab_game_modes_plans USING btree (game_plan_id);


--
-- Name: index_vocab_games_on_completed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_games_on_completed ON public.vocab_games USING btree (completed);


--
-- Name: index_vocab_games_on_exposure_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_games_on_exposure_id ON public.vocab_games USING btree (exposure_id);


--
-- Name: index_vocab_games_on_exposure_stage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_games_on_exposure_stage_id ON public.vocab_games USING btree (exposure_stage_id);


--
-- Name: index_vocab_grades_sets_on_grade_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_grades_sets_on_grade_id ON public.vocab_grades_sets USING btree (grade_id);


--
-- Name: index_vocab_grades_sets_on_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_grades_sets_on_set_id ON public.vocab_grades_sets USING btree (set_id);


--
-- Name: index_vocab_part_of_speech_words_on_word_id_part_of_speech_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_vocab_part_of_speech_words_on_word_id_part_of_speech_id ON public.vocab_part_of_speech_words USING btree (word_id, part_of_speech_id);


--
-- Name: index_vocab_parts_of_speech_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_parts_of_speech_translations_on_locale ON public.vocab_parts_of_speech_translations USING btree (locale);


--
-- Name: index_vocab_set_participations_on_assignment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_set_participations_on_assignment_id ON public.vocab_set_participations USING btree (assignment_id);


--
-- Name: index_vocab_set_participations_on_progress; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_set_participations_on_progress ON public.vocab_set_participations USING btree (progress);


--
-- Name: index_vocab_set_participations_on_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_set_participations_on_set_id ON public.vocab_set_participations USING btree (set_id);


--
-- Name: index_vocab_set_participations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_set_participations_on_user_id ON public.vocab_set_participations USING btree (user_id);


--
-- Name: index_vocab_set_participations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_vocab_set_participations_uniqueness ON public.vocab_set_participations USING btree (set_id, user_id, vocab_game_mode);


--
-- Name: index_vocab_sets_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_sets_on_locale ON public.vocab_sets USING btree (locale);


--
-- Name: index_vocab_sets_on_quiz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_sets_on_quiz_id ON public.vocab_sets USING btree (quiz_id);


--
-- Name: index_vocab_sets_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_sets_on_user_id ON public.vocab_sets USING btree (user_id);


--
-- Name: index_vocab_sets_words_on_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_sets_words_on_set_id ON public.vocab_sets_words USING btree (set_id);


--
-- Name: index_vocab_sets_words_on_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_sets_words_on_word_id ON public.vocab_sets_words USING btree (word_id);


--
-- Name: index_vocab_synonyms_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_synonyms_on_locale ON public.vocab_synonyms USING btree (locale);


--
-- Name: index_vocab_synonyms_on_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_synonyms_on_word_id ON public.vocab_synonyms USING btree (word_id);


--
-- Name: index_vocab_word_attempts_on_deck_attempt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_word_attempts_on_deck_attempt_id ON public.vocab_word_attempts USING btree (deck_attempt_id);


--
-- Name: index_vocab_word_attempts_on_game_mode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_word_attempts_on_game_mode_id ON public.vocab_word_attempts USING btree (game_mode_id);


--
-- Name: index_vocab_word_attempts_on_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_word_attempts_on_word_id ON public.vocab_word_attempts USING btree (word_id);


--
-- Name: index_vocab_word_synonym_options_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_word_synonym_options_on_locale ON public.vocab_word_synonym_options USING btree (locale);


--
-- Name: index_vocab_word_synonym_options_on_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_word_synonym_options_on_word_id ON public.vocab_word_synonym_options USING btree (word_id);


--
-- Name: index_vocab_word_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_word_translations_on_locale ON public.vocab_word_translations USING btree (locale);


--
-- Name: index_vocab_word_translations_on_vocab_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_word_translations_on_vocab_word_id ON public.vocab_word_translations USING btree (vocab_word_id);


--
-- Name: index_vocab_words_on_main_part_of_speech_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_words_on_main_part_of_speech_id ON public.vocab_words USING btree (main_part_of_speech_id);


--
-- Name: index_vocab_words_on_word_element_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_words_on_word_element_type ON public.vocab_words USING btree (word_element_type);


--
-- Name: index_vocab_wrong_image_options_on_option_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_wrong_image_options_on_option_word_id ON public.vocab_wrong_image_options USING btree (option_word_id);


--
-- Name: index_vocab_wrong_image_options_on_word_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vocab_wrong_image_options_on_word_id ON public.vocab_wrong_image_options USING btree (word_id);


--
-- Name: index_whitelisted_teachers_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_whitelisted_teachers_on_email ON public.whitelisted_teachers USING btree (email);


--
-- Name: index_word_count_bonus_rules_on_word_count_bonus_rule_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_word_count_bonus_rules_on_word_count_bonus_rule_set_id ON public.reader_word_count_bonus_rules USING btree (word_count_bonus_rule_set_id);


--
-- Name: index_wupee_notification_types_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_wupee_notification_types_on_name ON public.wupee_notification_types USING btree (name);


--
-- Name: index_wupee_notifications_on_attached_object_type_and_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wupee_notifications_on_attached_object_type_and_id ON public.wupee_notifications USING btree (attached_object_type, attached_object_id);


--
-- Name: index_wupee_notifications_on_receiver_type_and_receiver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wupee_notifications_on_receiver_type_and_receiver_id ON public.wupee_notifications USING btree (receiver_type, receiver_id);


--
-- Name: indx_transactions_on_premium_source_type_and_premium_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX indx_transactions_on_premium_source_type_and_premium_source_id ON public.membership_transactions USING btree (premium_source_type, premium_source_id);


--
-- Name: scene_element_polymorphic_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX scene_element_polymorphic_index ON public.crg_ordered_scene_elements USING btree (scene_element_id, scene_element_type);


--
-- Name: school_teacher_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX school_teacher_email_index ON public.schools_whitelisted_teachers USING btree (school_id, whitelisted_teacher_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_index ON public.audits USING btree (user_id, user_type);


--
-- Name: teacher_klass_memberships fk_rails_075698231e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_klass_memberships
    ADD CONSTRAINT fk_rails_075698231e FOREIGN KEY (klass_id) REFERENCES public.klasses(id);


--
-- Name: announcements fk_rails_0adc463d8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_0adc463d8e FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: api_users fk_rails_1424556446; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.api_users
    ADD CONSTRAINT fk_rails_1424556446 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: standards fk_rails_143f4c4c17; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.standards
    ADD CONSTRAINT fk_rails_143f4c4c17 FOREIGN KEY (standard_type_id) REFERENCES public.standard_types(id);


--
-- Name: wupee_notification_type_configurations fk_rails_14fb53542a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notification_type_configurations
    ADD CONSTRAINT fk_rails_14fb53542a FOREIGN KEY (notification_type_id) REFERENCES public.wupee_notification_types(id);


--
-- Name: teacher_klass_memberships fk_rails_23710928f6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_klass_memberships
    ADD CONSTRAINT fk_rails_23710928f6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: assessment_questions fk_rails_602b376c1a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_questions
    ADD CONSTRAINT fk_rails_602b376c1a FOREIGN KEY (skill_id) REFERENCES public.master_zinc_skills(id);


--
-- Name: schools_standard_types fk_rails_6aec2e7474; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schools_standard_types
    ADD CONSTRAINT fk_rails_6aec2e7474 FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- Name: zinc_skill_standards fk_rails_729d191d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zinc_skill_standards
    ADD CONSTRAINT fk_rails_729d191d6f FOREIGN KEY (standard_id) REFERENCES public.standards(id);


--
-- Name: district_adminships fk_rails_96d124a159; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.district_adminships
    ADD CONSTRAINT fk_rails_96d124a159 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: wupee_notifications fk_rails_ab25b81f4a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wupee_notifications
    ADD CONSTRAINT fk_rails_ab25b81f4a FOREIGN KEY (notification_type_id) REFERENCES public.wupee_notification_types(id);


--
-- Name: schools fk_rails_bf9778ac51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT fk_rails_bf9778ac51 FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- Name: zinc_skill_standards fk_rails_bfbb5344f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zinc_skill_standards
    ADD CONSTRAINT fk_rails_bfbb5344f1 FOREIGN KEY (zinc_skill_id) REFERENCES public.reader_zinc_skills(id);


--
-- Name: schools_standard_types fk_rails_d968f656a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schools_standard_types
    ADD CONSTRAINT fk_rails_d968f656a9 FOREIGN KEY (standard_type_id) REFERENCES public.standard_types(id);


--
-- Name: district_adminships fk_rails_e02f523570; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.district_adminships
    ADD CONSTRAINT fk_rails_e02f523570 FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- PostgreSQL database dump complete
--

