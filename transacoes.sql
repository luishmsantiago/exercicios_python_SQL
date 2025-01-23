'''Uma transação é um conjunto de operações no banco de dados que são tratadas como uma única unidade de trabalho. 
Elas seguem o conceito ACID para garantir confiabilidade.
Propriedades ACID:

Atomicidade (A):

A transação é indivisível: todas as operações devem ser concluídas ou nenhuma será.
Exemplo: Transferir dinheiro entre contas (se uma operação falha, nenhuma alteração é feita).

Consistência (C):

O banco passa de um estado válido para outro após a transação.
Exemplo: Após uma transação, o total de saldo não pode mudar.

Isolamento (I):

Transações não interferem umas nas outras.
Exemplo: Enquanto uma transação está em andamento, outra não pode acessar dados parcialmente alterados.

Durabilidade (D):

As alterações feitas por uma transação confirmada são permanentes, mesmo em caso de falha no sistema.

'''

'''Iniciar transação:'''
BEGIN TRANSACTION;

'''Confirmar transação:'''
COMMIT;

'''Desfazer transação:'''
ROLLBACK;

'''Exemplo:'''

BEGIN TRANSACTION;

-- Debita da conta A
UPDATE contas SET saldo = saldo - 100 WHERE id = 1;

-- Credita na conta B
UPDATE contas SET saldo = saldo + 100 WHERE id = 2;

-- Confirma a transação
COMMIT;
