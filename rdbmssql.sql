--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2023-03-28 21:29:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 239 (class 1255 OID 33105)
-- Name: abc(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.abc()
    LANGUAGE plpgsql
    AS $$
declare 
n integer:=23;
c integer:=0;
begin
for i in 1..n
loop


if(mod(n,i)=0)
 then c:=c+1;
end if;
end loop;
if(c=2) then raise notice 'prime%',n;

end if;
end;
$$;


ALTER PROCEDURE public.abc() OWNER TO postgres;

--
-- TOC entry 215 (class 1255 OID 33065)
-- Name: cantdel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cantdel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	raise exception 'Dont delete from oddeven table';
end;
$$;


ALTER FUNCTION public.cantdel() OWNER TO postgres;

--
-- TOC entry 214 (class 1255 OID 24867)
-- Name: check_number(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_number(num numeric, OUT result character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
IF num>0 THEN
result := 'Positive';
ELSEIF num<0 THEN
result := 'Negative';
ELSE
result := 'Zero';
END IF;



RETURN;
END
$$;


ALTER FUNCTION public.check_number(num numeric, OUT result character varying) OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 33076)
-- Name: chk(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.chk()
    LANGUAGE plpgsql
    AS $$
declare
n numeric:=1;
begin
if(n<0)
then raise notice '-ve';
else
raise notice '+ve';
end if;
end;
$$;


ALTER PROCEDURE public.chk() OWNER TO postgres;

--
-- TOC entry 224 (class 1255 OID 33099)
-- Name: chk(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.chk(n1 integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

declare
n integer=n1;
begin
if(n<0) then return 1;
else
return 0;
end if;

end;
$$;


ALTER FUNCTION public.chk(n1 integer) OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 24874)
-- Name: chkno(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.chkno(n integer)
    LANGUAGE plpgsql
    AS $$
declare
t INTEGER := n;
rev INTEGER := 0;
d INTEGER := 0;
begin
while t>0
Loop
d = t%10;
rev = (rev*10) + d;
t = t/10;
End loop;
if rev=n then
raise notice 'palindrome';
else
raise notice 'not palindrome';
end if;
end;
$$;


ALTER PROCEDURE public.chkno(n integer) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 33081)
-- Name: chko(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.chko() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
n integer:=1234;
n1 integer:=n;
rev integer:=0;
d integer;
begin
while(n>0)
loop
d:=n%10;
rev:=rev*10+d;
n=n/10;
end loop;
raise notice '%old',(rev);
return rev;

end;

$$;


ALTER FUNCTION public.chko() OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 33078)
-- Name: chko(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.chko(m integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare
n integer:=m;
begin
if(n>0) then
return 'positive';
else
return 'negative';
end if;

end;

$$;


ALTER FUNCTION public.chko(m integer) OWNER TO postgres;

--
-- TOC entry 217 (class 1255 OID 33074)
-- Name: finddiv5(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.finddiv5(even character varying)
    LANGUAGE plpgsql
    AS $$
declare
ch record;
begin
for ch in(select num from OddEven where type='Even' and num%5=0)
loop
insert into evendiv values (ch.num);
end loop;
end;
$$;


ALTER PROCEDURE public.finddiv5(even character varying) OWNER TO postgres;

--
-- TOC entry 216 (class 1255 OID 24869)
-- Name: incen(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.incen(sl integer)
    LANGUAGE plpgsql
    AS $$
declare
inc INTEGER := 0;
begin
if(sl<=40000) then
inc=1000;
raise notice 'incentive(%) for this sales limit %',inc,sl;
elsif(sl>50000 AND sl<60000) then
inc=10000;
raise notice 'incentive(%)for this sales limit(%)',inc,sl;
elsif(sl>=60000) THEN
inc=20000;
raise notice 'incentive(%)for this sales limit(%)',inc,sl;
end if;
end;
$$;


ALTER PROCEDURE public.incen(sl integer) OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 24873)
-- Name: reverse_number(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.reverse_number(num numeric, OUT result character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE

t INTEGER := num;
rev INTEGER := 0;
d INTEGER := 0;


Begin
while t>0
Loop
d = t%10;
rev = (rev*10) + d;
t = t/10;
End loop;







result := rev;


















RETURN;
END
$$;


ALTER FUNCTION public.reverse_number(num numeric, OUT result character varying) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 24868)
-- Name: smallbig(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.smallbig(n1 integer, n2 integer)
    LANGUAGE plpgsql
    AS $$
declare
num_small INTEGER := 0;
num_large INTEGER :=0;
begin
if(n1>=n2) then
num_small=n2;
num_large=n1;
else
num_small=n1;
num_large=n2;
end if;
raise notice 'stored small n2 ias now(%)',num_small;
raise notice 'stored big asnum large %',num_large;
raise notice 'big % small %',num_large,num_small;
end;
$$;


ALTER PROCEDURE public.smallbig(n1 integer, n2 integer) OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 24875)
-- Name: switch(character); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.switch(sl character)
    LANGUAGE plpgsql
    AS $$
DECLARE
   nameChar char(1) := sl;
BEGIN
   CASE nameChar
      when  'A' then raise notice '%: eXCELLENT ',nameChar;
      when 'B' then raise notice '% :v GOOD ',nameChar;
      when 'C'then raise notice '% :ok',nameChar;
      
      else raise notice 'NONe ';
   END CASE;
END;
$$;


ALTER PROCEDURE public.switch(sl character) OWNER TO postgres;

--
-- TOC entry 222 (class 1255 OID 24876)
-- Name: switch2(character, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.switch2(sl character, n1 integer, n2 integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
   res integer:=0;
   nameChar char(1):=sl;
BEGIN

raise notice 'enter + - * /';
   CASE nameChar
      when  '+' then raise notice 'add % ',(n1+n2);
      when '-' then raise notice 'subtract% ',(n1-n2);
      when '/'then raise notice 'div %',(n1/n2);
	  when '*'then raise notice 'multiply %',(n1*n2);
      
      else raise notice 'NONe ';
   END CASE;
END;
$$;


ALTER PROCEDURE public.switch2(sl character, n1 integer, n2 integer) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 24879)
-- Name: wkday(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.wkday()
    LANGUAGE plpgsql
    AS $$
	DECLARE
	date DATE := TO_DATE('23-NOV-2021', 'DD-MON-YYYY');
	get_day VARCHAR(15);

	begin
	get_day := RTRIM(TO_CHAR(date, 'DAY'));
	IF get_day IN ('SATURDAY', 'SUNDAY') THEN
		raise notice 'Yes Weekend!!';
	else 
		raise notice 'Not weekend!';
	END IF;
	END $$;


ALTER PROCEDURE public.wkday() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16604)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name character varying(100) NOT NULL,
    no_of integer NOT NULL
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16609)
-- Name: book_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.book_authors OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16579)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(255) NOT NULL,
    cost integer,
    published_date date NOT NULL,
    publisher_id integer,
    category character varying(100),
    img character varying(255),
    stock integer,
    pname character varying(300),
    author character varying(100)
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 33108)
-- Name: cancelorders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cancelorders (
    namec character varying(50),
    totcost integer,
    itemname character varying(80),
    quantity integer,
    price integer,
    orderid integer,
    userid integer,
    dateof date,
    sno1 integer NOT NULL
);


ALTER TABLE public.cancelorders OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33106)
-- Name: cancelorders_sno1_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cancelorders_sno1_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cancelorders_sno1_seq OWNER TO postgres;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 212
-- Name: cancelorders_sno1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cancelorders_sno1_seq OWNED BY public.cancelorders.sno1;


--
-- TOC entry 211 (class 1259 OID 33084)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    name character varying(50),
    address character varying(50),
    totcost integer,
    itemname character varying(50),
    quantity integer,
    sno integer NOT NULL,
    price integer,
    orderid integer,
    mail character varying(50),
    userid integer,
    orderid1 integer,
    dateof date,
    deli date
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33082)
-- Name: customer_sno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_sno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_sno_seq OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 210
-- Name: customer_sno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_sno_seq OWNED BY public.customer.sno;


--
-- TOC entry 205 (class 1259 OID 24810)
-- Name: icart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icart (
    username character varying(100) NOT NULL,
    item_name character varying(100) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    book_id integer
);


ALTER TABLE public.icart OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24846)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24844)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 208
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 200 (class 1259 OID 16406)
-- Name: publishers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publishers (
    publisher_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.publishers OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24805)
-- Name: users1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users1 (
    user_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    passwordd character varying(100) NOT NULL,
    tid integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.users1 OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24831)
-- Name: users1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users1_id_seq OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 207
-- Name: users1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;


--
-- TOC entry 206 (class 1259 OID 24823)
-- Name: users1_tid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users1_tid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users1_tid_seq OWNER TO postgres;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 206
-- Name: users1_tid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users1_tid_seq OWNED BY public.users1.tid;


--
-- TOC entry 2910 (class 2604 OID 33111)
-- Name: cancelorders sno1; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cancelorders ALTER COLUMN sno1 SET DEFAULT nextval('public.cancelorders_sno1_seq'::regclass);


--
-- TOC entry 2909 (class 2604 OID 33087)
-- Name: customer sno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN sno SET DEFAULT nextval('public.customer_sno_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 24849)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 24825)
-- Name: users1 tid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1 ALTER COLUMN tid SET DEFAULT nextval('public.users1_tid_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 24833)
-- Name: users1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);


--
-- TOC entry 3067 (class 0 OID 16604)
-- Dependencies: 202
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, name, no_of) FROM stdin;
1	Jain	1
2	Bjarne Stroustrup	2
3	Joshua Bloch	1
4	Bs Grewal	1
5	Pradep Day Manas Gosh	1
6	Barbara C williams	1
7	Nathan Clark	1
8	RS Ghurmi JK Gupta	1
9	Agor R	1
10	VK mehta Rohit Mehta	1
11	MM Uppal	1
12	Adan B Gorway	1
13	Sadhu Singh	1
14	Veerarajan T	1
15	Balagurusamy	1
16	Chris Sebestian	1
\.


--
-- TOC entry 3068 (class 0 OID 16609)
-- Dependencies: 203
-- Data for Name: book_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_authors (book_id, author_id) FROM stdin;
223	1
224	2
225	3
226	4
227	5
228	6
229	7
230	8
231	9
232	10
233	11
234	12
235	13
236	14
237	15
222	16
\.


--
-- TOC entry 3066 (class 0 OID 16579)
-- Dependencies: 201
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (book_id, title, cost, published_date, publisher_id, category, img, stock, pname, author) FROM stdin;
223	Engineering Chemistry-Jain & Jain	380	2020-12-20	4	Chemistry Chemical	image/Chem1jpg.jpg	52	Dhanpat Rai	Jain
224	The C++	380	2020-10-20	2	Computer Engineering	image/C.jpg	52	Khanna Publishers	Bjarne Stourstrup
225	Effective Java	300	2021-10-19	2	Computer Engineering	Java.jpg	50	Khanna Publishers	Joshua Bloch
226	Higher Engineering Mathematics	700	2017-11-10	2	Mathematics 	image/Bs.jpg	48	Khanna Publishers	Bs Grewal
227	Programming in C	600	2016-11-11	1	Computer Engineering	C.jpg	73	S Chand	Pradep Day Manas Gosh
228	Fluid mechanics	450	2016-02-10	5	Mechanical Engineering	image/p1.jpg	50	wiley	Barbara C Willaims
229	C#	300	2017-06-20	1	Computer Engineering	image/chash.jpg	47	S Chand	Nathan Clark
230	Civil Engineering Book	400	2019-10-10	1	Civil Engineering	image/ci12.jpg	50	S chand	RS Ghumi JK Gupta
231	Civil Eng-Qs and ans	500	2021-01-31	2	Civil Engineering	image/ci.jpg	52	Khanna Publishers	Agor R
232	Basic Electrical Engineering	500	2020-01-31	1	eee	image/eee1.jpg	50	S Chand	VK Mehta Rohit Mehta
222	Python Programming	370	2019-02-20	1	Computer Engineering	python.jpg	14	S Chand	Chris Sebestian
233	Engineering Chemistry	400	2019-10-31	2	Chemistry Chemical	image/chem2.jpg	44	Khanna Publishers	MM Uppal
234	Think Python	400	2019-10-19	6	Computer Engineering	image/python1.jpg	50	Orelly	Adan B Gorway
235	Basic mechanical Engineering	400	2020-10-19	1	Mechanical Engineering	image/mech2.jpg	56	S Chand	Sadhu Singh
236	Discrete Mathematics	300	2018-10-19	3	Mathematics	image/math2jpg.jpg	42	Mc Graw Hill	Veerarajan T
237	Programming with Java	433	2018-10-19	3	Computer Engineering	image/j2.jpg	0	Mc Graw Hill	Balagurusamy
\.


--
-- TOC entry 3078 (class 0 OID 33108)
-- Dependencies: 213
-- Data for Name: cancelorders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cancelorders (namec, totcost, itemname, quantity, price, orderid, userid, dateof, sno1) FROM stdin;
Shivaani	900	C#	3	300	117	3	2022-01-20	1
Shivaani	1120	Python Programming	2	370	119	2	2022-01-20	2
Shivaani	1120	The C++	1	380	119	2	2022-01-20	3
Shivaani	1626	Programming with Java	2	433	120	3	2022-01-21	4
Shivaani	1626	The C++	2	380	120	3	2022-01-21	5
Shivaani	2965	Basic mechanical Engineering	2	400	121	3	2022-01-21	6
Shivaani	2965	Programming with Java	5	433	121	3	2022-01-21	7
Shivaani	1520	The C++	4	380	125	3	2022-01-21	8
Shivaani	900	C#	3	300	118	3	2022-01-20	9
Shivaani	1940	Python Programming	2	370	122	3	2022-01-21	10
Shivaani	1940	Programming in C	2	600	122	3	2022-01-21	11
Shivaani	760	The C++	2	380	123	3	2022-01-21	12
Shivaani	740	Python Programming	2	370	128	3	2022-01-22	13
Shivaani	300	C#	1	300	129	3	2022-01-22	14
Shivaani	2100	Higher Engineering Mathematics	3	700	124	3	2022-01-21	15
Shivaani	1500	Python Programming	2	370	130	3	2022-01-24	16
Shivaani	1500	The C++	2	380	130	3	2022-01-24	17
Shivaani	2100	C#	7	300	131	51	2022-01-24	18
Shivaani	2590	Python Programming	7	370	132	53	2022-01-24	19
Shivaani	1200	C#	4	300	133	54	2022-01-24	20
Shivaani	2900	C#	3	300	134	55	2022-01-24	21
Shivaani	2900	Civil Eng-Qs and ans	4	500	134	55	2022-01-24	22
Shivaani	3200	Higher Engineering Mathematics	4	700	135	56	2022-01-24	23
Shivaani	3200	Engineering Chemistry	1	400	135	56	2022-01-24	24
\.


--
-- TOC entry 3076 (class 0 OID 33084)
-- Dependencies: 211
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (name, address, totcost, itemname, quantity, sno, price, orderid, mail, userid, orderid1, dateof, deli) FROM stdin;
adi	        chennai	4040	C#	3	70	300	\N	ss@g.com	2	57	2022-01-10	\N
adi	        chennai	4040	Python Programming	2	71	370	\N	ss@g.com	2	57	2022-01-10	\N
Shivaani	        666	3540	The C++	3	78	380	\N	ss@g.com	3	62	2022-01-11	\N
Shivaani	        666	3540	Engineering Chemistry	6	79	400	\N	ss@g.com	3	62	2022-01-11	\N
Shivaani	        1111	3080	Python Programming	4	80	370	\N	ss@g.com	3	63	2022-01-15	\N
Shivaani	        1111	3080	Basic mechanical Engineering	4	81	400	\N	ss@g.com	3	63	2022-01-15	\N
Shivaani	        ccc	1360	Engineering Chemistry-Jain & Jain	2	137	380	\N	ss@g.com	3	126	2022-01-19	2022-01-24
Shivaani	        ccc	1360	C#	2	138	300	\N	ss@g.com	3	126	2022-01-19	2022-01-24
Shivaani	        ccc	1400	Higher Engineering Mathematics	2	139	700	\N	ss@g.com	3	127	2022-01-22	2022-01-27
Shivaani	      sss  	900	C#	3	47	300	\N	ss@g.com	3	42	2022-01-02	\N
Shivaani	        ttt	2100	Programming in C	3	62	600	\N	ss@g.com	3	53	2022-01-08	\N
Shivaani	        ttt	2100	C#	1	63	300	\N	ss@g.com	3	53	2022-01-08	\N
adi	        chennai	4040	Discrete Mathematics	8	69	300	\N	ss@g.com	2	57	2022-01-12	\N
\.


--
-- TOC entry 3070 (class 0 OID 24810)
-- Dependencies: 205
-- Data for Name: icart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.icart (username, item_name, price, quantity, book_id) FROM stdin;
agi@gmail.com	Engg maths 2	380	2	223
ab@gm.com	Engg maths 2	380	1	223
s123@m.com	C#	300	4	229
shiv3@gmail.com	Programming with Java	433	2	237
shiv3@gmail.com	Python Programming	370	5	222
shiv3@gmail.com	Engineering Chemistry	400	2	233
siva1@gmail.com	Higher Engineering Mathematics	700	4	226
char1@gmail.com	Higher Engineering Mathematics	700	2	226
11@gmail.com	Fluid mechanics	450	2	228
la@m.com	The C++	380	1	224
sh@gmail.com	Higher Engineering Mathematics	700	3	226
aditi7@gmail.com	Civil Engineering Book	400	2	230
aditi7@gmail.com	Python Programming	370	3	222
aditi7@gmail.com	Engineering Chemistry-Jain & Jain	380	2	223
Shivaanis32@gmail.com	The C++	380	1	224
\.


--
-- TOC entry 3074 (class 0 OID 24846)
-- Dependencies: 209
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, user_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 16406)
-- Dependencies: 200
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publishers (publisher_id, name) FROM stdin;
1	S Chand
3	Mc Graw Hill Education
2	Khanna Publishers
4	Dhanpat Rai Publishing Company
5	Wiley
6	orelly
\.


--
-- TOC entry 3069 (class 0 OID 24805)
-- Dependencies: 204
-- Data for Name: users1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users1 (user_id, user_name, passwordd, tid, id) FROM stdin;
371866676	123@gmail.com	1234	1	1
85930	aditi7@gmail.com	323	2	2
10000	mm	123	4	3
6357392	mary123@ymail.com	1234	5	4
9000	a@gmail.com	1234	6	5
333445566	m@gmail.com	12345	7	6
559299	shiv32@gmail.com	1234	8	7
267	agi@gmail.com	1234	9	8
8728462	m123@gmail.com	1234	10	9
359405	ch@gmail.com	323	11	10
987212693	maryy@1.com	223	12	12
927518	ab@gm.com	1	13	13
430553264	11@gmail.com	22	14	14
22637292	agilan@gmail.com	1234	15	15
897537107	ss@gmail.com	1234	16	16
5556352	s1@gmail.com	1234	17	17
892323	bb@gamil.com	1234	38	38
187030558	agm@mmail.com	1234	18	18
497735	maryq@y.com	00	19	19
636226	bhav@yah.com	12	20	20
609524318	bh@gmail.com	1234	21	21
934504173	s@yh.com	1234	22	22
13538524	1@gmail.com	100	23	23
65712327	ask@gmail.com	123	24	24
304829183	mudilan@gmail.com	1234	25	25
1255742	se@gfmail.com	100	39	39
65960470	Ahgg@h.com	123	40	40
479	ag1@gm.com	1	41	41
35948	bis@g.com	11	42	42
13662	la@m.com	la	43	43
1581352	bb1@g.com	1	44	44
3714	dhanlak@1.com	1	45	45
8217541	rsrav@2.com	2	46	46
19255708	charsdhan@12.com	12	47	47
254318	ara@g.com	1234	48	48
372432	rajlaks1@a.com	1234	49	49
577911045	Shivaanis32@gmail.com	1234	3	11
70538	s123@m.com	123	50	50
392443071	shiv3@gmail.com	12345	51	51
70883	82shiv@gmail.com	1234	52	52
328926	sh@gmail.com	12345	53	53
223774645	pro@gmail.com	12345	54	54
97197312	siva1@gmail.com	12345	55	55
9153068	char1@gmail.com	12345	56	56
\.


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 212
-- Name: cancelorders_sno1_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cancelorders_sno1_seq', 24, true);


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 210
-- Name: customer_sno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_sno_seq', 150, true);


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 208
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 135, true);


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 207
-- Name: users1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users1_id_seq', 56, true);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 206
-- Name: users1_tid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users1_tid_seq', 56, true);


