--Funções de SQL
--COUNT

--Contagem do número de linhas da tabela profissionais (contagem do número de profissionais).
SELECT COUNT(*) AS total_profissionais 
	FROM profissionais;

--AVG
--Média de salário dos profissionais
SELECT AVG(salarioclt) AS media_salario_clt 
	FROM profissionais;

--MIN
--Menor salário dos profissionais
SELECT MIN(salarioclt) AS media_salario_clt 
	FROM profissionais;

--MAX
--Maior salário dos profissionais
SELECT MAX(salarioclt) AS media_salario_clt 
	FROM profissionais;

--CONCAT()
--Concatenar endereço dos pacientes
SELECT CONCAT(logradouro, ', ', numero, ', ', complemento, ' - ', cidade, ' - ', uf, ' - ', cep, '.') AS endereco_completo, nomepaciente
FROM pacientes;

--UPPER()
--Nome dos pacientes em maiúsculo
SELECT UPPER(nomepaciente)
FROM pacientes;

--LOWER()
--Nome dos pacientes em minúsculo
SELECT LOWER(nomepaciente)
FROM pacientes;

--SUBSTRING()
--Exibir apenas a primeira letra do nome dos pacientes
SELECT SUBSTRING(nomepaciente,1,1) AS inicial
FROM pacientes;

--LEFT()
--Exibir apenas os 5 primeiros caracteres do nome dos pacientes
SELECT LEFT(nomepaciente,5) AS edit_left
FROM pacientes;

--RIGHT()
--Exibir apenas os 5 últimos caracteres do nome dos pacientes
SELECT RIGHT(nomepaciente,5) AS edit_left
FROM pacientes;

--TRIM()
--Remover a letra 'a' do nome dos pacientes
SELECT TRIM(nomepaciente,'J') AS edit_left
FROM pacientes;

--LTRIM()
--Remover a letra 'a' do início do nome dos pacientes
SELECT LTRIM(nomepaciente,'a') AS edit_left
FROM pacientes;

--RTRIM()
--Remover a letra 'J' do final do nome dos pacientes
SELECT RTRIM(nomepaciente,'a') AS edit_left
FROM pacientes;

--LENTH()
--Tamanho do nome dos pacientes
SELECT LENGTH(nomepaciente) AS tamanho_nome
FROM pacientes;

--Separa nome de sobrenome
SELECT 
    SPLIT_PART(nomepaciente, ' ', 1) AS primeiro_nome,
    SPLIT_PART(nomepaciente, ' ', array_length(string_to_array(nomepaciente, ' '), 1)) AS ultimo_sobrenome
FROM pacientes;


--FUNÇÕES DE DATA E HORA

--NOW()
--Data e hora atual comparado com a data de atendimentos
SELECT dataatendimento, NOW() FROM prontuarios;

--CURRENT_DATE
--Data atual comparado com a data de atendimentos
SELECT dataatendimento, CURRENT_DATE FROM prontuarios;

-- Adiciona 10 dias à data
SELECT CURRENT_DATE + INTERVAL '10 days' AS data_adicionada;

-- Subtrai 5 meses da data
SELECT CURRENT_DATE - INTERVAL '5 months' AS data_subtraida;

-- Diferença em dias
SELECT CURRENT_DATE - '2025-01-01'::DATE AS diferenca_em_dias;

-- Diferença detalhada (anos, meses, dias)
SELECT AGE(CURRENT_DATE, '2025-01-01'::DATE) AS diferenca_detalhada;

--Calculo de idade de pacientes
SELECT DATE_PART('year', CURRENT_DATE) - DATE_PART('year', datanasc) AS idade_pacientes, nomepaciente
FROM pacientes;

-- Extrair ano de nascimento
SELECT EXTRACT(year FROM datanasc) AS ano_nasc
	FROM pacientes;

