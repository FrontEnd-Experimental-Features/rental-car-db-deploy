-- Table: public.OptionsHamburgerSubMenu

-- DROP TABLE IF EXISTS public."OptionsHamburgerSubMenu";

CREATE TABLE IF NOT EXISTS public."OptionsHamburgerSubMenu"
(
    "Id" integer NOT NULL,
    "SubMenu" integer,
    "SubMenuOptions" character varying(30) COLLATE pg_catalog."default",
    "IsActive" boolean DEFAULT true,
    CONSTRAINT "OptionsHamburgerSubMenu_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "OptionsHamburgerSubMenu_SubMenu_fkey" FOREIGN KEY ("SubMenu")
        REFERENCES public."OptionsHamburgerMenu" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."OptionsHamburgerSubMenu"
    OWNER to super_user;



-- Table: public.OptionsHamburgerMenu

-- DROP TABLE IF EXISTS public."OptionsHamburgerMenu";

CREATE TABLE IF NOT EXISTS public."OptionsHamburgerMenu"
(
    "Id" integer NOT NULL,
    "IsActive" boolean DEFAULT true,
    "Name" character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT "optionsHamburgerMenu_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "OptionsHamburgerMenu_Id_key" UNIQUE ("Id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."OptionsHamburgerMenu"
    OWNER to super_user;