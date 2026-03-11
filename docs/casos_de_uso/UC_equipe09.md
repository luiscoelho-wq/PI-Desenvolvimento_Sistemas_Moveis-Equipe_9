# Casos de Uso — Atlas Contábil

Documento contendo os principais casos de uso do aplicativo **Atlas Contábil**, desenvolvido como projeto integrado do módulo **Desenvolvimento de Sistemas Móveis**.

---

## Caso de Uso 01 — Realizar Login

**Ator:** Usuário (Contador)  
**Objetivo:** Acessar o aplicativo mediante autenticação válida.

### Pré-condições:
- O aplicativo deve estar instalado e funcional.
- O usuário deve possuir acesso autorizado ao sistema acadêmico.

### Pós-condições:
- Sessão iniciada com sucesso.
- Usuário redirecionado ao Dashboard.

### Fluxo Principal:
1) Usuário abre o aplicativo.  
2) Sistema exibe a tela de login.  
3) Usuário informa credenciais.  
4) Sistema valida os dados inseridos.  
5) Sistema redireciona para a tela inicial (Dashboard).  

### Fluxos Alternativos:

**A1 — Credenciais inválidas**  
1) Sistema identifica erro nas credenciais.  
2) Exibe mensagem informando falha no login.  
3) Permite nova tentativa.  

**A2 — Campos não preenchidos**  
1) Sistema detecta campos vazios.  
2) Solicita preenchimento obrigatório.  

### Regras de Negócio:
- RN01: O acesso ao sistema é restrito a usuários autorizados.  
- RN02: Dados utilizados são apenas simulados para fins acadêmicos.  

### Requisitos Relacionados:
- RF01 — Exibição da tela inicial  
- RF03 — Navegação entre telas  
- RNF01 — Usabilidade  
- RNF11 — Confiabilidade básica  

---

## Caso de Uso 02 — Simular Cenário Tributário

**Ator:** Usuário (Contador)  
**Objetivo:** Avaliar impactos estratégicos simulados a partir da alteração de parâmetros tributários.

### Pré-condições:
- Usuário autenticado.  
- Acesso ao módulo de simulação.  

### Pós-condições:
- Cenário estratégico atualizado e exibido.  

### Fluxo Principal:
1) Usuário acessa o simulador estratégico.  
2) Altera parâmetros simulados (faturamento, regime ou funcionários).  
3) Sistema processa os dados.  
4) Sistema apresenta resultado estimado do cenário.  

### Fluxos Alternativos:

**A1 — Valores inválidos**  
1) Sistema identifica dados inconsistentes.  
2) Solicita correção antes da simulação.  

**A2 — Cancelamento da simulação**  
1) Usuário retorna à tela anterior.  
2) Nenhuma alteração é salva.  

### Regras de Negócio:
- RN04: Simulações utilizam apenas dados fictícios.  
- RN05: Resultados possuem finalidade exclusivamente acadêmica.  

### Requisitos Relacionados:
- RF08 — Simulação básica de cenário tributário  
- RF11 — Atualização visual das informações  
- RNF05 — Manutenibilidade  
- RNF12 — Clareza de escopo  

---

## Casos de Uso — Complementares

### Caso de Uso 03 — Visualizar Lista de Clientes

**Ator:** Usuário (Contador)  
**Objetivo:** Permitir que o usuário visualize a lista de clientes simulados cadastrados no sistema.

**Pré-condições:**  
- Usuário autenticado no sistema.  
- Acesso ao módulo de clientes.  

**Pós-condições:**  
- Lista de clientes exibida ao usuário.  

**Fluxo Principal:**

1. Usuário acessa a funcionalidade de clientes.  
2. Sistema consulta os dados simulados disponíveis.  
3. Sistema exibe a lista de clientes cadastrados.  

**Fluxos Alternativos:**

**A1 — Nenhum cliente disponível**  

1. Sistema identifica ausência de clientes cadastrados.  
2. Exibe mensagem informativa ao usuário.  

**Regras de Negócio:**  
- RN04 — Simulações utilizam apenas dados fictícios.  

**Requisitos Relacionados:**  
- RF06 — Visualização de lista de clientes simulados  
- RNF01 — Usabilidade  
- RNF11 — Confiabilidade básica  

---

### Caso de Uso 04 — Consultar Detalhes de Cliente

**Ator:** Usuário (Contador)  
**Objetivo:** Permitir que o usuário visualize informações estratégicas simuladas de um cliente específico.

**Pré-condições:**  
- Usuário autenticado.  
- Lista de clientes carregada.  

**Pós-condições:**  
- Informações detalhadas do cliente exibidas.  

**Fluxo Principal:**  
1. Usuário acessa a lista de clientes.  
2. Seleciona um cliente específico.  
3. Sistema carrega os dados simulados do cliente.  
4. Sistema exibe informações detalhadas.  

**Fluxos Alternativos:**  

**A1 — Falha ao carregar dados**  
1. Sistema identifica erro na recuperação das informações.  
2. Exibe mensagem de erro ao usuário.  

**Regras de Negócio:**  
- RN07 — Orientações baseadas nos dados informados.  

**Requisitos Relacionados:**  
- RF07 — Consulta de detalhes do cliente  
- RF11 — Atualização visual das informações  
- RNF03 — Desempenho  

---

### Caso de Uso 05 — Visualizar Histórico de Simulações

**Ator:** Usuário (Contador)  
**Objetivo:** Permitir que o usuário visualize simulações tributárias realizadas anteriormente.

**Pré-condições:**  
- Usuário autenticado.  
- Simulações previamente registradas.  

**Pós-condições:**  
- Histórico de simulações exibido.  

**Fluxo Principal:**  
1. Usuário acessa o módulo de simulações.  
2. Seleciona a opção de histórico.  
3. Sistema consulta as simulações registradas.  
4. Sistema exibe a lista de cenários simulados.  

**Fluxos Alternativos:**  

**A1 — Histórico vazio**  
1. Sistema identifica ausência de simulações.  
2. Exibe mensagem informando que não existem cenários registrados.  

**Regras de Negócio:**  
- RN06 — Organização por cenários.  

**Requisitos Relacionados:**  
- RF15 — Histórico de simulações  
- RNF05 — Manutenibilidade  
- RNF12 — Clareza de escopo  

---

### Caso de Uso 06 — Encerrar Sessão (Logout)

**Ator:** Usuário (Contador)  
**Objetivo:** Permitir que o usuário finalize sua sessão no aplicativo.

**Pré-condições:**  
- Usuário autenticado no sistema.  

**Pós-condições:**  
- Sessão encerrada.  
- Usuário redirecionado para a tela de login.  

**Fluxo Principal:**  
1. Usuário acessa a opção de logout.  
2. Sistema encerra a sessão atual.  
3. Sistema redireciona para a tela de login.  

**Fluxos Alternativos:**  

**A1 — Cancelamento da ação**  
1. Usuário cancela a solicitação de logout.  
2. Sistema mantém a sessão ativa.  

**Regras de Negócio:**  
- RN01 — Acesso restrito ao sistema.  

**Requisitos Relacionados:**  
- RF14 — Logout do sistema  
- RNF01 — Usabilidade  
- RNF16 — Estabilidade da navegação  
