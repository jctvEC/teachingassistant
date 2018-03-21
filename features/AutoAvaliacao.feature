Feature: auto-avalia��o
As an aluno,
I want to atribuir os conceitos MA, MANA ou MPA a cada uma das metas avaliadas,
so that eu posso acompanhar meu progresso.

Scenario: preenchimento bem-sucedido
Given O aluno �Jo�o� n�o fez sua auto-avalia��o
When O aluno �Jo�o� preenche �Entender conceitos de requisitos� com �MA�, �Especificar requisitos com qualidade� com �MANA� e �Entender conceitos de ger�ncia de configura��o com �MPA�.
Then o sistema armazena o preenchimento da auto-avalia��o de �Jo�o�.

Scenario: preenchimento bem-sucedido
Given Eu estou na p�gina de auto-avalia��o
When Eu preencho os campos �Entender conceitos de requisitos� com �MA�, �Especificar requisitos com qualidade� com �MANA� e �Entender conceitos de ger�ncia de configura��o com �MPA�.
Then Eu vejo uma mensagem de confirma��o
And Os conceitos atribu�dos aparecem na minha lista de metas

Scenario: preenchimento mal-sucedido devido � aus�ncia de conceitos
Given O aluno �Victor� n�o fez sua auto-avalia��o
When O aluno �Victor� preenche �Entender conceitos de requisitos� com �MA� e �Especificar requisitos com qualidade� com �MANA�
And O aluno �Victor� n�o preenche �Entender conceitos de ger�ncia de configura��o�
Then O sistema n�o registra os conceitos atribu�dos

Scenario: preenchimento mal-sucedido devido � aus�ncia de conceitos
Given Eu estou na p�gina de auto-avalia��o
When Eu preencho os campos �Entender conceitos de requisitos� com �MA�, �Especificar requisitos com qualidade� com �MANA�
And Eu n�o preencho o campo �Entender conceitos de ger�ncia de configura��o�
Then Eu vejo uma mensagem de erro
And Sou redirecionado para a p�gina "P�gina Inicial"

Scenario: nenhuma discrep�ncia
Given Eu estou na lista de auto-avalia��es dos alunos
And O aluno �Jo�o� possui �1� conceito de �5� superior aos meus
And O aluno �Victor� possui nenhum conceito superior aos meus
And O aluno �Ferraz� possui conceitos iguais aos meus
When Eu filtro a lista por auto-avalia��es discrepantes
Then Eu vejo que a quantidade de alunos e o percentual de alunos com auto-avalia��o discrepante � 0 e 0%, respectivamente
And Eu vejo que a lista est� vazia

Scenario: discrep�ncia
Given Eu estou na lista de auto-avalia��o dos alunos
And O aluno �Coutinho� possui uma auto-avalia��o discrepante 
And A lista possui �3� entradas
When Eu filtro a lista por auto-avalia��es discrepantes
Then Eu vejo que a quantidade de alunos e o percentual de alunos com auto-avalia��o discrepante � �1� e �33%�, respectivamente
And Eu vejo o aluno �Coutinho� na lista
