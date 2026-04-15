# Casos de Uso — Atlas Contábil

Documento contendo os principais casos de uso do aplicativo **Atlas Contábil**, desenvolvido como projeto integrado do módulo **Desenvolvimento de Sistemas Móveis**.

---
# Sumário

## Módulo 1 — Acesso ao Sistema
- UC01 — Cadastrar Usuário  
- UC02 — Realizar Login  
- UC03 — Encerrar Sessão  

## Módulo 2 — Interface e Navegação
- UC04 — Exibir Tela Inicial  
- UC05 — Navegar entre Telas  
- UC06 — Atualizar Informações da Interface  
- UC07 — Organizar Interface Visual  

## Módulo 3 — Dashboard
- UC08 — Visualizar Dashboard  
- UC09 — Acessar Modo Estratégico  
- UC10 — Exibir Mensagens Informativas  

## Módulo 4 — Clientes
- UC11 — Visualizar Lista de Clientes  
- UC12 — Consultar Detalhes de Cliente  

## Módulo 5 — Gestão Inteligente de Tarefas
- UC13 — Visualizar Tarefas do Dia  
- UC14 — Marcar Tarefa como Concluída  
- UC15 — Priorizar Tarefas  
- UC16 — Gerar Insights Inteligentes  
- UC17 — Gerar Resumo do Dia  
- UC18 — Visualizar Insights Detalhados  
- UC19 — Filtrar Tarefas por Período  
- UC20 — Visualizar Resumo por Período  
- UC21 — Destacar Tarefas Urgentes  
---

# Módulo 1 — Acesso ao Sistema

## Caso de Uso 01 — Cadastrar Usuário

**Ator:** Contador  

**Objetivo:** Permitir que um novo usuário crie uma conta no sistema.

### Pré-condições
- Aplicativo instalado.

### Pós-condições
- Conta de usuário criada no sistema.

### Fluxo Principal
1. Usuário acessa tela de cadastro.
2. Usuário informa nome, e-mail e senha.
3. Sistema valida os dados.
4. Sistema registra o novo usuário.

### Regras de Negócio
- RN01 — Acesso restrito ao sistema.

### Requisitos Relacionados
- RF11 — Cadastro de usuário
- RNF01 — Usabilidade
- RNF07 — Segurança acadêmica
- RNF13 — Compatibilidade com dispositivos móveis

---
**Descrição da Atividade:**  
Representa o fluxo de cadastro de um novo usuário, incluindo o preenchimento dos dados e validação pelo sistema.

<img width="240" height="367" alt="image" src="https://github.com/user-attachments/assets/76c81b5e-6e9f-46b2-bd0c-4a669a5742c6" />

---

## Caso de Uso 02 — Realizar Login

**Ator:** Contador  

**Objetivo:** Permitir acesso ao aplicativo mediante autenticação.

### Pré-condições
- Usuário cadastrado.

### Pós-condições
- Usuário autenticado no sistema.

### Fluxo Principal
1. Usuário abre o aplicativo.
2. Sistema exibe tela de login.
3. Usuário informa e-mail e senha.
4. Sistema valida credenciais.
5. Usuário acessa o sistema.

### Fluxos Alternativos

**A1 — Credenciais inválidas**

1. Sistema identifica erro.
2. Sistema exibe mensagem informativa.

### Regras de Negócio
- RN01 — Acesso restrito ao sistema.

### Requisitos Relacionados
- RF01 — Exibição da tela inicial
- RF16 — Exibição de mensagens informativas
- RNF03 — Desempenho
- RNF14 — Tempo de resposta das funcionalidades

---
**Descrição da Atividade:**  
Descreve o processo de autenticação do usuário, incluindo a validação das credenciais e tratamento de erro em caso de falha.

<img width="314" height="367" alt="image" src="https://github.com/user-attachments/assets/04dd534e-e51e-42ed-b254-bd37af110be5" />

---

## Caso de Uso 03 — Encerrar Sessão (Logout)

**Ator:** Contador  

**Objetivo:** Permitir que o usuário finalize sua sessão no aplicativo.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Sessão encerrada.

### Fluxo Principal
1. Usuário seleciona opção de logout.
2. Sistema encerra sessão.
3. Sistema retorna à tela de login.

### Regras de Negócio
- RN01 — Acesso restrito ao sistema.

