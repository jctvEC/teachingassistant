Feature: auto-avalia�ao de metas das disciplinas do Cin
As a Aluno
I want to atribuir conceito (MANA, MA ou MPA) a todas as metas de uma dada disciplina
so that dado que o professor preencheu sua avalia�ao, preencherei as minhas consequentemente e poderei fazer uma compara�ao com as notas do professor e as minhas.

Scenario: Autoavalia�ao das metas de uma dada disciplina 
Given eu loguei com meu cpf "12312312312" e nome "Juliano"
And que estou na tela de auto-avalia�ao da disciplina "ESS"
And o professor j� preencheu suas notas
When eu preencho minhas notas, em "Requisitos ", com "MA",  "Ger�ncia de Configura�ao ", com  "MA" e em "Valida�ao e Teste" com "MA"
Then finalizo minha avalia�ao 
And recebo uma mensagem de confirma�ao
And vejo minha notas "MA", "MA", "MA" em "Requisitos", "Ger�ncia de Configura�ao" e  "Valida�ao e Teste" da disciplina "ESS" na tela de auto-avalia�ao