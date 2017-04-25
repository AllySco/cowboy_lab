DROP TABLE if EXISTS bounties;

CREATE TABLE bounties (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT4,
  danger_level INT4,
  last_known_location VARCHAR(255),
  home_world VARCHAR(255),
  favourite_weapon VARCHAR(255)
);

