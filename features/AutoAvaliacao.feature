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