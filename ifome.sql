CREATE TABLE `user` (
  `id` serial PRIMARY KEY,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `orders` (
  `id` serial PRIMARY KEY,
  `user_id` int,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `store` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(150) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `address` varchar(100) NOT NULL,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `store_item` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(100),
  `store_id` int,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `order_store_item` (
  `store_item_id` int,
  `order_id` int
);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `store_item` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`id`);

ALTER TABLE `order_store_item` ADD FOREIGN KEY (`store_item_id`) REFERENCES `store_item` (`id`);

ALTER TABLE `order_store_item` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);



INSERT INTO store_item (name, price, description, store_id) VALUES
('Tacacá', 25.50, 'Sopa típica do norte com camarão e jambu', 1),
('Açaí na Tigela', 18.00, 'Açaí puro com granola e banana', 1),
('Pizza Margherita', 35.00, 'Pizza com molho de tomate, mussarela e manjericão', 2),
('Pizza Quatro Queijos', 42.00, 'Pizza com mussarela, gorgonzola, parmesão e provolone', 2),
('Salada Vegana', 22.00, 'Salada de folhas com tofu, grão-de-bico e molho de mostarda', 3),
('Hambúrguer de Lentilha', 28.00, 'Hambúrguer vegano de lentilha com alface e tomate', 3),
('Café Expresso', 8.00, 'Café expresso feito com grãos selecionados', 4),
('Pão de Queijo', 5.00, 'Pão de queijo tradicional, crocante por fora e macio por dentro', 4),
('Brigadeiro Gourmet', 6.00, 'Brigadeiro tradicional feito com chocolate belga', 5),
('Torta de Limão', 15.00, 'Torta de limão com base crocante e creme suave de limão', 5);


INSERT INTO store (name, zipcode, address) VALUES
('Sabor do Norte', '01001000', 'Avenida Paulista, 1000'),
('Pizzaria Da Esquina', '01310921', 'Rua Augusta, 500'),
('Restaurante Vegano', '04050000', 'Rua Domingos de Morais, 1234'),
('Café da Praça', '02044000', 'Praça da Liberdade, 150'),
('Doceria Delícia', '04534000', 'Avenida Faria Lima, 2000');


SELECT
    s.id AS store_id,
    s.name AS store_name,
    s.zipcode,
    s.address,
    si.id AS item_id,
    si.name AS item_name,
    si.price,
    si.description
FROM
    store s
JOIN
    store_item si ON s.id = si.store_id
ORDER BY
    s.name, si.name;