
#  Documentação de Widgets - Atlas Contábil

Este documento detalha a arquitetura de widgets utilizada no desenvolvimento do aplicativo **Atlas Contábil**, dividida por categorias funcionais e exemplos de aplicação.

---

##  1. Widgets de Estrutura de Tela (Layout Principal)
Responsáveis por definir o esqueleto básico de cada interface.

* **`Scaffold`**: O widget fundamental que fornece a estrutura visual principal (espaços para AppBar, Body e BottomNavigationBar).
* **`AppBar`**: Barra superior para títulos e ações rápidas (ex: notificações).
* **`Body`**: Área central e dinâmica onde o conteúdo principal é exibido.
* **`BottomNavigationBar`**: Menu inferior para alternar entre módulos como Home, Calendário e Perfil.
<img width="1920" height="1080" alt="1" src="https://github.com/user-attachments/assets/bdc069f0-0d74-4db8-882f-f6f154eaa11e" />

---

##  2. Widgets de Organização e Posicionamento
Utilizados para estruturar e alinhar os elementos visuais.

* **`Container`**: Elemento de estilização (cores, bordas, margens).
* **`Padding`**: Adiciona espaçamento interno para garantir respiro visual.
* **`Column` / `Row`**: Organizam elementos em sequências verticais ou horizontais, respectivamente.
* **`SingleChildScrollView`**: Torna o conteúdo rolável, evitando erros de layout (*overflow*).
* **`Spacer` / `SizedBox`**: Criam espaços flexíveis ou fixos entre componentes.
<img width="1920" height="1080" alt="2" src="https://github.com/user-attachments/assets/1960588f-2ee6-4134-b3dc-a39e50ae438a" />

---

##  3. Widgets de Interface de Usuário e Conteúdo
Responsáveis pela apresentação de informações ao usuário.

* **`Text`**: Exibição de textos com diferentes estilos tipográficos.
* **`Image`**: Carregamento de logotipos e recursos visuais.
* **`Card`**: Painel com bordas arredondadas e sombra, ideal para agrupar conteúdos relacionados.
* **`Icon`**: Representações gráficas de funções (ex: ícone de calendário).
* **`ListView`**: Cria listas roláveis eficientes para grandes volumes de dados.
<img width="1920" height="1080" alt="3" src="https://github.com/user-attachments/assets/9f278f1b-0667-4a5c-bc20-22ba4ab6713e" />

---

##  4. Widgets de Entrada de Dados e Interação
Permitem a inserção de informações e execução de ações.

* **`TextField`**: Campos de entrada para texto (login, senhas, formulários).
* **`ElevatedButton`**: Botão com destaque visual para ações primárias.
* **`TextButton`**: Botão simples para ações secundárias (ex: "Esqueci a senha").
* **`IconButton`**: Ícone interativo para ações rápidas.
<img width="1920" height="1080" alt="4" src="https://github.com/user-attachments/assets/3f59a9e6-8e4b-49fb-a5ad-bfa51788ed02" />

---

##  5. Widgets Especializados de Visualização de Dados
Componentes focados em Business Intelligence (BI) e organização temporal.

* **`CalendarWidget`**: Componente personalizado para visualização de obrigações fiscais.
* **`PieChart` / `BarChart`**: Gráficos de pizza e barras para transformar números em insights visuais.
<img width="1920" height="1080" alt="5" src="https://github.com/user-attachments/assets/90ba2c31-77e8-4874-b4cb-d4e3daf957f6" />

---

##  6. Estudo de Caso: Dashboard (Home)
A tela principal utiliza a combinação dos widgets acima para oferecer uma visão estratégica:

### Estrutura da Interface
* **Cabeçalho (AppBar):** Saudação personalizada e botão de notificações.
* **Corpo (Body):** Lista rolável contendo:
    * **`Resumo Rápido:`** `Cards` com alertas fiscais.
    * **`Insights do Dia:`** Dados de crescimento e limites de clientes.
    * **`Ação Principal:`** `ElevatedButton` para "Descrever Cenário Fiscal".
 * **Navegação (Bottom Bar):** Atalhos para Home, Calendário e Perfil.
<img width="1920" height="1080" alt="6" src="https://github.com/user-attachments/assets/d1d220ee-f81e-42d9-aa7d-5011ff220a71" />

---

## 7. Tela de Insights Inteligentes

A **Tela de Insights** tem como propósito central transformar dados brutos do calendário contábil em análises estratégicas e recomendações práticas para o usuário, otimizando a tomada de decisão.

Construída sobre um `Scaffold`, a interface utiliza uma `AppBar` simples com o título **"Insights"** e uma `BottomNavigationBar` para navegação intuitiva entre os módulos de Home, Calendário e Perfil.

O coração da tela reside no **Body**, que implementa um `ListView` para organizar o fluxo de informações de forma escalável:

* **`Gestão de Ações:`** Uma sequência de `Cards` interativos organiza tarefas críticas, como finalização de relatórios fiscais (*tax reports*), revisões jurídicas, atualizações de registros e consultas de clientes.
* **`Inteligência Artificial:`** Inclui um card específico de **Recomendações via IA**, destacando o caráter tecnológico e preventivo da plataforma.
* **`Visualização de Dados:`** Na base da lista, o sistema apresenta dois painéis de análise visual que facilitam a interpretação de métricas complexas:
  * **`PieChart` (Gráfico de Pizza):** Para o resumo proporcional das atividades do mês.
  * **`BarChart` (Gráfico de Barras):** Focado em insights fiscais comparativos.
<img width="1920" height="1080" alt="7" src="https://github.com/user-attachments/assets/b52b8d01-37f3-443e-86b6-2419bf58d536" />

---

### Organização do Conteúdo (Layout Principal)

O corpo da tela é estruturado em uma `Column` principal, dividida em dois blocos estratégicos:

#### Bloco Superior: Identidade Visual
Responsável pelo reconhecimento da marca e impacto inicial:
* **`Center`**: Garante a centralização horizontal de todo o grupo de branding.
* **`Column`**: Organiza os elementos da marca em sequência vertical.
    * **`SizedBox`**: Define o espaçamento superior em relação ao topo da tela.
       * **`Image`**: Exibe o logotipo oficial do **Atlas Contábil**.
          * **`SizedBox`**: Cria um respiro visual entre a imagem e o texto.
             * **`Text ("Atlas")`**: Título principal com estilo tipográfico destacado.
                * **`SizedBox`**: Pequeno intervalo para separação de hierarquia.
                   * **`Text ("Guia contábil estratégico")`**: Subtítulo ou slogan da marca.

#### Bloco Inferior: Ações do Usuário
Focado na conversão e navegabilidade inicial:
* **`Center`**: Mantém o alinhamento centralizado dos botões de interação.
* **`Column`**: Empilha as opções de acesso para facilitar o clique.
    * **`SizedBox`**: Espaçamento técnico para separar a identidade visual das ações.
      * **`ElevatedButton ("Fazer Login")`**: Ação primária, com preenchimento para maior destaque visual.
          * **`SizedBox`**: Espaçamento entre os botões para evitar cliques acidentais.
             * **`OutlinedButton ("Criar uma Nova Conta")`**: Ação secundária, com estilo vazado para diferenciar a hierarquia de importância.
               
                  <img width="516" height="729" alt="image" src="https://github.com/user-attachments/assets/1893ee00-2076-4d86-a833-8ac084f687fc" />