### Requisitos Relacionados
- RF12 — Logout do sistema
- RNF11 — Confiabilidade básica
- RNF16 — Estabilidade da navegação

---
**Descrição da Atividade:**  
Representa o processo de logout do usuário, finalizando a sessão e retornando à tela de login.

<img width="180" height="248" alt="image" src="https://github.com/user-attachments/assets/bfb484fd-d6d1-4552-bcbd-15e535202f32" />

---

# Módulo 2 — Interface e Navegação

## Caso de Uso 04 — Exibir Tela Inicial

**Ator:** Sistema

**Objetivo:** Apresentar a tela inicial do aplicativo.

### Pré-condições
- Sistema inicializado.

### Pós-condições
- Tela inicial exibida ao usuário.

### Fluxo Principal
1. Sistema carrega interface principal.
2. Exibe funcionalidades disponíveis.

### Regras de Negócio
- RN01 — Acesso restrito ao sistema.

### Requisitos Relacionados
- RF01 — Exibição da tela inicial
- RNF01 — Usabilidade
- RNF08 — Padronização visual

---
**Descrição da Atividade:**  
Descreve o carregamento da interface principal do sistema e a exibição das funcionalidades disponíveis ao usuário.

<img width="163" height="248" alt="image" src="https://github.com/user-attachments/assets/a6649c5e-4879-44bf-b593-49f0723b3540" />

---

## Caso de Uso 05 — Navegar entre Telas

**Ator:** Contador  

**Objetivo:** Permitir acesso às funcionalidades do sistema.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Tela selecionada exibida.

### Fluxo Principal
1. Usuário seleciona funcionalidade.
2. Sistema abre tela correspondente.

### Regras de Negócio
- RN01 — Acesso restrito ao sistema.

### Requisitos Relacionados
- RF03 — Navegação entre telas
- RNF03 — Desempenho
- RNF16 — Estabilidade da navegação

---
**Descrição da Atividade:**  
Representa a navegação do usuário entre as diferentes telas do aplicativo.

<img width="227" height="193" alt="image" src="https://github.com/user-attachments/assets/13dbb033-0e46-4e7d-8de9-289f9cdd481c" />

---

## Caso de Uso 06 — Atualizar Informações da Interface

**Ator:** Sistema

**Objetivo:** Atualizar os dados exibidos na tela.

### Pré-condições
- Interface carregada.

### Pós-condições
- Dados atualizados na interface.

### Fluxo Principal
1. Usuário realiza ação.
2. Sistema processa a ação.
3. Interface é atualizada.

### Regras de Negócio
- RN05 — Atualização manual dos dados.

### Requisitos Relacionados
- RF09 — Atualização visual das informações
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve a atualização das informações exibidas na interface após ações realizadas pelo usuário.

<img width="155" height="248" alt="image" src="https://github.com/user-attachments/assets/af654231-1577-499a-974b-3d6dad2dea21" />

---

## Caso de Uso 07 — Organizar Interface Visual

**Ator:** Sistema

**Objetivo:** Manter organização visual conforme o protótipo.

### Pré-condições
- Interface carregada.

### Pós-condições
- Interface organizada conforme padrão.

### Fluxo Principal
1. Sistema aplica layout definido.
2. Componentes são exibidos organizados.

### Regras de Negócio
- RN05 — Atualização manual dos dados.

### Requisitos Relacionados
- RF10 — Organização visual das interfaces
- RNF08 — Padronização visual

---
**Descrição da Atividade:**  
Representa a aplicação do layout e a organização visual dos elementos da interface conforme o padrão definido.

<img width="222" height="193" alt="image" src="https://github.com/user-attachments/assets/8195da33-9a7f-423a-a38a-460b94dd02ef" />

---

# Módulo 3 — Dashboard

## Caso de Uso 08 — Visualizar Dashboard

**Ator:** Contador  

**Objetivo:** Apresentar visão geral do sistema.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Dashboard exibido.

### Fluxo Principal
1. Sistema carrega dados.
2. Sistema apresenta indicadores.

### Regras de Negócio
- RN02 — Informações possuem caráter informativo
  
### Requisitos Relacionados
- RF02 — Visualização do Dashboard
- RF09 — Atualização visual das informações
- RNF01 — Usabilidade
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve o carregamento e a exibição dos indicadores no dashboard do sistema.

<img width="193" height="248" alt="image" src="https://github.com/user-attachments/assets/ef5a3b14-cda8-4cb7-9bb8-472b5944e3e7" />

