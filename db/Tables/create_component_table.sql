CREATE TABLE IF NOT EXISTS core.components
(
    id integer NOT NULL DEFAULT nextval('core.components_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    weight numeric(10,4) NOT NULL,
    cost numeric(10,2) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT components_pkey PRIMARY KEY (id)
)
