-- Insert main menu items
INSERT INTO public."OptionsHamburgerMenu" ("Name", "IsActive")
VALUES 
('Reservations', true),
('Vehicles', true),
('Locations', true),
('Deals', true);

-- Insert submenu items
INSERT INTO public."OptionsHamburgerSubMenu" ("SubMenu", "SubMenuOptions", "IsActive")
VALUES 
-- Reservations submenu
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Reservations'), 'Make a Reservation', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Reservations'), 'View/Modify/Cancel', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Reservations'), 'Get a Receipt', true),

-- Vehicles submenu
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Vehicles'), 'Car Guide', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Vehicles'), 'Luxury Cars', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Vehicles'), 'Special Offers', true),

-- Locations submenu
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Locations'), 'Find a Location', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Locations'), 'Airport Rentals', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Locations'), 'International Rentals', true),

-- Deals submenu
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Deals'), 'Current Promotions', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Deals'), 'Last Minute Deals', true),
((SELECT "Id" FROM public."OptionsHamburgerMenu" WHERE "Name" = 'Deals'), 'Partner Offers', true);