---

## Caso de Uso 09 — Acessar Modo Estratégico

**Ator:** Contador  

**Objetivo:** Visualizar visão geral estratégica da carteira de clientes.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Modo estratégico exibido.

### Fluxo Principal
1. Usuário acessa modo estratégico.
2. Sistema apresenta dados.

### Regras de Negócio
- RN02 — Informações possuem caráter informativo
- RN07 — Orientações baseadas nos dados informados

### Requisitos Relacionados
- RF08 — Acesso ao modo estratégico
- RF09 — Atualização visual das informações
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve a visualização de informações estratégicas gerais do sistema.

<img width="229" height="248" alt="image" src="https://github.com/user-attachments/assets/ad7b933a-8664-442a-b3c1-ac859d2e6a61" />

---

## Caso de Uso 10 — Exibir Mensagens Informativas

**Ator:** Sistema

**Objetivo:** Informar eventos ou erros ao usuário.

### Pré-condições
- Evento ou erro identificado.

### Pós-condições
- Mensagem exibida ao usuário.

### Fluxo Principal
1. Sistema identifica evento.
2. Sistema exibe mensagem.

### Regras de Negócio
- RN02 — Informações possuem caráter informativo

### Requisitos Relacionados
- RF16 — Exibição de mensagens informativas
- RF09 — Atualização visual das informações
- RNF11 — Confiabilidade básica

---
**Descrição da Atividade:**  
Descreve a exibição de mensagens informativas ou de erro pelo sistema.

<img width="201" height="248" alt="image" src="https://github.com/user-attachments/assets/41a55a01-c0a3-4cd9-8f71-dc3d965fc7dd" />

---

# Módulo 4 — Clientes

## Caso de Uso 11 — Visualizar Lista de Clientes

**Ator:** Contador  

**Objetivo:** Permitir acesso à lista de clientes.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Lista de clientes exibida.

### Fluxo Principal
1. Usuário acessa módulo de clientes.
2. Sistema consulta dados.
3. Lista é exibida.

### Regras de Negócio
- RN04 — Histórico por usuário
- RN07 — Orientações baseadas nos dados informados

### Requisitos Relacionados
- RF04 — Visualização de lista de clientes
- RF09 — Atualização visual das informações
- RNF01 — Usabilidade
- RNF03 — Desempenho
---
**Descrição da Atividade:**  
Descreve o carregamento e exibição da lista de clientes disponíveis no sistema.

<img width="176" height="248" alt="image" src="https://github.com/user-attachments/assets/54f9b7d5-b933-494b-b2e9-7bd34dc90501" />

---

## Caso de Uso 12 — Consultar Detalhes de Cliente

**Ator:** Contador  

**Objetivo:** Visualizar informações estratégicas de um cliente.

### Pré-condições
- Usuário autenticado.
- Cliente selecionado.

### Pós-condições
- Detalhes do cliente exibidos.

### Fluxo Principal
1. Usuário seleciona cliente.
2. Sistema carrega dados.
3. Sistema exibe informações.

### Regras de Negócio
- RN04 — Histórico por usuário
- RN07 — Orientações baseadas nos dados informados

### Requisitos Relacionados
- RF05 — Consulta de detalhes do cliente
- RF09 — Atualização visual das informações
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve a visualização dos dados detalhados de um cliente selecionado.

<img width="182" height="248" alt="image" src="https://github.com/user-attachments/assets/67371f96-c66c-4c7b-82b0-3495e37ec0a2" />

---

# Módulo 5 — Gestão Inteligente de Tarefas

## Caso de Uso 13 — Visualizar Tarefas do Dia

**Ator:** Usuário  

**Objetivo:** Permitir que o usuário visualize as tarefas do dia atual.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Lista de tarefas exibida.

### Fluxo Principal
1. Usuário acessa a tela inicial.
2. Sistema identifica a data atual.
3. Sistema carrega tarefas do dia.
4. Sistema exibe lista de tarefas.

### Regras de Negócio
- RN08 — Organização de tarefas por data

### Requisitos Relacionados
- RF17 — Visualização de tarefas por data
- RF09 — Atualização visual das informações
- RNF17 — Clareza das informações

---
**Descrição da Atividade:**  
Representa a exibição das tarefas diárias organizadas para o usuário.

