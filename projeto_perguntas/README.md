# Projeto Perguntas ❓

## 📝 Descrição
O **Projeto Perguntas** é uma aplicação de questionário interativa desenvolvida em Flutter. O projeto serve como um excelente exemplo prático para entender os fundamentos do framework, focando especialmente no gerenciamento de estado local, composição de widgets e comunicação entre componentes através de callbacks.

## ✨ Funcionalidades
- **Questionário Dinâmico:** Apresenta perguntas de múltipla escolha de forma sequencial.
- **Sistema de Pontuação:** Atribui diferentes pesos a cada resposta, permitindo uma avaliação final personalizada.
- **Feedback de Resultado:** Exibe uma mensagem final baseada no desempenho do usuário (pontuação acumulada).
- **Reinicialização:** Permite que o usuário reinicie o questionário a qualquer momento após a conclusão, limpando o estado anterior.

## 🚀 Tecnologias
- **Flutter:** Framework para desenvolvimento de UI multiplataforma.
- **Dart:** Linguagem de programação otimizada para interfaces de usuário.

## 🛠️ Instruções
Para executar o projeto em seu ambiente local, siga os passos abaixo:

1. **Pré-requisitos:** Certifique-se de ter o [Flutter SDK](https://docs.flutter.dev/install/quick) instalado e configurado.
1. **Dependências:** No terminal, dentro da raiz do projeto, execute:
   ```bash
   flutter pub get
   ```
1. Execute utilizando a IDE de sua preferência.

## ⚠️ Pontos de Atenção
- **Gerenciamento de Estado:** O projeto utiliza `StatefulWidget` e `setState` para controlar a pergunta atual e a pontuação acumulada, demonstrando o ciclo de vida básico de um componente Flutter.
- **Composição de Widgets:** A interface é modularizada em pequenos componentes reaproveitáveis:
  - `Questao`: Responsável pela exibição do texto da pergunta.
  - `Resposta`: Um botão estilizado que gerencia a ação de escolha.
  - `Questionario` e `Resultado`: Organizam o fluxo principal da aplicação.
- **Callbacks:** O uso de funções passadas como parâmetro (`_responder` e `_reiniciarQuestionario`) é fundamental para manter o estado centralizado no widget pai (`main.dart`) enquanto a interação ocorre nos widgets filhos.
- **Tipagem em Dart:** O projeto faz uso de `Map<String, Object>` e `.cast()` para lidar com coleções de dados heterogêneas de forma segura.

---

Este projeto faz parte de uma jornada de aprendizado em desenvolvimento mobile com Flutter.
