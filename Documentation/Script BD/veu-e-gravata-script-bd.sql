CREATE TABLE `TB_CASAL`(
`ID_CASAL` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`DH_INCLUSAO` DATETIME NOT NULL,
`CD_CASAL` VARCHAR(255) NOT NULL,
`DH_PREVISAO_CASAMENTO` DATETIME NOT NULL,
`HX_FOTO_CASAL` VARCHAR(255) NOT NULL,
`DS_FOTO_CASAL` VARCHAR(255) NOT NULL
);
CREATE TABLE `TB_PRODUTO`(
`ID_PRODUTO` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`DH_INCLUSAO` DATETIME NOT NULL,
`VL_PRECO` DECIMAL(8, 2) NOT NULL,
`HX_FOTO_PRODUTO` VARCHAR(255) NOT NULL,
`DS_FOTO_PRODUTO` VARCHAR(255) NOT NULL,
`DS_NSU` VARCHAR(255) NOT NULL,
`DS_PRODUTO` VARCHAR(255) NOT NULL,
`DS_NOME` VARCHAR(255) NOT NULL
);
CREATE TABLE `TB_CONJUGE`(
`ID_CONJUGE` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`DS_CIDADE` VARCHAR(255) NOT NULL,
`DS_NOME` VARCHAR(255) NOT NULL,
`DS_CELULAR` VARCHAR(255) NOT NULL,
`DS_UF` VARCHAR(255) NOT NULL,
`DS_CPF` VARCHAR(255) NOT NULL,
`TG_TIPO` VARCHAR(255) NOT NULL,
`DT_NASCIMENTO` DATE NOT NULL,
`FK_CASAL` INT NOT NULL,
`DS_LOGRADOURO` VARCHAR(255) NOT NULL,
`DH_INCLUSAO` DATETIME NOT NULL,
`DS_CEP` VARCHAR(255) NOT NULL,
`DS_COMPLEMENTO` VARCHAR(255) NOT NULL,
`DS_EMAIL` VARCHAR(255) NOT NULL
);
CREATE TABLE `TB_USUARIO`(
`ID_USUARIO` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`DS_CIDADE` VARCHAR(255) NOT NULL,
`DH_INCLUSAO` DATETIME NOT NULL,
`DS_UF` VARCHAR(255) NOT NULL,
`DS_EMAIL` VARCHAR(255) NOT NULL,
`DS_COMPLEMENTO` VARCHAR(255) NOT NULL,
`DS_CEP` VARCHAR(255) NOT NULL,
`DS_CPF` VARCHAR(255) NOT NULL,
`DT_NASCIMENTO` DATE NOT NULL,
`DS_CELULAR` VARCHAR(255) NOT NULL,
`DS_NOME` VARCHAR(255) NOT NULL,
`DS_SENHA` VARCHAR(255) NOT NULL,
`DS_LOGRADOURO` VARCHAR(255) NOT NULL
);
CREATE TABLE `TB_PRODUTO_CASAL`(
`ID_PRODUTO_CASAL` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`DH_INCLUSAO` DATETIME NOT NULL,
`FK_PRODUTO` INT NOT NULL,
`FK_CASAL` INT NOT NULL,
`TG_RESERVADO` TINYINT NOT NULL,
`FK_USUARIO` INT NOT NULL
);
ALTER TABLE
`TB_PRODUTO_CASAL` ADD CONSTRAINT `tb_produto_casal_fk_produto_foreign` FOREIGN KEY(`FK_PRODUTO`) REFERENCES `TB_PRODUTO`(`ID_PRODUTO`);
ALTER TABLE
`TB_PRODUTO_CASAL` ADD CONSTRAINT `tb_produto_casal_fk_casal_foreign` FOREIGN KEY(`FK_CASAL`) REFERENCES `TB_CASAL`(`ID_CASAL`);
ALTER TABLE
`TB_CONJUGE` ADD CONSTRAINT `tb_conjuge_fk_casal_foreign` FOREIGN KEY(`FK_CASAL`) REFERENCES `TB_CASAL`(`ID_CASAL`);
ALTER TABLE
`TB_PRODUTO_CASAL` ADD CONSTRAINT `tb_produto_casal_fk_usuario_foreign` FOREIGN KEY(`FK_USUARIO`) REFERENCES `TB_USUARIO`(`ID_USUARIO`);