<img width="207" height="303" alt="image" src="https://github.com/user-attachments/assets/cf1391f7-1cca-4a70-bee0-79d3ad8566f5" />

---

## Caso de Uso 14 — Marcar Tarefa como Concluída

**Ator:** Usuário  

**Objetivo:** Permitir que o usuário atualize o status das tarefas.

### Pré-condições
- Tarefa disponível na lista.

### Pós-condições
- Tarefa marcada como concluída.

### Fluxo Principal
1. Usuário seleciona uma tarefa.
2. Usuário marca como concluída.
3. Sistema atualiza o status.
4. Interface é atualizada.

### Regras de Negócio
- RN09 — Atualização de status de tarefas

### Requisitos Relacionados
- RF18 — Atualização de status de tarefas
- RF09 — Atualização visual das informações
- RNF18 — Tempo de atualização de interface

---
**Descrição da Atividade:**  
Representa a atualização do status de uma tarefa pelo usuário.

<img width="214" height="303" alt="image" src="https://github.com/user-attachments/assets/5b35d950-163d-4d44-9762-9afd8ad39906" />

---

## Caso de Uso 15 — Priorizar Tarefas

**Ator:** Sistema  

**Objetivo:** Identificar automaticamente tarefas mais urgentes.

### Pré-condições
- Tarefas disponíveis.

### Pós-condições
- Tarefas organizadas por prioridade.

### Fluxo Principal
1. Sistema analisa prazos das tarefas.
2. Sistema identifica tarefas urgentes.
3. Sistema destaca tarefas prioritárias.

### Regras de Negócio
- RN10 — Priorização automática

### Requisitos Relacionados
- RF19 — Priorização automática de tarefas
- RF24 — Destaque de tarefas urgentes
- RNF20 — Organização visual de tarefas

---
**Descrição da Atividade:**  
Representa a priorização automática das tarefas com base na urgência.

<img width="237" height="303" alt="image" src="https://github.com/user-attachments/assets/191955e5-ab17-4813-9f03-a29dfd545dc0" />

---

## Caso de Uso 16 — Gerar Insights Inteligentes

**Ator:** Sistema  

**Objetivo:** Gerar recomendações com base nas tarefas do usuário.

### Pré-condições
- Tarefas disponíveis.

### Pós-condições
- Insights exibidos.

### Fluxo Principal
1. Sistema analisa tarefas do usuário.
2. Sistema identifica padrões e prazos.
3. Sistema gera insights.
4. Sistema exibe recomendações.

### Regras de Negócio
- RN07 — Orientações baseadas nos dados informados

### Requisitos Relacionados
- RF07 — Visualização de insights inteligentes
- RF15 — Recomendações inteligentes
- RNF02 — Eficiência

---
**Descrição da Atividade:**  
Representa a geração de recomendações automáticas com base nas tarefas.

<img width="213" height="303" alt="image" src="https://github.com/user-attachments/assets/ddc9b371-9782-4847-8f21-d3249a73f9d1" />

---

## Caso de Uso 17 — Gerar Resumo do Dia

**Ator:** Sistema  

**Objetivo:** Apresentar um resumo das atividades do dia.

### Pré-condições
- Tarefas disponíveis.

### Pós-condições
- Resumo exibido.

### Fluxo Principal
1. Sistema coleta dados das tarefas.
2. Sistema organiza informações.
3. Sistema gera resumo do dia.
4. Sistema exibe resumo.

### Regras de Negócio
- RN11 — Geração de resumos

### Requisitos Relacionados
- RF20 — Geração de resumo diário
- RF12 — Exibição de resultados processados
- RNF14 — Tempo de resposta das funcionalidades

---
**Descrição da Atividade:**  
Representa a geração de um resumo diário das atividades.

<img width="227" height="303" alt="image" src="https://github.com/user-attachments/assets/e9f55f73-4b80-4159-97b8-604111f06988" />

---

## Caso de Uso 18 — Visualizar Insights Detalhados

**Ator:** Usuário  

**Objetivo:** Permitir acesso completo às recomendações geradas.

### Pré-condições
- Insights disponíveis.

### Pós-condições
- Detalhamento exibido.

### Fluxo Principal
1. Usuário seleciona “ver mais”.
2. Sistema carrega detalhes.
3. Sistema exibe recomendações completas.

### Regras de Negócio
- RN07 — Orientações baseadas nos dados informados