--Arredondamento das casas decimais para 1 na média de salario dos profissionais
SELECT ROUND(AVG(salarioclt),1) FROM profissionais;

--Arredondamento da média de salario dos profissionais para cima
SELECT CEIL(AVG(salarioclt)) FROM profissionais;

--Arredondamento da média de salario dos profissionais para baixo
SELECT FLOOR(AVG(salarioclt)) FROM profissionais;

--Valor absoluto da média de salario dos profissionais
SELECT ABS(AVG(salarioclt)) FROM profissionais;

--Uso de POWER para deixar o valor do salário ao quadrado de um profissional em específico
SELECT POWER((SELECT salarioclt FROM profissionais WHERE idprofissional = 1),2) AS salario_quadrado;

--Uso de EXP para deixar o valor do salário a um valor exponencial
SELECT EXP((SELECT salarioclt FROM profissionais WHERE idprofissional = 1)) AS salario_exp;

--Uso de SQRT para deixar o valor do salário a raiz quadrada
SELECT SQRT((SELECT salarioclt FROM profissionais WHERE idprofissional = 1)) AS salario_raiz;

--Uso de MOD para verificar resto da divisão da média de salário dos profissionais
SELECT MOD(AVG(salarioclt)::INTEGER, 2) AS media_modulo
FROM profissionais;

--Funções de controle de fluxo com IF e case
--Verificar o tipo de profissional baseado no salário
SELECT nome,  
	CASE
		WHEN salarioatendimento > 1 THEN 'profissional_parceiro'
		WHEN salarioclt > 1 THEN 'profissional_registrado'
		WHEN salariodiaria > 1 THEN 'profissional_liberal'
	ELSE 'erro'
	END as tipo_profissional
	FROM profissionais;

-- COALESCE() para juntar os profissionais e os salarios numa tabela.
SELECT nome, COALESCE(salarioatendimento, salarioclt, salariodiaria,0) AS salarioatendimento FROM profissionais;
--Juntar os valores dos tipos de salários.
SELECT 
    nome, 
    (COALESCE(salarioclt, 0) + COALESCE(salarioatendimento, 0) + COALESCE(salariodiaria, 0)) AS soma_salario 
FROM 
    profissionais;


--NULLIF() para identificar se dois telefones de pacies são iguais
SELECT idpaciente, NULLIF(telefone, telefone1) FROM pacientes;

--USO de cast para transformar o ano da data de nascimento em inteiro
SELECT CAST(EXTRACT(YEAR FROM datanasc) AS INT) AS ano_int FROM pacientes;

--Converter data para string
SELECT to_char('2020-06-29 18:12:23'::timestamp, 'YYYYMMDDHH24MISS');

--FUNÇÕES DE JANELA

--ROW_NUMBER()
--Exibir o número da linha de cada profissional
SELECT
  idprofissional,
  cpf,
  rg,
  ROW_NUMBER () OVER (
    ORDER BY
      idprofissional
  )
FROM
  profissionais;

--RANK()
-- Ranquear salario dos profissionais clt
SELECT
  idprofissional,
  cpf,
  rg,
  salarioclt,
  RANK () OVER (
    ORDER BY
      salarioclt DESC
  )
FROM
  profissionais
	WHERE salarioclt > 1;

--DENSE_RANK()
--Faz o mesmo rank que o anterior, mas sem pular posições
SELECT
  idprofissional,
  cpf,
  rg,
  salarioclt,
  DENSE_RANK () OVER (
    ORDER BY
      salarioclt DESC
  )
FROM
  profissionais
	WHERE salarioclt > 1;

--Somar o valor gasto nos planos de tratamento
SELECT SUM (valor) FROM trat_planos_trat;



--Buscar nome, diagnósticos, medicamentos e data do atendimento

