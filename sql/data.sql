DELETE FROM fitness;
DELETE FROM sports;
DELETE FROM address;
DELETE FROM users;
DELETE FROM notifications;
DELETE FROM matchs;
DELETE FROM participant;


-- --- Populate fitness table ------------
ALTER SEQUENCE fitness_id_seq RESTART;
INSERT INTO fitness (type) VALUES
('Begenner'),
('Intermediate'),
('Advenced');

-- --- Populate sports table ------------
ALTER SEQUENCE sports_id_seq RESTART;
INSERT INTO sports (name) VALUES
('football'),
('Tennis'),
('golf');

-- --- Populate address table for match ------------
ALTER SEQUENCE address_id_seq RESTART;
INSERT INTO address (name, street, city, postal_code) VALUES
('Stade du Moulin Boisseau', 'Rue du Moulin Boisseau','Carquefou' , 44470),
('Stade de la Beaujoire', 'Route de Saint-Joseph','Nantes' , 44300),
('Stade municipal', '31bis Rue du Stade','Sainte-Luce-sur-Loire' , 44980);


-- --- Populate address table for users ------------
INSERT INTO address (city, postal_code) VALUES
('Sainte-Luce-sur-Loire', 44980),
('Carquefou', 44470);

-- --- Populate users table ------------
ALTER SEQUENCE users_id_seq RESTART;
INSERT INTO users (firstname, lastname, age, email, password, nb_match, fitness_id, address_id) VALUES
('Mark', 'Couty', 35, 'mc@test.fr', '1234', 4, 3, 5),
('Robert', 'Pater', 75, 'rp@test.fr', '1234', 5, 2, 4);

-- --- Populate notifications table ------------
ALTER SEQUENCE notifications_id_seq RESTART;
INSERT INTO notifications (description, status, user_id) VALUES
(' à refusé votre demande d incription', false , 1),
(' à accepté votre demande d incription', true, 2);

-- --- Populate score_app table ------------
INSERT INTO score_app (user_id, score) VALUES
(1, 3),
(2, 2);

--- Populate match table ------------
ALTER SEQUENCE matchs_id_seq RESTART;
INSERT INTO matchs (name, score, organization_id, sport_id, address_id, nb_player_min, nb_player_max, date_time, duration, price, best_player_id) VALUES
('Football U8', 'EU 2 / 5 US', 1, 1, 1, 1, 10,(TO_TIMESTAMP('2022-09-15', '10:00')), (TO_TIMESTAMP('2022-1-1', '2:00')), 15, 2);

--- Populate participant table ------------
INSERT INTO participant (match_id, user_id, status) VALUES
(1 , 1 , 1),
(1, 2 , 2);