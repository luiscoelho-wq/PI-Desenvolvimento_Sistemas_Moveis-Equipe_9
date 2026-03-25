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

## Módulo 5 — Simulação Tributária
- UC13 — Acessar Simulador Tributário  
- UC14 — Inserir Dados da Simulação  
- UC15 — Validar Dados da Simulação  
- UC16 — Executar Simulação Tributária  
- UC17 — Exibir Resultado da Simulação  
- UC18 — Gerar Recomendações Estratégicas  
- UC19 — Gerar Resumo Estratégico  
- UC20 — Visualizar Histórico de Simulações  
- UC21 — Visualizar Detalhes de Simulação  
- UC22 — Comparar Cenários Tributários  
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
1. Sistema carrega dados simulados.
2. Sistema apresenta indicadores.

### Regras de Negócio
- RN02 — Simulações não possuem valor legal.

### Requisitos Relacionados
- RF02 — Visualização do Dashboard
- RNF01 — Usabilidade
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve o carregamento e a exibição dos indicadores simulados no dashboard do sistema.

<img width="191" height="193" alt="image" src="https://github.com/user-attachments/assets/5242ea4f-0ec3-4ef6-80dc-5317d59eedde" />

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
2. Sistema apresenta dados simulados.

### Regras de Negócio
- RN02 — Simulações não possuem valor legal.

### Requisitos Relacionados
- RF08 — Acesso ao modo estratégico
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Representa o acesso do usuário à visualização estratégica com dados simulados.

<img width="229" height="193" alt="image" src="https://github.com/user-attachments/assets/f2cf3750-6498-473f-8510-ddddf32f776c" />

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
- RN02 — Simulações não possuem valor legal.

### Requisitos Relacionados
- RF16 — Exibição de mensagens informativas
- RNF11 — Confiabilidade básica

---
**Descrição da Atividade:**  
Descreve a exibição de mensagens informativas ou de erro pelo sistema.

<img width="170" height="193" alt="image" src="https://github.com/user-attachments/assets/8db4ed05-30b6-41eb-a759-dca5ed03ba40" />

---

# Módulo 4 — Clientes

## Caso de Uso 11 — Visualizar Lista de Clientes

**Ator:** Contador  

**Objetivo:** Permitir acesso à lista de clientes simulados.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Lista de clientes exibida.

### Fluxo Principal
1. Usuário acessa módulo de clientes.
2. Sistema consulta dados simulados.
3. Lista é exibida.

### Regras de Negócio
- RN07 — Orientações baseadas nos dados informados.

### Requisitos Relacionados
- RF04 — Visualização de lista de clientes simulados
- RNF01 — Usabilidade
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Representa o processo de consulta e exibição da lista de clientes simulados.

<img width="176" height="248" alt="image" src="https://github.com/user-attachments/assets/190a5c58-83e1-4d6a-b496-7739acdb130a" />

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
- RN07 — Orientações baseadas nos dados informados.

### Requisitos Relacionados
- RF05 — Consulta de detalhes do cliente
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve a visualização dos dados detalhados de um cliente selecionado.

<img width="140" height="248" alt="image" src="https://github.com/user-attachments/assets/68f28efa-de6a-4289-87d6-6ed8208e6852" />

---

# Módulo 5 — Simulação Tributária

## Caso de Uso 13 — Acessar Simulador Tributário

**Ator:** Contador  

**Objetivo:** Permitir acesso à ferramenta de simulação.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Interface do simulador exibida.

### Fluxo Principal
1. Usuário acessa simulador.
2. Sistema abre interface.

### Regras de Negócio
- RN02 — Simulações não possuem valor legal.

### Requisitos Relacionados
- RF06 — Simulação básica de cenário tributário
- RNF01 — Usabilidade

---
**Descrição da Atividade:**  
Representa o acesso do usuário à ferramenta de simulação tributária.

<img width="146" height="193" alt="image" src="https://github.com/user-attachments/assets/0eaa5598-b33d-48aa-851e-f7f356a8987d" />

---

## Caso de Uso 14 — Inserir Dados da Simulação

**Ator:** Contador  

**Objetivo:** Informar parâmetros da simulação.

### Pré-condições
- Simulador aberto.

### Pós-condições
- Dados da simulação registrados.

### Fluxo Principal
1. Usuário informa dados fiscais.
2. Sistema registra parâmetros.

### Regras de Negócio
- RN03 — Dados obrigatórios para simulação
- RN05 — Atualização manual dos dados

### Requisitos Relacionados
- RF06 — Simulação tributária
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve o processo de inserção dos dados necessários para a simulação.

<img width="160" height="193" alt="image" src="https://github.com/user-attachments/assets/94bd5a31-d594-427e-84bf-1d7e34a99dc1" />

---

## Caso de Uso 15 — Validar Dados da Simulação

**Ator:** Sistema

**Objetivo:** Garantir consistência dos dados.

### Pré-condições
- Dados informados pelo usuário.

### Pós-condições
- Dados validados.

### Fluxo Principal
1. Sistema verifica dados informados.
2. Sistema confirma validade.

### Regras de Negócio
- RN03 — Dados obrigatórios para simulação

### Requisitos Relacionados
- RF06 — Simulação tributária
- RNF11 — Confiabilidade básica

---
**Descrição da Atividade:**  
Representa a validação dos dados informados antes da execução da simulação.

<img width="167" height="257" alt="image" src="https://github.com/user-attachments/assets/d63072f0-a3b2-4199-bbea-540c180fbfc6" />

---

## Caso de Uso 16 — Executar Simulação Tributária

**Ator:** Sistema

**Objetivo:** Processar dados e gerar cenário.

### Pré-condições
- Dados validados.

### Pós-condições
- Resultado da simulação gerado.

