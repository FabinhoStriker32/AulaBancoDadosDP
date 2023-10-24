CREATE TABLE `consulta` (
  `id_consulta` int(10),
  `especialidade_id` int,
  `id_medico` varchar(255),
  `id_paciente` varchar(255),
  `valor` float,
  `data_consulta` timestamp,
  `hora_consulta` time,
  `id_convenio` int
);

CREATE TABLE `medico` (
  `id_medico` int(10),
  `especialidade` int,
  `nome` varchar(255),
  `CPF` varchar(255),
  `CRM` varchar(255),
  `telefone` varchar(255)
);

CREATE TABLE `receita` (
  `id_receita` int(10),
  `paciente` varchar(255),
  `medico` varchar(255),
  `consulta` varchar(255),
  `quantidade` varchar(255),
  `medicamento` varchar(255)
);

CREATE TABLE `convenio` (
  `id_conveio` int(10),
  `nome` varchar(255),
  `cnpj` int,
  `tempo_carencia` timestamp
);

CREATE TABLE `paciente` (
  `id_paciente` int(10),
  `rg_paciente` varchar(11),
  `cpf` varchar(11),
  `nome` varchar(255),
  `email_paciente` varchar(255),
  `data_nascimento` varchar(255),
  `telefone` varchar(255),
  `endereco` varchar(255),
  `id_convenio` varchar(255)
);

CREATE TABLE `internacao` (
  `id_internacao` int(10),
  `data_entrada` timestamp,
  `data_prev_alta` timestamp,
  `data_alta` timestamp,
  `procedimento` varchar(255),
  `enfermeiro_id` int
);

CREATE TABLE `enfermeiro` (
  `id_enfermeiro` int(10),
  `nome` varchar(255),
  `CPF` int,
  `CRE` int
);

CREATE TABLE `especialidade` (
  `id_especialidade` int(10),
  `nome` varchar(255)
);

CREATE TABLE `quarto` (
  `id_quarto` int(10),
  `numero_quarto` number,
  `tipo` varchar(255)
);

CREATE TABLE `tipo_quarto` (
  `id_tipo_quarto` int(10),
  `descricao` varchar(255),
  `valor_diaria` float
);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_consulta`) REFERENCES `receita` (`id_receita`);

ALTER TABLE `convenio` ADD FOREIGN KEY (`id_conveio`) REFERENCES `consulta` (`valor`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`id_convenio`) REFERENCES `convenio` (`id_conveio`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`id_paciente`) REFERENCES `consulta` (`id_consulta`);

ALTER TABLE `medico` ADD FOREIGN KEY (`especialidade`) REFERENCES `consulta` (`especialidade_id`);

ALTER TABLE `medico` ADD FOREIGN KEY (`nome`) REFERENCES `consulta` (`id_medico`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_internacao`) REFERENCES `paciente` (`rg_paciente`);

ALTER TABLE `enfermeiro` ADD FOREIGN KEY (`id_enfermeiro`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`id_quarto`) REFERENCES `internacao` (`id_internacao`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`procedimento`);

ALTER TABLE `medico` ADD FOREIGN KEY (`especialidade`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `tipo_quarto` ADD FOREIGN KEY (`id_tipo_quarto`) REFERENCES `quarto` (`tipo`);
