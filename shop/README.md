# Shop App (Minha Loja)

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)

Uma aplicação de e-commerce completa desenvolvida em Flutter, focada em fornecer uma experiência de compra fluida com gerenciamento de estado avançado e integração com Firebase.

## 📝 Descrição

O **Shop App** é um projeto desenvolvido para demonstrar o poder do Flutter no desenvolvimento de aplicativos mobile. Ele abrange desde a autenticação de usuários até o fluxo completo de compra (carrinho e pedidos), além de uma área administrativa para gerenciamento do catálogo de produtos.

## ✨ Funcionalidades

- **Autenticação Segura:** Sistema de Login e Registro integrado ao Firebase Auth.
- **Catálogo de Produtos:** Listagem dinâmica com carregamento via API.
- **Favoritos:** Possibilidade de favoritar produtos com persistência por usuário.
- **Carrinho de Compras:** Adição, remoção e ajuste de quantidade de itens em tempo real.
- **Gestão de Pedidos:** Histórico detalhado de compras realizadas.
- **Painel Administrativo:** CRUD completo (Criação, Leitura, Atualização e Deleção) de produtos.
- **UI/UX Polida:** Animações Hero, transições de página customizadas e feedback visual ao usuário (Snackbars e Dialogs).

## 🚀 Tecnologias e Bibliotecas

- **[Provider](https://pub.dev/packages/provider):** Gestão de estado e Injeção de Dependências.
- **[Firebase Realtime Database](https://firebase.google.com/docs/database):** Armazenamento de dados em tempo real.
- **[HTTP](https://pub.dev/packages/http):** Comunicação com APIs REST.
- **[Shared Preferences](https://pub.dev/packages/shared_preferences):** Persistência local de dados da sessão.
- **[Flutter Dotenv](https://pub.dev/packages/flutter_dotenv):** Gerenciamento de variáveis de ambiente.
- **[Intl](https://pub.dev/packages/intl):** Internacionalização e formatação de moeda (BRL) e datas.

## 🛠️ Instruções de Instalação

### Pré-requisitos
- Flutter SDK instalado.
- Conta no Firebase configurada.

### Passo a passo
1. Clone este repositório.
2. Execute `flutter pub get` para instalar as dependências.
3. Crie um arquivo `.env` na raiz do projeto com a seguinte chave:
   ```env
   FIREBASE_WEB_API_KEY=SUA_CHAVE_AQUI
   ```
4. Configure as URLs do seu Firebase Realtime Database no arquivo `lib/utils/constants.dart`.
5. Execute o app com `flutter run`.

## ⚠️ Pontos de Atenção

1. **Variáveis de Ambiente:** O arquivo `.env` é essencial para o funcionamento da autenticação. Nunca comite sua chave de API real em repositórios públicos.
2. **Regras do Firebase:** Certifique-se de configurar as regras de segurança no Firebase Realtime Database para permitir acesso apenas a usuários autenticados, especialmente para a pasta de pedidos e favoritos por usuário.
3. **Fonts:** O projeto utiliza as fontes **Lato** e **Anton**. Verifique se os arquivos `.ttf` estão corretamente localizados na pasta `assets/fonts/`.

---
Desenvolvido como parte do curso de Flutter para aprendizado de padrões de projeto e integrações externas.
