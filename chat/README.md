# Chat App - Flutter & Firebase

Este é um aplicativo de chat em tempo real desenvolvido como parte do curso "Aprenda Flutter e Desenvolva Apps para Android e iOS". O projeto demonstra a integração do Flutter com diversos serviços do Firebase para criar uma experiência de comunicação completa e funcional.

## 📝 Descrição

O **Chat App** permite que usuários se cadastrem, façam login e troquem mensagens instantâneas em salas de conversa. O aplicativo foca em práticas modernas de desenvolvimento, incluindo uma arquitetura limpa com abstração de serviços, gerenciamento de estado eficiente e integração robusta com backend as a service (BaaS).

## 🚀 Funcionalidades

- **Autenticação Completa:** Cadastro e Login de usuários via Firebase Auth.
- **Perfil do Usuário:** Upload e exibição de fotos de perfil utilizando Firebase Storage e Image Picker.
- **Mensagens em Tempo Real:** Sincronização instantânea de mensagens com Cloud Firestore.
- **Notificações Push:** Recebimento de alertas de novas mensagens via Firebase Cloud Messaging (FCM).
- **Interface Intuitiva:** UI moderna com suporte a feedbacks visuais de carregamento e mensagens de erro.
- **Mock vs Firebase:** Estrutura preparada para alternar facilmente entre dados simulados (Mock) e produção (Firebase).

## 🛠️ Tecnologias

As seguintes ferramentas e bibliotecas foram utilizadas:

- [Flutter](https://flutter.dev/) - Framework UI.
- [Firebase Auth](https://firebase.google.com/docs/auth) - Autenticação.
- [Cloud Firestore](https://firebase.google.com/docs/firestore) - Banco de dados NoSQL em tempo real.
- [Firebase Storage](https://firebase.google.com/docs/storage) - Armazenamento de arquivos (fotos de perfil).
- [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging) - Notificações push.
- [Provider](https://pub.dev/packages/provider) - Gerenciamento de estado.
- [Image Picker](https://pub.dev/packages/image_picker) - Seleção de imagens da galeria ou câmera.

## 💻 Como rodar o projeto
1. Certifique-se de ter o SDK do Flutter instalado em sua máquina.
2. Clone este repositório.
3. No terminal, acesse a pasta do projeto e execute:
   ```bash
   flutter pub get
   ```
4. Execute utilizando a IDE de sua preferência.

## ⚠️ Pontos de Atenção

- **Alternando para Mock:** Caso deseje testar o app sem configurar o Firebase, altere o retorno das `factory` classes em `lib/core/services/auth/auth_service.dart` e `lib/core/services/chat/chat_service.dart` para utilizarem as versões `Mock`.
- **Regras do Firebase:** Certifique-se de configurar as regras de segurança no Firestore e Storage para permitir leitura e escrita durante o desenvolvimento.
- **Notificações:** Para testar notificações push em dispositivos iOS, é necessária uma conta de desenvolvedor Apple e configuração de certificados APNs.
