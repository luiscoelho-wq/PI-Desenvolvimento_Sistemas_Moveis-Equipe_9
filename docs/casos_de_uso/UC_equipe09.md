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
- UC09 — Acessar Painel Inteligente
- UC10 — Exibir Mensagens Informativas  

## Módulo 4 — Clientes
- UC11 — Visualizar Lista de Clientes    

## Módulo 5 — Gestão Inteligente de Tarefas
- UC12 — Visualizar Tarefas por Data  
- UC13 — Marcar Tarefa como Concluída  
- UC14 — Definir Prioridade de Tarefas   
- UC15 — Gerar Insights Inteligentes  
- UC16 — Gerar Resumo Diário  
- UC17 — Filtrar Tarefas por Período  
 
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
- RF10 — Cadastro de usuário
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
- RF13 — Exibição de mensagens informativas do sistema
- RNF03 — Desempenho
- RNF14 — Tempo de resposta das funcionalidades

---
**Descrição da Atividade:**  
Descreve o processo de autenticação do usuário, incluindo a validação das credenciais e tratamento de erro em caso de falha.

<img width="314" height="367" alt="image" src="https://github.com/user-attachments/assets/04dd534e-e51e-42ed-b254-bd37af110be5" />

---

## Caso de Uso 03 — Encerrar Sessão 

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
- RF11 — Logout do sistema
- RNF11 — Confiabilidade básica  

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
- RN05 — Inserção manual de dados  

### Requisitos Relacionados
- RF08 — Atualização visual das informações
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
- RN05 — Inserção manual de dados

### Requisitos Relacionados
- RF09 — Organização visual das interfaces
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
- RF08 — Atualização visual das informações
- RNF01 — Usabilidade
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve o carregamento e a exibição dos indicadores no dashboard do sistema.

<img width="193" height="248" alt="image" src="https://github.com/user-attachments/assets/ef5a3b14-cda8-4cb7-9bb8-472b5944e3e7" />

---

## Caso de Uso 09 — Acessar Painel Inteligente

## Ator
Contador

## Objetivo
Permitir que o usuário visualize uma visão geral contendo calendário, tarefas e insights relevantes.

## Pré-condições
- Usuário autenticado.

## Pós-condições
- Painel inteligente exibido ao usuário.

## Fluxo Principal
1. Usuário acessa o painel inteligente.
2. Sistema carrega calendário e tarefas.
3. Sistema gera insights automáticos.
4. Sistema exibe informações organizadas.

## Regras de Negócio
- RN02 — Informações possuem caráter informativo
- RN07 — Geração de insights baseada em dados  

## Requisitos Relacionados
- RF07 — Acesso ao painel inteligente
- RF05 — Visualização de calendário e tarefas
- RF06 — Visualização de insights inteligentes
- RNF01 — Usabilidade
- RNF03 — Desempenho

## Descrição da Atividade
Representa o acesso ao painel principal inteligente do sistema, contendo calendário, tarefas e insights relevantes ao usuário.

<img width="266" height="365" alt="image" src="https://github.com/user-attachments/assets/d23da9ed-0a7e-4a95-835a-d8a5f9f00f45" />

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
- RF13 — Exibição de mensagens informativas do sistema
- RF08 — Atualização visual das informações
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
- RN04 — Informações por usuário
- RN07 — Geração de insights baseada em dados

### Requisitos Relacionados
- RF04 — Visualização de lista de clientes
- RF08 — Atualização visual das informações
- RNF01 — Usabilidade
- RNF03 — Desempenho
---
**Descrição da Atividade:**  
Descreve o carregamento e exibição da lista de clientes disponíveis no sistema.

<img width="176" height="248" alt="image" src="https://github.com/user-attachments/assets/54f9b7d5-b933-494b-b2e9-7bd34dc90501" />

---

# Módulo 5 — Gestão Inteligente de Tarefas

## Caso de Uso 12 — Visualizar Tarefas por Data

## Ator
Contador

## Objetivo
Permitir que o usuário visualize tarefas organizadas conforme a data selecionada no calendário.

## Pré-condições
- Usuário autenticado.
- Calendário disponível no sistema.

## Pós-condições
- Lista de tarefas da data selecionada exibida.

## Fluxo Principal
1. Usuário acessa o calendário.
2. Usuário seleciona uma data.
3. Sistema identifica as tarefas associadas.
4. Sistema exibe as tarefas organizadas.

## Regras de Negócio
- RN07 — Geração de insights baseada em dados

## Requisitos Relacionados
- RF05 — Visualização de calendário e tarefas
- RF14 — Visualização de tarefas por data
- RF08 — Atualização visual das informações
- RNF01 — Usabilidade
- RNF03 — Desempenho

## Descrição da Atividade
Representa a visualização das tarefas organizadas conforme a data selecionada pelo usuário no calendário.

<img width="266" height="311" alt="image" src="https://github.com/user-attachments/assets/3cbd9a77-75b8-4919-b99d-09cf702961aa" />

---

## Caso de Uso 13 — Marcar Tarefa como Concluída

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
- RN06 — Organização das informações por cliente

### Requisitos Relacionados
- RF15 — Atualização de status de tarefas
- RF08 — Atualização visual das informações  

---
**Descrição da Atividade:**  
Representa a atualização do status de uma tarefa pelo usuário.