SELECT pat.fullname AS nome_completo, mr.diagnoses AS diagnostico, mr.medicines AS medicamentos, ap.appointmentdate AS data_atendimento
	FROM 
		patients pat
	JOIN
		medicalrecords mr
	ON 
		pat.patientid = mr.patientid
	JOIN
		appointments ap
	ON
		pat.patientid = ap.patientid;

--SPs

--SP para ordenar os medicamentos
CREATE OR REPLACE PROCEDURE Order_Medicines(IN p_medicines VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
  -- Verificar se o parâmetro foi recebido
  IF p_medicines IS NULL OR p_medicines = '' THEN
    RAISE NOTICE 'O parâmetro "Medicines" está vazio!';
  ELSE
    -- Exibir os resultados no console do servidor (não retorna à aplicação)
    PERFORM *
    FROM medicalrecords
    WHERE medicines ILIKE '%' || p_medicines || '%'
    ORDER BY prescribeddate DESC;
  END IF;
END;
$$;


--Chamada Do SP
CALL Search_For_Medicine1('Antibiotics');

-- SP para adicionar paciente:
--

CREATE OR REPLACE PROCEDURE Add_Patient(
  sp_name VARCHAR(100),
  sp_adress VARCHAR(255),
  sp_birthday DATE,
  sp_insurance VARCHAR(50),
  sp_username VARCHAR(50),
  sp_password VARCHAR(255),
  sp_email VARCHAR(100),
  sp_telephone VARCHAR(15),
  sp_dayleft DATE
  )
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO Patients (FullName, Address, DateOfBirth, Insurance, Username, Password, Email, Telephone, DateLeft)
  VALUES(  
      sp_name,
      sp_adress,
      sp_birthday,
      sp_insurance,
      sp_username,
      sp_password,
      sp_email,
      sp_telephone,
      sp_dayleft
END;
$$;

-- SP para atualizar data de saída do hospital.

CREATE OR REPLACE PROCEDURE Patient_Left(
  sp_patientid INTEGER,
  sp_dateleft DATE
  )
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE Patients
  SET dateleft = sp_dateleft
  WHERE patientid = sp_patientid;
END;
$$;


--Functions

-- Seleção dos dados necessários para exibir informações dos pacientes, médicos e agendamentos
CREATE VIEW relatorio_hospitalar
AS
SELECT 
    p.fullname AS patientname,         -- Nome do paciente
    doc.fullname AS doctorname,        -- Nome do médico
    mr.diagnoses AS medical_diagnoses, -- Diagnósticos do prontuário médico
    mr.medicines AS medicines,         -- Medicamentos do prontuário médico
    mr.allergies AS allergies,         -- Alergias do prontuário médico
    ap.appointmentdate AS appointment_date -- Data do agendamento
FROM 
    patients p                         -- Tabela de pacientes
JOIN 
    appointments ap                    -- Tabela de agendamentos
ON 
    p.patientid = ap.patientid         -- Relaciona pacientes com seus agendamentos
JOIN 
    doctors doc                        -- Tabela de médicos
ON 
    doc.doctorid = ap.doctorid         -- Relaciona agendamentos com os médicos
JOIN 
    medicalrecords mr                  -- Tabela de prontuários médicos
ON 
    p.patientid = mr.patientid         -- Relaciona pacientes com seus prontuários
WHERE 
    EXTRACT(MONTH FROM ap.appointmentdate) = 6 -- Filtra os agendamentos do mês de junho
ORDER BY 
    p.fullname ASC; -- Ordena os resultados alfabeticamente pelo nome do paciente
--USAR VIEW
SELECT * FROM relatorio_hospitalar;

--Funcao para editar RG
CREATE OR REPLACE FUNCTION formatar_rg(rg_sem_formatacao VARCHAR)
RETURNS VARCHAR AS $$
BEGIN
    RETURN CONCAT(
        SUBSTRING(rg_sem_formatacao, 1, 1), '.', 
        SUBSTRING(rg_sem_formatacao, 2, 3), '.', 
        SUBSTRING(rg_sem_formatacao, 5, 3) 
    );
END;
$$ LANGUAGE plpgsql;
-- CHAMADA: SELECT formatar_rg('5863000');

--Funcao para editar CPF
CREATE OR REPLACE FUNCTION formatar_cpf(cpf_sem_formatacao VARCHAR)
RETURNS VARCHAR AS $$
BEGIN
    RETURN CONCAT(
        SUBSTRING(cpf_sem_formatacao, 1, 3), '.', 
        SUBSTRING(cpf_sem_formatacao, 4, 3), '.', 
        SUBSTRING(cpf_sem_formatacao, 7, 3), '-',
		SUBSTRING(cpf_sem_formatacao, 10, 2)
    );
END;
$$ LANGUAGE plpgsql;

--CHAMADA:  SELECT formatar_cpf('00013602900');

--Selecionar nome e valor dos planos de tratamento que começam com a letra 'V'
SELECT p.nomepaciente, p.nomeplano, tpt.valor AS valor_plano
	FROM pacientes p
	JOIN trat_planos_trat tpt
	ON p.idpaciente=tpt.idpaciente
	WHERE nomeplano ILIKE 'v%';

--Consulta com nome do paciente, quantidade de atendimentos e nome dos profissionais que realizou atendimento
WITH totalconsultas AS (
	SELECT COUNT(evolucao) AS num_atendimentos, idpaciente
	FROM prontuarios
	GROUP BY idpaciente
)
SELECT  p.nomepaciente, 
        tc.num_atendimentos, 
        STRING_AGG(prof.nome, ', ') AS nome_profissionais
  FROM pacientes p
  JOIN totalconsultas tc
  ON p.idpaciente=tc.idpaciente
  JOIN prontuarios pro
  ON p.idpaciente=pro.idpaciente
  JOIN atualizacao atu
  ON pro.idprontuario=atu.idprontuario
  JOIN profissionais prof
  ON atu.idprofissional=prof.idprofissional
  GROUP BY p.nomepaciente, tc.num_atendimentos;


---ALterar valores nulos
--1) Verificar se há valores nulos na coluna salarioclt
SELECT 
    nome, 
    COALESCE(salarioclt, 0) AS salarioclt
FROM 
    profissionais;
WHERE salarioclt IS NULL;

--2) Testar com COALESCE() para substituir valores nulos
SELECT 
    nome, 
    COALESCE(salarioclt, 0) AS salarioclt
