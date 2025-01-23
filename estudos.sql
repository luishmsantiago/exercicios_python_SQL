'''JOINS: Aqui verifica os pacientes, e as datas consultas que eles fizeram, e retorna o nome do paciente e a data da consulta.'''
SELECT 
    p.nome AS nome_paciente,
    c.data_consulta
FROM 
    pacientes p
JOIN 
    consultas c 
ON 
    p.id_paciente = c.id_paciente;


'''Subconsultas: Aqui listamos os pacientes que fizeram consultas nos últimos 30 dias.'''
SELECT 
    nome 
FROM 
    pacientes
WHERE 
    id_paciente IN (
        SELECT 
            id_paciente 
        FROM 
            consultas
        WHERE 
            data_consulta >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
    );

 '''CTE (Common Table Expression): cria uma tabela com as colunas total consultas e id_paciente, 
 e depois faz um join com a tabela pacientes para retornar o nome do paciente e o total de consultas que ele fez.'''
WITH TotalConsultas AS (
    SELECT 
        id_paciente, 
        COUNT(*) AS total_consultas
    FROM 
        consultas
    GROUP BY 
        id_paciente
)
SELECT 
    p.nome AS nome_paciente,
    tc.total_consultas
FROM 
    pacientes p
JOIN 
    TotalConsultas tc
ON 
    p.id_paciente = tc.id_paciente;

'''Agregações: Aqui temos uma consulta que retorna a especialidade e o total de consultas feitas, em ordem decrescente. 
Se limitarmos para 1 a quantidade de resultados, teremos a especialidade com mais consultas.'''

SELECT 
    especialidade, 
    COUNT(*) AS total_consultas
FROM 
    consultas
GROUP BY 
    especialidade
ORDER BY 
    total_consultas DESC;

'''Média'''

SELECT 
    AVG(valor) AS media
FROM 
    tabela_dados;

'''Moda'''

SELECT 
    valor, 
    COUNT(valor) AS frequencia
FROM 
    tabela_dados
GROUP BY 
    valor
ORDER BY 
    frequencia DESC
LIMIT 1;

'''Variancia'''

SELECT 
    AVG(POWER(valor - (SELECT AVG(valor) FROM tabela_dados), 2)) AS variancia
FROM 
    tabela_dados;

'''Desvio Padrão'''

SELECT 
    SQRT(AVG(POWER(valor - (SELECT AVG(valor) FROM tabela_dados), 2))) AS desvio_padrao
FROM 
    tabela_dados;

'''Distribuição normal'''

-- Média e desvio padrão
SELECT 
    AVG(valor) AS media, 
    SQRT(AVG(POWER(valor - (SELECT AVG(valor) FROM tabela_dados), 2))) AS desvio_padrao
FROM 
    tabela_dados;
