--liquibase formatted sql

--changeset you:recreate-hamburger-menu-tables
--comment: Drop and recreate hamburger menu tables

-- Drop existing tables if they exist
DROP TABLE IF EXISTS public."OptionsHamburgerSubMenu";
DROP TABLE IF EXISTS public."OptionsHamburgerMenu";

-- Create OptionsHamburgerMenu table
CREATE TABLE public."OptionsHamburgerMenu"
(
    "Id" SERIAL PRIMARY KEY,
    "IsActive" boolean DEFAULT true,
    "Name" character varying(30) COLLATE pg_catalog."default"
);

-- Create OptionsHamburgerSubMenu table
CREATE TABLE public."OptionsHamburgerSubMenu"
(
    "Id" SERIAL PRIMARY KEY,
    "SubMenu" integer,
    "SubMenuOptions" character varying(30) COLLATE pg_catalog."default",
    "IsActive" boolean DEFAULT true,
    CONSTRAINT "OptionsHamburgerSubMenu_SubMenu_fkey" FOREIGN KEY ("SubMenu")
        REFERENCES public."OptionsHamburgerMenu" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

-- Set ownership of tables
ALTER TABLE public."OptionsHamburgerMenu" OWNER to super_user;
ALTER TABLE public."OptionsHamburgerSubMenu" OWNER to super_user;
