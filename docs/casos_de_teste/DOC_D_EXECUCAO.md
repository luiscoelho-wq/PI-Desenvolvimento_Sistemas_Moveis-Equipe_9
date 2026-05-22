# Documento D — Execução e Resultados dos Testes

**Projeto:** Auth_29119_App  
**Tecnologia:** Flutter  
**Arquitetura:** MVVM com Provider  
**Norma aplicada:** ISO/IEC/IEEE 29119  

## Tipo de teste
- Unidade
- Integração

---

# 1. Objetivo

Registrar a execução dos testes implementados no projeto Flutter, documentando os resultados obtidos, falhas encontradas e análise final do comportamento do sistema.

---

# 2. Ambiente de Execução

## Ambiente utilizado
- Flutter SDK
- Dart SDK
- flutter_test
- integration_test

## Arquitetura
- MVVM
- Provider
- FakeAuthService

---

# 3. Estrutura dos Testes Executados

```plaintext
test/
  viewmodel/
    signup_viewmodel_test.dart
    login_viewmodel_test.dart

integration_test/
  auth_flow_test.dart
```

---

# 4. Execução dos Testes

## Testes unitários

```bash
flutter test
```

## Testes de integração

```bash
flutter test integration_test
```

---

# 5. Resultados dos Testes Unitários

| Caso | Objetivo | Resultado Esperado | Resultado Obtido | Status |
|------|------|------|------|------|
| TC01 | Cadastro válido | Cadastro realizado | Cadastro realizado | Aprovado |
| TC02 | Campos vazios | Mensagem de erro | Mensagem exibida | Aprovado |
| TC03 | E-mail inválido | Mensagem de erro | Mensagem exibida | Aprovado |
| TC04 | Cadastro duplicado | Bloqueio cadastro | Bloqueio realizado | Aprovado |
| TC05 | Navegação login | goToLogin | goToLogin | Aprovado |
| TC06 | Login válido | goToHome | goToHome | Aprovado |
| TC07 | Login vazio | Mensagem de erro | Mensagem exibida | Aprovado |
| TC08 | Login inválido | Mensagem de erro | Mensagem exibida | Aprovado |
| TC09 | Navegação Home | goToHome | goToHome | Aprovado |

---

# 6. Simulação de Falha

Foi realizada uma simulação de falha alterando propositalmente o valor esperado do teste TC02.

## Objetivo da simulação
- Demonstrar funcionamento do framework de teste
- Evidenciar diferença entre resultado esperado e obtido
- Validar comportamento de falhas automatizadas

## Resultado da simulação

| Esperado | Obtido | Status |
|------|------|------|
| "Preencha os campos obrigatórios." | "Preencha e-mail e senha." | Reprovado |

---

# 7. Análise dos Resultados

Os testes unitários validaram corretamente:

- Regras de negócio
- Validações
- Mensagens
- Estados dos ViewModels

Os testes de integração também demonstraram que o fluxo de autenticação funciona corretamente entre View, ViewModel e Service.

---

# 8. Benefícios Observados

## A arquitetura MVVM permitiu
- Isolamento da lógica
- Facilidade de teste
- Reutilização
- Separação entre UI e negócio

## A utilização de FakeAuthService permitiu
- Independência de backend real
- Execução rápida
- Previsibilidade dos resultados

---

# 9. Problemas Encontrados

Nenhuma falha funcional foi encontrada durante os testes oficiais.

Apenas a falha simulada apresentou erro propositalmente induzido para fins didáticos.

---

# 10. Conclusão Final

Os testes executados demonstraram que o sistema atende aos requisitos funcionais definidos inicialmente.

Os testes unitários validaram corretamente os ViewModels isoladamente.

Os testes de integração validaram o fluxo completo de autenticação da aplicação.

A utilização da ISO/IEC/IEEE 29119 permitiu organizar conceitos, processo, técnicas, execução e documentação de forma estruturada e rastreável.

---

# 11. Estatísticas Finais

| Tipo | Quantidade |
|------|------|
| Testes planejados | 9 |
| Testes executados | 9 |
| Testes aprovados | 9 |
| Testes reprovados | 0 |
| Falhas simuladas | 1 |

---

# 12. Evidência de Execução

## Exemplo de saída do terminal

```bash
00:01 +9: All tests passed!
```

## Exemplo de falha simulada

```bash
Expected: "Preencha os campos obrigatórios."
Actual: "Preencha e-mail e senha."
Which: is different.
```

---
