PGDMP     '    0                z            db    13.4    13.4 H    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    db    DATABASE     ^   CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';
    DROP DATABASE db;
                postgres    false            ?            1255    33105    abc() 	   PROCEDURE     ?   CREATE PROCEDURE public.abc()
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
    DROP PROCEDURE public.abc();
       public          postgres    false            ?            1255    33065 	   cantdel()    FUNCTION     ?   CREATE FUNCTION public.cantdel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	raise exception 'Dont delete from oddeven table';
end;
$$;
     DROP FUNCTION public.cantdel();
       public          postgres    false            ?            1255    24867    check_number(numeric)    FUNCTION       CREATE FUNCTION public.check_number(num numeric, OUT result character varying) RETURNS character varying
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
 N   DROP FUNCTION public.check_number(num numeric, OUT result character varying);
       public          postgres    false            ?            1255    33076    chk() 	   PROCEDURE     ?   CREATE PROCEDURE public.chk()
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
    DROP PROCEDURE public.chk();
       public          postgres    false            ?            1255    33099    chk(integer)    FUNCTION     ?   CREATE FUNCTION public.chk(n1 integer) RETURNS integer
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
 &   DROP FUNCTION public.chk(n1 integer);
       public          postgres    false            ?            1255    24874    chkno(integer) 	   PROCEDURE     '  CREATE PROCEDURE public.chkno(n integer)
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
 (   DROP PROCEDURE public.chkno(n integer);
       public          postgres    false            ?            1255    33081    chko()    FUNCTION       CREATE FUNCTION public.chko() RETURNS integer
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
    DROP FUNCTION public.chko();
       public          postgres    false            ?            1255    33078    chko(integer)    FUNCTION     ?   CREATE FUNCTION public.chko(m integer) RETURNS character varying
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
 &   DROP FUNCTION public.chko(m integer);
       public          postgres    false            ?            1255    33074    finddiv5(character varying) 	   PROCEDURE     ?   CREATE PROCEDURE public.finddiv5(even character varying)
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
 8   DROP PROCEDURE public.finddiv5(even character varying);
       public          postgres    false            ?            1255    24869    incen(integer) 	   PROCEDURE     ?  CREATE PROCEDURE public.incen(sl integer)
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
 )   DROP PROCEDURE public.incen(sl integer);
       public          postgres    false            ?            1255    24873    reverse_number(numeric)    FUNCTION     H  CREATE FUNCTION public.reverse_number(num numeric, OUT result character varying) RETURNS character varying
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
 P   DROP FUNCTION public.reverse_number(num numeric, OUT result character varying);
       public          postgres    false            ?            1255    24868    smallbig(integer, integer) 	   PROCEDURE     ?  CREATE PROCEDURE public.smallbig(n1 integer, n2 integer)
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
 8   DROP PROCEDURE public.smallbig(n1 integer, n2 integer);
       public          postgres    false            ?            1255    24875    switch(character) 	   PROCEDURE     j  CREATE PROCEDURE public.switch(sl character)
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
 ,   DROP PROCEDURE public.switch(sl character);
       public          postgres    false            ?            1255    24876 $   switch2(character, integer, integer) 	   PROCEDURE     ?  CREATE PROCEDURE public.switch2(sl character, n1 integer, n2 integer)
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
 E   DROP PROCEDURE public.switch2(sl character, n1 integer, n2 integer);
       public          postgres    false            ?            1255    24879    wkday() 	   PROCEDURE     G  CREATE PROCEDURE public.wkday()
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
    DROP PROCEDURE public.wkday();
       public          postgres    false            ?            1259    16604    authors    TABLE     ?   CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name character varying(100) NOT NULL,
    no_of integer NOT NULL
);
    DROP TABLE public.authors;
       public         heap    postgres    false            ?            1259    16609    book_authors    TABLE     c   CREATE TABLE public.book_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
     DROP TABLE public.book_authors;
       public         heap    postgres    false            ?            1259    16579    books    TABLE     R  CREATE TABLE public.books (
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
    DROP TABLE public.books;
       public         heap    postgres    false            ?            1259    33108    cancelorders    TABLE     ?   CREATE TABLE public.cancelorders (
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
     DROP TABLE public.cancelorders;
       public         heap    postgres    false            ?            1259    33106    cancelorders_sno1_seq    SEQUENCE     ?   CREATE SEQUENCE public.cancelorders_sno1_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cancelorders_sno1_seq;
       public          postgres    false    213                       0    0    cancelorders_sno1_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cancelorders_sno1_seq OWNED BY public.cancelorders.sno1;
          public          postgres    false    212            ?            1259    33084    customer    TABLE     _  CREATE TABLE public.customer (
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
    DROP TABLE public.customer;
       public         heap    postgres    false            ?            1259    33082    customer_sno_seq    SEQUENCE     ?   CREATE SEQUENCE public.customer_sno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customer_sno_seq;
       public          postgres    false    211                       0    0    customer_sno_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customer_sno_seq OWNED BY public.customer.sno;
          public          postgres    false    210            ?            1259    24810    icart    TABLE     ?   CREATE TABLE public.icart (
    username character varying(100) NOT NULL,
    item_name character varying(100) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    book_id integer
);
    DROP TABLE public.icart;
       public         heap    postgres    false            ?            1259    24846    orders    TABLE     S   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer
);
    DROP TABLE public.orders;
       public         heap    postgres    false            ?            1259    24844    orders_order_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    209                       0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    208            ?            1259    16406 
   publishers    TABLE     p   CREATE TABLE public.publishers (
    publisher_id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.publishers;
       public         heap    postgres    false            ?            1259    24805    users1    TABLE     ?   CREATE TABLE public.users1 (
    user_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    passwordd character varying(100) NOT NULL,
    tid integer NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.users1;
       public         heap    postgres    false            ?            1259    24831    users1_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users1_id_seq;
       public          postgres    false    204                       0    0    users1_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;
          public          postgres    false    207            ?            1259    24823    users1_tid_seq    SEQUENCE     ?   CREATE SEQUENCE public.users1_tid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.users1_tid_seq;
       public          postgres    false    204                       0    0    users1_tid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.users1_tid_seq OWNED BY public.users1.tid;
          public          postgres    false    206            ^           2604    33111    cancelorders sno1    DEFAULT     v   ALTER TABLE ONLY public.cancelorders ALTER COLUMN sno1 SET DEFAULT nextval('public.cancelorders_sno1_seq'::regclass);
 @   ALTER TABLE public.cancelorders ALTER COLUMN sno1 DROP DEFAULT;
       public          postgres    false    212    213    213            ]           2604    33087    customer sno    DEFAULT     l   ALTER TABLE ONLY public.customer ALTER COLUMN sno SET DEFAULT nextval('public.customer_sno_seq'::regclass);
 ;   ALTER TABLE public.customer ALTER COLUMN sno DROP DEFAULT;
       public          postgres    false    211    210    211            \           2604    24849    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    209    208    209            Z           2604    24825 
   users1 tid    DEFAULT     h   ALTER TABLE ONLY public.users1 ALTER COLUMN tid SET DEFAULT nextval('public.users1_tid_seq'::regclass);
 9   ALTER TABLE public.users1 ALTER COLUMN tid DROP DEFAULT;
       public          postgres    false    206    204            [           2604    24833 	   users1 id    DEFAULT     f   ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);
 8   ALTER TABLE public.users1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    204            ?          0    16604    authors 
   TABLE DATA           9   COPY public.authors (author_id, name, no_of) FROM stdin;
    public          postgres    false    202   ?[       ?          0    16609    book_authors 
   TABLE DATA           :   COPY public.book_authors (book_id, author_id) FROM stdin;
    public          postgres    false    203   ?\       ?          0    16579    books 
   TABLE DATA           x   COPY public.books (book_id, title, cost, published_date, publisher_id, category, img, stock, pname, author) FROM stdin;
    public          postgres    false    201   ;]                 0    33108    cancelorders 
   TABLE DATA           p   COPY public.cancelorders (namec, totcost, itemname, quantity, price, orderid, userid, dateof, sno1) FROM stdin;
    public          postgres    false    213   `                 0    33084    customer 
   TABLE DATA           ?   COPY public.customer (name, address, totcost, itemname, quantity, sno, price, orderid, mail, userid, orderid1, dateof, deli) FROM stdin;
    public          postgres    false    211   ?a       ?          0    24810    icart 
   TABLE DATA           N   COPY public.icart (username, item_name, price, quantity, book_id) FROM stdin;
    public          postgres    false    205   c                 0    24846    orders 
   TABLE DATA           3   COPY public.orders (order_id, user_id) FROM stdin;
    public          postgres    false    209   Hd       ?          0    16406 
   publishers 
   TABLE DATA           8   COPY public.publishers (publisher_id, name) FROM stdin;
    public          postgres    false    200   ed       ?          0    24805    users1 
   TABLE DATA           H   COPY public.users1 (user_id, user_name, passwordd, tid, id) FROM stdin;
    public          postgres    false    204   ?d                  0    0    cancelorders_sno1_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cancelorders_sno1_seq', 24, true);
          public          postgres    false    212                       0    0    customer_sno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.customer_sno_seq', 150, true);
          public          postgres    false    210                       0    0    orders_order_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_order_id_seq', 135, true);
          public          postgres    false    208                       0    0    users1_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users1_id_seq', 56, true);
          public          postgres    false    207                       0    0    users1_tid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.users1_tid_seq', 56, true);
          public          postgres    false    206            d           2606    16608    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    202            f           2606    16613    book_authors book_authors_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (book_id);
 H   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT book_authors_pkey;
       public            postgres    false    203            b           2606    16583    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    201            p           2606    33113    cancelorders cancelorders_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.cancelorders
    ADD CONSTRAINT cancelorders_pkey PRIMARY KEY (sno1);
 H   ALTER TABLE ONLY public.cancelorders DROP CONSTRAINT cancelorders_pkey;
       public            postgres    false    213            n           2606    33089    customer customer_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (sno);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    211            l           2606    24851    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    209            `           2606    16410    publishers publishers_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (publisher_id);
 D   ALTER TABLE ONLY public.publishers DROP CONSTRAINT publishers_pkey;
       public            postgres    false    200            h           2606    24835    users1 users1_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.users1 DROP CONSTRAINT users1_pkey;
       public            postgres    false    204            j           2606    24814    users1 userunique 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT userunique UNIQUE (user_name);
 ;   ALTER TABLE ONLY public.users1 DROP CONSTRAINT userunique;
       public            postgres    false    204            v           2606    33090    customer customer_orderid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_orderid_fkey;
       public          postgres    false    2924    211    209            s           2606    16619    book_authors fk_author    FK CONSTRAINT     ?   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES public.authors(author_id);
 @   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT fk_author;
       public          postgres    false    203    2916    202            r           2606    16614    book_authors fk_book    FK CONSTRAINT     x   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 >   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT fk_book;
       public          postgres    false    2914    203    201            q           2606    16584    books fk_publisher    FK CONSTRAINT     ?   ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES public.publishers(publisher_id);
 <   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_publisher;
       public          postgres    false    2912    201    200            t           2606    24815    icart fk_uname    FK CONSTRAINT     ?   ALTER TABLE ONLY public.icart
    ADD CONSTRAINT fk_uname FOREIGN KEY (username) REFERENCES public.users1(user_name) ON UPDATE CASCADE;
 8   ALTER TABLE ONLY public.icart DROP CONSTRAINT fk_uname;
       public          postgres    false    2922    205    204            u           2606    24852    orders orders_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          postgres    false    2920    209    204            ?   ?   x???j?0E??W?J?y?]?SdH)I;?n4??=u?6a?????s???
r3??}#????"??b?l"?~??RۃX????? ?L?Y?????L?I_?#h?+1a???????EK3V??O?+t=?6???9c??H???4.????.g?????b]?6?9Qж???U?i??Zx?{F;?i?	{7??J??b??M?_?D?Ә8?KG?,????????y*??<U?      ?   K   x?̱?0B??g???]??!ͩ?G2X҄??ccƍ:^??N$n8r???{???`??!?]?SUl[      ?   ?  x?}?Mo?@???_1R?^"?˂??1IS%r??iz?e?7?	_څX??X??????>3?|H??M?\)???De?Vf;?#??gl~??
?B??'?R@ ?cR???K?轖?%_0?p?P^R?K??H??1Q^\ȊFVBXde])?!??w????>?ϩ??2??dr?????T???ˋ?*??8?w_?,?ay?S????#???&5?<-??c??㤯????tda?2???k??<x?]^s??????,????ax0El(?
?&?????x?Sr?M|Xq?(_??U?״?`sb?ń)|Mk??LE|???u !??G??^Qz?B??sn?S??9?g2?!??iJ:??A????"?M?O?Thg?d??w??؂???@?B??{1??(? p?Y[????E{r?
??\?mRg????.+bҁ???E>Ɨ寺?ސ??3??m|??l??ޤ?????;??`(?:y??>?p^=??B%??Ht????UR?x?V?O:??<S?????x??&F[\?ge+M<????ҫ?s??6????%?8?X௲l??o?????%?/???:̥????Qi???57؜g?lhˀQW????c?1?;?*?H?o㽁+Z'5??O???km#?*?[)??L;??Rv???ܭ???N?[?6????8?WN??)????U??e???a????2}МR?kS[ʶ??????/????         ?  x??S?j?0=+_aرtز7ׅ?:??.??aI!	???MJe/t??c??{??wM8z?(???4h:(???q-??"?]?J???46?Nl?C???]ڝ???GS?r?z? ??cLA???????b??s9?R?I?W-??R?????-<?!?E[????o??ա??~jϜC??F??X?kg?	?1?????~m???ɶ6??
V?0???K(?RY??%s?Dd	q??3z??Y,?}?Qo?%DOSP??H?,??????Vś???c?Dv?2&?j???=?:
??&?d*?.qL͹?9MqU??m?h?Ͷl??????u4Xñ(y£?i?FX?b?1\???}???o %??f?????̴/m??Q???J??a?O??L7??c?e?=?9?         a  x????j?0????z		??%?V?J?%?s????(???NC??NLt??з??#?/??Lk??r?S??@?? (??;??Ь̶?N9_R?d?^?/1ֻ?n=Y?ۦ?]?|???f?????'??D???֒z?ԕ ?S? ??]'=??yk{?E??v.?~T??o?2\hW9?w???o??D-f??:8C:kZ?7????lJ?,?L?n,_????j?r?e?R????J5?׀+G??7t?????ǎ?7??	?R?y\*厧su^*?@T?p/r5?;O ?'??1gx?(????%G?"???ב????A.??'Lo?=??Y????nVY??i?
?      ?     x???AK1??ɯ^?%??n?E
??G/c??M?u???٭???CO????yo7. ??]?CtN?}???d?)?9|s?& WJo?DsŴ?????]????%???{????z|H?s???.?B?t-ي????0Z?F??ۀ?Of??BӐ????y?D?y?X???.??T4????.?I???.?IX?????"Xr?#fVGl?[?m??[?,?u{??.\????}?}???s??????}???-`?b<???Jk
??*?!ޗ???i˭            x?????? ? ?      ?   m   x?3?Vp?H?K?2??MVp/J,W????QpM)MN,????2??*?KT(M??,?H-*?2?t?$?(%f?$2????s?*?L9?3sR+??8??Rsr*?b???? ??"?      ?   ^  x?mT?r?0<?! ? o?7?????+i?63??.?$u?h?"X<???RJ?i;?????yo????7K???qe75RR????s e2.?aMi??Ӡ<}?t??FH_'+?lf9??B???Tؽik???/?k?J?Z??v?65?\Ck.(??F56o99??Vm
Ɛ?!^?4;wv??l?aW???K??A???6?l?ݴ ?\1+??)?j?PLu??Mipm??????ڍ?8F??ȍ= 0?hf???|m?
??H?Pt???y?P?-??????t?BGi T/??6??2???5?4\Rs???n]?
??,a?L?ݕ?1s?`??!??Al???/??	1??R?ڤB????X`Q?Ș??i??Ck ???r$???n??*)'?s4?N????K???P??_@S?x?????)??X???q????`???aן??u?`?Aa=T??!?^?rX??+U,v?.#~}(??gu????SAݹ"+?S:??H???W`?h"	?|?Y???_nos\G??XP???>=O ㏑q(!?۾9~ "V>??+?b?Hn??pl???o}@??SH?p???&8p?T.C??????????WL8     