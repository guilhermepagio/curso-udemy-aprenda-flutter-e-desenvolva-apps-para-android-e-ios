# Great Places 🖼️

Uma aplicação Flutter moderna e intuitiva para registrar seus lugares favoritos, capturando fotos e armazenando localizações geográficas precisas.

## 📝 Descrição

O **Great Places** permite que usuários criem um diário visual e geográfico de locais importantes. O aplicativo utiliza recursos nativos do dispositivo, como a câmera para capturar momentos e o GPS para identificar endereços, além de oferecer uma integração robusta com o Google Maps para visualização e seleção manual de pontos de interesse.

## ✨ Funcionalidades

- **Gerenciamento de Lugares**: Cadastro e listagem de locais com título, foto e endereço.
- **Captura de Imagem**: Integração com a câmera do dispositivo para registro visual imediato.
- **Geolocalização**: 
  - Obtenção da localização atual via GPS.
  - Seleção manual de coordenadas através de um mapa interativo.
  - Conversão automática de coordenadas (Latitude/Longitude) em endereços legíveis (Reverse Geocoding).
- **Persistência Local**: Armazenamento offline de dados e imagens utilizando o banco de dados SQLite.
- **Visualização Detalhada**: Tela dedicada para rever fotos e abrir a localização exata no mapa.

## 🚀 Tecnologias

Este projeto utiliza as melhores práticas e bibliotecas do ecossistema Flutter:

- **[Flutter](https://flutter.dev/):** Framework principal.
- **[Provider](https://pub.dev/packages/provider):** Gerenciamento de estado de forma reativa.
- **[Google Maps Flutter](https://pub.dev/packages/google_maps_flutter):** Integração com mapas interativos.
- **[SQFlite](https://pub.dev/packages/sqflite):** Banco de dados local para persistência de dados.
- **[Image Picker](https://pub.dev/packages/image_picker):** Manipulação de câmera e galeria.
- **[Location](https://pub.dev/packages/location):** Acesso a serviços de localização do dispositivo.
- **[Flutter Dotenv](https://pub.dev/packages/flutter_dotenv):** Gerenciamento de chaves de API e variáveis de ambiente.
- **[HTTP](https://pub.dev/packages/http):** Consumo de APIs do Google para Geocoding e Static Maps.

## ⚙️ Instruções de Configuração

### Pré-requisitos
- Flutter SDK instalado na versão mais recente.
- Uma chave de API do Google Cloud Platform com as seguintes APIs ativadas:
  - Maps SDK for Android/iOS
  - Maps Static API
  - Geocoding API

### Instalação

1. Clone este repositório.
1. Instale as dependências:
   ```bash
   flutter pub get
   ```
1. Configuração de Variáveis de Ambiente:
   Crie um arquivo chamado `.env` na raiz do projeto e adicione sua chave do Google Maps:
   ```env
   GOOGLE_MAPS_API_KEY=SUA_CHAVE_AQUI
   ```
1. Execute utilizando a IDE de sua preferência.

## ⚠️ Pontos de Atenção

1. **Permissões Nativas:**
   - **Android**: Verifique se as permissões de `CAMERA`, `ACCESS_FINE_LOCATION` e `ACCESS_COARSE_LOCATION` estão configuradas no `AndroidManifest.xml`.
   - **iOS**: Certifique-se de que as chaves `NSCameraUsageDescription` e `NSLocationWhenInUseUsageDescription` foram adicionadas ao `Info.plist`.
1. **Chave de API:** O arquivo `.env` está incluído no `.gitignore` por segurança. Nunca submeta sua chave de API real para repositórios públicos.
1. **Google Cloud Console**: Certifique-se de restringir sua chave de API para os IDs de pacote do seu aplicativo (Android/iOS) para evitar uso indevido por terceiros.

---

Este projeto faz parte de uma jornada de aprendizado em desenvolvimento mobile com Flutter.
