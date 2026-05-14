# Documento C — Técnicas e Casos de Teste (ISO/IEC/IEEE 29119-4)

*Projeto:* Atlas Contábil  

## 1. Técnicas de Teste Aplicadas
- *Particionamento de Equivalência:* Para validar e-mails válidos e inválidos.
- *Análise de Valor Limite:* Para senhas (mínimo de caracteres) e campos vazios.
- *Transição de Estado:* Para monitorar a mudança de estados da UI (Deslogado -> Autenticando -> Logado).

## 2. Especificação dos Casos de Teste (CT)

| ID | Caso de Teste | Entrada Esperada | Resultado Esperado |
| :--- | :--- | :--- | :--- |
| *CT01* | Cadastro com Sucesso | Nome, Email válido, Senha | Redirecionar para Login |
| *CT02* | Cadastro Campo Vazio | Nome="", Email="", Senha="" | Mensagem: "Preencha os campos" |
| *CT03* | Email Inválido | "usuario.com" (sem @) | Mensagem: "Email inválido" |
| *CT04* | Login Válido | Credenciais existentes | Navegar para DashboardView |
| *CT05* | Login Inválido | Email ou Senha errados | Mensagem: "Credenciais incorretas" |
| *CT06* | Fluxo de Splash | App aberto | Se logado -> Home; Se não -> Login |

## 3. Conclusão
Estes casos garantem que as funcionalidades críticas do *Atlas Contábil* descritas no Backlog do Produto sejam validadas conforme as normas de qualidade de software.