<img width="214" height="303" alt="image" src="https://github.com/user-attachments/assets/5b35d950-163d-4d44-9762-9afd8ad39906" />

---

## Caso de Uso 14 — Definir Prioridade de Tarefas

## Ator
Contador

## Objetivo
Permitir que o usuário destaque tarefas conforme sua prioridade ou urgência.

## Pré-condições
- Usuário autenticado.
- Tarefas disponíveis no sistema.

## Pós-condições
- Tarefas destacadas conforme prioridade definida pelo usuário.

## Fluxo Principal
1. Usuário acessa a lista de tarefas.
2. Usuário seleciona uma tarefa.
3. Usuário define o nível de prioridade.
4. Sistema atualiza as informações da tarefa.
5. Sistema aplica destaque visual na interface.

## Regras de Negócio
- RN07 — Geração de insights baseada em dados.

## Requisitos Relacionados
- RF19 — Destaque de prioridade nas tarefas
- RF15 — Atualização de status de tarefas
- RF08 — Atualização visual das informações
- RNF08 — Padronização visual
- RNF11 — Confiabilidade básica

## Descrição da Atividade
Representa a definição manual de prioridade das tarefas pelo usuário, permitindo destaque visual conforme urgência.

<img width="245" height="365" alt="image" src="https://github.com/user-attachments/assets/e40f9d2c-828d-472e-ad78-c58b9e80aefb" />

---

## Caso de Uso 15 — Gerar Insights Inteligentes

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
- RN07 — Geração de insights baseada em dados  

### Requisitos Relacionados
- RF06 — Visualização de insights inteligentes
- RF12 — Recomendações inteligentes
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Representa a geração de recomendações automáticas com base nas tarefas.

<img width="213" height="303" alt="image" src="https://github.com/user-attachments/assets/ddc9b371-9782-4847-8f21-d3249a73f9d1" />

---

## Caso de Uso 16 — Gerar Resumo Diário

## Ator
Sistema

## Objetivo
Gerar automaticamente um resumo das atividades do dia.

## Pré-condições
- Existirem tarefas cadastradas para o dia atual.

## Pós-condições
- Resumo diário exibido ao usuário.

## Fluxo Principal
1. Sistema identifica as tarefas do dia.
2. Sistema organiza as informações.
3. Sistema gera o resumo automático.
4. Sistema exibe o resumo ao usuário.

## Regras de Negócio
- RN07 — Geração de insights baseada em dados.

## Requisitos Relacionados
- RF17 — Geração de resumo diário
- RF08 — Atualização visual das informações
- RNF03 — Desempenho
- RNF14 — Tempo de resposta das funcionalidades

## Descrição da Atividade
Representa a geração automática de um resumo diário com base nas tarefas registradas no sistema.

<img width="253" height="311" alt="image" src="https://github.com/user-attachments/assets/547dccb0-dbb4-444d-b395-5b53a7c11f2b" />

---

## Caso de Uso 17 — Filtrar Tarefas por Período

## Ator
Contador

## Objetivo
Permitir que o usuário visualize tarefas conforme o período selecionado.

## Pré-condições
- Usuário autenticado.
- Existirem tarefas cadastradas.

## Pós-condições
- Tarefas filtradas exibidas.

## Fluxo Principal
1. Usuário seleciona um período.
2. Sistema identifica o filtro escolhido.
3. Sistema aplica o filtro nas tarefas.
4. Sistema atualiza a interface.

## Regras de Negócio
- RN07 — Geração de insights baseada em dados.

## Requisitos Relacionados
- RF18 — Filtro de tarefas por período
- RF08 — Atualização visual das informações
- RNF01 — Usabilidade
- RNF03 — Desempenho

## Descrição da Atividade
Representa a filtragem de tarefas conforme o período selecionado pelo usuário.

<img width="215" height="311" alt="image" src="https://github.com/user-attachments/assets/ce77aa06-bc89-4ab6-9abb-1c2d37ef20c7" />

---

# Funcionalidades do MVP

Para o aplicativo **Atlas Contábil**, foi definido um conjunto mínimo de funcionalidades que demonstram o funcionamento principal do sistema.

Essas funcionalidades compõem o **MVP (Minimum Viable Product)** do projeto.

## Casos de Uso incluídos no MVP

- **UC02 — Realizar Login**
- **UC04 — Exibir Tela Inicial**
- **UC05 — Navegar entre Telas**
- **UC08 — Visualizar Dashboard**
- **UC09 — Acessar Painel Inteligente**
- **UC11 — Visualizar Lista de Clientes**
- **UC12 — Visualizar Tarefas por Data**
- **UC13 — Marcar Tarefa como Concluída**
- **UC14 — Definir Prioridade de Tarefas**
- **UC15 — Gerar Insights Inteligentes**
- **UC16 — Gerar Resumo Diário**
- **UC17 — Filtrar Tarefas por Período**

## Objetivo do MVP

O MVP permite demonstrar o fluxo principal do sistema:

1. O usuário realiza login no aplicativo.
2. O sistema apresenta o dashboard com indicadores simulados.
3. O usuário acessa o painel inteligente com calendário, tarefas e insights.
4. O usuário visualiza a lista de clientes cadastrados.
5. O usuário acompanha tarefas organizadas por data.
6. O usuário atualiza o status e prioridade das tarefas.
7. O sistema gera insights e apresenta um resumo diário das atividades.
