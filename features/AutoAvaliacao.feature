Feature: Acesso de informa��es dos servi�os fornecidos pelo NASE
As a: Estudante (cliente)
I want to: Consultar meus servi�os do NASE e ver minhas informa��es pessoais associadas
So that: Posso ter acesso a meu hist�rico de atendimento cl�nico e dados pessoais

Scenario: Consultar um agendamento
Given eu estou loguei com meu cpf "12312312312"
And eu estou na p�gina de "Agendamento"
And eu agendei previamente somente uma consulta "Odontol�gica" na data "21/04/2019" �s "12:30"
When eu busco pela proxima consulta em "pr�ximas consultas"
Then eu vejo uma consulta "Odontol�gica" marcada para a data "21/04/2019" �s "12:30"

Scenario: Consultar um agendamento que inexiste
Given eu estou loguei com meu cpf "12312312312"
And nao marquei previamente nenhuma consulta
And eu estou na p�gina de "Agendamento"
When eu busco pela proxima consulta em "pr�ximas consultas"
Then eu vejo uma mensagem que relata "Sem consultas para os pr�ximos dias"

Scenario: Consultar hist�rico completo
Given eu estou loguei com meu cpf "12312312312"
And eu estou na p�gina de "Hist�rico"
When eu seleciono em "Historico Completo"
Then eu vejo todas consultas e anota�oes m�dicas dos servi�os que fiz
"Servico Odontologico" com "Doutora Brenda" e com coment�rio do servi�o na data  "23/02/2019" �s "12:30"
And "Servico Psicol�gico" com "Doutor Bruno" e com comentario do servico na data "12/12/2018"

Scenario: Consultar hist�rico num intervalo de datas inv�lidas
Given eu estou loguei com meu cpf "12312312312"
And eu estou na p�gina de "Hist�rico"
when eu seleciono "Historico Parcial"
And preencho duas datas "22/02/2019" e "ab/03/2019"
Then eu vejo uma mensagem que relata "Dados incorretos, preencha novamente"

Scenario: Consultar hist�rico num intervalo de datas v�lidas
Given eu estou loguei com meu cpf "12312312312"
And eu estou na p�gina de "Hist�rico"
when eu seleciono "Historico Parcial"
And preencho duas datas "22/02/2019" e "22/03/2019"
Then eu vejo as consultas e anota�oes m�dicas dos servi�os que fiz entre "22/02/2019" e "22/03/2019", sendo a �nica "Servico Odontologico" com "Doutora Brenda" e com coment�rio do servi�o na data  "23/02/2019" �s "12:30"