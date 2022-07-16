-- Alunos que entregaram o projeto módulo 1 com conceito 'Pronto' ou 'Mais do que pronto'
SELECT alunos.nome, modulo, conceito FROM entregas
INNER JOIN alunos ON entregas.alunos_cpf = alunos.cpf
WHERE modulo = 1 AND conceito IN ("Pronto","Mais do que pronto");
    
-- Quantidade de projetos no conceito “Ainda não está pronto” ou “Chegando lá”
SELECT entregas.conceito, count(*) as quantidade
FROM entregas 
GROUP BY entregas.conceito
HAVING entregas.conceito = 'Ainda não está pronto' OR entregas.conceito = 'Chegando lá'
ORDER BY entregas.conceito;

-- ALunos com a maior quantidade de projetos no conceito “Mais do que pronto”
SELECT alunos.nome, alunos.cpf FROM entregas 
inner join alunos ON entregas.alunos_cpf = alunos.cpf
WHERE conceito = "Mais do que pronto";