### Fluxo Principal
1. Sistema processa parâmetros.
2. Calcula resultado.

### Regras de Negócio
- RN02 — Simulações não possuem valor legal.

### Requisitos Relacionados
- RF06 — Simulação tributária
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve o processamento dos dados e a geração do cenário tributário.

<img width="137" height="193" alt="image" src="https://github.com/user-attachments/assets/fb89ce38-419a-45ca-80cb-2afedb60173c" />

---

## Caso de Uso 17 — Exibir Resultado da Simulação

**Ator:** Sistema

**Objetivo:** Apresentar cenário tributário.

### Pré-condições
- Simulação executada.

### Pós-condições
- Resultado exibido ao usuário.

### Fluxo Principal
1. Sistema gera resultado.
2. Sistema exibe informações.

### Regras de Negócio
- RN02 — Simulações não possuem valor legal.

### Requisitos Relacionados
- RF06 — Simulação tributária
- RNF01 — Usabilidade

---
**Descrição da Atividade:**  
Representa a apresentação dos resultados da simulação ao usuário.

<img width="128" height="193" alt="image" src="https://github.com/user-attachments/assets/9384e4fa-e3a2-4b45-a088-22208a673a0c" />

---

## Caso de Uso 18 — Gerar Recomendações Estratégicas

**Ator:** Sistema

**Objetivo:** Apresentar recomendações com base na simulação.

### Pré-condições
- Resultado da simulação disponível.

### Pós-condições
- Recomendações exibidas.

### Fluxo Principal
1. Sistema analisa resultado.
2. Sistema apresenta recomendações.

### Regras de Negócio
- RN07 — Orientações baseadas nos dados informados.

### Requisitos Relacionados
- RF15 — Recomendações estratégicas simuladas
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve a geração de recomendações estratégicas com base no resultado da simulação.

<img width="166" height="193" alt="image" src="https://github.com/user-attachments/assets/41df8714-cffd-4cd9-b63d-31dabc6a66c5" />

---

## Caso de Uso 19 — Gerar Resumo Estratégico

**Ator:** Sistema

**Objetivo:** Criar resumo de informações simuladas.

### Pré-condições
- Resultado da simulação disponível.

### Pós-condições
- Resumo exibido.

### Fluxo Principal
1. Sistema organiza dados da simulação.
2. Sistema apresenta resumo.

### Regras de Negócio
- RN02 — Simulações não possuem valor legal.

### Requisitos Relacionados
- RF07 — Geração de resumo
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Representa a criação de um resumo estratégico com base nos dados da simulação.

<img width="133" height="193" alt="image" src="https://github.com/user-attachments/assets/4e1b4a8d-bb19-477c-8c2a-b865dd85ed02" />

---

## Caso de Uso 20 — Visualizar Histórico de Simulações

**Ator:** Contador  

**Objetivo:** Consultar simulações anteriores.

### Pré-condições
- Usuário autenticado.

### Pós-condições
- Histórico exibido.

### Fluxo Principal
1. Usuário acessa histórico.
2. Sistema apresenta lista.

### Regras de Negócio
- RN04 — Histórico de simulações
- RN06 — Organização por cenários

### Requisitos Relacionados
- RF13 — Histórico de simulações
- RNF01 — Usabilidade

---
**Descrição da Atividade:**  
Descreve o acesso e a visualização das simulações realizadas anteriormente.

<img width="137" height="193" alt="image" src="https://github.com/user-attachments/assets/8bbdaac3-ad72-41dc-8417-2acb2775f868" />

---

## Caso de Uso 21 — Visualizar Detalhes de Simulação

**Ator:** Contador  

**Objetivo:** Analisar uma simulação específica.

### Pré-condições
- Histórico disponível.
- Simulação selecionada.

### Pós-condições
- Detalhes exibidos.

### Fluxo Principal
1. Usuário seleciona simulação.
2. Sistema exibe detalhes.

### Regras de Negócio
- RN04 — Histórico de simulações

### Requisitos Relacionados
- RF14 — Visualização detalhada de simulação
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Representa a visualização detalhada de uma simulação específica.

<img width="162" height="193" alt="image" src="https://github.com/user-attachments/assets/4c7ed0ba-452e-4b04-a360-f9e7db59983b" />

---

## Caso de Uso 22 — Comparar Cenários Tributários

**Ator:** Contador  

**Objetivo:** Comparar diferentes simulações.

### Pré-condições
- Múltiplas simulações disponíveis.

### Pós-condições
- Comparação exibida.

### Fluxo Principal
1. Usuário seleciona cenários.
2. Sistema apresenta comparação.

### Regras de Negócio
- RN06 — Organização por cenários

### Requisitos Relacionados
- RF13 — Histórico de simulações
- RNF03 — Desempenho

---
**Descrição da Atividade:**  
Descreve o processo de comparação entre diferentes cenários de simulação.

<img width="152" height="248" alt="image" src="https://github.com/user-attachments/assets/826e7f47-113b-42c8-9774-2b5ed0175730" />

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
- **UC13 — Acessar Simulador Tributário**
- **UC14 — Inserir Dados da Simulação**
- **UC15 — Validar Dados da Simulação**
- **UC16 — Executar Simulação Tributária**
- **UC17 — Exibir Resultado da Simulação**

## Objetivo do MVP

O MVP permite demonstrar o fluxo principal do sistema:

1. O usuário realiza login no aplicativo.
2. O sistema apresenta o dashboard com indicadores simulados.
3. O usuário pode acessar a lista de clientes simulados.
4. O usuário pode realizar uma simulação tributária.
5. O sistema apresenta o resultado da simulação.

Com esse conjunto de funcionalidades, já é possível demonstrar o funcionamento central do **Atlas Contábil**.
