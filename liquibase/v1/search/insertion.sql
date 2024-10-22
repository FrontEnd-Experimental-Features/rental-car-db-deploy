-- Disable triggers temporarily for faster bulk insert
ALTER TABLE States DISABLE TRIGGER ALL;
ALTER TABLE Cities DISABLE TRIGGER ALL;

-- Insert states
INSERT INTO States (name) VALUES
('Alabama'), ('Alaska'), ('Arizona'), ('Arkansas'), ('California'),
('Colorado'), ('Connecticut'), ('Delaware'), ('Florida'), ('Georgia'),
('Hawaii'), ('Idaho'), ('Illinois'), ('Indiana'), ('Iowa'),
('Kansas'), ('Kentucky'), ('Louisiana'), ('Maine'), ('Maryland'),
('Massachusetts'), ('Michigan'), ('Minnesota'), ('Mississippi'), ('Missouri'),
('Montana'), ('Nebraska'), ('Nevada'), ('New Hampshire'), ('New Jersey'),
('New Mexico'), ('New York'), ('North Carolina'), ('North Dakota'), ('Ohio'),
('Oklahoma'), ('Oregon'), ('Pennsylvania'), ('Rhode Island'), ('South Carolina'),
('South Dakota'), ('Tennessee'), ('Texas'), ('Utah'), ('Vermont'),
('Virginia'), ('Washington'), ('West Virginia'), ('Wisconsin'), ('Wyoming')
ON CONFLICT (name) DO NOTHING;

