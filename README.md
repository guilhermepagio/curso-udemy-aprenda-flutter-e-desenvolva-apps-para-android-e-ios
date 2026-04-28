# 🤖🍎 Projetos do Curso de Flutter

Este repositório contém uma coleção de aplicações desenvolvidas durante o curso [**Aprenda Flutter e Desenvolva Apps para Android e iOS**](https://www.udemy.com/course/curso-flutter/). Os projetos abrangem desde conceitos fundamentais de gerenciamento de estado e composição de widgets até integrações complexas com Firebase, Google Maps e recursos nativos do dispositivo.

## 🚀 Índice de Projetos

| Nome | Descrição |
| :--- | :--- |
| [**Chat App**](./chat) | Aplicativo de chat em tempo real com Firebase Auth, Firestore, Storage e Notificações Push. |
| [**Expenses**](./expenses) | Gestão de despesas pessoais com gráficos semanais e interface adaptativa (Material/Cupertino). |
| [**Great Places**](./great_places) | Diário de lugares favoritos com uso de Câmera, GPS (Google Maps) e persistência SQLite. |
| [**Meals**](./meals) | Guia de receitas culinárias com navegação por categorias, filtros de dieta e favoritos. |
| [**Projeto Perguntas**](./projeto_perguntas) | Quiz interativo focado em fundamentos de Flutter, callbacks e gerenciamento de estado local. |
| [**Shop**](./shop) | E-commerce completo com autenticação, carrinho, gestão de pedidos e catálogo via Firebase. |

## 🛠️ Pré-requisitos Gerais

Para rodar os projetos deste repositório, certifique-se de ter o **Flutter SDK**, o **Dart SDK**, um ambiente de desenvolvimento adequado (VS Code ou Android Studio) e um emulador ou dispositivo físico configurados.

> [!NOTE]
> É fundamental consultar o arquivo `pubspec.yaml` de cada projeto para verificar as dependências e versões específicas necessárias para a correta configuração do ambiente.

### 🔑 Configurações Adicionais
Alguns projetos específicos (`Great Places`, `Shop`, `Chat App`) requerem chaves de API ou configurações externas:
- **Firebase:** É necessário criar um projeto no console do Firebase e baixar os arquivos de configuração (`google-services.json` / `GoogleService-Info.plist`) ou usar o FlutterFire CLI.
- **Google Cloud Platform:** O projeto `Great Places` exige uma API Key com Maps SDK e Geocoding API ativadas.

---
*Este repositório serve como portfólio de aprendizado e evolução no ecossistema Dart/Flutter.*
