# Documento B — Processo de Teste (ISO/IEC/IEEE 29119-2)

*Projeto:* Atlas Contábil  
*Status:* Planejado  

## 1. Estratégia de Teste
Será utilizada a técnica de *Mocks* para isolar as ViewModels das dependências externas (Firebase). Os testes serão automatizados e executados via CLI do Flutter.

## 2. Ambiente de Teste
- *Ferramentas:* Flutter SDK, Dart SDK.
- *Packages:* flutter_test, mocktail ou mockito.
- *CI/CD:* Preparado para GitHub Actions.

## 3. Critérios de Entrada
- Código das ViewModels versionado no branch main ou develop.
- Documento A (Conceitual) revisado e aprovado pela equipe.

## 4. Critérios de Saída
- 100% dos casos de teste (CTs) executados.
- Cobertura de testes de unidade acima de 80% nas ViewModels.
- Relatório de testes sem falhas críticas abertas.

## 5. Fluxo de Execução
1. *Unidade:* Testar métodos de login e cadastro isoladamente.
2. *Estado:* Verificar se isLoading muda para true durante as chamadas.
3. *Integração:* Simular o fluxo do usuário clicando no botão e chegando na Dashboard.

## 6. Controle de Execução
Os resultados serão registrados no log do GitHub Actions e resumidos no README do projeto.
