SELECT
 d.start_date AS Reserveringsdatum,
 k.meta_value AS Voornaam,
 l.meta_value AS Achternaam,
 g.meta_value AS Voorkeur,
 h.meta_value AS Allergie,
 IF(j.meta_value = 843, ‘Volwassene’,’Kind’) AS Persoon,
 IF(m.product_id = 819, ‘Ja’, ‘Nee’) AS Drankenarrangement,
 b.order_item_name AS TypeTour,
 f.meta_value AS Ticketcode,
 a.id AS Bestelnummer
FROM
 wp_posts a
JOIN wp_woocommerce_order_items b ON
 a.id = b.order_id
JOIN wp_booking_order_history c ON
 a.id = c.order_id
JOIN wp_booking_history d ON
 c.booking_id = d.id
JOIN wp_posts e ON
 a.id = e.post_parent
JOIN wp_postmeta f ON
 e.id = f.post_id
JOIN wp_postmeta g ON
 e.id = g.post_id
JOIN wp_postmeta h ON
 e.id = h.post_id
JOIN wp_wc_order_product_lookup i ON
 a.id = i.order_id
JOIN wp_postmeta j ON
 e.id = j.post_id
JOIN wp_postmeta k ON
 e.id = k.post_id
JOIN wp_postmeta l ON
 e.id = l.post_id
JOIN wp_wc_order_product_lookup m ON
 a.id = m.order_id
WHERE NOT
 b.order_item_name = ‘kind’ AND NOT b.order_item_name = ‘volwassene’ AND NOT b.order_item_
name= ‘drankenarrangement p.p.’ AND f.meta_key = ‘ticket_code’ AND g.meta_key = ‘tc_ff_voorkeur_
tcfn_3956’ AND h.meta_key = ‘tc_ff_allergien_tcfn_2346’ AND k.meta_key =’first_name’ AND l.meta_
key=’last_name’ AND m.product_id =’819’
GROUP BY
 e.id