FROM 
    profissionais;

--3) Atualizar valores nulos na coluna salarioclt
UPDATE 
    profissionais
SET
    salarioclt = 0
WHERE 
    salarioclt IS NULL;

--DADOS DUPLICADOS 
--1) Verificar se há dados duplicados na tabela de pacientes
SELECT rg, COUNT(rg) AS quantidade
FROM pacientes
GROUP BY rg
HAVING COUNT(rg) > 1;
--Aqui temos o valor de rg duplicado:  '548702055'

--2) Remover dados duplicados na tabela de pacientes
DELETE FROM pacientes 
WHERE idpaciente = (
	SELECT 	MAX(idpaciente)
	FROM pacientes
	WHERE rg = '548702055'
);

-- DADOS INCONSISTENTES
--1) vefiricar se há e-mails inválidos na tabela de pacientes
SELECT *
FROM pacientes
WHERE email NOT LIKE '%@%.%';

--2) Identificar valores inválidos
SELECT *
FROM trat_planos_trat
WHERE preco < 0 OR quantidade < 0;

--3) Corrigir valores inválidos com letras maiusculas
UPDATE clientes
SET email = LOWER(email);

--4) Padronização de dados
UPDATE trat_planos_trat
SET categoria = INITCAP(categoria); -- Capitaliza a primeira letra

--5) Criar restrições
ALTER TABLE trat_planos_trat
ADD CONSTRAINT chk_preco CHECK (preco >= 0);
