# Wiki schema
 
# --- !Ups

CREATE TABLE wikipages (
    id integer NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    uri varchar(255) not null,
    content text not null,
    author varchar(255) not null,
    create_date timestamp not null default now(),
    updater varchar(255),
    modified_date timestamp
);
CREATE TRIGGER wikipages_modified_date_trigger BEFORE UPDATE ON wikipages FOR EACH ROW SET NEW.modified_date = NOW();
CREATE UNIQUE INDEX wikipages_uri_index ON wikipages (uri);
 
# --- !Downs

DROP INDEX wikipages_uri_index;
DROP TRIGGER wikipages_modified_date_trigger;
DROP TABLE wikipages;


