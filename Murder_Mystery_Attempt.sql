/* Check murder crime on date 2018-01-15 in SQL City */
select description from crime_scene_report where date='20180115' and city='SQL City' and type='murder';

/* From the data, we get a first witness who lived in a last house on a Northwestern Dr and a second witness lived on a Franklin Ave and named Annabel*/
/* Searching what is first witness's name */
select name, license_id,id from person where address_street_name = 'Northwestern Dr' order by address_number desc;

/* We get first witness's name is Morty Schapiro,his license_id=118009, and his id = 14887 */

/* Now lets check Mr. Morty's interview */
select * from interview where person_id = '14887';

/* Based on Mr. Morty's interview, the suspect had a "Get Fit Now Gym" bag that only gold members have those bags. 
And membership number started with 48Z. Suspect car have a plate number H42W included.

/* Now lets check the second witness data */
select * from person where address_street_name = 'Franklin Ave' and name LIKE "Annabel%";
/* We get second witness's name is Annabel Miller,her license_id=490173, and her id = 16371 */

/* Lets check Mrs. Annabel's interview */
select * from interview where person_id = 16371;
/* The suspect went to gym on January the 9th */


/* CHAPTER 2 */
/* Based on Mr. Morty's interview, the suspect membership number started with 48Z and based on fact by Mr. Morty the bag taht suspect had is only gold member had. Lets check data member's gym */
select * from get_fit_now_member where id LIKE '48Z%' AND membership_status='gold';
/* We get 2 suspect named Joe Germuska with id person = 28819 and id member = 48Z7A and Jeremy Bowers with id person = 67318 and id member=48Z55*/

/* Now lets narrow down our suspect. Based on Mrs. Annabel's interview, the suspect went to gym on January the 9th.
Now let's check the data check in based on our suspect */

select * from get_fit_now_check_in where membership_id='48Z7A' OR membership_id='48Z55' and check_in_date=20180109;
/* Our two suspects checked in on that day*/
/* Now let's check who have a plate number H42W included */

select * from drivers_license where plate_number LIKE '%H42W%';
/* We get 3 another suspect who had a plate number H42W included */


/* CHAPTER 3 */
/* In this chapter, lets check id's suspect */
select * from person where license_id in (183779, 423327, 664760);

/* there is one name that meets the facts related to the suspect. Lets check if there is an interview with him */

select * from interview where person_id = 67318;
/* From the interview, Jeremy Bowers was hired by a woman with a lot of money. she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. 
she attended the SQL Symphony Concert 3 times in December 2017. */

/* Based on the results of the interview with Jeremy Bowers, let's check whether there is a woman who owns a Tesla car and height around 5'5 or 5'7 */
select * from drivers_license where car_make= 'Tesla' and car_model='Model S' and height BETWEEN 65 AND 67 and gender='female' and hair_color='red';

/* We get 3 suspect, female who have a Tesla Car Model S. Now from here lets check the suspect's income*/
select income.annual_income, person.license_id, person.id, income.ssn from income 
join person on income.ssn = person.ssn 
where person.license_id in (291182, 202298, 918773);
/* Based on annual income in the 3 suspects, Miranda Priestly(license_id=202298) who has the most income 

/* Lets check who is attended the SQL Symphony Concert in December 2017 */
select person.license_id, fb.date from facebook_event_checkin as fb
join person on fb.person_id = person.id
where event_name = 'SQL Symphony Concert' and date LIKE '201712%' and person.license_id in (291182, 202298, 918773);
/*ANDDD Miranda Priestly had attended 3 times in SQL Symphony Concert on 06, 12,29 decemmber 
LEEETSSS ARREST HERRR */

INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;