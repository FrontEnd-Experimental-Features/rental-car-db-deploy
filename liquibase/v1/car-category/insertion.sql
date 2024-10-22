
-- Insert the car types (if not already inserted)
INSERT INTO CarType (type, title) VALUES
    ('Premium', 'Premium Cars'),
    ('Budget', 'Budget-Friendly Options')
ON CONFLICT (type) DO NOTHING;


-- Insert car categories (with is_active)
INSERT INTO CarCategory (id, name, description, type_id, is_active)
VALUES
    ('luxury-sedans', 'Luxury Sedans', 'Experience ultimate comfort and style', (SELECT id FROM CarType WHERE type = 'Premium'), true),
    ('sporty-convertibles', 'Sporty Convertibles', 'Feel the thrill of the open road', (SELECT id FROM CarType WHERE type = 'Premium'), true),
    ('spacious-suvs', 'Spacious SUVs', 'Perfect for family trips and adventures', (SELECT id FROM CarType WHERE type = 'Premium'), true),
    ('electric-luxury', 'Electric Luxury', 'Eco-friendly luxury with cutting-edge technology', (SELECT id FROM CarType WHERE type = 'Premium'), true),
    ('exotic-supercars', 'Exotic Supercars', 'Experience the pinnacle of automotive engineering', (SELECT id FROM CarType WHERE type = 'Premium'), true),
    ('economy-cars', 'Economy Cars', 'Efficient and affordable for city driving', (SELECT id FROM CarType WHERE type = 'Budget'), true),
    ('compact-hatchbacks', 'Compact Hatchbacks', 'Easy to park and great on gas', (SELECT id FROM CarType WHERE type = 'Budget'), true),
    ('midsize-sedans', 'Midsize Sedans', 'Balanced comfort and economy', (SELECT id FROM CarType WHERE type = 'Budget'), true),
    ('budget-suvs', 'Budget SUVs', 'Spacious and affordable for family trips', (SELECT id FROM CarType WHERE type = 'Budget'), true),
    ('electric-economy', 'Electric Economy', 'Eco-friendly and cost-effective city driving', (SELECT id FROM CarType WHERE type = 'Budget'), true)
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    type_id = EXCLUDED.type_id,
    is_active = EXCLUDED.is_active;

