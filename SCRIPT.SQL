CREATE DATABASE EMPRESA;

USE EMPRESA;
--CREATE TABLE FILMES(
--ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
--NOME VARCHAR(200) NOT NULL,
--ID_GENERO INT UNSIGNED NOT NULL,
--PRIMARY KEY(ID),
--FOREIGN KEY(ID_GENERO) REFERENCES GENERO(ID)

CREATE TABLE FORNECEDORES (
    idFORNECEDOR INTEGER NOT NULL,
    NOME VARCHAR(255) NOT NULL,
    RUA VARCHAR(255) NOT NULL,
    CIDADE VARCHAR(255) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    PRIMARY KEY (idFORNECEDOR)
);

CREATE TABLE CATEGORIAS (
    idCATEGORIA INTEGER NOT NULL,
    NOME VARCHAR(255) NOT NULL,
    PRIMARY KEY (idCATEGORIA)
);

CREATE TABLE PRODUTOS (
    idPRODUTO INTEGER NOT NULL,
    NOME VARCHAR(255) NOT NULL,
    QUANTIDADE INTEGER NOT NULL,
    PRECO FLOAT NOT NULL,
    idFORNECEDOR INTEGER NOT NULL,
    idCATEGORIA INTEGER NOT NULL,
    PRIMARY KEY (idPRODUTO),
    FOREIGN KEY (idFORNECEDOR) REFERENCES FORNECEDORES (idFORNECEDOR),
    FOREIGN KEY (idCATEGORIA) REFERENCES CATEGORIAS (idCATEGORIA)
);

SELECT * FROM PRODUTOS;

SELECT * FROM CATEGORIAS;

SELECT * FROM FORNECEDORES;

DESCRIBE PRODUTOS;

INSERT INTO
    CATEGORIAS (idCATEGORIA, NOME)
VALUES (1, 'Super Luxo'),
    (2, 'Importado'),
    (3, 'Tecnologia'),
    (4, 'Vintage'),
    (5, 'Supremo');

INSERT INTO
    FORNECEDORES (
        idFORNECEDOR,
        NOME,
        RUA,
        CIDADE,
        ESTADO
    )
VALUES (
        1,
        'Ajax SA',
        'Rua Pres Castelo Branco',
        'Porto Alegre',
        'RS'
    ),
    (
        2,
        'Sansul SA',
        'Av Brasil',
        'Rio de Janeiro',
        'RJ'
    ),
    (
        3,
        'South Chairs',
        'Rua do Moinho',
        'Santa Maria',
        'RS'
    ),
    (
        4,
        'Elon Electro',
        'Rua Apolo',
        'São Paulo',
        'SP'
    ),
    (
        5,
        'Mike Eletctro',
        'Rua Pedro da Cunha',
        'Curitiba',
        'PR'
    );

INSERT INTO
    PRODUTOS (
        `idPRODUTO`,
        `NOME`,
        `QUANTIDADE`,
        `PRECO`,
        `idFORNECEDOR`,
        `idCATEGORIA`
    )
VALUES (
        1,
        'Cadeira Azul',
        30,
        300.00,
        5,
        5
    ),
    (
        2,
        'Cadeira Vermelha',
        50,
        2150.00,
        2,
        1
    ),
    (
        3,
        'Guarda-Roupa Disney',
        400,
        829.50,
        4,
        1
    ),
    (
        4,
        'Torradeira Azul',
        20,
        9.90,
        3,
        1
    ),
    (5, 'TV', 30, 3000.25, 2, 2);
--1. Dados de 2 produtos de categoria 3 de qualquer fornecedor
INSERT INTO
    PRODUTOS (
        `idPRODUTO`,
        `NOME`,
        `QUANTIDADE`,
        `PRECO`,
        `idFORNECEDOR`,
        `idCATEGORIA`
    )
VALUES (
        6,
        'Tablet Asus 2000',
        5,
        1250.00,
        1,
        3
    ),
    (
        7,
        'iPhone 15 Plus',
        7,
        4500.00,
        2,
        3
    );
--2. Dados de 2 fornecedores distintos, sen do um do RN e outro do PB
INSERT INTO
    FORNECEDORES (
        idFORNECEDOR,
        NOME,
        RUA,
        CIDADE,
        ESTADO
    )
VALUES (
        6,
        'Jurubeba',
        'Rua na Consolação',
        'Ipueira',
        'RN'
    ),
    (
        7,
        'Ojuara SA',
        'Rua da Amizade',
        'Patos',
        'PB'
    );

-- 3. Inserir dados de mais uma categoria de nome Nacional

INSERT INTO
    CATEGORIAS (idCATEGORIA, NOME)
VALUES (6, 'Nacional');

-- 4. Atualize a tabela produtos, aumentando o preço do produto cujo idPRODUTO  é 4, para 298,00

UPDATE PRODUTOS SET PRECO = 298.00 WHERE idPRODUTO = 4;

SELECT * FROM PRODUTOS;

SELECT * FROM FORNECEDORES;
-- 5. Recupere da tabela produtos, todos os produtos do fornecedor localizado no RJ;

SELECT idfornecedor FROM fornecedores WHERE estado = 'RJ';

SELECT
    nome,
    quantidade,
    idfornecedor,
    preco
FROM produtos
WHERE
    idfornecedor = 2;

-- 6. Recupere da tabela produtos, todos os produtos do fornecedor localizado no RS;

SELECT idfornecedor FROM fornecedores WHERE estado = 'RS';

SELECT PRODUTOS.NOME, PRODUTOS.IDFORNECEDOR, PRODUTOS.PRECO, FORNECEDORES.IDFORNECEDOR
FROM PRODUTOS, FORNECEDORES
WHERE
    PRODUTOS.IDFORNECEDOR = FORNECEDORES.IDFORNECEDOR
    AND ESTADO = 'RS';

-- 7. Recupere da tabela produtos,todos os produtos do fornecedor localizado no SP;

SELECT idfornecedor FROM fornecedores WHERE estado = 'SP';

SELECT
    nome,
    quantidade,
    idfornecedor,
    preco
FROM produtos
WHERE
    idfornecedor = 4;

-- 8. Recupere da tabela produtos e fornecedores o nome do produto mais caro e o nome do fornecedor desse produto;

SELECT
    PRODUTOS.NOME AS NOME_DO_PRODUTO,
    FORNECEDORES.NOME AS FORNECEDOR,
    PRODUTOS.PRECO AS PRECO
FROM PRODUTOS, FORNECEDORES
WHERE
    PRODUTOS.IDFORNECEDOR = FORNECEDORES.IDFORNECEDOR
    AND PRECO = (
        SELECT MAX(PRECO)
        FROM PRODUTOS
    );
-- 9. Atualize a tabela fornecedores, alterando a cidade para parnamirim, o estado para RN e a Rua para Abel Cabral, do fornecedor cujo nome é Elon Electron;
UPDATE FORNECEDORES -- TABELA QUE SERA ATULIZADA
SET
    CIDADE = 'Parnamirim',
    ESTADO = 'RN',
    RUA = 'Abel Cabral'
WHERE
    NOME = 'Elon Electro';

SELECT * FROM FORNECEDORES;

-- 10. ATUALIZE a tabela produtos, alterando o preco dos produtos em 10% de aumento, cujo fornecedor seja Sansul SA.
UPDATE PRODUTOS
SET
    PRECO = PRECO * 1.2
WHERE
    IDFORNECEDOR = (
        SELECT IDFORNECEDOR
        FROM FORNECEDORES
        WHERE
            NOME = 'sansul SA'
    );

SELECT * FROM PRODUTOS;

/*11. ATUALIZE a tabela produtos, alterando o preco dos produtos em 10% de diminuicao, cujo fornecedor seja
Mike electro e a categoria seja Supremo.*/
UPDATE PRODUTOS
SET
    PRECO = PRECO * 0.9
WHERE
    IDFORNECEDOR = (
        SELECT IDFORNECEDOR
        FROM FORNECEDORES
        WHERE
            NOME LIKE 'Mike electro'
    )
    AND IDCATEGORIA = (
        SELECT IDCATEGORIA
        FROM CATEGORIAS
        WHERE
            NOME LIKE 'Supremo'
    );

/* 12. RECUPERE da tabela produtos, todos os produtos que tenham o preco entre 8 e 2.000, 
ordenados a partir do maior preco. */
SELECT *
FROM PRODUTOS
WHERE
    PRECO BETWEEN 8 AND 2000
ORDER BY PRECO DESC;

/*13. RECUPERE da tabela produtos, todos os produtos que tenham o pre�o 
maior que 2.000, ordenados a partir do menor preco.*/

SELECT * FROM PRODUTOS WHERE PRECO > 2000 ORDER BY PRECO;

/*14. RECUPERE da tabela fornecedor, o nome de todos os fornecedores 
que iniciam com a letra A.*/

SELECT NOME FROM FORNECEDORES WHERE NOME LIKE 'A%';

/*15. RECUPERE da tabela fornecedor, o nome de todos os fornecedores que contenham a letra S.*/

SELECT NOME FROM FORNECEDORES WHERE NOME LIKE '%S%';

/*16. ATUALIZE a tabela produtos, aumentando em 15% a quantidade de produtos que tenham o pre�o
inferior a 300.*/

UPDATE PRODUTOS SET QUANTIDADE = QUANTIDADE * 1.15 WHERE PRECO < 300;

/*17. APAGUE da tabela produtos todas os produtos da categoria 5;*/

DELETE FROM PRODUTOS WHERE IDCATEGORIA = 5;

/*18. RECUPERE da tabela fornecedores, todos os registros cadastrados;*/

SELECT * FROM FORNECEDORES;

/*19. RECUPERE da tabela produtos, o nome dos produtos que iniciam 
com a letra T e tenham o pre�o acima de 400.*/

SELECT NOME FROM PRODUTOS WHERE NOME LIKE 'T%' AND PRECO > 400;

/* 20. APAGUE a tabela produtos;
DROP TABLE PRODUTOS;
*/

/* 21. RECUPERE DA TABELA PRODUTOS, O NOME DO PRODUTO , 
O PRE�O, O NOME DA SUA CATEGORIA E O NOME DO FORNECEDOR*/

SELECT PRODUTOS.NOME AS PRODUTO, PRODUTOS.PRECO AS PRE�O, 
CATEGORIAS.NOME AS CATEGORIA, FORNECEDORES.NOME AS FORNECEDOR
FROM PRODUTOS, CATEGORIAS, FORNECEDORES
WHERE 
CATEGORIAS.IDCATEGORIA = PRODUTOS.IDCATEGORIA 
AND 
FORNECEDORES.IDFORNECEDOR = PRODUTOS.IDFORNECEDOR;

/* 22. RECUPERE DA TABELA PRODUTOS, O NOME DO PRODUTO , 
O PRE�O, O NOME DA SUA CATEGORIA E O NOME DO FORNECEDOR, TODOS ORDENADOS DE FORMA CRESCENTE*/

SELECT PRODUTOS.NOME AS PRODUTO, PRODUTOS.PRECO AS PRE�O, 
CATEGORIAS.NOME AS CATEGORIA, FORNECEDORES.NOME AS FORNECEDOR
FROM PRODUTOS, CATEGORIAS, FORNECEDORES
WHERE 
CATEGORIAS.IDCATEGORIA = PRODUTOS.IDCATEGORIA 
AND 
FORNECEDORES.IDFORNECEDOR = PRODUTOS.IDFORNECEDOR
ORDER BY PRODUTOS.NOME ASC;