### Requisitos Relacionados
- RF21 — Detalhamento de insights
- RF07 — Visualização de insights inteligentes
- RNF17 — Clareza das informações

---
**Descrição da Atividade:**  
Representa a visualização detalhada dos insights gerados pelo sistema.

<img width="253" height="248" alt="image" src="https://github.com/user-attachments/assets/bde1c67a-685b-452d-8fb3-a54bdf41345a" />

---

## Caso de Uso 19 — Filtrar Tarefas por Período

**Ator:** Usuário  

**Objetivo:** Permitir que o usuário visualize tarefas por período (diário, semanal ou mensal).

### Pré-condições
- Tarefas disponíveis.

### Pós-condições
- Tarefas filtradas exibidas.

### Fluxo Principal
1. Usuário seleciona tipo de visualização.
2. Sistema identifica o período.
3. Sistema filtra tarefas.
4. Sistema atualiza a interface.

### Regras de Negócio
- RN12 — Visualização de dados por período

### Requisitos Relacionados
- RF22 — Filtro de tarefas por período
- RF09 — Atualização visual das informações
- RNF01 — Usabilidade  

---
**Descrição da Atividade:**  
Representa a filtragem de tarefas com base no período selecionado pelo usuário.

<img width="208" height="303" alt="image" src="https://github.com/user-attachments/assets/464a74d1-c805-4e02-b05f-fbaa24e9c4cb" />

---

## Caso de Uso 20 — Visualizar Resumo por Período

**Ator:** Sistema  

**Objetivo:** Exibir resumo com base no período selecionado.

### Pré-condições
- Período selecionado.

### Pós-condições
- Resumo atualizado exibido.

### Fluxo Principal
1. Sistema identifica o período ativo.
2. Sistema coleta dados das tarefas.
3. Sistema gera resumo.
4. Sistema exibe informações.

### Regras de Negócio
- RN12 — Visualização de dados por período

### Requisitos Relacionados
- RF23 — Resumo por período
- RF20 — Geração de resumo diário
- RNF02 — Eficiência

---
**Descrição da Atividade:**  
Representa a atualização do resumo com base no período escolhido pelo usuário.

<img width="188" height="303" alt="image" src="https://github.com/user-attachments/assets/4181eca2-7c39-41a2-969b-7dbb531e0db3" />

---

## Caso de Uso 21 — Destacar Tarefas Urgentes

**Ator:** Sistema  

**Objetivo:** Evidenciar tarefas com maior prioridade.

### Pré-condições
- Tarefas cadastradas.

### Pós-condições
- Tarefas urgentes destacadas.

### Fluxo Principal
1. Sistema analisa prazos.
2. Sistema identifica urgência.
3. Sistema aplica destaque visual.

### Regras de Negócio
- RN10 — Priorização automática

### Requisitos Relacionados
- RF24 — Destaque de tarefas urgentes
- RF19 — Priorização automática de tarefas
- RNF20 — Organização visual de tarefas

---
**Descrição da Atividade:**  
Representa a identificação e o destaque de tarefas prioritárias.

<img width="214" height="303" alt="image" src="https://github.com/user-attachments/assets/35d61306-6712-455b-8c00-1dfc371fd7ce" />

---

# Funcionalidades do MVP

Para o aplicativo **Atlas Contábil**, foi definido um conjunto mínimo de funcionalidades que demonstram o funcionamento principal do sistema.

Essas funcionalidades compõem o **MVP (Minimum Viable Product)** do projeto.

## Casos de Uso incluídos no MVP

- **UC02 — Realizar Login**
- **UC04 — Exibir Tela Inicial**
- **UC05 — Navegar entre Telas**
- **UC08 — Visualizar Dashboard**
- **UC11 — Visualizar Lista de Clientes**
- **UC12 — Consultar Detalhes de Cliente**
- **UC13 — Visualizar Tarefas do Dia**
- **UC14 — Marcar Tarefa como Concluída**
- **UC16 — Gerar Insights Inteligentes**
- **UC17 — Gerar Resumo do Dia**

## Objetivo do MVP

O MVP permite demonstrar o fluxo principal do sistema:

1. O usuário realiza login no aplicativo.
2. O sistema apresenta o dashboard com indicadores simulados.
3. O usuário pode acessar a lista de clientes simulados.
4. O usuário visualiza e gerencia suas tarefas do dia.
5. O sistema gera insights e apresenta um resumo inteligente das atividades.
