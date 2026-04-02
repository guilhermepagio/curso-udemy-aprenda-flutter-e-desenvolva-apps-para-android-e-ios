# Expenses 💰

Aplicação mobile desenvolvida em Flutter para auxílio no controle financeiro pessoal, permitindo o registro, visualização e acompanhamento de gastos semanais de forma intuitiva.

## 🎯 Objetivo
O projeto visa oferecer uma ferramenta simples e eficiente para gerenciar despesas diárias. O usuário pode cadastrar transações com título, valor e data, acompanhando a distribuição dos gastos através de um gráfico dinâmico que representa os últimos 7 dias.

## 🚀 Funcionalidades
- **Cadastro de Transações:** Inclusão de novos gastos com validação de dados.
- **Gráfico Semanal:** Visualização percentual dos gastos realizados em cada dia da última semana.
- **Lista de Despesas:** Listagem cronológica das transações cadastradas.
- **Exclusão de Registros:** Opção para remover transações da lista.
- **Interface Adaptativa:** Componentes que se ajustam automaticamente entre Android (Material Design) e iOS (Cupertino).
- **Responsividade:** Suporte completo para modo Retrato (Portrait) e Paisagem (Landscape).

## 🛠 Tecnologias e Pacotes
- **Flutter & Dart:** Framework e linguagem base.
- **intl (^0.20.2):** Utilizado para formatação de moedas (BRL) e datas.
- **Cupertino Icons:** Ícones nativos do sistema iOS.
- **Custom Fonts:** Uso das famílias *OpenSans* e *Quicksand* para uma tipografia refinada.

## 💻 Como rodar o projeto
1. Certifique-se de ter o SDK do Flutter instalado em sua máquina.
2. Clone este repositório.
3. No terminal, acesse a pasta do projeto e execute:
   ```bash
   flutter pub get
   ```
4. Execute utilizando a IDE de sua preferência.

## 🧠 Conceitos de Flutter Aplicados
- **Componentes Adaptativos:** Implementação de lógica para alternar entre `Material` e `Cupertino` (ex: `AdaptativeButton`, `AdaptativeTextField`) garantindo a experiência nativa em cada OS.
- **Gerenciamento de Estado:** Uso de `StatefulWidgets` e `setState` para manipulação dinâmica da lista de transações.
- **Layouts Responsivos:** Utilização de `MediaQuery` para cálculos de altura disponível e `LayoutBuilder` para renderização baseada em restrições de espaço.
- **Comunicação entre Widgets:** Passagem de funções via construtor para comunicação de eventos de baixo para cima (lifting state up).
- **Tematização Global:** Centralização de cores e estilos de texto através do `ThemeData`.

---

Este projeto faz parte de uma jornada de aprendizado em desenvolvimento mobile com Flutter.
