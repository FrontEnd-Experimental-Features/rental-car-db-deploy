--liquibase formatted sql

--changeset you:update-hamburger-menu-data
--comment: Insert data into existing hamburger menu tables

-- Insert main menu items if they don't exist
INSERT INTO public."OptionsHamburgerMenu" ("Name", "IsActive")
SELECT t.name, t.is_active
FROM (
    VALUES 
    ('Reservations', true),
    ('Vehicles', true),
    ('Locations', true),
    ('Deals', true)
) AS t(name, is_active)
WHERE NOT EXISTS (
    SELECT 1 FROM public."OptionsHamburgerMenu" WHERE "Name" = t.name
);

-- Insert submenu items if they don't exist
INSERT INTO public."OptionsHamburgerSubMenu" ("SubMenu", "SubMenuOptions", "IsActive")
SELECT subquery.submenu_id, subquery.option, true
FROM (
    VALUES 
    ('Reservations', 'Make a Reservation'),
    ('Reservations', 'View/Modify/Cancel'),
    ('Reservations', 'Get a Receipt'),
    ('Vehicles', 'Car Guide'),
    ('Vehicles', 'Luxury Cars'),
    ('Vehicles', 'Special Offers'),
    ('Locations', 'Find a Location'),
    ('Locations', 'Airport Rentals'),
    ('Locations', 'International Rentals'),
    ('Deals', 'Current Promotions'),
    ('Deals', 'Last Minute Deals'),
    ('Deals', 'Partner Offers')
) AS t(menu_name, option)
JOIN public."OptionsHamburgerMenu" ON "OptionsHamburgerMenu"."Name" = t.menu_name
WHERE NOT EXISTS (
    SELECT 1 
    FROM public."OptionsHamburgerSubMenu" 
    WHERE "SubMenu" = "OptionsHamburgerMenu"."Id" 
    AND "SubMenuOptions" = t.option
);