-- Insert cities
INSERT INTO Cities (name, state_id)
SELECT c.city, s.id
FROM (VALUES
    ('Alabama', ARRAY['Birmingham', 'Montgomery', 'Mobile', 'Huntsville', 'Tuscaloosa', 'Hoover', 'Dothan', 'Auburn', 'Decatur', 'Madison']),
    ('Alaska', ARRAY['Anchorage', 'Fairbanks', 'Juneau', 'Sitka', 'Ketchikan', 'Wasilla', 'Kenai', 'Kodiak', 'Bethel', 'Palmer']),
    ('Arizona', ARRAY['Phoenix', 'Tucson', 'Mesa', 'Chandler', 'Scottsdale', 'Glendale', 'Gilbert', 'Tempe', 'Peoria', 'Surprise']),
    ('Arkansas', ARRAY['Little Rock', 'Fort Smith', 'Fayetteville', 'Springdale', 'Jonesboro', 'North Little Rock', 'Conway', 'Rogers', 'Pine Bluff', 'Bentonville']),
    ('California', ARRAY['Los Angeles', 'San Diego', 'San Jose', 'San Francisco', 'Fresno', 'Sacramento', 'Long Beach', 'Oakland', 'Bakersfield', 'Anaheim', 'Santa Ana', 'Riverside', 'Stockton', 'Irvine', 'Chula Vista', 'Fremont', 'San Bernardino', 'Modesto', 'Fontana', 'Oxnard']),
    ('Colorado', ARRAY['Denver', 'Colorado Springs', 'Aurora', 'Fort Collins', 'Lakewood', 'Thornton', 'Arvada', 'Westminster', 'Pueblo', 'Centennial', 'Boulder', 'Greeley', 'Longmont', 'Loveland', 'Grand Junction', 'Broomfield']),
    ('Connecticut', ARRAY['Bridgeport', 'New Haven', 'Stamford', 'Hartford', 'Waterbury', 'Norwalk', 'Danbury', 'New Britain', 'Bristol', 'Meriden', 'West Haven', 'Milford', 'Middletown', 'Norwich', 'Shelton']),
    ('Delaware', ARRAY['Wilmington', 'Dover', 'Newark', 'Middletown', 'Smyrna', 'Milford', 'Seaford', 'Georgetown', 'Elsmere', 'New Castle']),
    ('Florida', ARRAY['Jacksonville', 'Miami', 'Tampa', 'Orlando', 'St. Petersburg', 'Hialeah', 'Tallahassee', 'Fort Lauderdale', 'Port St. Lucie', 'Cape Coral', 'Pembroke Pines', 'Hollywood', 'Miramar', 'Gainesville', 'Coral Springs', 'Miami Gardens', 'Clearwater', 'Palm Bay', 'Pompano Beach', 'West Palm Beach']),
    ('Georgia', ARRAY['Atlanta', 'Augusta', 'Columbus', 'Macon', 'Savannah', 'Athens', 'Sandy Springs', 'Roswell', 'Johns Creek', 'Albany', 'Warner Robins', 'Alpharetta', 'Marietta', 'Valdosta', 'Smyrna', 'Dunwoody']),
    ('Hawaii', ARRAY['Honolulu', 'Pearl City', 'Hilo', 'Kailua', 'Waipahu', 'Kaneohe', 'Mililani Town', 'Kahului', 'Ewa Gentry', 'Kihei']),
    ('Idaho', ARRAY['Boise', 'Meridian', 'Nampa', 'Idaho Falls', 'Pocatello', 'Caldwell', 'Coeur d''Alene', 'Twin Falls', 'Lewiston', 'Post Falls']),
    ('Illinois', ARRAY['Chicago', 'Aurora', 'Joliet', 'Naperville', 'Rockford', 'Elgin', 'Springfield', 'Peoria', 'Champaign', 'Waukegan', 'Cicero', 'Bloomington', 'Arlington Heights', 'Evanston', 'Decatur', 'Schaumburg', 'Bolingbrook', 'Palatine']),
    ('Indiana', ARRAY['Indianapolis', 'Fort Wayne', 'Evansville', 'South Bend', 'Carmel', 'Fishers', 'Bloomington', 'Hammond', 'Gary', 'Lafayette', 'Muncie', 'Terre Haute', 'Kokomo', 'Anderson', 'Noblesville', 'Greenwood']),
    ('Iowa', ARRAY['Des Moines', 'Cedar Rapids', 'Davenport', 'Sioux City', 'Iowa City', 'Waterloo', 'Ames', 'West Des Moines', 'Council Bluffs', 'Dubuque', 'Ankeny', 'Urbandale', 'Cedar Falls', 'Marion', 'Bettendorf']),
    ('Kansas', ARRAY['Wichita', 'Overland Park', 'Kansas City', 'Olathe', 'Topeka', 'Lawrence', 'Shawnee', 'Manhattan', 'Lenexa', 'Salina', 'Hutchinson', 'Leavenworth', 'Leawood', 'Dodge City', 'Garden City']),
    ('Kentucky', ARRAY['Louisville', 'Lexington', 'Bowling Green', 'Owensboro', 'Covington', 'Richmond', 'Georgetown', 'Florence', 'Hopkinsville', 'Nicholasville', 'Frankfort', 'Henderson', 'Jeffersontown', 'Elizabethtown', 'Paducah']),
    ('Louisiana', ARRAY['New Orleans', 'Baton Rouge', 'Shreveport', 'Lafayette', 'Lake Charles', 'Kenner', 'Bossier City', 'Monroe', 'Alexandria', 'New Iberia', 'Houma', 'Slidell', 'Ruston', 'Hammond', 'Natchitoches']),
    ('Maine', ARRAY['Portland', 'Lewiston', 'Bangor', 'South Portland', 'Auburn', 'Biddeford', 'Sanford', 'Brunswick', 'Augusta', 'Scarborough', 'Saco', 'Westbrook', 'Waterville', 'Windham', 'Gorham']),
    ('Maryland', ARRAY['Baltimore', 'Frederick', 'Rockville', 'Gaithersburg', 'Bowie', 'Hagerstown', 'Annapolis', 'College Park', 'Salisbury', 'Laurel', 'Greenbelt', 'Cumberland', 'Westminster', 'Hyattsville', 'Takoma Park']),
    ('Massachusetts', ARRAY['Boston', 'Worcester', 'Springfield', 'Lowell', 'Cambridge', 'New Bedford', 'Brockton', 'Quincy', 'Lynn', 'Fall River', 'Newton', 'Lawrence', 'Somerville', 'Framingham', 'Haverhill', 'Waltham', 'Malden', 'Brookline', 'Plymouth', 'Medford']),
    ('Michigan', ARRAY['Detroit', 'Grand Rapids', 'Warren', 'Sterling Heights', 'Ann Arbor', 'Lansing', 'Flint', 'Dearborn', 'Livonia', 'Westland', 'Troy', 'Farmington Hills', 'Kalamazoo', 'Wyoming', 'Southfield', 'Rochester Hills', 'Taylor', 'Pontiac', 'St. Clair Shores', 'Royal Oak']),
    ('Minnesota', ARRAY['Minneapolis', 'St. Paul', 'Rochester', 'Duluth', 'Bloomington', 'Brooklyn Park', 'Plymouth', 'St. Cloud', 'Eagan', 'Woodbury', 'Maple Grove', 'Eden Prairie', 'Coon Rapids', 'Burnsville', 'Blaine', 'Lakeville', 'Minnetonka', 'Apple Valley', 'Edina', 'St. Louis Park']),
    ('Mississippi', ARRAY['Jackson', 'Gulfport', 'Southaven', 'Hattiesburg', 'Biloxi', 'Meridian', 'Tupelo', 'Greenville', 'Olive Branch', 'Horn Lake', 'Clinton', 'Pearl', 'Starkville', 'Pascagoula', 'Brandon', 'Ridgeland', 'Vicksburg', 'Laurel', 'Oxford', 'Gautier']),
    ('Missouri', ARRAY['Kansas City', 'St. Louis', 'Springfield', 'Columbia', 'Independence', 'Lee''s Summit', 'O''Fallon', 'St. Joseph', 'St. Charles', 'St. Peters', 'Blue Springs', 'Florissant', 'Joplin', 'Chesterfield', 'Jefferson City', 'Cape Girardeau', 'Wentzville', 'University City', 'Liberty', 'Ballwin']),
    ('Montana', ARRAY['Billings', 'Missoula', 'Great Falls', 'Bozeman', 'Butte', 'Helena', 'Kalispell', 'Havre', 'Anaconda', 'Miles City', 'Belgrade', 'Livingston', 'Laurel', 'Whitefish', 'Lewistown']),
    ('Nebraska', ARRAY['Omaha', 'Lincoln', 'Bellevue', 'Grand Island', 'Kearney', 'Fremont', 'Hastings', 'Norfolk', 'North Platte', 'Columbus', 'Papillion', 'La Vista', 'Scottsbluff', 'South Sioux City', 'Beatrice']),
    ('Nevada', ARRAY['Las Vegas', 'Henderson', 'Reno', 'North Las Vegas', 'Sparks', 'Carson City', 'Fernley', 'Elko', 'Mesquite', 'Boulder City', 'Fallon', 'Winnemucca', 'West Wendover', 'Ely', 'Yerington']),
    ('New Hampshire', ARRAY['Manchester', 'Nashua', 'Concord', 'Derry', 'Dover', 'Rochester', 'Salem', 'Merrimack', 'Hudson', 'Londonderry', 'Keene', 'Bedford', 'Portsmouth', 'Goffstown', 'Laconia']),
    ('New Jersey', ARRAY['Newark', 'Jersey City', 'Paterson', 'Elizabeth', 'Trenton', 'Clifton', 'Camden', 'Passaic', 'Union City', 'Bayonne', 'East Orange', 'Vineland', 'New Brunswick', 'Hoboken', 'Perth Amboy', 'West New York', 'Plainfield', 'Hackensack', 'Sayreville', 'Kearny']),
    ('New Mexico', ARRAY['Albuquerque', 'Las Cruces', 'Rio Rancho', 'Santa Fe', 'Roswell', 'Farmington', 'Clovis', 'Hobbs', 'Alamogordo', 'Carlsbad', 'Gallup', 'Deming', 'Los Lunas', 'Chaparral', 'Sunland Park']),
    ('New York', ARRAY['New York City', 'Buffalo', 'Rochester', 'Yonkers', 'Syracuse', 'Albany', 'New Rochelle', 'Mount Vernon', 'Schenectady', 'Utica', 'White Plains', 'Hempstead', 'Troy', 'Niagara Falls', 'Binghamton', 'Freeport', 'Valley Stream']),
    ('North Carolina', ARRAY['Charlotte', 'Raleigh', 'Greensboro', 'Durham', 'Winston-Salem', 'Fayetteville', 'Cary', 'Wilmington', 'High Point', 'Greenville', 'Asheville', 'Concord', 'Gastonia', 'Jacksonville', 'Chapel Hill', 'Rocky Mount', 'Burlington', 'Wilson', 'Huntersville', 'Kannapolis']),
    ('North Dakota', ARRAY['Fargo', 'Bismarck', 'Grand Forks', 'Minot', 'West Fargo', 'Williston', 'Dickinson', 'Mandan', 'Jamestown', 'Wahpeton', 'Devils Lake', 'Valley City', 'Watford City', 'Grafton', 'Lincoln']),
    ('Ohio', ARRAY['Columbus', 'Cleveland', 'Cincinnati', 'Toledo', 'Akron', 'Dayton', 'Parma', 'Canton', 'Youngstown', 'Lorain', 'Hamilton', 'Springfield', 'Kettering', 'Elyria', 'Lakewood', 'Cuyahoga Falls', 'Middletown', 'Euclid', 'Mansfield', 'Newark']),
    ('Oklahoma', ARRAY['Oklahoma City', 'Tulsa', 'Norman', 'Broken Arrow', 'Lawton', 'Edmond', 'Moore', 'Midwest City', 'Enid', 'Stillwater', 'Muskogee', 'Bartlesville', 'Owasso', 'Shawnee', 'Ponca City', 'Ardmore', 'Duncan', 'Del City', 'Bixby', 'Sapulpa']),
    ('Oregon', ARRAY['Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro', 'Beaverton', 'Bend', 'Medford', 'Springfield', 'Corvallis', 'Albany', 'Tigard', 'Lake Oswego', 'Keizer', 'Grants Pass', 'Oregon City', 'McMinnville', 'Redmond', 'Tualatin', 'West Linn']),
    ('Pennsylvania', ARRAY['Philadelphia', 'Pittsburgh', 'Allentown', 'Erie', 'Reading', 'Scranton', 'Bethlehem', 'Lancaster', 'Harrisburg', 'Altoona', 'York', 'State College', 'Wilkes-Barre', 'Chester', 'Williamsport', 'Easton', 'Lebanon', 'Hazleton', 'New Castle', 'Johnstown']),
    ('Rhode Island', ARRAY['Providence', 'Warwick', 'Cranston', 'Pawtucket', 'East Providence', 'Woonsocket', 'Coventry', 'Cumberland', 'North Providence', 'South Kingstown', 'West Warwick', 'Johnston', 'North Kingstown', 'Newport', 'Bristol']),
    ('South Carolina', ARRAY['Charleston', 'Columbia', 'North Charleston', 'Mount Pleasant', 'Rock Hill', 'Greenville', 'Summerville', 'Sumter', 'Goose Creek', 'Hilton Head Island', 'Florence', 'Spartanburg', 'Myrtle Beach', 'Aiken', 'Anderson', 'Greer', 'Mauldin', 'Greenwood', 'North Augusta', 'Easley']),
    ('South Dakota', ARRAY['Sioux Falls', 'Rapid City', 'Aberdeen', 'Brookings', 'Watertown', 'Mitchell', 'Yankton', 'Pierre', 'Huron', 'Vermillion', 'Spearfish', 'Brandon', 'Box Elder', 'Madison', 'Sturgis']),
    ('Tennessee', ARRAY['Nashville', 'Memphis', 'Knoxville', 'Chattanooga', 'Clarksville', 'Murfreesboro', 'Franklin', 'Jackson', 'Johnson City', 'Bartlett', 'Hendersonville', 'Kingsport', 'Collierville', 'Cleveland', 'Smyrna', 'Germantown', 'Brentwood', 'Columbia', 'La Vergne', 'Spring Hill']),
    ('Texas', ARRAY['Houston', 'San Antonio', 'Dallas', 'Austin', 'Fort Worth', 'El Paso', 'Arlington', 'Corpus Christi', 'Plano', 'Laredo', 'Lubbock', 'Garland', 'Irving', 'Amarillo', 'Grand Prairie', 'McKinney', 'Frisco', 'Pasadena', 'Killeen', 'Mesquite', 'McAllen', 'Waco', 'Carrollton', 'Denton', 'Midland', 'Abilene', 'Beaumont', 'Round Rock', 'Odessa', 'Wichita Falls', 'Richardson', 'Lewisville', 'Tyler']),
    ('Utah', ARRAY['Salt Lake City', 'West Valley City', 'Provo', 'West Jordan', 'Orem', 'Sandy', 'Ogden', 'St. George', 'Layton', 'Taylorsville', 'South Jordan', 'Lehi', 'Logan', 'Murray', 'Draper', 'Bountiful', 'Riverton', 'Roy', 'Spanish Fork', 'Pleasant Grove']),
    ('Vermont', ARRAY['Burlington', 'South Burlington', 'Rutland', 'Barre', 'Montpelier', 'Winooski', 'St. Albans', 'Newport', 'Vergennes', 'Essex Junction']),
    ('Virginia', ARRAY['Virginia Beach', 'Norfolk', 'Chesapeake', 'Richmond', 'Newport News', 'Alexandria', 'Hampton', 'Roanoke', 'Portsmouth', 'Suffolk', 'Lynchburg', 'Harrisonburg', 'Leesburg', 'Charlottesville', 'Danville', 'Blacksburg', 'Manassas', 'Petersburg', 'Fredericksburg', 'Winchester']),
    ('Washington', ARRAY['Seattle', 'Spokane', 'Tacoma', 'Vancouver', 'Bellevue', 'Kent', 'Everett', 'Renton', 'Yakima', 'Federal Way', 'Spokane Valley', 'Bellingham', 'Kennewick', 'Auburn', 'Pasco', 'Marysville', 'Lakewood', 'Redmond', 'Shoreline', 'Richland']),
    ('West Virginia', ARRAY['Charleston', 'Huntington', 'Morgantown', 'Parkersburg', 'Wheeling', 'Weirton', 'Fairmont', 'Martinsburg', 'Beckley', 'Clarksburg', 'South Charleston', 'St. Albans', 'Vienna', 'Bluefield', 'Moundsville']),
    ('Wisconsin', ARRAY['Milwaukee', 'Madison', 'Green Bay', 'Kenosha', 'Racine', 'Appleton', 'Waukesha', 'Oshkosh', 'Eau Claire', 'Janesville', 'West Allis', 'La Crosse', 'Sheboygan', 'Wauwatosa', 'Fond du Lac', 'New Berlin', 'Wausau', 'Brookfield', 'Beloit', 'Greenfield']),
    ('Wyoming', ARRAY['Cheyenne', 'Casper', 'Laramie', 'Gillette', 'Rock Springs', 'Sheridan', 'Green River', 'Evanston', 'Riverton', 'Cody', 'Rawlins', 'Lander', 'Torrington', 'Powell', 'Jackson'])
) AS t(state, cities)
CROSS JOIN LATERAL unnest(t.cities) AS c(city)
JOIN States s ON s.name = t.state
ON CONFLICT (name, state_id) DO NOTHING;

-- Re-enable triggers
ALTER TABLE States ENABLE TRIGGER ALL;
ALTER TABLE Cities ENABLE TRIGGER ALL;
