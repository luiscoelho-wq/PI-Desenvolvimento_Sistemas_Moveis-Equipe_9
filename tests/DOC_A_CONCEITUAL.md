# Documento A — Base Conceitual de Teste (ISO/IEC/IEEE 29119-1)

**Projeto:** Atlas Contábil  
**Tecnologia:** Flutter (Dart)  
**Arquitetura:** MVVM (Model-View-ViewModel)  
**Data:** 12/05/2024  

## 1. Sistema sob teste
O escopo principal deste documento é o **Fluxo de Autenticação e Navegação Inicial** do aplicativo Atlas Contábil, garantindo que apenas usuários autorizados acessem os dados estratégicos.

## 2. Itens de teste
Conforme a estrutura do projeto, os itens a serem testados são:
- `LoginViewModel`: Lógica de autenticação e mensagens de erro.
- `SignUpViewModel`: Lógica de criação de novas contas.
- `AuthService`: Interface de comunicação com o Firebase (Mockada).
- `SplashView`: Lógica de redirecionamento inicial.
- Fluxo Completo: Login → Dashboard.

## 3. Escopo
- **Testes de Unidade:** Validação de regras de negócio nas ViewModels.
- **Testes de Integração:** Fluxo de navegação entre telas.
- **Validações:** Campos obrigatórios, formatos de e-mail e persistência de estado.

## 4. Fora de escopo
- Serviços reais do Firebase (Firestore/Auth) em tempo de execução de teste.
- Testes de performance de rede.
- Testes de interface (UI/UX) manuais.

## 5. Requisitos Funcionais (RF)
- **RF01:** O usuário deve conseguir se cadastrar com nome, e-mail e senha.
- **RF02:** O sistema deve impedir cadastro com campos vazios.
- **RF03:** O sistema deve validar o formato do e-mail.
- **RF04:** O sistema deve retornar para a tela de Login após o cadastro.
- **RF05:** O usuário deve conseguir fazer login com credenciais válidas.
- **RF06:** O sistema deve navegar para a Dashboard (Home) após o login.

## 6. Riscos de Teste
- **R01:** Usuário conseguir acessar a Dashboard sem estar autenticado.
- **R02:** Falha na exibição de mensagens de erro (Feedback ao usuário).
- **R03:** Loop infinito na tela de Splash por falha de estado.
