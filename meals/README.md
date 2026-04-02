# Meals 🍳

Uma aplicação Flutter moderna e intuitiva para exploração de receitas culinárias, permitindo aos usuários navegar por categorias, filtrar pratos por restrições alimentares e gerenciar seus favoritos.

## 📋 Descrição

O **Meals** é um guia de receitas completo que organiza pratos por categorias (Italiana, Hamburgueres, Asiática, etc.). Cada receita apresenta detalhes cruciais como tempo de preparo, nível de complexidade e custo, além de uma lista detalhada de ingredientes e o passo a passo da preparação. O app conta com um sistema de filtros persistente para dietas específicas e suporte a temas claro e escuro.

## ✨ Funcionalidades

- **Navegação por Categorias:** Interface em grid para escolha rápida do tipo de culinária.
- **Detalhes da Refeição:** Visualização rica com imagens, tempo de preparo, complexidade (Simples, Médio, Difícil) e custo (Barato, Justo, Caro).
- **Sistema de Favoritos:** Possibilidade de marcar receitas para acesso rápido em uma aba dedicada.
- **Filtros Personalizados:** Configurações para exibir apenas refeições:
  - Sem Glúten
  - Sem Lactose
  - Veganas
  - Vegetarianas
- **Navegação Dinâmica:** Menu lateral (Drawer) e barra de navegação inferior (Tabs).
- **Tematização:** Suporte completo a **Material 3** com temas Light e Dark automáticos.

## 🚀 Tecnologias e Recursos

- **Flutter & Dart:** Framework e linguagem base.
- **Material Design 3:** Utilização dos componentes e esquemas de cores mais recentes.
- **Gerenciamento de Estado:** Implementado via levantamento de estado (State Lifting) para controle global de filtros e favoritos.
- **Rotas Nomeadas:** Navegação estruturada através de `AppRoutes`.
- **Tipografia Customizada:** 
  - *Raleway* (Corpo e títulos principais)
  - *RobotoCondensed* (Destaques e AppBars)

## 🛠️ Instruções de Uso

1.  Clonar este repositório.
1.  Instalar dependências:
    ```bash
    flutter pub get
    ```
1.  Execute utilizando a IDE de sua preferência.

## 💡 Pontos de Atenção

- **Dados Locais:** Atualmente, o projeto utiliza dados estáticos localizados em `lib/data/dummy_data.dart`.
- **Gestão de Cores:** O tema é gerado dinamicamente a partir de uma `seedColor` (Pink), garantindo harmonia visual em ambos os modos (Light/Dark).
- **Responsividade:** O layout utiliza `GridView` com `SliverGridDelegateWithMaxCrossAxisExtent` para se adaptar a diferentes tamanhos de tela.

---

Este projeto faz parte de uma jornada de aprendizado em desenvolvimento mobile com Flutter.
