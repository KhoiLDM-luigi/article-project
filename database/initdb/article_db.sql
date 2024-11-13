CREATE DATABASE article_db;

\connect article_db;

CREATE TABLE articles(
    id SERIAL PRIMARY KEY,
    owner VARCHAR,
    title VARCHAR,
    content TEXT
);

INSERT INTO articles(owner, title, content)
VALUES ('spring-admin', 'Article A', 'This is a article A by spring-admin.'),
       ('spring-admin', 'Article B', 'This is a article B by spring-admin.'),
       ('test', 'Article C', 'This is a article C by test.'),
       ('test', 'Article D', 'This is a article D by test.'),
       ('test', 'Article E', '# This is a header 

I have made some *changes* to this **Article**

## This is a smaller header 

Hello, world!!!

This is the first session content

**Not many thing here tho**

## This is another smaller header



Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer dictum in quam vel posuere. Suspendisse egestas ante ante, nec laoreet nisl vehicula id. Nunc eleifend dui purus, quis venenatis libero facilisis ac. Suspendisse potenti. Pellentesque porta gravida mi, non iaculis enim egestas vitae. Duis volutpat imperdiet sollicitudin. Ut consequat ac nibh id lacinia.

Pellentesque rutrum porta sapien, a lobortis erat venenatis ac. Cras at tortor ultricies, vulputate leo ac, convallis nisl. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse accumsan, ex eget aliquam pretium, mi urna euismod libero, faucibus semper tellus nunc a risus. Morbi malesuada consequat placerat. Sed sagittis, ligula vitae facilisis scelerisque, orci felis semper quam, sed ornare risus purus viverra mi. Quisque ultricies quis massa at iaculis.

In hac habitasse platea dictumst. Aenean consequat sapien tortor, vel imperdiet sem pellentesque et. Ut iaculis, elit sit amet facilisis finibus, nisi leo feugiat ante, at ullamcorper mauris nisi eget velit. Vestibulum pulvinar laoreet risus. Nulla congue feugiat lobortis. Nam dictum ligula et enim consequat pellentesque. Suspendisse faucibus ac quam a pharetra. Etiam ullamcorper nunc mi, eget hendrerit turpis tempor vel. Curabitur euismod est metus, eget mollis dui bibendum in. Nullam elementum tortor id hendrerit finibus. Nullam dolor urna, elementum a sagittis in, efficitur non nisl. Aenean a libero mollis, aliquet mi et, dignissim arcu. Suspendisse potenti. Maecenas finibus vel odio eu porttitor.

Sed convallis pretium leo, eget consectetur metus dictum non. Praesent condimentum imperdiet ullamcorper. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla et iaculis lorem. Cras massa urna, mollis eu leo nec, gravida lacinia nisl. Morbi non sem in sapien ullamcorper condimentum sed sit amet ligula. Maecenas mollis diam ullamcorper mauris scelerisque, at consequat enim feugiat. Quisque tincidunt tempus tortor et elementum. Proin arcu urna, fringilla id tincidunt a, consequat vel ligula. Integer ac libero ac diam sagittis malesuada dictum a elit. Proin sed arcu bibendum, pulvinar nisl ut, tempus enim. Donec rhoncus accumsan arcu nec hendrerit.

Sed dignissim nunc quis mi rhoncus, sed bibendum ligula sagittis. Sed tincidunt nunc sit amet finibus imperdiet. Donec posuere aliquam justo, eu condimentum justo convallis in. Praesent vehicula congue tellus at suscipit. Nulla eu tincidunt erat. Vivamus rhoncus lectus a mi laoreet maximus. Vivamus at nibh eget eros imperdiet vulputate nec nec mauris.');