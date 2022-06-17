USE AAT52;

/*
DROP TABLE movies_actors;
DROP TABLE movies_locations;
DROP TABLE locations;
DROP TABLE actors;
DROP TABLE movies;
*/

CREATE TABLE movies (
	movie_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	release_date DATETIME NOT NULL,
	plot_description VARCHAR(40000) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE actors (
	actor_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	
    first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	birth_date DATETIME NOT NULL,
	biography VARCHAR(1000) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE locations (
	location_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	
    location_name VARCHAR(100) NOT NULL,
	street_address VARCHAR(150) NOT NULL,
	city VARCHAR(100) NOT NULL,
	state CHAR(2) NOT NULL,
    zip VARCHAR(5) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE movies_actors (
	movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    
    FOREIGN KEY (movie_id) 
    REFERENCES movies (movie_id),
	FOREIGN KEY (actor_id) 
    REFERENCES actors (actor_id)
) ENGINE = InnoDB;

CREATE TABLE movies_locations (
	movie_id INT NOT NULL,
    location_id INT NOT NULL,
    
    FOREIGN KEY (movie_id) 
    REFERENCES movies (movie_id),
	FOREIGN KEY (location_id) 
    REFERENCES locations (location_id)
) ENGINE = InnoDB;

INSERT INTO movies (movie_id, title, release_date, plot_description)
VALUES (1,
		'Hero', 
        '2004-08-27', 
        'A defense officer, Nameless, was summoned by the 
        King of Qin regarding his success of terminating three warriors.');
		/*source: https://www.imdb.com/title/tt0299977/ */

INSERT INTO movies (movie_id, title, release_date, plot_description)
VALUES (2, 
		'Chungking Express', 
		'1996-03-10', 
        'Two melancholy Hong Kong policemen fall in love: one with a 
        mysterious female underworld figure, the other with a beautiful 
        and ethereal server at a late-night restaurant he frequents.');
        /*source: https://www.imdb.com/title/tt0109424/?ref_=nm_knf_t4 */

INSERT INTO movies (movie_id, title, release_date, plot_description)
VALUES (3, 
		'Knives Out', 
        '2019-12-01', 
        'When renowned crime novelist Harlan Thrombey (Christopher 
        Plummer) is found dead at his estate just after his 85th birthday, 
        the inquisitive and debonair Detective Benoit Blanc (Daniel Craig) 
        is mysteriously enlisted to investigate. From Harlan''''s dysfunctional 
        family to his devoted staff, Blanc sifts through a web of red herrings 
        and self-serving lies to uncover the truth behind Harlan''''s untimely death.');
         /*source: https://www.imdb.com/title/tt8946378/ */
         
INSERT INTO movies (movie_id, title, release_date, plot_description)
VALUES (4, 
		'Hereditary', 
        '2018-06-08', 
        'When her mentally ill mother passes away, a woman named Annie 
		and her husband, son and daughter all mourn her loss. The family
        turn to different means to handle their grief, including Annie and her 
        daughter both flirting with the supernatural. They each begin to have 
        disturbing, otherworldly experiences linked to the sinister secrets and 
        emotional trauma that have been passed through the generations of 
        their family.');
         /*source: https://www.imdb.com/title/tt8946378/ */

INSERT INTO actors (actor_id, first_name, last_name, birth_date, biography)
VALUES (1, 
		'Tony', 
        'Wai', 
        '1962-06-27', 
        'Tony Leung Chiu Wai was born in Hong Kong on 27 June 1962. 
        He and his younger sister were raised by their mother after his 
        father left them. In 1982, after passing the training courses of TVB, 
        Tony became a TV actor and became famous for his comedy style 
        in such TV shows as Lu ding ji (1983) or The Proud Twins (1979). 
        However, he didn''''t limit himself to television and began showing
        his versatility in films like My Heart Is That Eternal Rose (1989) and 
        A City of Sadness (1989). After he starred in several movies directed 
        by ''''Kar wai Wong''''; such as Chungking Express (1994) and Happy 
        Together (1997), he gained more respect as an actor and finally 
        received the Best Actor Award at the Cannes International Film 
        Festival for his outstanding performance in In the Mood for Love (2000). 
        In addition to his acting career, he is also known as a singer.');
       /*source: https://www.imdb.com/name/nm0504897/?ref_=tt_ov_st_sm */

INSERT INTO actors (actor_id, first_name, last_name, birth_date, biography)
VALUES (2,
		'Toni', 
        'Collette', 
        '1972-11-01', 
        'Toni Collette is an Academy Award-nominated Australian actress, 
        best known for her roles in The Sixth Sense (1999) and Little Miss 
        Sunshine (2006). At the age of eleven, she showed her phenomenal 
        acting skills when she faked appendicitis out of boredom and longing 
        for attention; her act was so convincing that doctors had to remove 
        her appendix, even though the test showed nothing was wrong with it. 
        At 16, she left school and enrolled in the National Institute of Dramatic 
        Arts (NIDA). After 18 months of studies, she left NIDA for her feature 
        film debut as "Wendy Robinson", opposite Russell Crowe and Anthony 
        Hopkins, in The Efficiency Expert (1992), and earned herself a nomination 
        for Best Supporting Actress from the Australian Film Institute. In 1995, 
        Toni Collette came to Hollywood with a supporting role in The Pallbearer 
        (1996), then had a string of supporting roles. Her breakthrough came with 
        the role as "Lynn Sear" in The Sixth Sense (1999), for which she won an 
        Academy Award nomination for Best Actress in a Supporting Role. Her 
        latest memorable role as "Sheryl", a beaten-down but loving mother, in 
        Little Miss Sunshine (2006).');
		/*source: https://www.imdb.com/name/nm0001057/?ref_=tt_cl_t7 */

INSERT INTO actors (actor_id, first_name, last_name, birth_date, biography)
VALUES (3, 
		'Ryan', 
        'Reynolds', 
        '1976-10-23', 
        'Ryan Rodney Reynolds was born on October 23, 1976 in Vancouver, 
        British Columbia, Canada, the youngest of four children. Between 
        1991-93, Ryan appeared in Fifteen (1990), a Nickleodeon series taped 
        in Florida with many other Canadian actors. In 1997, he landed the role 
        of Berg in Two Guys, a Girl and a Pizza Place (1998). Initially, the show 
        was reviled by critics and seemed desperate for any type of ratings success. 
        However, it was renewed for a second season but with a provision for a 
        makeover by former Roseanne (1988) writer Kevin Abbott. The show 
        became a minor success and has led to additional film roles for Ryan, 
        most notably in the last-ever MGM film, a remake of The Amityville Horror (2005).');
		/*source: https://www.imdb.com/name/nm0005351/bio?ref_=nm_ov_bio_sm */

INSERT INTO locations (location_id, location_name, street_address, city, state, zip)
VALUES (1, 'China', 'Hengdiang', 'Dongyang', 'Zhejiang', 'N/A');

INSERT INTO locations (location_id, location_name, street_address, city, state, zip)
VALUES (2, 'United States', 'Ames Mansion', 'Boston', 'MA', 'N/A');

INSERT INTO locations (location_id, location_name, street_address, city, state, zip)
VALUES (3, 'United States', 'Summit County', 'Salt Lake City', 'UT', 'N/A');

INSERT INTO movies_actors (movie_id, actor_id)
VALUES (1, 1);

INSERT INTO movies_actors (movie_id, actor_id)
VALUES (2, 1);

INSERT INTO movies_actors (movie_id, actor_id)
VALUES (3, 2);

INSERT INTO movies_actors (movie_id, actor_id)
VALUES (4, 2);

INSERT INTO movies_locations (movie_id, location_id)
VALUES (1, 1);

INSERT INTO movies_locations (movie_id, location_id)
VALUES (3, 2);

INSERT INTO movies_locations (movie_id, location_id)
VALUES (4, 3);

SELECT*FROM movies;
SELECT*FROM actors;
SELECT*FROM locations;
SELECT*FROM movies_actors;
SELECT*FROM movies_locations;