--
-- TOC entry 2916 (class 2606 OID 16608)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 2918 (class 2606 OID 16613)
-- Name: book_authors book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (book_id);


--
-- TOC entry 2914 (class 2606 OID 16583)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- TOC entry 2928 (class 2606 OID 33113)
-- Name: cancelorders cancelorders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cancelorders
    ADD CONSTRAINT cancelorders_pkey PRIMARY KEY (sno1);


--
-- TOC entry 2926 (class 2606 OID 33089)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (sno);


--
-- TOC entry 2924 (class 2606 OID 24851)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 2912 (class 2606 OID 16410)
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (publisher_id);


--
-- TOC entry 2920 (class 2606 OID 24835)
-- Name: users1 users1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 24814)
-- Name: users1 userunique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT userunique UNIQUE (user_name);


--
-- TOC entry 2934 (class 2606 OID 33090)
-- Name: customer customer_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(order_id) ON DELETE SET NULL;


--
-- TOC entry 2931 (class 2606 OID 16619)
-- Name: book_authors fk_author; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- TOC entry 2930 (class 2606 OID 16614)
-- Name: book_authors fk_book; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- TOC entry 2929 (class 2606 OID 16584)
-- Name: books fk_publisher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES public.publishers(publisher_id);


--
-- TOC entry 2932 (class 2606 OID 24815)
-- Name: icart fk_uname; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icart
    ADD CONSTRAINT fk_uname FOREIGN KEY (username) REFERENCES public.users1(user_name) ON UPDATE CASCADE;


--
-- TOC entry 2933 (class 2606 OID 24852)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


-- Completed on 2023-03-28 21:29:48

--
-- PostgreSQL database dump complete
--

